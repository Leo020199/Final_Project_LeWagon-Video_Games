SELECT
  lg.name,
  lg.genre,
  lg.date
FROM {{ ref('list_playstation_games') }} AS lg
JOIN {{ ref('genres_playstation_games') }} AS gg
ON lg.genres = gg.genre_id
