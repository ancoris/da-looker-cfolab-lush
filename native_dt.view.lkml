# If necessary, uncomment the line below to include explore_source.

# include: "cfolab_lush.model.lkml"

view: native_dt {
  derived_table: {
    explore_source: ml_invoice_rec_kmeans_contact_allocation_changes {
      column: company_name {}
      column: previous_centroid_name {}
      column: current_centroid_name {}
      column: date_of_change {}
    }
  }
  dimension: company_name {
    label: "Allocation Changes Company Name"
  }
  dimension: previous_centroid_name {
    label: "Allocation Changes Moved From"
  }
  dimension: current_centroid_name {
    label: "Allocation Changes Moved To"
  }
  dimension: date_of_change {
    label: "Allocation Changes Date of Change"
    type: date
  }

}
