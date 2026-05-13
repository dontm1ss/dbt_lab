with source as (
    select * from {{ ref('seed_customers') }}
)

select
    customer_id,
    customer_name,
    registration_date::date as registration_date
from source