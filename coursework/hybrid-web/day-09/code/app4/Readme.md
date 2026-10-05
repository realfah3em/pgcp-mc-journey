# Simple e-Commerce Application

## Requirements

- user: register, login, change-password
- products: add, delete, search products, update existing products
- orders: get, cancel, place
- cart: add items, remove items

## Database Schema

```sql

CREATE DATABASE ecommerce_demo;
USE ecommerce_demo;

CREATE TABLE users(
    id integer primary key auto_increment,
    firstName varchar(50),
    lastName varchar(50),
    email varchar(50),
    password varchar(100),
    address varchar(200),
    phoneNumber varchar(10),
    createdTimestamp timestamp default current_timestamp
);

CREATE TABLE products(
    id integer primary key auto_increment,
    title varchar(50),
    brand varchar(50),
    tags varchar(100),
    description varchar(1000),
    price float,
    primaryImage varchar(100),
    category varchar(50),
    createdTimestamp timestamp default current_timestamp
);

CREATE TABLE orders(
    id integer primary key auto_increment,
    userId integer,
    totalPrice float,
    createdTimestamp timestamp default current_timestamp
);

CREATE TABLE orderDetails (
    id integer primary key auto_increment,
    orderId integer,
    productId integer,
    price float,
    quantity integer,
    createdTimestamp timestamp default current_timestamp
);

CREATE TABLE cart (
    id integer primary key auto_increment,
    userId integer,
    productId integer,
    price float,
    quantity integer,
    createdTimestamp timestamp default current_timestamp
);

```

## Commands

```bash
# install pre-requisites
# express: basic REST server
# mysql2: driver to connect the mysql server
# cors: used to enable cross origin resource sharing
# multer: used to upload files from client to server
# jsonwebtoken: used to add user authorization
# morgan: used to add logging
# crypto-js: used to add encryption
> yarn add express mysql2 cors multer jsonwebtoken morgan crypto-js

# install all the dependencies from package.json
> yarn
> npm install

```

## Concepts

### Authentication

- check if user exists using the information known to the user (email and password)
- implemented firing a query to check user's existence in database

### Authorization

- check if an authenticated user has enough rights to perform a specific action
- implemented by using JWT
