locals {
  data_world_0001_db_name = aws_glue_catalog_database.db_data_world.name
  data_world_0001_tb_name = "tb_covid_19_data_resource_hub_covid_19_case_counts"
}

resource "aws_glue_catalog_table" "tb_covid_19_data_resource_hub_covid_19_case_counts" {
  name          = local.data_world_0001_db_name
  database_name = local.data_world_0001_tb_name

  table_type = "external_table"

  parameters = {
    "external"            = "true"
    "parquet.compression" = "snappy"
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
      name = "people_positive_cases_count"
      type = "string"
      comment = "Number of people who tested positive for COVID-19. This number is not representative of the number of people who have been infected, as many people have not been tested. This number also does not account for people who have recovered or died from COVID-19."
    }
    columns {
      name = "county_name"
      type = "string"
      comment = "County name"
    }
    columns {
      name = "province_state_name"
      type = "string"
      comment = "Province or state name"
    }
    columns {
      name = "report_date"
      type = "string"
      comment = "Date of report in YYYY-MM-DD format"
    }
    columns {
      name = "continent_name"
      type = "string"
      comment = "Continent name"
    }
    columns {
      name = "data_source_name"
      type = "string"
      comment = "Data source name"
    }
    columns {
      name = "people_death_new_count"
      type = "string"
      comment = "Number of people who died from COVID-19 on the date of the report. This number is not representative of the number of people who have died from COVID-19, as many people have not been tested. This number also does not account for people who have recovered or died from COVID-19."
    }
    columns {
      name = "county_fips_number"
      type = "string"
      comment = "County FIPS number"
    }
    columns {
      name = "country_alpha_3_code"
      type = "string"
      comment = "Country alpha-3 code"
    }
    columns {
      name = "country_short_name"
      type = "string"
      comment = "Country short name"
    }
    columns {
      name = "country_alpha_2_code"
      type = "string"
      comment = "Country alpha-2 code"
    }
    columns {
      name = "people_positive_new_cases_count"
      type = "string"
      comment = "Number of new people who tested positive for COVID-19 on the date of the report. This number is not representative of the number of people who have been infected, as many people have not been tested. This number also does not account for people who have recovered or died from COVID-19."
    }
    columns {
      name = "people_death_count"
      type = "string"
      comment = "Number of people who died from COVID-19. This number is not representative of the number of people who have died from COVID-19, as many people have not been tested. This number also does not account for people who have recovered or died from COVID-19."
    }
  }
}
