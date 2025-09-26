SELECT
  lg.name,
  lg.genre,
  lg.date
FROM {{ ref('list_xbox_games') }} AS lg
JOIN {{ ref('genres_list_games') }} AS gg
ON lg.genres = gg.genre_id
