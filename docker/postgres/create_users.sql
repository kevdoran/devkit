CREATE USER ranger WITH LOGIN PASSWORD 'password';
CREATE DATABASE ranger;
GRANT CONNECT ON DATABASE ranger to ranger;
GRANT ALL PRIVILEGES ON DATABASE ranger TO ranger;