view: ml_invoice_rec_kmeans_contact_centroid_match_to_original {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_ml_unsupervised.ml_invoice_rec_kmeans_contact_centroid_match_to_original`
    ;;
    #This may be better shifted to an extension
    view_label: "Contact Cluster Id"

  dimension: current_centroid_id {
    hidden: yes
    type: number
    sql: ${TABLE}.current_centroid_id ;;
  }

  dimension: original_centroid_id {
    type: number
    sql: ${TABLE}.original_centroid_id ;;
    description: "Comfort zone: 3, Royalty: 2, Rehab: 1, Sleepy: 4"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
