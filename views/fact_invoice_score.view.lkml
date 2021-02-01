view: fact_invoice_score {
  sql_table_name: `cfolab-lush.dbt_bsl_pl_cfolab.fact_invoice_score`
    ;;

  dimension: company_id {
    type: string
    sql: ${TABLE}.company_id ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: days_due_to_payment {
    type: number
    sql: ${TABLE}.days_due_to_payment ;;
  }

  dimension: days_issue_to_payment {
    type: number
    sql: ${TABLE}.days_issue_to_payment ;;
  }

  dimension: days_paid_late_tier {
    type: number
    sql: ${TABLE}.days_paid_late_tier ;;
  }

  dimension_group: dw_delivery {
    type: time
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

  dimension: invoice_amount_ex_credit_notes_and_discounts_global {
    type: number
    sql: ${TABLE}.invoice_amount_ex_credit_notes_and_discounts_global ;;
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

  dimension: invoice_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.invoice_id ;;
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


  dimension: invoice_value_tier {
    type: number
    sql: ${TABLE}.invoice_value_tier ;;
  }

  dimension: invoice_score_raw {
    type: number
    sql: ${TABLE}.invoice_score_raw ;;
  }

  dimension: invoice_score_friendly {
    type: number
    sql: ${TABLE}.invoice_score_friendly ;;
  }

  dimension_group: snapshot_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.snapshot_date ;;
  }

  dimension: offset_months {
    type: number
    sql: ${TABLE}.offset_months ;;
  }

  measure: count {
    type: count
    drill_fields: [company_name]
  }
}
