-- представление показывает наличие товаров по разделу каталога

CREATE OR REPLACE VIEW view_products_in_catalog
AS 
SELECT c.id, p.name, st.quantity AS count_prod, c.name AS name_catalog
FROM 
	products p
JOIN
	catalog_subdivision cs
JOIN  
	catalogs c
join 
	storehouse st
ON 
	p.catalog_sub_id = cs.id AND cs.catalog_id = c.id AND p.id = st.product_id 

-- посмотрим наименования и количество товаров в каталоге 
	
SELECT * FROM view_products_in_catalog;



-- представление выводит статистику покупок по пользователям и сортирует по количеству заказов

CREATE OR REPLACE VIEW view_user_activ
AS 
SELECT CONCAT(u.firstname, ' ', u.lastname) AS us, COUNT(o.id) AS cnt
FROM 
	users u 
JOIN 
	orders o
ON 
	u.id = o.user_id 
GROUP BY us
ORDER BY cnt DESC 

-- посмотрим статистику покупок

SELECT * FROM view_user_activ;

-- пример вложенного запроса, выводит пользователя, его пол и количество отзывов, который он написал

SELECT
  id,
  lastname,
  (SELECT gender FROM profiles WHERE user_id = users.id) AS gend,
  (SELECT count(*) FROM feedback WHERE user_id = id) AS cnt
FROM
  users
ORDER BY cnt DESC


                    