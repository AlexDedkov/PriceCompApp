import React, { useState } from 'react';
import Favourites from './Favorites';
import Content from './Content';
import Pricecomp from './Pricecomp';

interface FavoriteProduct {
  id: number;
  name: string;
  description: string;
  image_url: string;
}

const MainComponent: React.FC<{ userId: number | null }> = ({ userId }) => {
  const [selectedProduct, setSelectedProduct] = useState<FavoriteProduct | null>(null);

  // Function to handle selecting a favorite product
  const handleSelectProduct = (product: FavoriteProduct) => {
    setSelectedProduct(product);
  };

  return (
    <div className="container">
      <div className="row">
        <div className="col-md-4">
          <Favourites userId={userId} onSelectProduct={handleSelectProduct} />
        </div>

        <div className="col-md-8">
          {/* Pass selectedProduct and userId to Content */}
          <Content selectedProduct={selectedProduct} userId={userId} />

          {/* Also pass selectedProduct to Pricecomp for price comparisons */}
          {selectedProduct && <Pricecomp productId={selectedProduct.id} />}
        </div>
      </div>
    </div>
  );
};

export default MainComponent;
