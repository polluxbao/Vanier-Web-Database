select contactFirstName || ' ' || contactLastName as Name from customers
where country = 'Sweden';

select FirstName || ' ' || LastName as Name, email, jobtitle from office_employees
where firstname = 'Leslie' and officecode = 1;

select productname, productcode, productvendor from products
where MSRP > 100;