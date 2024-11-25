import React, { useState } from 'react';
import Favorites from './Favorites'; 
import LoginModal from './LoginModal';
import RegisterModal from './RegisterModal';
import AdminLoginModal from './AdminLoginModal';
import 'bootstrap/dist/css/bootstrap.min.css';

interface FavoriteProduct {
  id: number;
  name: string;
  description: string;
  image_url: string;
}

interface HeaderProps {
  setLoggedInUser: React.Dispatch<React.SetStateAction<string | null>>;
  setIsAdmin: React.Dispatch<React.SetStateAction<boolean>>;  // Add setIsAdmin to props
  userId: number | null;
  onSelectProduct: (product: FavoriteProduct) => void; 
}

const Header: React.FC<HeaderProps> = ({ setLoggedInUser, setIsAdmin, userId, onSelectProduct }) => {
  const [showFavorites, setShowFavorites] = useState(false);
  const [showLoginModal, setShowLoginModal] = useState(false);
  const [showRegisterModal, setShowRegisterModal] = useState(false);
  const [showAdminLoginModal, setShowAdminLoginModal] = useState(false); // Admin login state
  const [loggedInUser, setLoggedInUserState] = useState<string | null>(null);
  const [isAdmin, setIsAdminState] = useState<boolean>(false);  // Local admin state

  const handleToggleFavorites = () => setShowFavorites(!showFavorites);
  const handleShowLogin = () => setShowLoginModal(true);
  const handleShowRegister = () => setShowRegisterModal(true);
  const handleShowAdminLogin = () => setShowAdminLoginModal(true); // Show admin login modal

  const handleCloseLogin = () => setShowLoginModal(false);
  const handleCloseRegister = () => setShowRegisterModal(false);
  const handleCloseAdminLogin = () => setShowAdminLoginModal(false); // Close admin login modal

  const handleLoginSuccess = (username: string, admin: boolean) => {
    setLoggedInUserState(username);
    setLoggedInUser(username);
    setIsAdmin(admin);  // Set global admin state
    setIsAdminState(admin);  // Set local admin state
    handleCloseLogin();  // Close login modal
  };

  const handleLogout = () => {
    setLoggedInUserState(null);
    setLoggedInUser(null);
    setIsAdmin(false);  // Reset admin state
    setIsAdminState(false);  // Reset local admin state
  };

  return (
    <div>
      <header className="fixed-top bg-dark text-white p-3">
        <div className="container">
          <nav className="navbar navbar-expand-lg navbar-dark">
            <a className="navbar-brand navttext" href="#top">СравниЦены</a>
            <button
              className="navbar-toggler"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#navbarNav"
              aria-controls="navbarNav"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <span className="navbar-toggler-icon"></span>
            </button>
            <div className="collapse navbar-collapse justify-content-end" id="navbarNav">
              <ul className="navbar-nav">
                {/* Show "Favorites" button only if user is not an admin */}
                {loggedInUser && !isAdmin && (
                  <li className="nav-item me-3">
                    <button
                      onClick={handleToggleFavorites}
                      className="btn btn-secondary"
                    >
                      {showFavorites ? 'Спрятать избранное' : 'Показать избранное'}
                    </button>
                  </li>
                )}
                {/* Show user or admin details if logged in */}
                {loggedInUser ? (
                  <>
                    <li className="nav-item me-3">
                      <span>{loggedInUser} {isAdmin && '(Admin)'}</span>
                    </li>
                    <li className="nav-item">
                      <button
                        onClick={handleLogout}
                        className="btn btn-danger"
                      >
                        Выйти
                      </button>
                    </li>
                  </>
                ) : (
                  <>
                    {/* Show login, register, and admin login buttons if not logged in */}
                    <li className="nav-item me-3">
                      <button
                        onClick={handleShowRegister}
                        className="btn btn-primary"
                      >
                        Зарегистрироваться
                      </button>
                    </li>
                    <li className="nav-item me-3">
                      <button
                        onClick={handleShowLogin}
                        className="btn btn-success"
                      >
                        Войти
                      </button>
                    </li>
                    <li className="nav-item">
                      <button
                        onClick={handleShowAdminLogin}
                        className="btn btn-warning"
                      >
                        Администратор
                      </button>
                    </li>
                  </>
                )}
              </ul>
            </div>
          </nav>
        </div>
      </header>

      {/* Show favorites only for regular users */}
      {showFavorites && !isAdmin && <Favorites userId={userId} onSelectProduct={onSelectProduct} />} 

      {/* Regular Login Modal */}
      <LoginModal
        show={showLoginModal}
        onClose={handleCloseLogin}
        onLoginSuccess={(username: string) => handleLoginSuccess(username, false)}  // Regular user login
      />

      {/* Register Modal */}
      <RegisterModal
        show={showRegisterModal}
        onClose={handleCloseRegister}
      />

      {/* Admin Login Modal */}
      <AdminLoginModal
        show={showAdminLoginModal}
        onClose={handleCloseAdminLogin}
        onLoginSuccess={(username: string) => handleLoginSuccess(username, true)}  // Admin login success
      />
    </div>
  );
};

export default Header;
