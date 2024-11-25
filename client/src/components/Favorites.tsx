//Favourites show component

import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

interface FavoriteProduct {
  id: number;
  name: string;
  description: string;
  image_url: string;
}

interface FavoritesProps {
  userId: number | null;
  onSelectProduct: (product: FavoriteProduct) => void; 
}

const Favorites: React.FC<FavoritesProps> = ({ userId, onSelectProduct }) => {
  const [favorites, setFavorites] = React.useState<FavoriteProduct[]>([]);

  React.useEffect(() => {
    if (userId) {
      fetchFavorites(userId);
    }
  }, [userId]);

  const fetchFavorites = async (userId: number) => {
    try {
      const response = await fetch(`http://localhost:5000/favorites/${userId}`);
      if (!response.ok) {
        throw new Error('Failed to fetch favorites');
      }
      const data = await response.json();
      setFavorites(data);
    } catch (error) {
      console.error('Error fetching favorites:', error);
    }
  };

  const removeFavorite = async (productId: number) => {
    if (!userId) return;

    try {
      const response = await fetch(`http://localhost:5000/favorites/${userId}/${productId}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error('Failed to remove favorite');
      }

      setFavorites(favorites.filter((product) => product.id !== productId));
    } catch (error) {
      console.error('Error removing favorite:', error);
    }
  };

  return (
    <div className="sticky-favorites-container">
  <div className="sticky-favorites">
    <h3>Избранное</h3>
    {favorites.length > 0 ? (
      <ul>
        {favorites.map((product) => (
          <li
            key={product.id}
            onClick={() => onSelectProduct(product)}
            style={{ cursor: 'pointer' }}
          >
            <div>
              <img src={product.image_url} alt={product.name} width="50" />
              <span className="ms-2">{product.name}</span>
            </div>
            <button
              className="btn btn-danger btn-sm"
              onClick={() => removeFavorite(product.id)}
            >
              Удалить
            </button>
          </li>
        ))}
      </ul>
    ) : (
      <p>Ваш список избранного пуст</p>
    )}
  </div>
</div>
  );
};

export default Favorites;
