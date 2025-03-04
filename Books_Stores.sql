# Create a Database called 'Books_Stores' 
CREATE DATABASE Books_Stores;
USE Books_Stores;

# create table "Branch"
CREATE TABLE Branch
(
Branch_Code VARCHAR(10) PRIMARY KEY,
Manager_id VARCHAR(10),
Branch_address VARCHAR(30),
Contact_Number VARCHAR(15)
);
DESC branch;

# Create table "Employees"
CREATE TABLE Employees
(
Employee_id VARCHAR(30) PRIMARY KEY,
Employee_name VARCHAR(30),
Position_of_emoplyee VARCHAR(30),
Salary DECIMAL(10,2)
);
DESC Employees;





# Create table "Customer"
CREATE TABLE Customers
(
Customer_Id VARCHAR(20) PRIMARY KEY,
Customer_name VARCHAR(30) not null,
Customer_address VARCHAR(30) not null,
Register_date DATE
);
DESC Customers;





# Create table "Books"
CREATE TABLE Books
(
ISBN VARCHAR(10) PRIMARY KEY,
Book_title VARCHAR(50),
Category VARCHAR(30),
Rental_Price DECIMAL(10,2),
Status ENUM('Yes','No'),
Author VARCHAR(30),
Publisher VARCHAR(30)
);
DESC Books;

alter TABLE books MODIFY COLUMN ISBN VARCHAR(30);
alter TABLE books MODIFY COLUMN Book_title VARCHAR(60);

# Create table "IssueStatus"
CREATE TABLE IssueStatus
(
Issue_Id VARCHAR(10) PRIMARY KEY,
Issued_cust_id VARCHAR(30),
Issued_book_name VARCHAR(80),
Issue_date DATE,
Isbn_book VARCHAR(30),
FOREIGN KEY (Issued_cust_id) REFERENCES Customers(Customer_id) on DELETE CASCADE,
FOREIGN KEY (Isbn_book) REFERENCES books(ISBN) on DELETE CASCADE
);
DESC issuestatus;
ALTER TABLE issuestatus MODIFY COLUMN Issued_book_name VARCHAR(80) not null;
ALTER TABLE issuestatus MODIFY COLUMN Isbn_book VARCHAR(25) not null;


# Create table "ReturnStatus"
CREATE TABLE ReturnStatus
(
Return_id VARCHAR(10) PRIMARY KEY,
Return_cust_id VARCHAR(30) not null,
Return_book_name VARCHAR(80),
Return_date DATE,
isbn_book VARCHAR(25) not null,
FOREIGN KEY (isbn_book) REFERENCES books(ISBN) on DELETE CASCADE
);
DESC returnstatus;



SHOW TABLES;
desc branch;
# Insert values into each tables
INSERT INTO branch VALUES
('HYD-B001', 'HYD-M101', 'KPHB PILLER NO-1866', '+917244861897'),
('VIZAG-B002', 'VIZAG-M102', 'VIZAG-MAIN CENTER ROAD NO-3', '+918624870145'),
('CHNI-B003', 'CHNI-M103', 'PARADISE ROAD NO-4', '+919048756942'),
('HYD-B004', 'HYD-M104', 'GACHIBOWLI ROAD NO-4', '+919725461348'),
('VIZAG-B005', 'VIZAG-M105', 'BESIDE BEACH NO-5', '+917548632457');
SELECT * FROM branch;

DESC employees;

INSERT INTO employees VALUES
('E101', 'Krishnakanth Nalamolu', 'Manager', 80000.00),
('E102', 'Raju namappli', 'Clerk', 40000.00),
('E103', 'Mallik ravula', 'Librarian', 50000.00),
('E104', 'Vignesh ramaplli', 'Assistant', 50000.00),
('E105', 'Sarath aluvalu', 'Assistant', 45000.00),
('E106', 'Mani kakerla', 'Assistant', 47000.00),
('E107', 'Manesh ravipali', 'Manager', 52000.00),
('E108', 'Jenney bunkeer', 'Clerk', 46700.00),
('E109', 'Daneesh usen', 'Librarian', 58000.00),
('E110', 'Lavanya mallika', 'Assistant', 46000.00),
('E111', 'Chandu chava', 'Manager', 60000.00);
SELECT * FROM employees;

INSERT INTO customers VALUES
('C001', 'Alice Johnson', '134 valmoart Main St', '2024-05-15'),
('C002', 'Bob Smith', '4-56 rice mill St', '2024-06-20'),
('C003', 'Carol Davis', '7-4-6 main road hyd', '2024-07-10'),
('C004', 'Dave Wilson', '4-56vishest road vizag', '2024-08-05'),
('C005', 'Eve Brown', '6-78 kuktapliy hyd', '2024-09-25'),
('C006', 'Frank Thomas', '34-5 sham reddy ongole', '2024-10-15'),
('C007', 'Grace Taylor', '3-56 valmort,gachibowily', '2024-11-20'),
('C008', 'Henry Anderson', '2-90 center road chittor', '2024-12-10'),
('C009', 'Ivy Martinez', '4-56 main road laapet', '2024-01-05'),
('C010', 'Jack Wilson', '8-7-0 Reddy nager,chittoe', '2024-02-25');
SELECT * FROM customers;


