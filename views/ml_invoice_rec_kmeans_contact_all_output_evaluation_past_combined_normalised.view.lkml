view: ml_invoice_rec_kmeans_contact_all_output_evaluation_past_combined_normalised {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_ml_unsupervised_past.ml_invoice_rec_kmeans_contact_all_output_evaluation_past_combined_normalised`
    ;;

  view_label: "Extract past combined normalised"

  dimension: avg_days_late_norm {
    type: number
    sql: ${TABLE}.avg_days_late_norm ;;
  }

  dimension: avg_days_outstanding_overdue_norm {
    type: number
    sql: ${TABLE}.avg_days_outstanding_overdue_norm ;;
  }

  dimension: centroid_id {
    type: string
    sql: ${TABLE}.centroid_id ;;
  }

  dimension: count_invoices_outstanding_norm {
    type: number
    sql: ${TABLE}.count_invoices_outstanding_norm ;;
  }

  dimension: count_invoices_paid_fully_norm {
    type: number
    sql: ${TABLE}.count_invoices_paid_fully_norm ;;
  }

  dimension: count_invoices_paid_late_norm {
    type: number
    sql: ${TABLE}.count_invoices_paid_late_norm ;;
  }

  dimension: late_or_outstanding_to_total_ratio_norm {
    type: number
    sql: ${TABLE}.late_or_outstanding_to_total_ratio_norm ;;
  }

  dimension: offset_months {
    type: number
    sql: ${TABLE}.offset_months ;;
  }

  dimension: payments_to_invoice_value_ratio_norm {
    type: number
    sql: ${TABLE}.payments_to_invoice_value_ratio_norm ;;
  }

  dimension: sum_invoiced_value_global_norm {
    type: number
    sql: ${TABLE}.sum_invoiced_value_global_norm ;;
  }

  dimension: sum_late_payments_global_norm {
    type: number
    sql: ${TABLE}.sum_late_payments_global_norm ;;
  }

  dimension: sum_payments_global_norm {
    type: number
    sql: ${TABLE}.sum_payments_global_norm ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
