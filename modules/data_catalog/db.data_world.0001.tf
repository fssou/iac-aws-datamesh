locals {
  data_world_0001_db_name = aws_glue_catalog_database.db_data_world.name
  data_world_0001_tb_name = "tb_covid_19_data_resource_hub_covid_19_case_counts"
}

resource "aws_glue_catalog_table" "tb_covid_19_data_resource_hub_covid_19_case_counts" {
  database_name = local.data_world_0001_db_name
  name          = local.data_world_0001_tb_name
  catalog_id    = data.aws_caller_identity.main.account_id
  table_type    = "external_table"
  description   = "This table contains COVID-19 case counts from the COVID-19 Data Resource Hub. The COVID-19 Data Resource Hub is a collection of the best available data for countries, states and counties. The data is updated daily and primarily sourced from public data repositories such as Johns Hopkins University, the CDC, WHO, and a few others. The data is collected, cleaned, and made available in a single place for analysis. The data is available in CSV and JSON formats. The data is also available via an API. The data is available for free and is licensed under the Creative Commons Attribution-ShareAlike 4.0 International license. The data is updated daily. The data is available for download from the COVID-19 Data Resource Hub website. The data is also available via an API. The data is available for free and is licensed under the Creative Commons Attribution-ShareAlike 4.0 International license. The data is updated daily."

  parameters = {
    "external"            = "true"
    "parquet.compression" = "snappy"
  }
  partition_keys {
    name    = "report_date"
    type    = "date"
    comment = "Date of report in YYYY-MM-DD format"
  }
  partition_keys {
    name    = "country_alpha_2_code"
    type    = "string"
    comment = "Country alpha-2 code"
  }
  partition_keys {
    name    = "continent_name"
    type    = "string"
    comment = "Continent name"
  }
  storage_descriptor {
    location      = "s3://${var.bucket_name_sor}/${local.data_world_0001_db_name}/${local.data_world_0001_tb_name}"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
    ser_de_info {
      name                  = "covid_19_case_counts"
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
      parameters = {
        "serialization.format" = 1
      }
    }
    columns {
      name    = "people_positive_cases_count"
      type    = "bigint"
      comment = "Number of people who tested positive for COVID-19."
    }
    columns {
      name    = "county_name"
      type    = "string"
      comment = "County name"
    }
    columns {
      name    = "province_state_name"
      type    = "string"
      comment = "Province or state name"
    }
    columns {
      name    = "data_source_name"
      type    = "string"
      comment = "Data source name"
    }
    columns {
      name    = "people_death_new_count"
      type    = "bigint"
      comment = "Number of people who died from COVID-19 on the date of the report. "
    }
    columns {
      name    = "county_fips_number"
      type    = "bigint"
      comment = "County FIPS number"
    }
    columns {
      name    = "country_alpha_3_code"
      type    = "string"
      comment = "Country alpha-3 code"
    }
    columns {
      name    = "country_short_name"
      type    = "string"
      comment = "Country short name"
    }
    columns {
      name    = "people_positive_new_cases_count"
      type    = "bigint"
      comment = "Number of new people who tested positive for COVID-19 on the date of the report."
    }
    columns {
      name    = "people_death_count"
      type    = "bigint"
      comment = "Number of people who died from COVID-19."
    }
  }
}
