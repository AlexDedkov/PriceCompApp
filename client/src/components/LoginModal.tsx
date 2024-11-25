import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

interface LoginModalProps {
  show: boolean;
  onClose: () => void;
  onLoginSuccess: (username: string, isAdmin: boolean) => void;  // Expecting two arguments
}

const LoginModal: React.FC<LoginModalProps> = ({ show, onClose, onLoginSuccess }) => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  const handleLogin = async () => {
    const loginData = { username, password };

    try {
      const response = await fetch('http://localhost:5000/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(loginData),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || 'Login failed');
      }

      const data = await response.json();
      console.log('Login success:', data);
      onLoginSuccess(username, false);  // Pass 'false' for regular user login
    } catch (error) {
      if (error instanceof Error) {
        setErrorMessage(error.message);
      } else {
        setErrorMessage('Unexpected error occurred');
      }
    }
  };

  if (!show) return null;

  return (
    <div className="modal fade show d-block dark-theme" tabIndex={-1} role="dialog">
      <div className="modal-dialog" role="document">
        <div className="modal-content dark-modal-content">
          <div className="modal-header">
            <h5 className="modal-title">Логин</h5>
            <button type="button" className="btn-close" onClick={onClose}></button>
          </div>
          <div className="modal-body">
            {errorMessage && <div className="alert alert-danger">{errorMessage}</div>}
            <input
              type="text"
              className="form-control mb-3 dark-input"
              placeholder="Имя"
              value={username}
              autoComplete="username"  // Helps specify intended use
              onChange={(e) => setUsername(e.target.value)}
            />
            <input
              type="password"
              className="form-control dark-input"
              placeholder="Пароль"
              value={password}
              autoComplete="current-password"  // Helps avoid incorrect autofills
              onChange={(e) => setPassword(e.target.value)}
            />
          </div>
          <div className="modal-footer">
            <button type="button" className="btn btn-secondary" onClick={onClose}>Закрыть</button>
            <button type="button" className="btn btn-primary" onClick={handleLogin}>Войти</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default LoginModal;