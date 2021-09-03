*Q1
SELECT ar.Name,count(inv.InvoiceLineId) AS total_orders
FROM InvoiceLine inv
JOIN Track tr ON inv.TrackId=tr.TrackId
JOIN Album al ON tr.AlbumId=al.AlbumId
JOIN Artist ar ON al.ArtistId=ar.ArtistId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 20;

*Q2
SELECT tr.Name Name_of_track,COUNT(il.InvoiceLineId) Total_orders
FROM Track tr
JOIN InvoiceLine il ON tr.TrackId=il.TrackId
JOIN Invoice inv ON il.InvoiceId=inv.InvoiceId
WHERE inv.BillingCountry="USA"
GROUP BY 1
ORDER BY 2 desc
LIMIT 10;

*Q3
SELECT  em.FirstName || ' ' || em.LastName AS Employee_Name,COUNT(inv.total) AS Total_sales
FROM Employee em
JOIN Customer cu ON em.EmployeeId=cu.SupportRepId
JOIN Invoice inv ON cu.CustomerId=inv.CustomerId
GROUP BY 1
ORDER BY 2 DESC;

*Q4
SELECT mt.Name as Media_Type,COUNT(il.InvoiceLineId) as Total_orders
FROM MediaType mt
JOIN Track tr ON mt.MediaTypeId=tr.MediaTypeId
JOIN InvoiceLine il ON tr.TrackId=il.TrackId
GROUP BY 1
ORDER by 2 desc
LIMIT 5;
