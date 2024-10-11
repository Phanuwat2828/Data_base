CREATE TRIGGER tg_checkProductPrice20Percent
ON product 
INSTEAD OF UPDATE
AS
BEGIN 
    -- อัปเดตเฉพาะสินค้าที่ราคามีการเปลี่ยนแปลงไม่เกิน 20%
    UPDATE product 
    SET price = inserted.price
    FROM product
    JOIN inserted ON product.pid = inserted.pid 
    JOIN deleted ON product.pid = deleted.pid 
    WHERE inserted.price <= deleted.price * 1.2;  -- จำกัดการอัปเดตราคาไม่เกิน 20%

    -- ตรวจสอบและแจ้งเตือนถ้ามีการพยายามอัปเดตราคาเกิน 20%
    IF EXISTS (
        SELECT *
        FROM inserted
        JOIN deleted ON inserted.pid = deleted.pid 
        WHERE inserted.price > deleted.price * 1.2
    )
    BEGIN 
        RAISERROR('Cannot update prices more than 20%%. Some updates were ignored.', 16, 1);
    END
END;


select *
from product

drop trigger tg_checkProductPrice20Percent

update product 
set price = price*100
