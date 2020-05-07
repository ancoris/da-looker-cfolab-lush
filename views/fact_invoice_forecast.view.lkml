view: fact_invoice_forecast {
  sql_table_name: `cfolab-lush.dw_pl_cfolab.fact_invoice_forecast`
    ;;

  dimension: scenario {
    type: string
    sql: ${TABLE}.scenario ;;
    group_label: "Scenario"
  }

  dimension: scenario_name {
    type: string
    sql: ${TABLE}.scenario_name ;;
    group_label: "Scenario"
  }

  dimension: scenario_input_link {
    type: string
    sql: ${TABLE}.scenario_input_link ;;
    html: <a href="{{value}}"  target="_blank"><font style="color:blue; text-decoration:underline">model inputs</font></a>
    ;;
    group_label: "Scenario"
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
    group_label: "Scenario"
  }

  dimension: is_forecast {
    type: number
    sql: ${TABLE}.is_forecast ;;
    group_label: "Scenario"
  }

  dimension: invoice_sequence {
    label: "Invoice sequence no"
    type: number
    sql: ${TABLE}.invoice_sequence ;;
    group_label: "Scenario"
  }

  dimension: invoice_type {
    type: string
    sql: ${TABLE}.invoice_type ;;
    group_label: "Invoice info"
  }

  dimension: invoice_friendly_id {
    label: "Invoice Id"
    type: string
    sql: ${TABLE}.invoice_friendly_id ;;
    html: <a href="https://go.xero.com/{% if invoice_type == 'PAY' %}AccountsPayable{%else%}AccountsReceivable{%endif%}/View.aspx?InvoiceID={{invoice_id}}"  target="_blank"><font style="color:blue; text-decoration:underline">{{ value }}</font></a>
      ;;
    group_label: "Invoice info"
  }

  dimension_group: invoice_issue {
    label: "Issue"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.invoice_issue_date ;;
    group_label: "Invoice info"
  }
  measure: min_invoice_issue_date {
    label: "First invoice issue date"
    type: date
    convert_tz: no
    datatype: date
    sql: min(invoice_issue_date) ;;
    group_label: "Invoice info"
  }
  measure: max_invoice_issue_date {
    label: "Most recent invoice issue date"
    type: date
    convert_tz: no
    datatype: date
    sql: max(invoice_issue_date) ;;
    group_label: "Invoice info"
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    group_label: "Company info"
  }

  dimension: payment_out_global {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.payment_out_global ;;
    group_label: "Net cash flow positioning"
  }

  dimension: payment_in_global {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.payment_in_global ;;
    group_label: "Net cash flow positioning"
  }

  dimension: net_payment_global {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.net_payment_global ;;
    group_label: "Net cash flow positioning"
  }

  dimension_group: payment {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      week_of_year

    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.payment_date ;;
    group_label: "Payments and credit notes"
  }

  dimension: deferral_amount {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.deferral_amount ;;
    group_label: "Net cash flow positioning"
  }

  measure: count {
    type: count
    drill_fields: [invoice_details*]

  }
  set: invoice_details {
    fields: [invoice_friendly_id, invoice_issue_date]
  }
}
