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

explore: fact_invoice_pay {
  label: "Payables"
}

explore: fact_invoice_rec {
  label: "Receivables"
}
