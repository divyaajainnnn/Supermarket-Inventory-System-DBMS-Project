## 👥 Group Details

**Project Title:** Supermarket Inventory System  
**Group:** 20  

**Group Members:**  
- Divya Jain (341138)  
- Kashish Jain (341143)  
- Mandira Roy (341151)  

**Programme:** PGDM 34(C)  
**Course:** Database Management Systems (DBMS)  
**Submitted To:** Prof. Ashok K. Harnal

---
## 📌 Project Overview
This repository contains the database design and implementation of a **Supermarket Inventory System**, developed as part of the **Database Management Systems (DBMS)** course.

The Supermarket Inventory System is designed to model the day-to-day operations of a supermarket from a database perspective.  
The system captures information related to products, stores, suppliers, customers, employees, inventory stock, and sales transactions.

The database design follows standard DBMS principles such as:
- Entity–relationship modeling
- One-to-many and many-to-many relationships
- Use of primary and composite keys
- Referential integrity using foreign keys
- Basic constraints and enumerated values

---
## Supermarket Inventory System – ER Diagram
<img width="904" height="1072" alt="er diagram" src="https://github.com/user-attachments/assets/fec9ed2b-e0fb-45db-a1a3-ff3aedc517be" />

---
## Database Tables Description

| Table Name | Description |
|-----------|------------|
| customer | Stores customer information such as name, contact details, address, and status |
| product | Stores product master data including product code, brand name, category, and product name |
| sku | Stores SKU-level details for each product such as pack size and MRP |
| store | Stores details of supermarket stores and warehouses including location and type |
| employee | Stores employee information and the store they are assigned to |
| supplier | Stores supplier master information |
| supplier_sku | Represents the many-to-many relationship between suppliers and SKUs along with supply price |
| stock | Represents the many-to-many relationship between stores and SKUs, storing inventory quantity and inbound price |
| purchase_order | Stores purchase orders placed with suppliers |
| purchase_order_item | Stores SKU-wise items included in each purchase order |
| sales_order | Stores customer orders and the SKUs included in each order |
| sales_payment | Stores payment details related to customer orders |
| delivery | Stores delivery details for customer orders including assigned store and employee |

---
## 📁 Files Included

- **supermarket_databse.sql**  
  Contains the complete SQL schema with table definitions, primary keys, foreign keys, constraints, and relationships.

- **supermarket_database ER.mwb**
- **supermarket_database ER pdf.pdf**
  ER diagram representing entities and relationships used in the database design.
