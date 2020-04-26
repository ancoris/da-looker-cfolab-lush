view: company_totals {
   derived_table: {
     sql: select
            company_id,
            ifnull(sum(invoice_amount_gross_global), 0)     as total_invoice_amount_gross_global,
            ifnull(sum(total_payment_amount_due_global), 0) as total_payment_amount_due_global,
            ifnull(sum(payment_amount_global), 0)           as total_payment_amount_global
        from `cfolab-lush.dw_pl_cfolab.fact_invoice` ;;
   }
  dimension: company_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.company_id ;;
   }
  dimension: total_invoice_amount_gross_global {
    type: number
    sql: ${TABLE}.total_invoice_amount_gross_global ;;
  }
  dimension: total_payment_amount_due_global {
    type: number
    sql: ${TABLE}.total_payment_amount_due_global ;;
  }
  dimension: total_payment_amount_global {
    type: number
    sql: ${TABLE}.total_payment_amount_global ;;
  }

}
