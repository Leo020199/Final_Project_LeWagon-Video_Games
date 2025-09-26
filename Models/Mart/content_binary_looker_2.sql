WITH A AS 
(SELECT
  genre,
  avg_alcohol_reference AS alcool,
  avg_blood AS sang,
  avg_drug_reference AS drogue,
  avg_fantasy_violence AS violence,
  avg_crude_humor AS humour,
  avg_sexual_themes AS sex
FROM {{ ref('content_binary_genre_joined') }}
WHERE genre IN ("adventure", "shooter", "rpg"))

SELECT
  ROUND(AVG(alcool),2) AS alcool,
  ROUND(AVG(sang),2) AS sang,
  ROUND(AVG(drogue),2) AS drogue,
  ROUND(AVG(violence),2) AS violence,
  ROUND(AVG(humour),2) AS humour,
  ROUND(AVG(sex),2) AS sex,
FROM A
