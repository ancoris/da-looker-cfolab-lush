view: ml_invoice_rec_classification_prediction_output {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_ml_supervised.ml_invoice_rec_classification_prediction_output`
    ;;

  dimension: days_until_due {
    type: number
    sql: ${TABLE}.days_until_due ;;
  }

  dimension: invoice_amount_ex_credit_notes_and_discounts_global {
    type: number
    sql: ${TABLE}.invoice_amount_ex_credit_notes_and_discounts_global ;;
  }

  dimension: invoice_id {
    type: string
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: predicted_class {
    type: string
    sql: ${TABLE}.predicted_class ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

  dimension: days_until_due_tiers {
    type: tier
    tiers: [0, 4, 8, 15, 31, 61, 91, 121]
    style: integer
    sql: ${TABLE}.days_until_due ;;
    value_format: "##0"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
