# ex8 - Write a SELECT statement that returns three columns from the Vendors table: vendor_name, 
# vendor_contact_last_name, and vendor_contact_first_name. Then, run this statement to make sure it works correctly.
SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors
# Add an ORDER BY clause to this statement that sorts the result set by last name and then first name, 
# both in ascending sequence. 
ORDER BY vendor_contact_last_name, vendor_contact_first_name;


# ex9 - Write a SELECT statement that returns one column from the Vendors table named full_name 
# that joins the vendor_contact_last_name and vendor_contact_first_name columns.
SELECT concat(vendor_contact_last_name, ', ', vendor_contact_first_name) AS full_name
FROM vendors
# Return only the contacts whose last name begins with the letter A, B, C, or E. This should retrieve 41 rows.
WHERE vendor_contact_last_name LIKE 'A%'
OR vendor_contact_last_name LIKE 'B%'
OR vendor_contact_last_name LIKE 'C%'
OR vendor_contact_last_name LIKE 'E%'
# Sort the result set by last name and then first name in ascending sequence.
ORDER BY vendor_contact_last_name, vendor_contact_first_name;


# ex10 - Write a SELECT statement that returns these column names and data from the Invoices table:
SELECT
	invoice_due_date AS 'Due Date',
    invoice_total AS 'Invoice Total',
    invoice_total * 0.1 AS '10%',
    invoice_total * 1.1 AS 'Plus 10%'
FROM invoices
# Return only the rows with an invoice total that’s greater than or equal to 500 and less than or equal to 1000. This should retrieve 12 rows.
WHERE invoice_total >= 500 and invoice_total <= 1000
# Sort the result set in descending sequence by invoice_due_date.
ORDER BY invoice_due_date DESC;

# ex11
SELECT
	invoice_number,
    invoice_total,
    (payment_total + credit_total) AS payment_credit_total,
    (invoice_total - payment_total - credit_total) AS balance_due
FROM invoices
# Return only invoices that have a balance due that’s greater than $50.
WHERE invoice_total - payment_total - credit_total > 50
# Sort the result set by balance due in descending sequence.
ORDER BY balance_due DESC
# Use the LIMIT clause so the result set contains only the rows with the 5 largest balances.
LIMIT 5;


# ex12
SELECT
	invoice_number,
    invoice_date,
    invoice_total - payment_total - credit_total AS balance_due,
    payment_date
FROM invoices
# Return only the rows where the payment_date column contains a null value. This should retrieve 11 rows.
WHERE payment_date IS NULL;


# ex13: Write a SELECT statement without a FROM clause that uses the CURRENT_DATE function to return the current date in its default format.
SELECT DATE_FORMAT(CURRENT_DATE(), '**%m-%d-%Y**') AS 'current_date';
    

# ex14 - Write a SELECT statement without a FROM clause that creates a row with these columns:
SELECT
	50000 AS starting_principal,
    50000 * 0.065 AS interest,
    50000 + 50000 * 0.065 AS principal_plus_interest;

    
