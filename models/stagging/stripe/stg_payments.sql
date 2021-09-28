select
    id as payment_id,
    orderid as order_id,
    status,
    amount

from `dbt-tutorial.stripe.payment` where status = 'success'