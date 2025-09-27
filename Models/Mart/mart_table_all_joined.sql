WITH exploded AS (
  -- base : genres dépliés + identifiant (NE PAS ré-ajouter platform, il est déjà dans t.*)
  SELECT
    t.* EXCEPT(genre1, genre2, genre3),
    LOWER(TRIM(genre)) AS genre,
    CONCAT(CAST(playerid AS STRING), '_', CAST(gameid AS STRING)) AS identifiant
  FROM {{ ref('all_joined_table') }} AS t
  CROSS JOIN UNNEST(ARRAY<STRING>[t.genre1, t.genre2, t.genre3]) AS genre
  WHERE genre IS NOT NULL AND TRIM(genre) <> '' AND LOWER(genre) <> 'missing'
),
base AS (
  -- dédup (player, game) DANS chaque (genre, platform)
  SELECT DISTINCT
    platform,
    genre,
    gameid,
    playerid
  FROM exploded
),
players_per_game AS (
  -- nb de joueurs distincts par (platform, genre, game)
  SELECT
    platform,
    genre,
    gameid,
    COUNT(DISTINCT playerid) AS n_players_for_game
  FROM base
  GROUP BY platform, genre, gameid
),
genre_platform_metrics AS (
  -- agrégats par (platform, genre)
  SELECT
    platform,
    genre,
    COUNT(DISTINCT gameid)            AS n_games_in_genre_platform,
    ROUND(AVG(n_players_for_game), 2) AS avg_players_per_game_in_genre_platform
  FROM players_per_game
  GROUP BY platform, genre
),
genre_platform_counts AS (
  -- joueurs distincts + paires (player,game) distinctes par (platform, genre)
  SELECT
    platform,
    genre,
    COUNT(DISTINCT playerid) AS n_players_in_genre_platform,
    COUNT(DISTINCT CONCAT(CAST(playerid AS STRING),'|',CAST(gameid AS STRING)))
      AS n_pairs_in_genre_platform
  FROM base
  GROUP BY platform, genre
),
genre_platform_all AS (
  SELECT
    m.platform,
    m.genre,
    m.n_games_in_genre_platform,
    m.avg_players_per_game_in_genre_platform,
    c.n_players_in_genre_platform,
    c.n_pairs_in_genre_platform,
    ROUND(SAFE_DIVIDE(c.n_pairs_in_genre_platform, c.n_players_in_genre_platform), 2)
      AS avg_games_per_player_in_genre_platform
  FROM genre_platform_metrics m
  JOIN genre_platform_counts  c
    ON m.platform = c.platform AND m.genre = c.genre
)

-- Résultat : toutes les lignes détaillées + colonnes par (platform, genre)
,
sub12 as (
SELECT
  e.*,
  gpa.n_games_in_genre_platform,
  gpa.avg_players_per_game_in_genre_platform,
  gpa.n_players_in_genre_platform,
  gpa.n_pairs_in_genre_platform,
  gpa.avg_games_per_player_in_genre_platform
FROM exploded e
LEFT JOIN genre_platform_all gpa
  ON e.platform = gpa.platform AND e.genre = gpa.genre)

,
sub13 as (
Select sub12.*, s.country_canonical,s.region
FROM sub12
INNER JOIN {{ ref('intermediate_all_joined_table') }} as s
on s.playerid = sub12.playerid)

Select sub13.*, concat (gameid,"_",playerid) as key_join2
from sub13

