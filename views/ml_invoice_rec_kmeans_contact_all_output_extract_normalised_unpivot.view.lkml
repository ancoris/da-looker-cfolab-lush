view: ml_invoice_rec_kmeans_contact_all_output_extract_normalised_unpivot {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_ml_unsupervised.ml_invoice_rec_kmeans_contact_all_output_extract_normalised_unpivot`
    ;;

  dimension: company_id {
    type: string
    sql: ${TABLE}.company_id ;;
  }

  dimension: nearest_centroid_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.nearest_centroid_id ;;
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
