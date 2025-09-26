WITH A AS (SELECT
  title,
  final.genre1,
  final.genre2,
  final.genre3,
  origin.alcohol_reference,
  origin.animated_blood,
  origin.blood,
  origin.blood_and_gore,
  origin.crude_humor,
  origin.drug_reference,
  origin.fantasy_violence,
  origin.intense_violence,
  origin.violence,
  origin.mature_humor,
  origin.nudity,
  origin.sexual_content,
  origin.sexual_themes,
  origin.strong_sexual_content
FROM {{ ref('content_binary') }} AS origin
LEFT JOIN projetfinalvideogames.final_mart.binary AS final
USING (title))

, B AS (SELECT *
FROM A
UNPIVOT (genre FOR genre_col IN (genre1, genre2, genre3))
WHERE genre IS NOT NULL 
  AND genre != 'missing')

SELECT
  DISTINCT genre,
  ROUND(avg(alcohol_reference),2) AS avg_alcohol_reference,
  ROUND(avg(animated_blood),2) AS avg_animated_blood,
  ROUND(avg(blood),2) AS avg_blood,
  ROUND(avg(blood_and_gore),2) AS avg_blood_and_gore,
  ROUND(avg(crude_humor),2) AS avg_crude_humor,
  ROUND(avg(drug_reference),2) AS avg_drug_reference,
  ROUND(avg(fantasy_violence),2) AS avg_fantasy_violence,
  ROUND(avg(intense_violence),2) AS avg_intense_violence,
  ROUND(avg(violence),2) as avg_violence,
  ROUND(avg(mature_humor),2) AS avg_mature_humor,
  ROUND(avg(nudity),2) as avg_nudity,
  ROUND(avg(sexual_content),2) as avg_sexual_content,
  ROUND(avg(sexual_themes),2) as avg_sexual_themes,
  ROUND(avg(strong_sexual_content),2) as avg_strong_sexual_content,
FROM B
GROUP BY genre
