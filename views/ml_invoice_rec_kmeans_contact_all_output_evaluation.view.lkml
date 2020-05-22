view: ml_invoice_rec_kmeans_contact_all_output_evaluation {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_ml_unsupervised.demo` ;;

  label: "Cluster centroids (REC)"

  dimension: avg_days_late {
    type: number
    sql: ${TABLE}.avg_days_late ;;
  }

  dimension: avg_days_outstanding_overdue {
    type: number
    sql: ${TABLE}.avg_days_outstanding_overdue ;;
  }

  dimension: centroid_id {
    label: "Original Nearest Centroid Id"
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.centroid_id ;;
  }

  # initialisation of the clusters is required to have consistency in the cluster locations
  # but the cluster ids come out different than what the dashboard is used to
  # as a fix, realign with case statement
  dimension: user_familiar_centroid_id {
    label: "Nearest Centroid Id"
    type: number
    sql: case
          when nearest_centroid_id = 3 then 1
          when nearest_centroid_id = 2 then 2
          when nearest_centroid_id = 1 then 3
          when nearest_centroid_id = 4 then 4
          when nearest_centroid_id = 5 then 5
        end ;;
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
