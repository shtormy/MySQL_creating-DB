-- триггер запрещающий вставлять в поле телефон количесвто цифр отличные от 11
delimiter //
DROP TRIGGER IF EXISTS  add_users;
CREATE TRIGGER add_users AFTER INSERT 
ON users 
FOR EACH ROW 
BEGIN 
	 IF LENGTH(NEW.phone) != 11 
	 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Заполните корректно поле телефон';
    END IF;
END//

/*INSERT INTO users VALUES
(21, 'Светлана', 'Попова', 'ia_svetlana@mail.ru', '8938', 'svetlana', '12345');*/

-- DELETE FROM users WHERE id=21;

-- триггер не дает купить товара, больше чем на складе
delimiter //
DROP TRIGGER IF EXISTS few_items_to_order;
CREATE TRIGGER few_items_to_order BEFORE INSERT 
ON orders 
FOR EACH ROW 
BEGIN
	 DECLARE quantity_id bigINT;
  SELECT quantity INTO quantity_id FROM storehouse where product_id = NEW.product_id;
	IF NEW.quantity > quantity_id
	THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недостаточно товара для заказа.';
    END IF;
	
END//