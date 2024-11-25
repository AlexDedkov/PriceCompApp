import { useState } from 'react';
import Header from "./components/Header";
import Footer from "./components/Footer";
import Searchbar from "./components/Searchbar";
import Content from "./components/Content";
import Pricecomp from "./components/Pricecomp";
import AdminDashboard from './components/AdminDashboard';

interface Product {
  id: number;
  name: string;
  description: string;
  image_url: string;
}

function App() {
  const [selectedProduct, setSelectedProduct] = useState<Product | null>(null);
  const [loggedInUser, setLoggedInUser] = useState<string | null>(null);
  const [isAdmin, setIsAdmin] = useState<boolean>(false);  // Admin state

  const handleProductSelect = (product: Product) => {
    setSelectedProduct(product);
  };

  const userId = loggedInUser ? 1 : null;

  return (
    <div className="App">
      <Header 
        setLoggedInUser={setLoggedInUser} 
        setIsAdmin={setIsAdmin}  // Pass setIsAdmin to Header
        userId={userId} 
        onSelectProduct={handleProductSelect} 
      />
      <main>
        {isAdmin ? (
          <AdminDashboard />  // Render admin dashboard if logged in as admin
        ) : (
          <>
            <Searchbar onSelect={handleProductSelect} />
            <Content selectedProduct={selectedProduct} userId={userId} />
            <Pricecomp productId={selectedProduct?.id || null} />
          </>
        )}
      </main>
      <Footer />
    </div>
  );
}

export default App;
