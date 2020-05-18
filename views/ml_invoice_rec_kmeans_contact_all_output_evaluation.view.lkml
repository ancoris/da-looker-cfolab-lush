view: ml_invoice_rec_kmeans_contact_all_output_evaluation {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_ml_unsupervised.ml_invoice_rec_kmeans_contact_all_output_evaluation`
    ;;

  dimension: avg_days_late {
    type: number
    sql: ${TABLE}.avg_days_late ;;
  }

  dimension: avg_days_outstanding_overdue {
    type: number
    sql: ${TABLE}.avg_days_outstanding_overdue ;;
  }

  dimension: centroid_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.centroid_id ;;
  }

  dimension: count_invoices_outstanding {
    type: number
    sql: ${TABLE}.count_invoices_outstanding ;;
  }

  dimension: count_invoices_paid_fully {
    type: number
    sql: ${TABLE}.count_invoices_paid_fully ;;
  }

  dimension: count_invoices_paid_late {
    type: number
    sql: ${TABLE}.count_invoices_paid_late ;;
  }

  dimension: late_or_outstanding_to_total_ratio {
    type: number
    sql: ${TABLE}.late_or_outstanding_to_total_ratio ;;
  }

  dimension: payments_to_invoice_value_ratio {
    type: number
    sql: ${TABLE}.payments_to_invoice_value_ratio ;;
  }

  dimension: sum_invoiced_value_global {
    type: number
    sql: ${TABLE}.sum_invoiced_value_global ;;
  }

  dimension: sum_late_payments_global {
    type: number
    sql: ${TABLE}.sum_late_payments_global ;;
  }

  dimension: sum_payments_global {
    type: number
    sql: ${TABLE}.sum_payments_global ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
