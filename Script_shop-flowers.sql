drop database if exists shop_flowers;
CREATE database shop_flowers;
use shop_flowers;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50), 
    email VARCHAR(120) UNIQUE,
    phone BIGINT UNIQUE,
    login VARCHAR(120) UNIQUE,
    user_password varchar(100)
) comment 'Данные покупателя';

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles(
	user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(100),
    shipping_address_default text,
    foreign key (user_id) references users(id)
)comment 'Профиль покупателя';

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
) comment 'Разделы каталога';

DROP TABLE IF EXISTS catalog_subdivision;
CREATE TABLE catalog_subdivision(
	id SERIAL PRIMARY KEY,
	catalog_id BIGINT UNSIGNED NOT NULL,
	name varchar(100),
	FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
) comment 'Подкаталоги';

DROP TABLE IF EXISTS products;
CREATE TABLE products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Название',
    desription TEXT COMMENT 'Описание',
    price DECIMAL (11,2) COMMENT 'Цена',
    catalog_sub_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
   	FOREIGN KEY (catalog_sub_id) REFERENCES catalog_subdivision(id)
) COMMENT 'Товары';

DROP TABLE IF EXISTS storehouse;
CREATE TABLE storehouse(
	id serial PRIMARY KEY,
	product_id BIGINT UNSIGNED NOT NULL,
	quantity int DEFAULT 0 COMMENT 'Остаток',
	FOREIGN KEY (product_id) REFERENCES products(id)
	) comment 'Остаток товаров';

DROP TABLE IF EXISTS images;
CREATE TABLE images(
	id SERIAL PRIMARY KEY,
	images_id BIGINT UNSIGNED  NULL,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (images_id) REFERENCES products(id)
	) comment 'Фото товара';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    quantity int DEFAULT 1 COMMENT 'Количество товара',
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    INDEX orders_quantity_idx(quantity)
	) comment 'Kорзина покупателя';

DROP TABLE IF EXISTS feedback;
CREATE TABLE feedback(
	feedback_id serial PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	feedback_body text,
	product_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
	) comment 'Отзывы покупателей';

DROP TABLE if EXISTS payments;
CREATE TABLE payments(
	id serial PRIMARY KEY,
	payer_id BIGINT UNSIGNED NOT NULL,
	pay_order_id BIGINT UNSIGNED NOT NULL,
	payment_date DATETIME DEFAULT NOW(),
	pay_status bit DEFAULT 0,
	amount_of_payment DECIMAL (65,2) COMMENT 'Стоимость',
	FOREIGN KEY (payer_id) REFERENCES users(id),
	FOREIGN KEY (pay_order_id) REFERENCES orders(id)
	) comment 'Оплата заказа'; 

DROP TABLE IF EXISTS delivery;
CREATE TABLE delivery(
	id serial PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	order_id BIGINT UNSIGNED NOT NULL,
	shipping_address text,
	delivery_method ENUM ('Самовывоз', 'Курьером'),
	FOREIGN KEY (order_id) REFERENCES orders(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
	) comment 'Доставка'; 
	
DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  product_id BIGINT UNSIGNED NOT NULL,
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  KEY index_of_product_id(product_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(50), 
	phone BIGINT UNIQUE,
    login VARCHAR(120) UNIQUE,
    user_password varchar(100),
	user_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
	order_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (product_id) REFERENCES products(id),
	FOREIGN KEY (order_id) REFERENCES orders(id)
) COMMENT = 'Продавцы';


