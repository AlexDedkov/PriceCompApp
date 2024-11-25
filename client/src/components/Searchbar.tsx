//Searchbar component

import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';

export interface SearchResult {
  id: number;
  name: string;
  description: string;
  image_url: string;
}

interface SearchbarProps {
  onSelect: (product: SearchResult) => void; 
}

const Searchbar: React.FC<SearchbarProps> = ({ onSelect }) => {
  const [searchTerm, setSearchTerm] = useState<string>('');
  const [searchResults, setSearchResults] = useState<SearchResult[]>([]);

  const handleSearch = async (): Promise<void> => {
    if (!searchTerm) return;

    try {
      const response = await fetch(`http://localhost:5000/search?q=${searchTerm}`);
      const data: SearchResult[] = await response.json();
      setSearchResults(data);
    } catch (error) {
      console.error('Error fetching search results:', error);
    }
  };

  const handleKeyDown = (event: React.KeyboardEvent<HTMLInputElement>): void => {
    if (event.key === 'Enter') {
      handleSearch();
    }
  };

  return (
    <div className="searchbar">
      <section id="searchsect" className="my-5 b">
        <div className="container my-1">
          <div className="row">
            <div className="col-md-9">
              <div className="input-group">
                <input
                  type="search"
                  className="form-control rounded"
                  placeholder="Поиск"
                  aria-label="Search"
                  aria-describedby="search-addon"
                  value={searchTerm}
                  onChange={(e: React.ChangeEvent<HTMLInputElement>) => setSearchTerm(e.target.value)}
                  onKeyDown={handleKeyDown} // Added event listener for "Enter" key
                />
                <button type="button" className="btn btn-outline-primary" onClick={handleSearch}>
                  Поиск
                </button>
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-md-9">
              <ul className="list-group">
                {searchResults.map((result) => (
                  <li
                    key={result.id}
                    className="list-group-item"
                    onClick={() => onSelect(result)} // Call onSelect when a result is clicked
                    style={{ cursor: 'pointer' }}
                  >
                    {result.name}
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Searchbar;
