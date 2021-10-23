{%- set payment_methods = ['credit_card', 'bank_transfer', 'coupon', 'gift_card'] -%}

WITH payments AS (
    SELECT * FROM {{ ref ('stg_payments') }}
),

final AS (
    SELECT
        order_id,
        {% for payment_method in payment_methods -%}
        SUM(case when payment_method = '{{ payment_method }}' then amount else 0 end) AS {{ payment_method }}_amount
        {%- if not loop.last -%}
        ,
        {%- endif %}
        {% endfor %}
    FROM payments
    GROUP BY 1
    ORDER BY 1
)

SELECT * FROM final