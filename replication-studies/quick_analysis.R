#!/usr/bin/env Rscript
# Quick test script for Facebook Marketing API analysis
# This is a simplified version for initial testing

# Setup ----
library(rsocialwatcher)
library(WDI)
library(dplyr)
library(tidyr)
library(ggplot2)
library(janitor)

# API Credentials ----
# IMPORTANT: Replace these with your actual credentials
TOKEN        <- "YOUR-TOKEN-HERE"
CREATION_ACT <- "YOUR-CREATION-ACT-HERE"
VERSION      <- "v19.0"

# Configuration ----
REGION <- "South Asia"  # Change to: "Sub-Saharan Africa", "Latin America & Caribbean", etc.
YEAR   <- 2021

# Fetch WDI Data ----
cat("Fetching World Bank data...\n")
wdi_df <- WDI(
  country = "all",
  indicator = c(
    "SP.POP.TOTL",           # Population
    "SP.POP.TOTL.MA.ZS",     # Male %
    "SP.POP.TOTL.FE.ZS",     # Female %
    "NY.GDP.PCAP.CD",        # GDP per capita
    "IT.NET.USER.ZS"         # Internet users %
  ),
  start = YEAR,
  end = YEAR,
  extra = TRUE
)

# Filter by region
wdi_df <- wdi_df %>%
  filter(region == REGION)

cat(sprintf("Found %d countries in %s\n", nrow(wdi_df), REGION))

# Fetch Facebook Data ----
cat("Fetching Facebook Marketing API data...\n")
fb_df <- query_fb_marketing_api(
  location_unit_type = "countries",
  location_keys      = map_param_vec(wdi_df$iso2c),
  gender             = map_param(1, 2),  # 1 = male, 2 = female
  version            = VERSION,
  creation_act       = CREATION_ACT,
  token              = TOKEN
)

cat(sprintf("Retrieved Facebook data for %d country-gender combinations\n", nrow(fb_df)))

# Clean and Merge ----
cat("Processing data...\n")
fb_clean_df <- fb_df %>%
  rename(iso2c = location_keys) %>%
  mutate(gender = case_when(
    gender == "1" ~ "fb_male",
    gender == "2" ~ "fb_female"
  )) %>%
  pivot_wider(
    id_cols = iso2c,
    names_from = gender,
    values_from = estimate_mau_upper_bound
  ) %>%
  left_join(wdi_df, by = "iso2c") %>%
  clean_names() %>%
  mutate(
    fb_total = fb_female + fb_male,
    fb_per_female = (fb_female / fb_total) * 100,
    wdi_per_female = sp_pop_totl_fe_zs,
    per_fb_pop = (fb_total / sp_pop_totl) * 100,
    fb_penetration_internet = (fb_total / (sp_pop_totl * it_net_user_zs / 100)) * 100
  )

# Quick Summary ----
cat("\n=== Summary Statistics ===\n")
cat(sprintf("Countries analyzed: %d\n", nrow(fb_clean_df)))
cat(sprintf("Total FB users: %s million\n", round(sum(fb_clean_df$fb_total, na.rm = TRUE) / 1e6, 1)))
cat(sprintf("Average FB penetration: %.1f%%\n", mean(fb_clean_df$per_fb_pop, na.rm = TRUE)))
cat(sprintf("Average internet users: %.1f%%\n", mean(fb_clean_df$it_net_user_zs, na.rm = TRUE)))

# Top 5 countries by penetration
cat("\n=== Top 5 Countries by FB Penetration ===\n")
top5 <- fb_clean_df %>%
  arrange(desc(per_fb_pop)) %>%
  select(country, per_fb_pop, it_net_user_zs, ny_gdp_pcap_cd) %>%
  head(5)
print(top5)

# Save processed data ----
output_file <- sprintf("fb_data_%s_%d.rds", gsub(" ", "_", tolower(REGION)), YEAR)
saveRDS(fb_clean_df, output_file)
cat(sprintf("\nData saved to: %s\n", output_file))

# Quick Plot ----
cat("\nGenerating quick visualization...\n")
p <- ggplot(fb_clean_df, aes(x = it_net_user_zs, y = per_fb_pop)) +
  geom_point(aes(size = sp_pop_totl / 1e6), alpha = 0.6, color = "#4267B2") +
  geom_smooth(method = "lm", se = TRUE, color = "darkblue") +
  labs(
    title = sprintf("Facebook Penetration vs Internet Connectivity: %s", REGION),
    x = "Internet Users (% of population)",
    y = "Facebook Penetration (% of population)",
    size = "Population (M)"
  ) +
  theme_minimal()

ggsave("fb_penetration_plot.png", p, width = 10, height = 6, dpi = 300)
cat("Plot saved to: fb_penetration_plot.png\n")

cat("\n✓ Analysis complete!\n")
