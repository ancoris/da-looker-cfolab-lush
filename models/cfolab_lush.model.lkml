connection: "cfolab-lush"

# include all the views
include: "/views/**/*.view"

datagroup: cfolab_lush_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cfolab_lush_default_datagroup

explore: fact_invoice {
  label: "All invoices"
}

explore: fact_invoice_forecast {
  label: "Forecasts"
}

explore: dim_input_config {
  label: "CFO input general"
}

explore: ml_invoice_rec_classification_prediction_output {
  label: "Late REC Invoice Predictions"
  join: fact_invoice {
    relationship: one_to_one
    sql_on: ${ml_invoice_rec_classification_prediction_output.invoice_id} = ${fact_invoice.invoice_id} ;;
  }
  join: ml_invoice_rec_classification_predict {
    relationship: one_to_one
    sql_on: ${ml_invoice_rec_classification_predict.invoice_id} = ${ml_invoice_rec_classification_prediction_output.invoice_id} ;;
  }
}

explore: ml_invoice_rec_kmeans_contact_all_output_extract {
  label: "Contact REC Cluster Output"
  join: ml_invoice_rec_kmeans_contact_all_output_evaluation {
    outer_only: yes
    relationship: many_to_one
    sql_on: ${ml_invoice_rec_kmeans_contact_all_output_evaluation.centroid_id} =${ml_invoice_rec_kmeans_contact_all_output_extract.nearest_centroid_id} ;;
  }
  join: ml_invoice_rec_kmeans_contact_centroid_match_to_original {
    relationship: many_to_one
    sql_on: ${ml_invoice_rec_kmeans_contact_all_output_extract.nearest_centroid_id} = ${ml_invoice_rec_kmeans_contact_centroid_match_to_original.current_centroid_id} ;;
  }
  join: fact_invoice {
    relationship: one_to_many
    sql_on: ${ml_invoice_rec_kmeans_contact_all_output_extract.company_id} = ${fact_invoice.company_id} ;;
  }
  join: fact_invoice_score {
    relationship: one_to_many
    sql_on: ${ml_invoice_rec_kmeans_contact_all_output_extract.company_id} = ${fact_invoice_score.company_id} ;;
  }
}


explore: ml_invoice_rec_kmeans_contact_allocation_changes {
  label: "Contact REC Cluster Allocations"
}

explore: ml_invoice_rec_kmeans_contact_all_output_evaluation_past_combine_2 {
  label: "Eval past combined 2"
}

explore: ml_invoice_rec_kmeans_contact_all_output_extract_past_combine_2 {
  label: "Extract past combined 2"
}

explore: fact_invoice_score {
  join: contact {
    relationship: one_to_one
    sql_on: ${fact_invoice_score.company_id} = ${contact.contact_id} ;;
  }
}
