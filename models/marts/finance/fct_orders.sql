with orders as (
    select 
    order_id,
    customer_id
    from {{ ref('stg_jaffle_shop__orders') }}

),

payments as (
    select * from {{ ref('stg_stripe__payments') }}
),

order_payments as
(
    select 
    order_id,
    sum(case when status = 'success' then amount end) as amount
    from payments 
    group by 1

)

select 
orders.order_id,
orders.customer_id,
order_payments.amount 
from
orders 
left join order_payments using (order_id)

