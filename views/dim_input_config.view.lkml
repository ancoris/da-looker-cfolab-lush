view: dim_input_config {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_input.dim_input_config`
    ;;

  dimension: current_balance {
    type: number
    sql: ${TABLE}.current_balance ;;
  }

  dimension: forecast_span_days {
    type: number
    sql: ${TABLE}.forecast_span_days ;;
  }

  dimension: link_to_sheet {
    type: string
    sql: ${TABLE}.link_to_sheet ;;
    html: <a href="{{value}}"  target="_blank"><font style="color:blue; text-decoration:underline">model inputs</font></a>
    ;;
  }

  dimension: reporting_currency {
    type: string
    sql: ${TABLE}.reporting_currency ;;
  }

  dimension: scenario {
    primary_key: yes
    type: string
    sql: ${TABLE}.scenario ;;
  }

  dimension: scenario_name {
    type: string
    sql: ${TABLE}.scenario_name ;;
  }

  measure: count {
    type: count
    drill_fields: [scenario_name]
  }
}
