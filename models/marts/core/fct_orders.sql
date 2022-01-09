{{ config(materialized='table') }}


with fact_orders as (

    select
        ord.order_id,
        ord.customer_id,
        ord.order_date,
        coalesce(pay.amount, 0) as amount

    from {{ ref('stg_orders')}} as ord

    left join (
        
        select
        order_id,
        sum(case when status = 'success' then amount end) as amount
        from {{ ref('stg_payments') }}
        group by 1
    ) as pay
    on ord.order_id=pay.order_id
    
    
    
)

select * from fact_orders