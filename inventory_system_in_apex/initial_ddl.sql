CREATE TABLE  "SALES_ORDER" 
   (	"SALES_ORDER_ID" NUMBER, 
	"SALES_ORDER_NO" VARCHAR2(20), 
	"SUPPLIER_ID" NUMBER, 
	"ORDER_DATE" DATE, 
	"ORDER_STATUS" VARCHAR2(20), 
	"TOTAL_PRICE" NUMBER, 
	 PRIMARY KEY ("SALES_ORDER_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "GOODS_DISPATCH" 
   (	"GOODS_DISPATCH_ID" NUMBER, 
	"GOODS_DISPATCH_NO" VARCHAR2(20), 
	"DISPATCH_DATE" DATE, 
	"SALES_ORDER_ID" NUMBER, 
	 PRIMARY KEY ("GOODS_DISPATCH_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "SUPPLIER" 
   (	"SUPPLIER_ID" NUMBER, 
	"SUPPLIER_NAME" VARCHAR2(30), 
	"ADDRESS" VARCHAR2(250), 
	"EMAIL" VARCHAR2(50), 
	"PHONE" VARCHAR2(20), 
	 PRIMARY KEY ("SUPPLIER_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "LOCATION" 
   (	"LOCATION_ID" NUMBER, 
	"LOCATION_NAME" VARCHAR2(30)
   )
/
CREATE TABLE  "GOODS_RECEIPT_D" 
   (	"GOODS_RECEIPT_D_ID" NUMBER, 
	"GOODS_RECEIPT_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	 PRIMARY KEY ("GOODS_RECEIPT_D_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "PRODUCT_SUPPLIER" 
   (	"PRODUCT_SUPPLIER_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"SUPPLIER_ID" NUMBER, 
	 PRIMARY KEY ("PRODUCT_SUPPLIER_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "PURCHASE_ORDER" 
   (	"PURCHASE_ORDER_ID" NUMBER, 
	"PURCHASE_ORDER_NO" VARCHAR2(20), 
	"SUPPLIER_ID" NUMBER, 
	"ORDER_DATE" DATE, 
	"ORDER_STATUS" VARCHAR2(20), 
	"TOTAL_PRICE" NUMBER, 
	 PRIMARY KEY ("PURCHASE_ORDER_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "GOODS_DISPATCH_D" 
   (	"GOODS_DISPATCH_D_ID" NUMBER, 
	"GOODS_DISPATCH_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	 PRIMARY KEY ("GOODS_DISPATCH_D_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "APP_USER" 
   (	"USER_ID" NUMBER, 
	"USER_NAME" VARCHAR2(100), 
	"USER_EMAIL" VARCHAR2(100), 
	"USER_PASSWORD" VARCHAR2(250), 
	 PRIMARY KEY ("USER_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "CUSTOMER" 
   (	"CUSTOMER_ID" NUMBER, 
	"CUSTOMER_NAME" VARCHAR2(30), 
	"ADDRESS" VARCHAR2(250), 
	"EMAIL" VARCHAR2(50), 
	"PHONE" VARCHAR2(20), 
	 PRIMARY KEY ("CUSTOMER_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "PURCHASE_ORDER_D" 
   (	"PURCHASE_ORDER_D_ID" NUMBER, 
	"PURCHASE_ORDER_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	 PRIMARY KEY ("PURCHASE_ORDER_D_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "SALES_ORDER_D" 
   (	"SALES_ORDER_D_ID" NUMBER, 
	"SALES_ORDER_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	 PRIMARY KEY ("SALES_ORDER_D_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "GOODS_RECEIPT" 
   (	"GOODS_RECEIPT_ID" NUMBER, 
	"GOODS_RECEIPT_NO" VARCHAR2(20), 
	"RECEIPT_DATE" DATE, 
	"PURCHASE_ORDER_ID" NUMBER, 
	 PRIMARY KEY ("GOODS_RECEIPT_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "PRODUCT" 
   (	"PRODUCT_ID" NUMBER, 
	"PRODUCT_NAME" VARCHAR2(30), 
	"DESCRIPTION" VARCHAR2(250), 
	"PRICE" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRODUCT_CATEGORY_ID" NUMBER, 
	"LOCATION_ID" NUMBER, 
	 PRIMARY KEY ("PRODUCT_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "PRODUCT_CATEGORY" 
   (	"PRODUCT_CATEGORY_ID" NUMBER, 
	"PRODUCT_CATEGORY_NAME" VARCHAR2(20), 
	 PRIMARY KEY ("PRODUCT_CATEGORY_ID")
  USING INDEX  ENABLE
   )
/
 CREATE SEQUENCE   "GOODS_DISPATCH_D_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
 CREATE SEQUENCE   "GOODS_RECEIPT_D_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
 CREATE SEQUENCE   "PRODUCT_SUPPLIER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
 CREATE SEQUENCE   "PURCHASE_ORDER_D_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
 CREATE SEQUENCE   "SALES_ORDER_D_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "APP_USER_BI" 
before insert on app_user
for each row
declare
    l_user_id number;
begin
    if inserting then
        select nvl(max(user_id), 100) + 1 into l_user_id
        from app_user;
        :new.user_id := l_user_id;
    end if;
end;

/
ALTER TRIGGER  "APP_USER_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "CUSTOMER_BI" 
before insert on customer
for each row
declare
    l_customer_id number;
begin
    if inserting then
        select nvl(max(customer_id), 100) + 1 into l_customer_id
        from customer;
        :new.customer_id := l_customer_id;
    end if;
end;

/
ALTER TRIGGER  "CUSTOMER_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "GOODS_DISPATCH_BI" 
before insert on goods_dispatch
for each row
declare
    l_goods_dispatch_id number;
begin
    if inserting then
        select nvl(max(goods_dispatch_id), 100) + 1 into l_goods_dispatch_id
        from goods_dispatch;
        :new.goods_dispatch_id := l_goods_dispatch_id;
    end if;
end;

/
ALTER TRIGGER  "GOODS_DISPATCH_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "GOODS_DISPATCH_D_BI" 
before insert on goods_dispatch_d
for each row
begin
    if inserting then
        :new.goods_dispatch_d_id := goods_dispatch_d_seq.nextval;
    end if;
end;

/
ALTER TRIGGER  "GOODS_DISPATCH_D_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "GOODS_RECEIPT_BI" 
before insert on goods_receipt
for each row
declare
    l_goods_receipt_id number;
begin
    if inserting then
        select nvl(max(goods_receipt_id), 100) + 1 into l_goods_receipt_id
        from goods_receipt;
        :new.goods_receipt_id := l_goods_receipt_id;
    end if;
end;

/
ALTER TRIGGER  "GOODS_RECEIPT_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "GOODS_RECEIPT_D_BI" 
before insert on goods_receipt_d
for each row
begin
    if inserting then
        :new.goods_receipt_d_id := goods_receipt_d_seq.nextval;
    end if;
end;

/
ALTER TRIGGER  "GOODS_RECEIPT_D_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "LOCATION_BI" 
before insert on location
for each row
declare
    l_location_id number;
begin
    if inserting then
        select nvl(max(location_id), 100) + 1 into l_location_id
        from location;
        :new.location_id := l_location_id;
    end if;
end;

/
ALTER TRIGGER  "LOCATION_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "PRODUCT_BI" 
before insert on product
for each row
declare
    l_product_id number;
begin
    if inserting then
        select nvl(max(product_id), 100) + 1 into l_product_id
        from product;
        :new.product_id := l_product_id;
    end if;
end;

/
ALTER TRIGGER  "PRODUCT_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "PRODUCT_CATEGORY_BI" 
before insert on product_category
for each row
declare
    l_product_category_id number;
begin
    if inserting then
        select nvl(max(product_category_id), 100) + 1 into l_product_category_id
        from product_category;
        :new.product_category_id := l_product_category_id;
    end if;
end;

/
ALTER TRIGGER  "PRODUCT_CATEGORY_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "PRODUCT_SUPPLIER_BI" 
before insert on product_supplier
for each row
begin
    if inserting then
        :new.product_supplier_id := product_supplier_seq.nextval;
    end if;
end;

/
ALTER TRIGGER  "PRODUCT_SUPPLIER_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "PURCHASE_ORDER_BI" 
before insert on purchase_order
for each row
declare
    l_purchase_order_id number;
begin
    if inserting then
        select nvl(max(purchase_order_id), 100) + 1 into l_purchase_order_id
        from purchase_order;
        :new.purchase_order_id := l_purchase_order_id;
    end if;
end;

/
ALTER TRIGGER  "PURCHASE_ORDER_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "PURCHASE_ORDER_D_BI" 
before insert on purchase_order_d
for each row
begin
    if inserting then
        :new.purchase_order_d_id := purchase_order_d_seq.nextval;
    end if;
end;

/
ALTER TRIGGER  "PURCHASE_ORDER_D_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "SALES_ORDER_BI" 
before insert on sales_order
for each row
declare
    l_sales_order_id number;
begin
    if inserting then
        select nvl(max(sales_order_id), 100) + 1 into l_sales_order_id
        from sales_order;
        :new.sales_order_id := l_sales_order_id;
    end if;
end;

/
ALTER TRIGGER  "SALES_ORDER_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "SALES_ORDER_D_BI" 
before insert on sales_order_d
for each row
begin
    if inserting then
        :new.sales_order_d_id := sales_order_d_seq.nextval;
    end if;
end;

/
ALTER TRIGGER  "SALES_ORDER_D_BI" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "SUPPLIER_BI" 
before insert on supplier
for each row
declare
    l_supplier_id number;
begin
    if inserting then
        select nvl(max(supplier_id), 100) + 1 into l_supplier_id
        from supplier;
        :new.supplier_id := l_supplier_id;
    end if;
end;

/
ALTER TRIGGER  "SUPPLIER_BI" ENABLE
/
