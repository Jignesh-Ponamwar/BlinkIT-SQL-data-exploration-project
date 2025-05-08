-- DELIVERY DELAY TIME AND REASONS FOR DELAYED DELIVERY

select * from delivery_performance;

select * from delivery_performance where delivery_time_minutes <=0;

WITH delivery AS (
SELECT 
    *,
    (CASE
        WHEN delivery_time_minutes < 0 THEN delivery_time_minutes * (- 1)
        ELSE delivery_time_minutes
    END) AS delivery_delay
FROM
    delivery_performance)
    
SELECT 
    delivery_status,
    ROUND(AVG(distance_km), 2) AS avg_distance_km,
    ROUND(AVG(delivery_delay)) AS avg_delay,
    reasons_if_delayed
FROM
    delivery
GROUP BY delivery_status , reasons_if_delayed
HAVING avg_delay > 5;

-- PROVIDES THE REASON FOR DELIVERY ALONG WITH AVG DELAY IN TIME AND AVG DISTANCE FOR THOSE DELIVERYS