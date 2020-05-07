view: ml_invoice_rec_classification_prediction_output {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_ml_supervised.ml_invoice_rec_classification_prediction_output`;;

  dimension: days_until_due {
    type: number
    sql: ${TABLE}.days_until_due ;;
  }

  dimension: invoice_amount_ex_credit_notes_and_discounts_global {
    type: number
    sql: ${TABLE}.invoice_amount_ex_credit_notes_and_discounts_global ;;
  }

  dimension: invoice_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: predicted_class {
    label: "Prediction"
    type: string
    sql: ${TABLE}.predicted_class ;;
    html: {% if {{value}} == 'Late' %}<b><font style="color:#B32F37">{{ value }}</font></b>{%endif%};;
  }


  dimension: probability {
    label: "Certainty"
    description: "Using facts about this company's invoice history, our Machine Learning model has determined the Predicted Class with this much certainty"
    type: number
    sql: ${TABLE}.probability ;;
    drill_fields: [probability]
    #drill_fields: [ml_invoice_rec_classification_predict.avg_days_late, ml_invoice_rec_classification_predict.avg_days_outstanding]
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

  set: ml_inputs {
    fields: [
      ml_invoice_rec_classification_predict.avg_days_late,
      ml_invoice_rec_classification_predict.avg_days_outstanding,
      ml_invoice_rec_classification_predict.count_outstanding_invoices,
      ml_invoice_rec_classification_predict.count_outstanding_invoices_overdue,
      ml_invoice_rec_classification_predict.count_paid_invoices,
      ml_invoice_rec_classification_predict.count_paid_invoices_late,
      ml_invoice_rec_classification_predict.days_paid_late_invoice_1,
      ml_invoice_rec_classification_predict.days_paid_late_invoice_2,
      ml_invoice_rec_classification_predict.days_paid_late_invoice_3,
      ml_invoice_rec_classification_predict.invoice_amount_gross_global,
      ml_invoice_rec_classification_predict.invoice_status_1,
      ml_invoice_rec_classification_predict.invoice_status_2,
      ml_invoice_rec_classification_predict.invoice_status_3,
      ml_invoice_rec_classification_predict.invoice_term_days,
      ml_invoice_rec_classification_predict.sum_last_three_outstanding,
      ml_invoice_rec_classification_predict.sum_outstanding_invoices,
      ml_invoice_rec_classification_predict.sum_outstanding_late_invoices,
      ml_invoice_rec_classification_predict.sum_paid_invoices_late,
      ml_invoice_rec_classification_predict.sum_paid_payment_global_invoices
    ]}
}
