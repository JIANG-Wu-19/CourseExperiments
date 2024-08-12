SELECT authors.au_id,au_lname,au_fname
FROM titleauthor,titles,authors
WHERE titleauthor.au_id=authors.au_id AND titleauthor.title_id=titles.title_id AND type NOT IN ('business','popular_comp')

SELECT authors.au_id,au_lname,au_fname
FROM authors,titles,titleauthor
WHERE titleauthor.au_id=authors.au_id AND titleauthor.title_id=titles.title_id AND price>20

SELECT authors.au_id,au_lname,au_fname
FROM authors,titles,titleauthor
WHERE titleauthor.au_id=authors.au_id AND titleauthor.title_id=titles.title_id AND royalty>80 AND state='KS'

SELECT state
FROM authors
GROUP BY state
HAVING COUNT(state)<5

SELECT authors.au_id,au_lname,au_fname,title
FROM authors,titles,titleauthor
WHERE titleauthor.au_id=authors.au_id AND titleauthor.title_id=titles.title_id AND authors.au_id=
(SELECT au_id
 FROM titleauthor
 WHERE title_id=
 (SELECT TOP 1 title_id
  FROM titles
  ORDER BY price DESC))

SELECT title
FROM titles
WHERE title_id IN (
SELECT title_id
FROM titleauthor
WHERE au_id IN (
SELECT au_id
FROM titleauthor
WHERE title_id IN (
SELECT TOP 10 title_id
FROM titles
ORDER BY ytd_sales ASC)))

SELECT authors.au_lname,authors.au_fname,titles.title,titles.price
FROM authors,titles,titleauthor
WHERE titleauthor.au_id=authors.au_id 
AND titleauthor.title_id=titles.title_id
AND state='CA'
AND price>(SELECT AVG(price) FROM titles)







