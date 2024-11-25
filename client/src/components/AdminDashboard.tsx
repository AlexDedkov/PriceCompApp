import React, { useState, useEffect } from 'react';

const AdminDashboard: React.FC = () => {
  const [selectedTable, setSelectedTable] = useState<string>('users');
  const [tableData, setTableData] = useState<any[]>([]);
  const [formData, setFormData] = useState<any>({});
  const [isEditMode, setIsEditMode] = useState<boolean>(false);
  const [editId, setEditId] = useState<number | null>(null);

  const tables = ['users', 'products', 'product_prices', 'price_notifications', 'favorites'];

  useEffect(() => {
    fetchTableData();
  }, [selectedTable]);

  const fetchTableData = async () => {
    try {
      const response = await fetch(`http://localhost:5000/admin/${selectedTable}`);
      const data = await response.json();
      setTableData(data);
    } catch (error) {
      console.error('Error fetching table data:', error);
    }
  };

  const handleFormChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleAdd = async () => {
    try {
      const response = await fetch(`http://localhost:5000/admin/${selectedTable}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData),
      });
      await response.json();
      fetchTableData();  // Refresh table data after adding
    } catch (error) {
      console.error('Error adding data:', error);
    }
  };

  const handleEdit = async () => {
    try {
      const response = await fetch(`http://localhost:5000/admin/${selectedTable}/${editId}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData),
      });
      await response.json();
      fetchTableData();  // Refresh table data after editing
      setIsEditMode(false);
      setEditId(null);
      setFormData({});
    } catch (error) {
      console.error('Error updating data:', error);
    }
  };

  const handleDelete = async (id: number) => {
    try {
      await fetch(`http://localhost:5000/admin/${selectedTable}/${id}`, { method: 'DELETE' });
      fetchTableData();  // Refresh table data after deleting
    } catch (error) {
      console.error('Error deleting data:', error);
    }
  };

  return (
    <div className="container mt-5 text-white">
      <h1>Панель Администратора</h1>

      {/* Table Selector */}
      <select value={selectedTable} onChange={(e) => setSelectedTable(e.target.value)} className="form-select mb-4">
        {tables.map((table) => (
          <option key={table} value={table}>
            {table}
          </option>
        ))}
      </select>

      {/* Table Data */}
      <table className="table table-striped">
        <thead>
          <tr>
            {tableData.length > 0 &&
              Object.keys(tableData[0]).map((key) => <th key={key}>{key}</th>)}
            <th>Действия</th>
          </tr>
        </thead>
        <tbody>
          {tableData.map((row) => (
            <tr key={row.id}>
              {Object.values(row).map((value, idx) => (
                <td key={idx}>
                  {typeof value === 'object' && value !== null ? JSON.stringify(value) : String(value)}
                </td>
              ))}
              <td>
                <button className="btn btn-primary me-2" onClick={() => {
                  setIsEditMode(true);
                  setEditId(row.id);
                  setFormData(row);  // Prepopulate form for editing
                }}>
                  Изменить
                </button>
                <button className="btn btn-danger" onClick={() => handleDelete(row.id)}>
                  Удалить
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      {/* Add/Edit Form */}
      <div className="mt-4">
        {Object.keys(tableData[0] || {}).map((key) => (
          <div className="mb-3" key={key}>
            <label className="form-label">{key}</label>
            <input
              type="text"
              name={key}
              value={formData[key] || ''}
              onChange={handleFormChange}
              className="form-control"
            />
          </div>
        ))}
        <button className="btn btn-success" onClick={isEditMode ? handleEdit : handleAdd}>
          {isEditMode ? 'Update' : 'Добавить'} 
        </button>
      </div>
    </div>
  );
};

export default AdminDashboard;
