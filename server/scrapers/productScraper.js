const unirest = require("unirest");
const cheerio = require("cheerio");
const { Pool } = require('pg');


const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'Pricecomparison',
    password: '######',
    port: 5432, 
});

const getData = async (url) => {
    const client = await pool.connect(); 
    try {
        
        const response = await unirest.get(url);
        const $ = cheerio.load(response.body);

        // Extract the product details
        const name = $("h1").text().trim();
        const priceText = $("span:contains('₽')").first().text().trim();
        const price = parseFloat(priceText.replace(/[^\d,.]/g, '').replace(',', '.')); 
        const imageUrl = $("img").filter((i, el) => $(el).attr('src')?.includes('cdn.citilink.ru')).attr('src');
        const storeName = 'Ситилинк'; 
        const productLink = url;

        console.log("Product Name: " + name);
        console.log("Price: " + price);
        console.log("Image URL: " + imageUrl);

        // Insert into products table
        const productInsertQuery = `
            INSERT INTO public.products (name, description, image_url)
            VALUES ($1, $2, $3)
            RETURNING id;
        `;
        const productInsertValues = [name, '', imageUrl]; 
        const productRes = await client.query(productInsertQuery, productInsertValues);
        const productId = productRes.rows[0].id;

        
        const priceInsertQuery = `
            INSERT INTO public.product_prices (product_id, store_name, price, link)
            VALUES ($1, $2, $3, $4);
        `;
        const priceInsertValues = [productId, storeName, price, productLink];
        await client.query(priceInsertQuery, priceInsertValues);

        console.log('Data inserted successfully!');
    } catch (error) {
        console.error('Error:', error);
    } finally {
        
        client.release();
    }
};

// URLs for scraping
const urls = [
    "https://www.citilink.ru/product/videokarta-asus-nvidia-geforce-rtx-3060-dual-rtx3060-o12g-v2-lhr-12gb-1543629/",
    "https://www.citilink.ru/product/videokarta-msi-nvidia-geforce-rtx-4060-rtx-4060-ventus-2x-black-8g-oc-1970001/",
    "https://www.citilink.ru/product/videokarta-palit-nvidia-geforce-rtx-4070ti-super-rtx4070ti-super-jetst-1997219/",
    "https://www.citilink.ru/product/videokarta-palit-nvidia-geforce-rtx-4080-super-rtx4080-super-gamingpro-1997170/",
    "https://www.citilink.ru/product/processor-intel-core-i9-14900k-lga-1700-oem-cm8071505094017-srn48-1986133/",
    "https://www.citilink.ru/product/processor-intel-core-i9-12900k-lga-1700-oem-cm8071504549230-srl4h-1779474/",
    "https://www.citilink.ru/product/processor-intel-core-i9-11900kf-lga-1200-oem-cm8070804400164-srknf-1783311/",
    "https://www.citilink.ru/product/videokarta-afox-pci-e-af2060s-8192d6h4-v2-nv-rtx2060super-8gb-256bit-g-2011704/",
    "https://www.citilink.ru/product/videokarta-sapphire-pci-e-4-0-11323-01-40g-nitro-rx-7900-xt-gaming-oc-1907671/",
    "https://www.citilink.ru/product/videokarta-sapphire-amd-radeon-rx-7700xt-11335-03-20g-pure-rx-7700-xt-1978711/",
    "https://www.citilink.ru/product/videokarta-asus-amd-radeon-rx-7800xt-tuf-rx7800xt-o16g-og-gaming-16gb-2003961/"
];

// Run the function for each URL
urls.forEach(url => getData(url));
