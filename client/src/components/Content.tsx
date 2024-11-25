// Content component
import React, { useState } from 'react';

interface Product {
  id: number;
  name: string;
  description: string;
  image_url: string;
}

interface ContentProps {
  selectedProduct: Product | null;
  userId: number | null;
}

const Content: React.FC<ContentProps> = ({ selectedProduct, userId }) => {
  const [targetPrice, setTargetPrice] = useState('');

  const handleAddToFavorites = async () => {
    if (!userId || !selectedProduct) {
      alert('Please log in to add favorites');
      return;
    }

    try {
      const response = await fetch('http://localhost:5000/favorites', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ userId, productId: selectedProduct.id }),
      });

      if (!response.ok) {
        throw new Error('Failed to add to favorites');
      }

      alert('Товар успешно добавлен в избранное!');
    } catch (error) {
      console.error('Error adding to favorites:', error);
      alert('Failed to add to favorites');
    }
  };

  const handleSetPriceNotification = async () => {
    if (!userId || !selectedProduct) {
      alert('Please log in to set price notifications');
      return;
    }

    try {
      const response = await fetch('http://localhost:5000/notifications', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          userId,
          productId: selectedProduct.id,
          targetPrice: parseFloat(targetPrice),
        }),
      });

      if (!response.ok) {
        throw new Error('Failed to set price notification');
      }

      alert('Уведомление о цене успешно создано');
    } catch (error) {
      console.error('Error setting price notification:', error);
      alert('Failed to set price notification');
    }
  };

  return (
    <div className="container-fluid">
      {selectedProduct ? (
        <section id="product-details" className="my-5 b">
          <div className="container-fluid my-1">
            <div className="row justify-content-center align-items-center">
              <div className="col-md-2">
                <img
                  src={selectedProduct.image_url || 'https://placehold.co/600x400'}
                  loading="lazy"
                  alt={selectedProduct.name}
                  className="img-fluid"
                />
              </div>
              <div className="col-md-6">
                <article>
                  <h2>{selectedProduct.name}</h2>
                  <p>{selectedProduct.description}</p>

                  {userId ? (
                    <>
                      <button onClick={handleAddToFavorites} className="btn btn-primary me-2">
                        Добавить в избранное
                      </button>
                      <div className="mt-2">
                        <label htmlFor="targetPrice">Оповестить меня когда цена ниже: </label>
                        <input
                          type="number"
                          id="targetPrice"
                          value={targetPrice}
                          onChange={(e) => setTargetPrice(e.target.value)}
                          min="0"
                          step="0.01"
                          className="form-control"
                        />
                        <button onClick={handleSetPriceNotification} className="btn btn-warning mt-2">
                          Установить оповещение о снижении цены
                        </button>
                      </div>
                    </>
                  ) : (
                    <p>Пожалуйста войдите чтобы добавить в избранное или установить оповещение</p>
                  )}
                </article>
              </div>
            </div>
          </div>
        </section>
      ) : (
        <div className="row d-flex justify-content-center align-items-center" style={{ height: '50vh' }}>
          <div className="col-md-6 text-center text-white">
            <p>Выберите товар чтобы показать детали</p>
          </div>
        </div>
      )}
    </div>
  );
};

export default Content;
