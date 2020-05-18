view: ml_invoice_rec_kmeans_contact_all_output_evaluation_unpivot {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_ml_unsupervised.ml_invoice_rec_kmeans_contact_all_output_evaluation_unpivot`
    ;;

  dimension: centroid_id {
    type: number
    sql: ${TABLE}.centroid_id ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.Value ;;
  }

  dimension: variable {
    type: string
    sql: ${TABLE}.Variable ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
