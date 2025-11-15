# 📦 Pharmacy Management System (MySQL)

The **Pharmacy Management System** is a **database-driven project** designed to automate and streamline the core operations of a pharmacy. It ensures efficient management of **medicines, prescriptions, customers, employees, orders, and billing**, while maintaining **data integrity, security, and quick information retrieval**.

---

## 🚀 Features

### 🧪 Medicine Inventory Management
- Track medicines, manufacturers, stock, price, and expiry dates  
- Automatically detect expired or low-stock medicines  
- Maintain manufacturer–medicine relationships  

### 🧾 Prescription Handling
- Store prescriptions linked to customers and doctors  
- Map multiple medicines to a single prescription  
- Validate medicine availability automatically  

### 👨‍⚕️ Employee & Role Management
- Manage pharmacists, doctors, and cashiers  
- Store roles, salaries, and shift timings  
- Ensure structured workforce data  

### 👤 Customer & Insurance Records
- Store customer demographic and contact details  
- Maintain insurance providers and discounts  
- Link insurance to billing workflow  

### 💳 Sales & Order Management
- Create and track purchase orders  
- Auto-compute billing with insurance deductions  
- Generate final invoices  

---

## 🗄️ Database Structure

| **Table Name**    | **Description** |
|-------------------|------------------|
| Customers         | Stores patient details |
| Employees         | Employee/doctor details |
| Insurance         | Insurance provider information |
| Medicines         | Medicine price, expiry, manufacturer |
| Manufacturers     | Company details |
| Prescriptions     | Prescription metadata |
| PrescriptionItems | Medicine list inside a prescription |
| Orders            | Customer order details |
| OrderItems        | Medicine-wise breakdown of orders |
| Bills             | Final invoice data |

---

## 🧱 Sample Table Columns

### **Customers**
- customer_id  
- name  
- age  
- gender  
- phone  
- address  
- insurance_id  

### **Employees**
- employee_id  
- name  
- role  
- salary  
- shift_time  

### **Medicines**
- medicine_id  
- name  
- manufacturer_id  
- price  
- expiry_date  
- stock  

---

## 🛠️ Technologies Used

- **MySQL**  
- **Advanced SQL Queries**  
- **Triggers**
- **Stored Procedures**
- **Joins & Subqueries**

---

## 🧩 SQL Concepts Implemented

### ✔️ Relational Database Design
- Primary & foreign keys  
- Normalized schema (3NF)  

### ✔️ SQL Joins  
- Multi-table joins for billing and order analysis  

### ✔️ Stored Procedures  
- Billing calculation  
- Automatic stock handling  

### ✔️ Triggers  
- Prevent sale of expired medicines  
- Auto-update stock on order creation  

---

## 📘 How to Use

1. Clone the repository  
2. Import the provided `.sql` file into MySQL  
3. Run DDL scripts to create tables  
4. Insert sample data  
5. Run triggers, procedures, and queries for testing  
6. Use MySQL Workbench / CLI to interact with the system  

---

## 📄 Project Highlights
- **10+ interconnected tables**  
- Real-world pharmacy workflow simulation  
- Strong focus on **data integrity & automation**  
- Excellent project for **DBMS**, interviews, and resume portfolios  

---

## 🤝 Contributions
Contributions and suggestions are welcome!

---


