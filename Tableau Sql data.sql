--Customer querry
SELECT
  customer.*,
  sub_territory.*,
  province.*
FROM
  `tc-da-1.adwentureworks_db.customer` AS customer
JOIN
  `adwentureworks_db.salesterritory` AS sub_territory
ON
  customer.TerritoryID = sub_territory.TerritoryID
JOIN
  `adwentureworks_db.stateprovince` AS province
ON
  sub_territory.TerritoryID = province.TerritoryID;
  
  
-- Sub sales 
SELECT
  sales_order_header.SubTotal,
  sales_order_header.TaxAmt,
  sales_order_header.Freight
FROM
  `adwentureworks_db.salesorderheader` as sales_order_header
  
  
  
-- Product 
SELECT
  product.*,
  special_offer.*,
  sales_order_detail.SalesOrderID,
  sales_order_detail.ProductID
FROM
  `adwentureworks_db.product` AS product
JOIN
  `adwentureworks_db.specialofferproduct` AS special_offer
ON
  product.ProductID = special_offer.ProductID
JOIN
  `adwentureworks_db.salesorderdetail` AS sales_order_detail
ON
  sales_order_detail.SpecialOfferID = special_offer.SpecialOfferID
  AND sales_order_detail.ProductID = special_offer.ProductID
JOIN
  `adwentureworks_db.salesorderheader` AS sales_order_header
ON
  sales_order_header.SalesOrderID = sales_order_detail.SalesOrderID
WHERE
  sales_order_header.OrderDate >= '2001-01-01'
  AND sales_order_header.OrderDate <= '2003-12-31';