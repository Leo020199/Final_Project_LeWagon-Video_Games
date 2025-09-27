WITH base AS (
  -- Dédup (player, game, genre) pour éviter les doublons
  SELECT DISTINCT
    gameid,
    title,
    playerid,
    LOWER(TRIM(genre)) AS genre
  FROM {{ ref('all_joined_table') }}
  WHERE genre IS NOT NULL
    AND TRIM(genre) <> ''
    AND LOWER(genre) <> 'missing'
),
players_per_game AS (
  -- # joueurs distincts par (genre, jeu)
  SELECT
    genre,
    gameid,
    ANY_VALUE(title) AS title,
    COUNT(DISTINCT playerid) AS n_players
  FROM base
  GROUP BY genre, gameid
),
ranked AS (
  -- Classement par genre
  SELECT
    genre,
    gameid,
    title,
    n_players,
    ROW_NUMBER() OVER (PARTITION BY genre ORDER BY n_players DESC, gameid) AS rn
  FROM players_per_game
)
SELECT
  genre,
  gameid,
  title,
  n_players,
  rn AS rank_in_genre
FROM ranked
WHERE rn <= 1000
ORDER BY genre, rank_in_genre
