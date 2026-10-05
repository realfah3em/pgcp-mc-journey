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
    createdTimestamp timestamp default current_timestamp
);

CREATE TABLE products(
    id integer primary key auto_increment,
    title varchar(50),
    brand varchar(50),
    tags varchar(100),
    price float,
    expiryDate varchar(50),
    category varchar(50),
    primaryImage varchar(100),
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
> yarn add express mysql2 cors multer jsonwebtoken morgan

```
