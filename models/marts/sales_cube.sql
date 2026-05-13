{{
    config(
        materialized='table'
    )
}}

select
    c.customer_id,
    c.customer_name,
    strftime(o.order_date, '%Y-%m') as order_month,
    count(o.order_id) as orders_count,
    sum(o.amount) as total_amount,
    avg(o.amount) as avg_order_amount,
    min(o.order_date) as first_order_date,
    max(o.order_date) as last_order_date
from {{ ref('stg_customers') }} c
left join {{ ref('stg_orders') }} o on c.customer_id = o.customer_id
group by 1, 2, 3
order by c.customer_id, order_month