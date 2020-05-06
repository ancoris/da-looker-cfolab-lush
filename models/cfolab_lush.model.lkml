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
  join: fact_invoice {
    relationship: one_to_one
    sql_on: ${ml_invoice_rec_classification_prediction_output.invoice_id} = ${fact_invoice.invoice_id} ;;
  }
  label: "ML predictions"
}
