//Price comparison component

import React, { useState, useEffect } from 'react';

interface PriceComparison {
  store_name: string;
  price: number;
  link: string;
}

interface PricecompProps {
  productId: number | null;
}

const Pricecomp: React.FC<PricecompProps> = ({ productId }) => {
  const [priceComparisons, setPriceComparisons] = useState<PriceComparison[]>([]);
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (productId) {
      setLoading(true);
      setError(null);
      
      fetch(`http://localhost:5000/product-prices/${productId}`)
        .then((response) => {
          if (!response.ok) {
            throw new Error('Failed to fetch price comparisons');
          }
          return response.json();
        })
        .then((data: PriceComparison[]) => {
          const sortedData = data.sort((a, b) => a.price - b.price);
          setPriceComparisons(sortedData);
          setLoading(false);
        })
        .catch((error) => {
          setError(error.message);
          setLoading(false);
        });
    }
  }, [productId]);

  if (loading) {
    return (
      <div className="container d-flex justify-content-center align-items-center">
        <p>Loading price comparisons...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="container d-flex justify-content-center align-items-center">
        <p>Error: {error}</p>
      </div>
    );
  }

  if (!priceComparisons.length) {
    return (
      <div className="container d-flex justify-content-center align-items-center text-white">
        <p>Для этого товара нет цен для сравнения</p>
      </div>
    );
  }

  const cheapestPrice = priceComparisons[0].price;

  return (
    <div className="container pricecomp-container" style={{ marginBottom: '100px' }}>
      <div className="row">
        <div className="col-md-12">
          <table className="table table-dark">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Имя магазина</th>
                <th scope="col">Цена</th>
                <th scope="col">Сравнение цены (%)</th>
                <th scope="col">Ссылка</th>
              </tr>
            </thead>
            <tbody>
              {priceComparisons.map((comparison, index) => (
                <tr key={index}>
                  <th scope="row">{index + 1}</th>
                  <td>{comparison.store_name}</td>
                  <td>{Number(comparison.price).toFixed(2)} ₽</td>
                  <td>{((comparison.price / cheapestPrice) * 100).toFixed(2)}%</td>
                  <td>
                    {/* Style the link to ensure visibility and better UX */}
                    <a
                      href={comparison.link}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="btn btn-outline-light"
                      style={{ textDecoration: 'none', color: 'white' }}
                    >
                      Посмотреть товар
                    </a>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default Pricecomp;
