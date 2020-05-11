view: ml_invoice_rec_classification_predict {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_ml_supervised.ml_invoice_rec_classification_predict`;;
  label: "ML Inputs"

  dimension: avg_days_late {
    description: "Average days late of invoices issued within three months prior to this one. Negative means early"
    type: number
    sql: ${TABLE}.avg_days_late ;;
    value_format: "0.##"
  }

  dimension: avg_days_outstanding {
    description: "Average days outstanding of invoices issued within three months prior to this one"
    type: number
    sql: ${TABLE}.avg_days_outstanding ;;
    value_format: "0.##"
  }

  dimension: count_outstanding_invoices {
    description: "Number of invoices issued within the last three months which are still outstanding"
    type: number
    sql: ${TABLE}.count_outstanding_invoices ;;
  }

  dimension: count_outstanding_invoices_overdue {
    label: "Count Overdue Invoices"
    description: "Number of invoices issued within the last three months which are outstanding and overdue"
    type: number
    sql: ${TABLE}.count_outstanding_invoices_overdue ;;
  }

  dimension: count_paid_invoices {
    label: "Count of Invoices Settled"
    description: "Count of invoices settled, prior to the creation of this invoice"
    type: number
    sql: ${TABLE}.count_paid_invoices ;;
  }

  dimension: count_paid_invoices_late {
    label: "Count of Invoices Settled Late"
    description: "Count of invoices that were paid late, prior to the creation of this invoice"
    type: number
    sql: ${TABLE}.count_paid_invoices_late ;;
  }

  dimension: days_paid_late_invoice_1 {
    description: "Number of days late of the most recent invoice"
    type: number
    sql: ${TABLE}.days_paid_late_invoice_1 ;;
  }

  dimension: days_paid_late_invoice_2 {
    description: "Number of days late of the second most recent invoice"
    type: number
    sql: ${TABLE}.days_paid_late_invoice_2 ;;
  }

  dimension: days_paid_late_invoice_3 {
    description: "Number of days late of the third most recent invoice"
    type: number
    sql: ${TABLE}.days_paid_late_invoice_3 ;;
  }

  dimension: invoice_amount_gross_global {
    type: number
    sql: ${TABLE}.invoice_amount_gross_global ;;
  }

  dimension: invoice_id {
    type: string
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: invoice_status_1 {
    label: "Previous"
    description: "Status of the most recent invoice"
    type: string
    sql: ${TABLE}.invoice_status_1 ;;
    html: <a href="https://go.xero.com/{% if fact_invoice.invoice_type == 'PAY' %}AccountsPayable{%else%}AccountsReceivable{%endif%}/View.aspx?InvoiceID={{invoice_1_id}}"  target="_blank"><font style="color:blue; text-decoration:underline">{{ value }}</font></a>;;
  }

  dimension: invoice_1_id {
    label: "Id of Previous"
    description: "Id of the most recent invoice"
    type: string
    sql: ${TABLE}.invoice_1_id ;;
    }

  dimension: invoice_status_2 {
    label: "Previous+1"
    description: "Status of the second most recent invoice"
    type: string
    sql: ${TABLE}.invoice_status_2 ;;
    html: <a href="https://go.xero.com/{% if fact_invoice.invoice_type == 'PAY' %}AccountsPayable{%else%}AccountsReceivable{%endif%}/View.aspx?InvoiceID={{invoice_2_id}}"  target="_blank"><font style="color:blue; text-decoration:underline">{{ value }}</font></a>;;

  }

  dimension: invoice_2_id {
    label: "Id of Previous+1"
    description: "Id of the second most recent invoice"
    type: string
    sql: ${TABLE}.invoice_2_id ;;
  }

  dimension: invoice_status_3 {
    label: "Previous+2"
    description: "Status of the third most recent invoice"
    type: string
    sql: ${TABLE}.invoice_status_3 ;;
    html: <a href="https://go.xero.com/{% if fact_invoice.invoice_type == 'PAY' %}AccountsPayable{%else%}AccountsReceivable{%endif%}/View.aspx?InvoiceID={{invoice_3_id}}"  target="_blank"><font style="color:blue; text-decoration:underline">{{ value }}</font></a>;;

  }

  dimension: invoice_3_id {
    label: "Id of Previous+2"
    description: "Id of the third most recent invoice"
    type: string
    sql: ${TABLE}.invoice_3_id ;;
  }

  dimension: invoice_term_days {
    type: number
    sql: ${TABLE}.invoice_term_days ;;
  }

  dimension: sum_last_three_outstanding {
    description: "Sum of the amounts outstanding, for the three most recent invoices (no time constraint)"
    type: number
    sql: ${TABLE}.sum_last_three_outstanding ;;
  }

  dimension: sum_outstanding_invoices {
    description: "Sum of the amounts outstanding, for invoices issued within three months prior to this one"
    type: number
    sql: ${TABLE}.sum_outstanding_invoices ;;
  }

  dimension: sum_outstanding_late_invoices {
    label: "Sum Outstanding Late Invoices"
    description: "Sum of the amounts late and outstanding, for invoices issued within three months prior to this one"
    type: number
    sql: ${TABLE}.sum_outstanding_late_invoices ;;
  }

  dimension: sum_paid_invoices_late {
    label: "Sum Invoices Paid Late"
    description: "Sum of the amounts paid late, for invoices issued within three months prior to this one"
    type: number
    sql: ${TABLE}.sum_paid_invoices_late ;;
  }

  dimension: sum_paid_payment_global_invoices {
    label: "Sum Invoices Paid On-time"
    description: "Sum of the amounts paid on-time, for invoices issued within three months prior to this one"
    type: number
    sql: ${TABLE}.sum_paid_payment_global_invoices ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
