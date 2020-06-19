view: ml_invoice_rec_kmeans_contact_allocation_changes {
  sql_table_name: `cfolab-lush.dbt_bsl_pl_cfolab_ml_unsupervised.ml_invoice_rec_kmeans_contact_allocation_changes`
    ;;
  view_label: "Allocation Changes"


  dimension: company_id {
    type: string
    sql: ${TABLE}.company_id ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: current_centroid_id {
    type: number
    sql: ${TABLE}.current_centroid_id ;;
  }

  dimension: previous_centroid_id {
    type: number
    sql: ${TABLE}.previous_centroid_id ;;
  }

  dimension: untransformed_previous_centroid_id {
    type: number
    sql: ${TABLE}.untransformed_previous_centroid_id ;;
  }

  dimension: date_of_change {
    type: date
    sql: ${TABLE}.date_of_change ;;
  }

  dimension: previous_centroid_name {
    label: "Moved From"
    type: string
    sql: CASE
        WHEN ${previous_centroid_id} = 3 THEN "Comfort Zone"
        WHEN ${previous_centroid_id} = 2 THEN "Royalty"
        WHEN ${previous_centroid_id} = 1 THEN "Rehab"
        WHEN ${previous_centroid_id} = 4 THEN "Sleepy"
        ELSE "Spare Cluster"
      END;;
  }

  dimension: current_centroid_name {
    label: "Moved To"
    type: string
    sql: CASE
        WHEN ${current_centroid_id} = 3 THEN "Comfort Zone"
        WHEN ${current_centroid_id} = 2 THEN "Royalty"
        WHEN ${current_centroid_id} = 1 THEN "Rehab"
        WHEN ${current_centroid_id} = 4 THEN "Sleepy"
        ELSE "Spare Cluster"
      END;;
  }

  dimension: type_of_change {
    description: "Is this change an 'Upgrade or Downgrade in cluster allocation? 'Other' and 'Unknown' also included"

  }

  measure: count {
    type: count
    drill_fields: [company_name]
  }
}
