view: dim_input_config {
  sql_table_name: `cfolab-lush.dw_pl_cfolab_input.dim_input_config`
    ;;

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: scenario {
    type: string
    sql: ${TABLE}.scenario ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
