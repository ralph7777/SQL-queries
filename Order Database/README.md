# Order database

This script builds a commodity transaction database recording the order and various entities by a furniture company. 


In the database, the constraints of value field include:

Each CustomerID is a number with at most three digits,

Each OrderID is a number with at most four digits,

Each ProductID is a number with at most two digits,

Each Name is at most 32 characters long,

Each Address is at most 16 characters long,

Each Quantity is a positive whole number between 1 and 100, inclusive,

Each Description is at most 30 characters long,

Each Finish is at most 10 characters long,

Each Price is a non-negative value (zero is allowed) representing a price in dollars and cents that cannot exceed 999.99.