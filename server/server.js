
const express = require('express');
const { Pool } = require('pg');
const app = express();
const cors = require('cors');
const nodemailer = require('nodemailer');
const cron = require('node-cron');

// PostgreSQL connection
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'Pricecomparison',
  password: '######',
  port: 5432, 
});


//Email config
const transporter = nodemailer.createTransport({
  service: 'gmail', 
  auth: {
    user: 'placeholdere@gmail.com', //Change this
    pass: 'placehodler_pass',    //Change this    
  },
});

// Function to send an email notification
const sendPriceDropEmail = (email, productName, targetPrice, currentPrice) => {
  const mailOptions = {
    from: 'placeholdere@gmail.com',  // Email отправителя
    to: email,                         // Email получателя
    subject: 'Уведомление о снижении цены!',
    text: `Хорошие новости! Цена на "${productName}" упала до ${currentPrice}₽, что ниже вашей целевой цены ${targetPrice}₽.
    
    Просмотреть товар можно по ссылке: http://localhost:3000`,
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.error('Error sending email:', error);
    } else {
      console.log('Email sent:', info.response);
    }
  });
};

// Function to check prices and notify about drop
const checkPriceNotifications = async () => {
  try {
   
    const notifications = await pool.query(`
      SELECT 
        pn.id, 
        pn.user_id, 
        pn.product_id, 
        pn.target_price, 
        u.email, 
        p.name AS product_name, 
        MIN(pp.price) AS current_price  -- Fetch the lowest price for the product from product_prices
      FROM price_notifications pn
      JOIN products p ON pn.product_id = p.id
      JOIN product_prices pp ON pn.product_id = pp.product_id
      JOIN users u ON pn.user_id = u.id
      WHERE pn.notified = false
      GROUP BY pn.id, u.email, p.name
    `);

    notifications.rows.forEach(async (notification) => {

      // Check if the current product price is less than or equal to the target price

      if (notification.current_price <= notification.target_price) {

        // Send email to the user
        sendPriceDropEmail(
          notification.email,               
          notification.product_name,        
          notification.target_price,        
          notification.current_price        
        );

        // Mark the notification as sent (update notified = true)

        await pool.query(
          `UPDATE price_notifications SET notified = true WHERE id = $1`,
          [notification.id]
        );
      }
    });
  } catch (error) {
    console.error('Error checking price notifications:', error);
  }
};

// Price check
cron.schedule('* * * * *', checkPriceNotifications);

app.use(cors()); 
app.use(express.json());


// Search endpoint
app.get('/search', async (req, res) => {
  const searchTerm = req.query.q;

  try {
    const result = await pool.query(
      `SELECT * FROM products WHERE name ILIKE $1`,
      [`%${searchTerm}%`] 
    );

    res.json(result.rows);
  } catch (error) {
    console.error('Error querying database:', error);
    res.status(500).send('Server error');
  }
});

app.get('/product-prices/:productId', async (req, res) => {
  const { productId } = req.params;

  try {
    const result = await pool.query(
      `SELECT store_name, price, link FROM product_prices WHERE product_id = $1 ORDER BY price ASC`,
      [productId]
    );
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching product prices:', error);
    res.status(500).send('Server error');
  }
});



// Login endpoint
app.post('/login', async (req, res) => {
  const { username, password, isAdminLogin } = req.body;

  try {
    // Query to check if the user with the given username and password exists
    const result = await pool.query(
      `SELECT * FROM users WHERE username = $1 AND password = $2`,
      [username, password]
    );

    if (result.rows.length > 0) {
      const user = result.rows[0];

      // If admin login is attempted, ensure the user has the 'admin' role
      if (isAdminLogin && user.role !== 'admin') {
        return res.status(403).json({ error: 'Access denied: Admins only' });
      }

      // If login is successful (either regular or admin), return the user data
      return res.json({ message: 'Login successful', user });
    } else {
      return res.status(400).json({ error: 'Invalid credentials' });
    }
  } catch (error) {
    console.error('Error logging in:', error);
    res.status(500).send('Server error');
  }
});


