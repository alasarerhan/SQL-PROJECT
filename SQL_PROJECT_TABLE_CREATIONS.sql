CREATE TABLE IF NOT EXISTS customers
(
    customer_id character varying(50) ,
    customer_unique_id character varying(50) ,
    customer_zip_code_prefix integer,
    customer_city character varying(50) ,
    customer_state character varying(50) ,
    PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS orders
(
    order_id character varying(50) ,
    customer_id character varying(50) ,
    order_status character varying(50) ,
    order_purchase_timestamp timestamp without time zone,
    order_approved_at timestamp without time zone,
    order_delivered_carrier_date timestamp without time zone,
    order_delivered_customer_date timestamp without time zone,
    order_estimated_delivery_date timestamp without time zone,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id) 
);


CREATE TABLE IF NOT EXISTS reviews
(
    review_id character varying(100) ,
    order_id character varying(100) ,
    review_score smallint,
    review_comment_title character varying(100) ,
    review_comment_message varchar ,
    review_creation_date date,
    review_answer_timestamp timestamp without time zone,
    FOREIGN KEY (order_id)
        REFERENCES orders (order_id) 
        
);


CREATE TABLE IF NOT EXISTS payments
(
    order_id character varying(100) ,
    payment_sequential integer,
    payment_type character varying(100) ,
    payment_installments integer,
    payment_value double precision,
    FOREIGN KEY (order_id)
        REFERENCES orders (order_id) 
);



-- Table: public.sellers

CREATE TABLE IF NOT EXISTS sellers
(
    seller_id character varying(100),
    seller_zip_code_prefix integer,
    seller_city character varying(100) ,
    seller_state character varying(100) ,
    PRIMARY KEY (seller_id)
);


CREATE TABLE IF NOT EXISTS products
(
    product_id character varying(100) ,
    product_category_name character varying(100) ,
    product_name_lenght integer,
    product_description_lenght integer,
    product_photos_qty integer,
    product_weight_g integer,
    product_length_cm integer,
    product_height_cm integer,
    product_width_cm integer,
    PRIMARY KEY (product_id)
);


CREATE TABLE IF NOT EXISTS order_items
(
    order_id character varying(100) ,
    order_item_id integer,
    product_id character varying(100) ,
    seller_id character varying(100) ,
    shipping_limit_date timestamp without time zone,
    price real,
    freight_value real,
	FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
	FOREIGN KEY (product_id)
        REFERENCES products (product_id),
	FOREIGN KEY (seller_id)
        REFERENCES public.sellers (seller_id)
    );

CREATE TABLE IF NOT EXISTS translation
(
    category_name character varying ,
    category_name_english character varying 
);



CREATE TABLE ecommerce_data (
    InvoiceNo integer,
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate VARCHAR,
    UnitPrice NUMERIC,
    CustomerID INT,
    Country VARCHAR(50)
);

alter table ecommerce_data
alter column invoicedate
type timestamp
using to_timestamp(invoicedate,'MM/DD/YY HH24:MI')



















