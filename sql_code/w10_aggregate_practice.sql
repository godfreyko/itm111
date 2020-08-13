USE art_gallery;

-- how many artist are from France
SELECT country, COUNT(artist_id) -- can't put fname and lname because it's not referring to only one person
FROM artist
WHERE country = "France";

-- how many artist from each country
SELECT country, COUNT(artist_id)
FROM artist
GROUP BY country;  

USE magazine;

-- how many people subscribe to Beautiful Birds magazine?
SELECT magazineName, COUNT(subscriberKey) AS subscribers -- leave magazineName off at first -- works because the WHERE limits it to only one magazine.
FROM magazine m
	JOIN subscription sn
		ON m.magazineKey = sn.magazineKey
WHERE magazineName = "Beautiful Birds";

-- on their own - What is the average price of all magazines?
SELECT AVG(magazinePrice) -- explain why we can't have magazineName here, because we are averaging a bunch of magazines
FROM magazine;

-- How many subscribers does each magazine have?
SELECT magazineName, COUNT(subscriberKey) AS subscribers
FROM magazine m
	JOIN subscription sn
		ON m.magazineKey = sn.magazineKey
GROUP BY magazineName;

-- Having filter (just those magazines having 2 or more subscribers)
SELECT magazineName, COUNT(subscriberKey) AS subscribers
FROM magazine m
	JOIN subscription sn
		ON m.magazineKey = sn.magazineKey  -- add a WHERE after this line later WHERE magazineName LIKE 'fish%' or WHERE m.magazineKey > 4 You can use a column name that is not in SELECT with WHERE  But can't use COUNT(subscriberKey >=2) No aggregates in WHERE
GROUP BY magazineName
HAVING subscribers >= 2;  -- if you try m.magazineKey > 4 it won't be recognized

-- on their own using the query we just did -- Add a total revenue onto each magazine
SELECT magazineName, COUNT(subscriberKey) AS subscribers, SUM(magazinePrice) AS 'Total Revenue'
FROM magazine m
	JOIN subscription sn
		ON m.magazineKey = sn.magazineKey  
GROUP BY magazineName
ORDER BY magazineName;

USE bike;

-- on their own -- get the highest price from the product table
SELECT brand_id, MAX(list_price), MIN(list_price) -- add brand_id later
FROM product
GROUP BY brand_id; -- add group by later (highest and lowest within brands)

-- same query but we want to see the brand name so we need to join
SELECT brand.brand_name, MAX(list_price), MIN(list_price) 
FROM product
	JOIN brand
		ON product.brand_id = brand.brand_id
GROUP BY brand.brand_name; 

-- average of all bikes
SELECT ROUND(AVG(list_price), 2)
FROM product;

-- on their own - Get the average of each brand
SELECT brand.brand_name, FORMAT(AVG(list_price), 2, 'en-US') 
FROM product
	JOIN brand
		ON product.brand_id = brand.brand_id
GROUP BY brand.brand_name WITH ROLLUP; 

-- practice with WHERE and HAVING again
SELECT brand.brand_name, FORMAT(AVG(list_price), 2, 'en-US') AS average
FROM product
	JOIN brand
		ON product.brand_id = brand.brand_id
WHERE model_year > '2016'
GROUP BY brand.brand_name WITH ROLLUP
HAVING AVG(list_price) > 2000; 

-- How many of each product do we have?
SELECT product_name, SUM(quantity)
	FROM store s 
		JOIN stock st
			ON s.store_id = st.store_id
		JOIN product p
			ON st.product_id = p.product_id
GROUP BY product_name;

-- How many of each product do we have in each store?
-- grouping within a group
-- also point out that the qualifier s. has to be used in 
-- the SELECT list. Once we set up a qualifier it has to be used 
-- throughout the query. We can't use store. there anymore.
SELECT s.store_id, product_name, SUM(quantity)
	FROM store s 
		JOIN stock st
			ON s.store_id = st.store_id
		JOIN product p
			ON st.product_id = p.product_id
GROUP BY product_name, store_id WITH ROLLUP ; -- add rollup later

</pre>
					<li>Remind students of the quiz on the second class of the week.&nbsp;</li>
				</ul>
			</li><br>
			<li>Mid-week
				<ul>
					<li>Have them complete their quiz by themselves once and then with others for the second attempt.
						The discussions and debates during the second attempt as a group is a great 'teach one another'
						activity. The two scores will be averaged for their final quiz score.</li>
				</ul>
			</li>
		</ul>
		<p style="padding-left: 40px;">(W10 - Summary Query Activity):</p>
		<ul>
			<li style="list-style-type: none;">
				<ul>
					<li>Just like the JOINS week, summary queries may take awhile to explain and help them understand.
						There may be some time this week for an extra activity.</li>
				</ul>
			</li>
		</ul>
		<ul>
			<li style="list-style-type: none;"></li>
			<li>End of the Week<br />
				<ul>
					<li style="list-style-type: none;"></li>
					<li>The homework due Saturday will be
						<ul>
							<li>creating a list of summary queries that produce the proper result sets.</li>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="gradingFeedback">
		<h2>Grading/Feedback</h2>
		<ul>
			<li><strong>Instructor:</strong> The check and quiz are auto-graded. The homework will be instructor or TA
				graded. It will be checking their summary queries and ensuring they produce the proper result sets.
			</li>
			<li>Here is the key:</li>
			<pre>
USE bike;

-- 1. Get the average quantity that we have in all our bike stocks. Round to the nearest whole number.

SELECT ROUND(AVG(quantity))As 'Stock Average'
FROM stock;

-- 2. Show each bike that needs to be reordered. Filter the results to only the lowest quantity of zero. Order by product_name
-- (instructors: the results should be 24 rows, if there is 25 and they have two rows with "Electra Townie Commute Go! - 2018", 
-- then they forgot to use DISTINCT or GROUP BY)

SELECT DISTINCT product_name
FROM stock s JOIN product p
	ON s.product_id = p.product_id
WHERE quantity < 1
ORDER BY product_name;

OR

SELECT product_name
FROM stock s JOIN product p
	ON s.product_id = p.product_id
WHERE quantity < 1
GROUP BY product_name
ORDER BY product_name;

-- 3. We want to see how many of each category of bike we have in our "Baldwin Bikes" store, store_id 2. We need to see the name of the category as well as the number of bikes in the category.Sort it by lowest numbers first.

SELECT category_name, COUNT(p.category_id) AS instock
FROM category c JOIN product p
	ON c.category_id = p.category_id
    JOIN stock s
    ON p.product_id = s.product_id
WHERE store_id = 2
GROUP BY category_name
ORDER BY instock;

USE employees;
-- 4. How many employees do we have?

SELECT COUNT(emp_no)AS 'Number of Employees'
FROM employees;

-- 5. Get the average salaries in each department. We only need those department averages that are below 60,000. Format the salary 2 decimal places and a comma in the thousands place. 

SELECT dept_name, FORMAT(AVG(salary), 2, 'en-US') AS average_salary
FROM salaries s
	JOIN employees e
		ON s.emp_no = e.emp_no
	JOIN dept_emp de
		ON e.emp_no = de.emp_no
	JOIN departments d
		ON de.dept_no = d.dept_no
GROUP BY dept_name
HAVING AVG(salary) < 60000;

-- 6. How many females work in each department?

SELECT dept_name, COUNT(gender)AS 'Number of Females'
FROM employees e JOIN dept_emp de
	ON e.emp_no = de.emp_no
    JOIN departments d
    ON de.dept_no = d.dept_no
WHERE gender = "F"
GROUP BY dept_name;