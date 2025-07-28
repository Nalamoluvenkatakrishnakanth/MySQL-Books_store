I am going to build a project based on books store management system. it keeps the all the information about books in the store their price, status, author_name, how many books available in the store.

# Books_store
This project is a books_store that allows for efficient management of books_store operations. It provides functionalities to track books, customers, employees, book issuance, and returns. The system, done using SQL, maintains a comprehensive database of books, their availability status, rental cost, and other relevant details. It also enables effective management of customers and employees associated with the book_store.

## Database Setup
Create a new database named "Book_store" to store the information.
create tables branch,employees,customers,issuance and return status tables,books table.

## Features

#### i) Books Management: 
    Add, update, and remove books from the library's collection. Track book details such as title, category, rental price, availability status, author, and publisher.
    
#### ii) Customer Management:
    Maintain a record of library customers, including their names, addresses, registration dates, and issuance history.
    
#### iii) Employee Management: 
    Manage library staff, including employee names, positions, salaries, and branch assignments.
    
#### iv) Book Issuance and Returns: 
    Track the issuance and return of books by customers. Monitor the status of issued books and ensure timely returns.
    
#### v) Branch Management: 
    Maintain information about library branches, including branch numbers, manager assignments, addresses, and contact details.
    
## Queries and Analysis
The project includes various SQL queries and data analysis tasks to extract valuable insights from the library's data. Some of the key queries implemented include:
##### 1.Retrieve the book title, category, and rental price of all available books.
##### 2.List the employee names and their respective salaries in descending order of salary.
##### 3.Retrieve the book titles and the corresponding customers who have issued those books.
##### 4.Display the total count of books in each category.
##### 5.Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
##### 6.List the customer names who registered before 2022-01-01 and have not issued any books yet.
##### 7.Display the branch numbers and the total count of employees in each branch.
##### 8.Display the names of customers who have issued books in the month of June 2023.
##### 9.Retrieve book titles from the book table containing the category "history".
##### 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
