# ex1 - Write a SELECT statement that returns all columns from the Vendors table inner-joined with all columns from the Invoices table. 
# This should return 114 rows. Hint: You can use an asterisk(*) to select the columns from both tables.
SELECT vendors.*, invoices.*
FROM vendors INNER JOIN invoices 
	ON vendors.vendor_id = invoices.vendor_id;
    
    
# ex2 - Use these aliases for the tables: v for Vendors and i for Invoices.
SELECT
	v.vendor_name,
    i.invoice_number,
    i.invoice_date,
    (i.invoice_total - i.payment_total - i.credit_total) AS balance_due
FROM vendors v 
JOIN invoices i
	ON v.vendor_id = i.vendor_id
# Return one row for each invoice with a non-zero balance. This should return 11 rows.
WHERE (i.invoice_total - i.payment_total - i.credit_total) <> 0
# Sort the result set by vendor_name in ascending order.
ORDER BY v.vendor_name ASC;


# ex3
SELECT 
	v.vendor_name,
    v.default_account_number AS default_account,
    gla.account_description AS description
FROM vendors v
JOIN general_ledger_accounts gla
	ON v.default_account_number = gla.account_number
ORDER BY gla.account_description, v.vendor_name;


# ex4
SELECT
	v.vendor_name,
    i.invoice_date,
    i.invoice_number,
    ili.invoice_sequence AS li_sequence,
    ili.line_item_amount AS li_amount
FROM vendors v
JOIN invoices i
	ON v.vendor_id = i.vendor_id
JOIN invoice_line_items ili
	ON i.invoice_id = ili.invoice_id
ORDER BY v.vendor_name, i.invoice_date, i.invoice_number, li_sequence;


# ex5 - self-join
# !!! answer does not match with text book problem
SELECT
	v.vendor_id,
    v.vendor_name,
    CONCAT(vc.first_name, ' ', vc.last_name) AS contact_name
FROM vendors v
JOIN vendor_contacts vc
	ON v.vendor_id = vc.vendor_id
JOIN vendor_contacts vc2
	ON vc.last_name = vc2.last_name AND vc.vendor_id < vc2.vendor_id
ORDER BY vc.last_name; # return 0 rows


# ex6 - outer join
SELECT
	gla.account_number,
	gla.account_description
    #,  ili.invoice_id
FROM general_ledger_accounts gla
LEFT JOIN invoice_line_items ili
	ON gla.account_number = ili.account_number
WHERE ili.invoice_id IS NULL
ORDER BY gla.account_number;


# ex7 - union
SELECT 
	vendor_name,
    'CA' AS vendor_state
FROM vendors
WHERE vendor_state = 'CA'
UNION
SELECT
	vendor_name,
    'Outside CA' AS vnedor_state
FROM vendors
WHERE vendor_state != 'CA'
ORDER BY vendor_name;


