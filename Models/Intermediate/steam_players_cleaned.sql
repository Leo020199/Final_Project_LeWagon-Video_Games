SELECT
  playerid,
  country
FROM {{ ref('steam_players') }}
