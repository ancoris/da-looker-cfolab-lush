view: fact_company_score {
  sql_table_name: `cfolab-lush.dw_pl_cfolab.fact_company_score`
    ;;

  dimension: average_company_score {
    type: number
    sql: ${TABLE}.average_company_score ;;
  }

  dimension: company_id {
    type: string
    sql: ${TABLE}.company_id ;;
  }

  dimension: offset_months {
    type: number
    sql: ${TABLE}.offset_months ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
