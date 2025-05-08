-- INCREASING REPEAT RATES

SELECT 
    ROUND((((COUNT(CASE
                WHEN total_orders > 1 THEN 1
            END)) / COUNT(*)) * 100),
            2) AS cust_repeat_rate
FROM
    customers;

-- VERIFYING IF ITS APPROXIMATELY ACCURATE (The table has total 2500 entries)

SELECT 
    COUNT(*)
FROM
    customers
WHERE
    total_orders > 1;

-- AREAS OF IMPROVEMENT FOR CUSTOMER RETENTION

select * from customer_feedback;

SELECT 
    *
FROM
    customer_feedback f
        JOIN
    customers c ON f.customer_id = c.customer_id;

with feedbacks as (
			SELECT 
    f.feedback_id,
    c.customer_id,
    f.feedback_text,
    f.feedback_category,
    f.sentiment,
    c.customer_segment
FROM
    customer_feedback f
        JOIN
    customers c ON f.customer_id = c.customer_id
WHERE
    c.total_orders <= 1
        AND f.sentiment != 'Positive'
        )
select feedback_category,count(sentiment) as negative_reviews from feedbacks group by feedback_category order by negative_reviews desc;

-- PROVIDES A COUNT OF NEGATIVE REVIEWS BASED ON FEEDBACK CATEGORY INDICATE THE ARES THAT NEED IMPROVEMENT FOR INCRESING THE CUSTOMER RETENTION RATE