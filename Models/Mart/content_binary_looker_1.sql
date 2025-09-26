SELECT
  genre,
  avg_alcohol_reference AS alcool,
  avg_blood AS sang,
  avg_drug_reference AS drogue,
  avg_fantasy_violence AS violence,
  avg_crude_humor AS humour,
  avg_sexual_themes AS sex
FROM {{ ref('content_binary_genre_joined') }}
WHERE genre IN ("adventure", "shooter", "rpg")