// Register endpoint
app.post('/register', async (req, res) => {
  const { username, email, password } = req.body;
  
  try {
    // Insert user into the database
    const result = await pool.query(
      `INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING *`,
      [username, email, password]
    );
    res.status(201).json(result.rows[0]);
  } catch (error) {
    if (error.code === '23505') {
      // Unique violation
      if (error.constraint === 'users_username_key') {
        return res.status(400).json({ message: 'Username already exists' });
      } else if (error.constraint === 'users_email_key') {
        return res.status(400).json({ message: 'Email already exists' });
      }
    }
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
});



// Add to favorites endpoint
app.post('/favorites', async (req, res) => {
  const { userId, productId } = req.body;

  if (!userId || !productId) {
    return res.status(400).json({ message: 'Missing userId or productId' });
  }

  try {
    // Check if the product is already in the user's favorites
    const checkFavorite = await pool.query(
      `SELECT * FROM favorites WHERE user_id = $1 AND product_id = $2`,
      [userId, productId]
    );

    if (checkFavorite.rows.length > 0) {
      return res.status(400).json({ message: 'Product is already in favorites' });
    }

    // Insert the favorite into the database
    const result = await pool.query(
      `INSERT INTO favorites (user_id, product_id) VALUES ($1, $2) RETURNING *`,
      [userId, productId]
    );

    res.status(201).json({ message: 'Product added to favorites', favorite: result.rows[0] });
  } catch (error) {
    console.error('Error adding to favorites:', error);
    res.status(500).json({ message: 'Server error' });
  }
});

app.get('/favorites/:userId', async (req, res) => {
  const { userId } = req.params;

  try {
    const result = await pool.query(
      `SELECT p.id, p.name, p.description, p.image_url
       FROM favorites f
       JOIN products p ON f.product_id = p.id
       WHERE f.user_id = $1`,
      [userId]
    );
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching favorites:', error);
    res.status(500).send('Server error');
  }
});


// Endpoint to remove a product from favorites
app.delete('/favorites/:userId/:productId', async (req, res) => {
  const { userId, productId } = req.params;

  try {
    // Delete the product from the user's favorites
    const result = await pool.query(
      `DELETE FROM favorites WHERE user_id = $1 AND product_id = $2 RETURNING *`,
      [userId, productId]
    );

    if (result.rowCount === 0) {
      return res.status(404).json({ message: 'Favorite not found' });
    }

    // Respond with success message
    res.status(200).json({ message: 'Favorite removed successfully' });
  } catch (error) {
    console.error('Error removing favorite:', error);
    res.status(500).send('Server error');
  }
});


// Endpoint to create a price notification
app.post('/notifications', async (req, res) => {
  const { userId, productId, targetPrice } = req.body;

  if (!userId || !productId || !targetPrice) {
    return res.status(400).json({ message: 'Missing required fields' });
  }

  try {
    const result = await pool.query(
      `INSERT INTO price_notifications (user_id, product_id, target_price) 
       VALUES ($1, $2, $3) RETURNING *`,
      [userId, productId, targetPrice]
    );

    res.status(201).json({ message: 'Price notification created', notification: result.rows[0] });
  } catch (error) {
    console.error('Error creating price notification:', error);
    res.status(500).send('Server error');
  }
});


// Fetch data from any table
app.get('/admin/:table', async (req, res) => {
  const { table } = req.params;
  try {
    const result = await pool.query(`SELECT * FROM ${table}`);
    res.json(result.rows);
  } catch (error) {
    res.status(500).send('Server error');
  }
});

// Insert data into a table
app.post('/admin/:table', async (req, res) => {
  const { table } = req.params;
  const data = req.body;
  const keys = Object.keys(data).join(", ");
  const values = Object.values(data);
  const placeholders = values.map((_, idx) => `$${idx + 1}`).join(", ");
  
  try {
    const result = await pool.query(
      `INSERT INTO ${table} (${keys}) VALUES (${placeholders}) RETURNING *`,
      values
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send('Server error');
  }
});

// Update data in a table
app.put('/admin/:table/:id', async (req, res) => {
  const { table, id } = req.params;
  const data = req.body;
  const updates = Object.keys(data).map((key, idx) => `${key} = $${idx + 1}`).join(", ");
  const values = Object.values(data);

  try {
    const result = await pool.query(
      `UPDATE ${table} SET ${updates} WHERE id = ${id} RETURNING *`,
      values
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send('Server error');
  }
});

// Delete data from a table
app.delete('/admin/:table/:id', async (req, res) => {
  const { table, id } = req.params;
  try {
    await pool.query(`DELETE FROM ${table} WHERE id = $1`, [id]);
    res.json({ message: 'Deleted successfully' });
  } catch (error) {
    res.status(500).send('Server error');
  }
});




const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
