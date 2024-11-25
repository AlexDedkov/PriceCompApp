import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

interface RegisterModalProps {
  show: boolean;
  onClose: () => void;
}

const RegisterModal: React.FC<RegisterModalProps> = ({ show, onClose }) => {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  // Function to validate email format
  const isValidEmail = (email: string) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  };

  const handleRegister = async () => {
    if (!isValidEmail(email)) {
      setErrorMessage('Введите корректный адрес почты');
      return;
    }

    const registerData = { username, email, password };

    try {
      const response = await fetch('http://localhost:5000/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(registerData),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || 'Registration failed');
      }

      const data = await response.json();
      console.log('Registration success:', data);
      setErrorMessage(null); // Clear any previous error messages
      onClose(); // Close the modal after successful registration
    } catch (error) {
      if (error instanceof Error) {
        setErrorMessage(error.message); // Display the error message in the modal
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
            <h5 className="modal-title">Регистрация</h5>
            <button type="button" className="btn-close" onClick={onClose}></button>
          </div>
          <div className="modal-body">
            {errorMessage && <div className="alert alert-danger">{errorMessage}</div>}
            <input
              type="text"
              className="form-control mb-3 dark-input"
              placeholder="Имя"
              value={username}
              autoComplete="new-username"
              onChange={(e) => setUsername(e.target.value)}
            />
            <input
              type="email"
              className="form-control mb-3 dark-input"
              placeholder="Email"
              value={email}
              autoComplete="new-email"
              onChange={(e) => setEmail(e.target.value)}
            />
            <input
              type="password"
              className="form-control dark-input"
              placeholder="Пароль"
              value={password}
              autoComplete="new-password"
              onChange={(e) => setPassword(e.target.value)}
            />
          </div>
          <div className="modal-footer">
            <button type="button" className="btn btn-secondary" onClick={onClose}>Закрыть</button>
            <button type="button" className="btn btn-primary" onClick={handleRegister}>Зарегистрироваться</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default RegisterModal;