desc books;
INSERT INTO books VALUES
('978-0-7432-7356-7', 'Angels & Demons', 'Mystery', 6.00, 'yes', 'Dan Brown', 'Pocket Books'),
('978-0-141-43910-0', 'Pride and Prejudice', 'Classic', 4.50, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-1-250-08041-3', 'The Road', 'Fiction', 5.75, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-307-26321-0', 'Life of Pi', 'Fiction', 6.25, 'yes', 'Yann Martel', 'Mariner Books'),
('978-0-593-12924-7', 'Becoming', 'Biography', 8.50, 'yes', 'Michelle Obama', 'Crown Publishing'),
('978-0-316-76948-4', 'Where the Crawdads Sing', 'Mystery', 7.00, 'yes', 'Delia Owens', 'G.P. Putnam\'s Sons'),
('978-0-385-54083-9', 'The Help', 'Historical Fiction', 6.00, 'yes', 'Kathryn Stockett', 'Amy Einhorn Books'),
('978-0-06-283870-9', 'Educated', 'Memoir', 6.75, 'yes', 'Tara Westover', 'Random House'),
('978-0-7432-6125-5', 'Gone Girl', 'Thriller', 7.50, 'yes', 'Gillian Flynn', 'Crown Publishing'),
('978-0-374-15889-0', 'The Goldfinch', 'Literary Fiction', 8.00, 'yes', 'Donna Tartt', 'Little, Brown and Company');
SELECT * FROM books;

UPDATE books SET status = 'No' WHERE isbn in ('978-0-7432-7356-7','978-0-385-54083-9','978-0-593-12924-7');

INSERT INTO IssueStatus VALUES
('IS101', 'C001', 'The Catcher in the Rye', '2023-05-01', '978-0-374-15889-0'),
('IS102', 'C002', 'The Da Vinci Code', '2023-05-02', '978-0-7432-6125-5'),
('IS103', 'C003', '1491: New Revelations of the Americas Before Columbus', '2023-05-03', '978-0-385-54083-9'),
('IS104', 'C004', 'Sapiens: A Brief History of Humankind', '2023-05-04', '978-0-06-283870-9'),
('IS105', 'C005', 'The Diary of a Young Girl', '2023-05-05', '978-0-316-76948-4');
SELECT * FROM issuestatus;
desc issuestatus;



INSERT INTO ReturnStatus VALUES
('RN01', 'C001', 'The Catcher in the Rye', '2023-06-06', '978-0-374-15889-0'),
('RN102', 'C002', 'The Da Vinci Code', '2023-06-07', '978-0-7432-6125-5'),
('RN103', 'C005', 'The Diary of a Young Girl', '2023-06-08', '978-0-316-76948-4'),
('RN104', 'C008', 'The Histories', '2023-06-09', '978-0-06-283870-9'),
('RN105', 'C010', 'A Game of Thrones', '2023-06-10', '978-0-374-15889-0');
SELECT * FROM returnstatus;



/*Queries*/

# 1. Retrieve the book title, category,Author, and rental price of all available books.
SELECT book_title, category, rental_price,Author FROM books WHERE Status = 'Yes';

# 2. List the employee names and their respective salaries in descending order of salary.
SELECT employee_name, salary FROM employees ORDER BY Salary DESC;

# 3. Retrieve the book titles and the corresponding customers name,address,redister_date who have issued those books.
SELECT issuestatus.Issued_book_name, customers.Customer_name,customers.Customer_address,customers.register_date FROM issuestatus INNER JOIN
customers on issuestatus.Issued_cust_id = customers.Customer_Id;


# 4. Display the total count of books in each category.
SELECT Category, COUNT(Book_title) FROM books GROUP BY Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000 in descending order.
SELECT employee_name, position_of_emoplyee,salary FROM employees WHERE Salary > 50000 order by salary desc;

# 6. List the customer names who registered before 2024-05-01 and have not issued any books yet.
SELECT customer_id,customer_name,register_date FROM customers WHERE Register_date < '2024-05-01' AND Customer_Id NOT IN
(SELECT issued_cust_id FROM issuestatus);

# 7. Add a new column Branch_no and establish relation between the employee and branch tables and 
# insert the valuesz into branch_no and Display the branch numbers and the total count of employees in each branch.
ALTER TABLE employees ADD COLUMN branch_no VARCHAR(10);

ALTER TABLE employees ADD CONSTRAINT FOREIGN KEY (branch_no)
REFERENCES branch(branch_code);
DESC employees;

UPDATE employees SET branch_no = 'HYD-B001' WHERE employee_id ='E101';
UPDATE employees SET branch_no = 'HYD-B001' WHERE employee_id ='E102';
UPDATE employees SET branch_no = 'HYD-B001' WHERE employee_id ='E103';
UPDATE employees SET branch_no = 'HYD-B001' WHERE employee_id ='E104';
UPDATE employees SET branch_no = 'VIZAG-B002' WHERE employee_id ='E105';
UPDATE employees SET branch_no = 'CHNI-B003' WHERE employee_id ='E106';
UPDATE employees SET branch_no = 'VIZAG-B002' WHERE employee_id ='E107';
UPDATE employees SET branch_no = 'VIZAG-B002' WHERE employee_id ='E108';
UPDATE employees SET branch_no = 'VIZAG-B002' WHERE employee_id ='E109';
UPDATE employees SET branch_no = 'HYD-B004' WHERE employee_id='E110';
UPDATE employees SET branch_no = 'CHNI-B003' WHERE employee_id ='E111';

SELECT * FROM employees;
SELECT branch_no, COUNT(employee_id) FROM employees GROUP BY branch_no;

# 8. Display the names of customers who have issued books in the month of may 2023.
SELECT customers.Customer_name FROM customers INNER JOIN issuestatus ON 
customers.Customer_Id = issuestatus.Issued_cust_id WHERE issuestatus.Issue_date >= '2023-05-01' AND 
issuestatus.Issue_date <= '2023-05-30';

# 9. Retrieve book_title from book table containing 'Literary Fiction'.
SELECT book_title FROM books WHERE Category = 'Literary Fiction';

# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT branch_no, COUNT(employee_id) FROM employees GROUP BY branch_no HAVING COUNT(Employee_id) > 5;


# End

