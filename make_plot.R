library(tidyverse)

top_songs <- read_rds("clean_data.rds")

billboard_plot <- top_songs |>
  ggplot(aes(x = week, y = rank, group = interaction(artist, track), color = best_rank)) +
  geom_line(alpha = 0.45, linewidth = 0.8) +
  scale_y_reverse(breaks = seq(1, 100, by = 10)) +
  scale_color_viridis_c(option = "plasma", direction = -1, name = "Best rank") +
  labs(
    title = "The climb and fall of Billboard hits",
    subtitle = "Songs that reached the top 10, charted week by week",
    x = "Weeks since entering the chart",
    y = "Billboard position (1 is best)",
    caption = "Each line represents one song; color shows its best chart position."
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.background = element_rect(fill = "#111827", color = NA),
    panel.background = element_rect(fill = "#111827", color = NA),
    panel.grid.major = element_line(color = "#374151"),
    panel.grid.minor = element_blank(),
    text = element_text(color = "#F9FAFB"),
    axis.text = element_text(color = "#D1D5DB"),
    plot.title = element_text(face = "bold", color = "#F9FAFB"),
    legend.background = element_rect(fill = "#111827", color = NA)
  )

ggsave("billboard.png", plot = billboard_plot)
