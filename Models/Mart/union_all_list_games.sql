SELECT *
FROM {{ ref('list_games_nintendo_genre_joined') }}
UNION ALL
SELECT *
FROM {{ ref('list_games_xbox_genre_joined') }}
UNION ALL
SELECT *
FROM {{ ref('list_games_playstation_genre_joined') }}
UNION ALL
SELECT *
FROM {{ ref('list_games_steam_genre_joined') }}
