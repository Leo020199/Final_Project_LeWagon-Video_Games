SELECT
  Console_Name,
  Type,
  Company,
  Released_Year,
  Units_sold_million,
  CASE
    WHEN Company = "Microsoft" THEN "xbox"
    WHEN Company = "Sony" THEN "playstation"
    WHEN Company = "Nintendo" THEN "nintendo"
    ELSE ""
  END AS plateform
FROM {{ ref('best_sales_consoles') }}
