SELECT
  playerid,
  country
FROM {{ ref('playstation_players') }}
