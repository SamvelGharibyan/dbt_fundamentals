with orders as (

    select * from {{ ref('stg_orders') }}
),

payments as (

    select * from {{ ref('stg_payments') }}
),

final as (

    select o.order_id
        , o.customer_id
        , p.amount
    from orders as o
    left join payments as p using (order_id)
)

select * from final