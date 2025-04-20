select
    orderid as order_id,
    id as payment_id,
    paymentmethod as payment_method,
    status,
    amount,
    created as order_date

from `dbt-tutorial`.stripe.payment