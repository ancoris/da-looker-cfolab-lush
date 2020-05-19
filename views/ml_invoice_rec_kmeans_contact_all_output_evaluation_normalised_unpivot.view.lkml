view: ml_invoice_rec_kmeans_contact_all_output_evaluation_normalised_unpivot {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_ml_unsupervised.ml_invoice_rec_kmeans_contact_all_output_evaluation_normalised_unpivot`
    ;;

  dimension: centroid_id {
    type: number
    primary_key: yes
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


  measure:  value_percentile_25 {
    type:  percentile
    percentile: 25
    sql: ${value} ;;
  }

  measure:  value_percentile_75 {
    type:  percentile
    percentile: 75
    sql: ${value} ;;
  }
}
