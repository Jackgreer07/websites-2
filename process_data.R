library(tidyverse)

top_songs <- billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    values_to = "rank"
  ) |>
  mutate(week = as.integer(week)) |>
  filter(!is.na(rank)) |>
  group_by(artist, track) |>
  mutate(best_rank = min(rank)) |>
  ungroup() |>
  filter(best_rank <= 10)

write_rds(top_songs, file = "clean_data.rds")
