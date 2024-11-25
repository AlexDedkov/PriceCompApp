import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

interface AdminLoginModalProps {
  show: boolean;
  onClose: () => void;
  onLoginSuccess: (username: string, isAdmin: boolean) => void;
}

const AdminLoginModal: React.FC<AdminLoginModalProps> = ({ show, onClose, onLoginSuccess }) => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState<string | null>(null);

  const handleLogin = async () => {
    const loginData = { username, password, isAdminLogin: true };

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
        throw new Error(errorData.error || 'Login failed');
      }

      const data = await response.json();
      console.log('Login success:', data);
      onLoginSuccess(username, true);
      onClose();
    } catch (error) {
      if (error instanceof Error) {
        setError(error.message);
      } else {
        setError('Unexpected error occurred');
      }
    }
  };

  if (!show) return null;

  return (
    <div className="modal fade show d-block dark-theme" tabIndex={-1} role="dialog">
      <div className="modal-dialog" role="document">
        <div className="modal-content dark-modal-content">
          <div className="modal-header">
            <h5 className="modal-title">Логин Администратора</h5>
            <button type="button" className="btn-close" onClick={onClose}></button>
          </div>
          <div className="modal-body">
            {error && <div className="alert alert-danger">{error}</div>}
            <input
              type="text"
              className="form-control mb-3 dark-input"
              placeholder="Логин"
              value={username}
              autoComplete="username"
              onChange={(e) => setUsername(e.target.value)}
            />
            <input
              type="password"
              className="form-control dark-input"
              placeholder="Пароль"
              value={password}
              autoComplete="current-password"
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

export default AdminLoginModal;
