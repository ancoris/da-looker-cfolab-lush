view: fact_invoice_rec {
  sql_table_name: `cfolab-lush.dw_pl_cfolab.fact_invoice_rec`
    ;;

  dimension: invoice_friendly_id {
    type: string
    sql: ${TABLE}.invoice_friendly_id ;;
  }

  dimension: invoice_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: company_id {
    hidden: yes
    type: string
    sql: ${TABLE}.company_id ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: company_segment_1 {
    type: string
    sql: ${TABLE}.company_segment_1 ;;
  }

  dimension: company_segment_2 {
    type: string
    sql: ${TABLE}.company_segment_2 ;;
  }

  dimension: company_segment_3 {
    type: string
    sql: ${TABLE}.company_segment_3 ;;
  }

  dimension: company_segment_4 {
    type: string
    sql: ${TABLE}.company_segment_4 ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: days_due_to_payment {
    type: number
    sql: ${TABLE}.days_due_to_payment ;;
  }

  dimension: days_issue_to_payment {
    type: number
    sql: ${TABLE}.days_issue_to_payment ;;
  }

  dimension: days_overdue {
    type: number
    sql: ${TABLE}.days_overdue ;;
  }

  dimension: days_until_due {
    type: number
    sql: ${TABLE}.days_until_due ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: discount_amount_global {
    type: number
    sql: ${TABLE}.discount_amount_global ;;
  }

  dimension: discount_percentage {
    type: number
    sql: ${TABLE}.discount_percentage ;;
  }

  dimension_group: dw_delivery {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dw_delivery_time ;;
  }

  dimension_group: dw_process {
    type: time
    hidden:  yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dw_process_time ;;
  }

  dimension: fx_rate {
    type: number
    sql: ${TABLE}.fx_rate ;;
  }

  dimension: invoice_age_days {
    type: number
    sql: ${TABLE}.invoice_age_days ;;
  }

  dimension: invoice_amount_gross {
    hidden: yes
    type: number
    sql: ${TABLE}.invoice_amount_gross ;;
  }

  dimension: invoice_amount_gross_global {
    type: number
    sql: ${TABLE}.invoice_amount_gross_global ;;
  }

  dimension: invoice_amount_net {
    hidden: yes
    type: number
    sql: ${TABLE}.invoice_amount_net ;;
  }

  dimension: invoice_amount_net_global {
    type: number
    sql: ${TABLE}.invoice_amount_net_global ;;
  }

  dimension_group: invoice_due {
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
    sql: ${TABLE}.invoice_due_date ;;
  }

  dimension_group: invoice_issue {
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
  }

  dimension: invoice_status {
    type: string
    sql: ${TABLE}.invoice_status ;;
  }

  dimension: invoice_term_days {
    type: number
    sql: ${TABLE}.invoice_term_days ;;
  }

  dimension: invoice_type {
    type: string
    sql: ${TABLE}.invoice_type ;;
  }

  dimension: lost_working_capital_amount_global {
    type: number
    sql: ${TABLE}.lost_working_capital_amount_global ;;
  }

  dimension: lost_working_capital_days {
    type: number
    sql: ${TABLE}.lost_working_capital_days ;;
  }

  dimension: missed_opportunity_amount_global {
    type: number
    sql: ${TABLE}.missed_opportunity_amount_global ;;
  }

  dimension: payment_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.payment_amount ;;
  }

  dimension: payment_amount_global {
    type: number
    sql: ${TABLE}.payment_amount_global ;;
  }

  dimension: payment_amount_outstanding_global {
    type: number
    sql: ${TABLE}.payment_amount_outstanding_global ;;
  }

  dimension_group: payment {
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
    sql: ${TABLE}.payment_date ;;
  }

  dimension: payment_status {
    type: string
    sql: ${TABLE}.payment_status ;;
  }

  dimension: tax_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: tax_amount_global {
    type: number
    sql: ${TABLE}.tax_amount_global ;;
  }

  dimension: total_payment_amount_due {
    hidden: yes
    type: number
    sql: ${TABLE}.total_payment_amount_due ;;
  }

  dimension: total_payment_amount_due_global {
    type: number
    sql: ${TABLE}.total_payment_amount_due_global ;;
  }

  measure: count {
    type: count
    drill_fields: [company_name]
  }
}
