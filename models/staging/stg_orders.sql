with source as (
    select * from {{ ref('seed_orders') }}
)

select
    order_id,
    customer_id,
    order_date::date as order_date,
    amount::numeric(10,2) as amount
from source
where amount > 0