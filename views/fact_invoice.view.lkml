view: fact_invoice {
  sql_table_name: `cfolab-lush.dw_pl_cfolab.fact_invoice`
    ;;

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
  dimension: invoice_age_days {
    type: number
    sql: ${TABLE}.invoice_age_days ;;
    group_label: "Invoice info"
  }

  dimension: invoice_status {
    type: string
    sql: ${TABLE}.invoice_status ;;
    group_label: "Invoice info"
  }

  dimension: payment_status {
    type: string
    sql: ${TABLE}.payment_status ;;
    group_label: "Invoice info"
  }

  dimension: invoice_term_days {
    label: "Terms"
    type: number
    sql: ${TABLE}.invoice_term_days ;;
    group_label: "Invoice info"
  }


  dimension: currency_code {
    alias: [issue_currency_code]
    type: string
    sql: ${TABLE}.currency_code ;;
    group_label: "Invoice info"
  }

  dimension: fx_rate {
    type: number
    sql: ${TABLE}.fx_rate ;;
    group_label: "Invoice info"
  }

  dimension: company_id {
    hidden: yes
    type: string
    sql: ${TABLE}.company_id ;;
    group_label: "Company info"
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    group_label: "Company info"
    link: {
      label: "See all invoices of this status from {{ value }}"
      url: "/looks/31?f[fact_invoice.company_name]={{ value }}&f[fact_invoice.invoice_type]={{ _filters['fact_invoice.invoice_type'] | url_encode }}&f[fact_invoice.payment_status]={{ _filters['fact_invoice.payment_status'] | url_encode }}&sorts=fact_invoice.invoice_issue_date+desc"
    }#31 is the look number for "All Invoices" in this instance.
  }

  dimension: company_segment_1 {
    type: string
    sql: ${TABLE}.company_segment_1 ;;
    group_label: "Company info"
  }

  dimension: company_segment_2 {
    type: string
    sql: ${TABLE}.company_segment_2 ;;
    group_label: "Company info"
  }

  dimension: company_segment_3 {
    type: string
    sql: ${TABLE}.company_segment_3 ;;
    group_label: "Company info"
  }

  dimension: company_segment_4 {
    type: string
    sql: ${TABLE}.company_segment_4 ;;
    group_label: "Company info"
  }

  dimension: total_invoice_amount_gross_global {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.total_invoice_amount_gross_global ;;
    group_label: "Company info"
  }

  dimension: total_paid_invoice_amount_gross_global {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.total_paid_invoice_amount_gross_global ;;
    group_label: "Company info"
  }

  dimension: invoice_amount_net_global {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.invoice_amount_net_global ;;
    group_label: "Invoice info"
  }

  dimension: tax_amount_global {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.tax_amount_global ;;
    group_label: "Invoice info"
  }

  dimension: invoice_amount_gross_global {
    label: "Amount Gross"
    type: number
    value_format_name: gbp
    sql: ${TABLE}.invoice_amount_gross_global ;;
    group_label: "Invoice info"
  }

  dimension: invoice_amount_ex_credit_notes_and_discounts_global {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.invoice_amount_ex_credit_notes_and_discounts_global ;;
    group_label: "Invoice info"
  }


  dimension: discount_amount_global {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.discount_amount_global ;;
    group_label: "Discounts"
  }

  dimension: discount_percentage {
    type: number
    sql: ${TABLE}.discount_percentage ;;
    group_label: "Discounts"
  }

  dimension: payment_amount_global {
    label: "Paid"
    type: number
    value_format_name: gbp
    sql: ${TABLE}.payment_amount_global ;;
    group_label: "Payments and credit notes"
  }

  dimension: credit_note_amount_global {
    label: "Credited"
    type: number
    value_format_name: gbp
    sql: ${TABLE}.credit_note_amount_global ;;
    group_label: "Payments and credit notes"
  }

  dimension: payment_amount_outstanding_global {
    label: "Outstanding"
    type: number
    value_format_name: gbp
    sql: ${TABLE}.payment_amount_outstanding_global ;;
    group_label: "Payments and credit notes"
  }

  dimension: lost_working_capital_amount_global {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.lost_working_capital_amount_global ;;
    group_label: "Missed opportnity"
  }

  dimension: lost_working_capital_days {
    type: number
    sql: ${TABLE}.lost_working_capital_days ;;
    group_label: "Missed opportnity"
  }

  dimension: missed_opportunity_amount_global {
    type: number
    value_format_name: gbp
    sql: ${TABLE}.missed_opportunity_amount_global ;;
    group_label: "Missed opportnity"
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

  dimension_group: invoice_due {
    label:  "Due"
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
    group_label: "Payment compliance"
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
    group_label: "Payments and credit notes"
  }

  dimension: days_due_to_payment {
    type: number
    sql: ${TABLE}.days_due_to_payment ;;
    group_label: "Payment compliance"
  }

  dimension: days_issue_to_payment {
    type: number
    sql: ${TABLE}.days_issue_to_payment ;;
    group_label: "Payment compliance"
  }

  dimension: days_overdue {
    type: number
    sql: ${TABLE}.days_overdue ;;
    group_label: "Payment compliance"
  }
  dimension: days_overdue_tiers {
    type: tier
    tiers: [0, 4, 8, 15, 31, 61, 91, 121]
    style: integer
    sql: ${TABLE}.days_overdue ;;
    value_format: "##0"
    group_label: "Payment compliance"
  }


  dimension: days_until_due {
    type: number
    sql: ${TABLE}.days_until_due ;;
    group_label: "Payment compliance"
  }
  dimension: days_until_due_tiers {
    type: tier
    tiers: [0, 4, 8, 15, 31, 61, 91, 121]
    style: integer
    sql: ${TABLE}.days_until_due ;;
    value_format: "##0"
    group_label: "Payment compliance"
  }
  dimension: amount_gross_overdue_global {
    label:"Overdue"
    type: number
    value_format_name: gbp
    sql: if(${days_overdue}>0,${payment_amount_outstanding_global},0) ;;
    group_label: "Payment compliance"
  }

  dimension: amount_gross_overdue_global_x_days_overdue {
    type: number
    value_format_name: gbp
    sql: if(${days_overdue}>0,${payment_amount_outstanding_global} * ${days_overdue},0) ;;
    group_label: "Payment compliance"
  }

  dimension: total_payment_amount_due {
    hidden: yes
    type: number
    sql: ${TABLE}.total_payment_amount_due ;;
  }
  dimension: tax_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.tax_amount ;;
  }
  dimension: payment_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.payment_amount ;;
  }
  dimension: invoice_amount_net {
    hidden: yes
    type: number
    sql: ${TABLE}.invoice_amount_net ;;
  }
  dimension: invoice_amount_gross {
    hidden: yes
    type: number
    sql: ${TABLE}.invoice_amount_gross ;;
  }
  dimension: discount_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.discount_amount ;;
  }
  dimension: invoice_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.invoice_id ;;
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


  measure: count {
    type: count
   drill_fields: [invoice_details*]

  }
  set: invoice_details {
    fields: [
      fact_invoice.invoice_friendly_id,
      fact_invoice.invoice_issue_date,
      fact_invoice.invoice_due_date,
      fact_invoice.invoice_term_days,
      fact_invoice.invoice_amount_gross_global,
      fact_invoice.payment_amount_global,
      fact_invoice.payment_amount_outstanding_global,
      fact_invoice.payment_status]
  }


}
