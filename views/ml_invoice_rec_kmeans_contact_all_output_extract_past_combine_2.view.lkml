view: ml_invoice_rec_kmeans_contact_all_output_extract_past_combine_2 {
  sql_table_name: `cfolab-lush.dbt_bsl_pl_cfolab_ml_unsupervised_past.ml_invoice_rec_kmeans_contact_all_output_extract_past_combine_2`
    ;;

  dimension: avg_days_late {
    type: number
    sql: ${TABLE}.avg_days_late ;;
  }

  dimension: avg_days_outstanding_overdue {
    type: number
    sql: ${TABLE}.avg_days_outstanding_overdue ;;
  }

  dimension: company_id {
    type: string
    sql: ${TABLE}.company_id ;;
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

  dimension: nearest_centroid_id {
    type: string
    sql: ${TABLE}.nearest_centroid_id ;;
  }

  dimension: offset_months {
    type: number
    sql: ${TABLE}.offset_months ;;
  }

  dimension: original_centroid_id {
    type: number
    sql: ${TABLE}.original_centroid_id ;;
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
