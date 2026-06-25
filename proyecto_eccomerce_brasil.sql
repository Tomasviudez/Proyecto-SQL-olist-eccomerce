--1
SELECT 
    o.order_id, 
    r.review_score, 
    i.freight_value
FROM olist_orders o
INNER JOIN olist_order_reviews r ON o.order_id = r.order_id
INNER JOIN olist_order_items i ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
LIMIT 10

--2
SELECT 
    order_id,
    order_purchase_timestamp,
    order_delivered_customer_date,
    
    -- Acá ocurre la magia de la limpieza de datos (ELT):
    DATE(NULLIF(order_delivered_customer_date, '')) - DATE(NULLIF(order_purchase_timestamp, '')) AS dias_de_demora

FROM 
    olist_orders
WHERE 
    order_status = 'delivered'
LIMIT 10;
--3
SELECT 
    ROUND(CAST(CORR(price, freight_value) AS NUMERIC), 4) AS correlacion_precio_vs_envio
FROM 
    olist_order_items;

