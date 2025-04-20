with customers as (
    select
    customer_id
    from {{ ref('stg_jaffle_shop__customers') }}
),

orders as (
    select 
    order_id,
    customer_id
    from {{ ref('stg_jaffle_shop__orders') }}

),

payments as
(
    select 
    order_id,
    amount
     FROM {{ ref('stg_stripe__payments') }}

)

select 
o.order_id,
c.customer_id,
p.amount 
from
customers c 
left join orders o 
on c.customer_id = o.customer_id
left join payments p 
on o.order_id = p.order_id

