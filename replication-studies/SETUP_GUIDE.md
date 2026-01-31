# Replication Studies Setup Guide

## Quick Start

### 1. Copy Files to Your Website

```bash
# Navigate to your website directory
cd ~/Documents/khanalmohan.github.io

# Create the replication-studies folder
mkdir -p replication-studies/fb-marketing-api/data

# Copy all files from Claude to this location
# (Download from Claude and copy manually)
```

### 2. Update Your _quarto.yml

Add this to your navbar section:

```yaml
navbar:
  left:
    - text: "Replication Studies"
      href: replication-studies/index.qmd
```

### 3. Install Required R Packages

```r
install.packages(c(
  "rsocialwatcher",
  "WDI",
  "dplyr",
  "tidyr",
  "ggplot2",
  "janitor",
  "ggpubr",
  "knitr",
  "kableExtra",
  "quarto"
))
```

### 4. Set Up Facebook API Access

1. Go to https://developers.facebook.com/
2. Create a new app
3. Navigate to Marketing API → Tools
4. Get your:
   - Access Token
   - Ad Account ID
   - API Version

5. Add credentials to `fb-marketing-api/index.qmd`:
```r
TOKEN        <- "YOUR-ACCESS-TOKEN"
CREATION_ACT <- "YOUR-AD-ACCOUNT-ID"
VERSION      <- "v19.0"
```

### 5. Test Locally

```bash
# Render the replication studies section
quarto render replication-studies/

# Preview the site
quarto preview
```

### 6. Deploy

```bash
git add replication-studies/
git commit -m "Add replication studies section with FB API analysis"
git push origin main
```

---

## Detailed Workflow

### Running the Facebook Analysis

#### Option 1: Quick Test Script

```bash
cd replication-studies/fb-marketing-api
Rscript quick_analysis.R
```

This will:
- Fetch data from Facebook API and World Bank
- Process and merge datasets
- Generate summary statistics
- Create a quick visualization
- Save processed data as `.rds` file

#### Option 2: Full Quarto Document

```bash
quarto render index.qmd
```

This creates a comprehensive HTML report with:
- Introduction and methodology
- Data collection details
- Multiple visualizations
- Statistical analysis
- Discussion and conclusions

### Customizing the Analysis

#### Change Region

In the Quarto document or R script, modify:

```r
wdi_df <- wdi_df %>%
  filter(region == "South Asia")  # Change this
```

Available regions:
- "South Asia"
- "Sub-Saharan Africa"
- "Latin America & Caribbean"
- "East Asia & Pacific"
- "Europe & Central Asia"
- "Middle East & North Africa"
- "North America"

#### Change Time Period

```r
wdi_df <- WDI(
  start = 2020,  # Change these
  end = 2023
)
```

#### Add More Indicators

Find indicators at: https://data.worldbank.org/

```r
indicator = c(
  "SP.POP.TOTL",
  "NY.GDP.PCAP.CD",
  "SE.XPD.TOTL.GD.ZS",  # Education expenditure
  "SH.XPD.CHEX.GD.ZS"   # Health expenditure
)
```

### Publishing to RPubs

#### Method 1: From RStudio

1. Open `index.qmd` in RStudio
2. Click "Render"
3. In the preview window, click "Publish"
4. Choose RPubs
5. Sign in and publish

#### Method 2: From Command Line

```r
# In R console
library(quarto)
quarto_render("index.qmd")

# Then use RPubs API or upload manually
```

---

## File Structure Explained

```
replication-studies/
│
├── index.qmd                    # Main landing page
├── README.md                    # Documentation
├── .gitignore                   # Files to ignore in git
├── _quarto.yml.sample          # Sample configuration
│
└── fb-marketing-api/            # Project folder
    ├── index.qmd                # Main analysis document
    ├── references.bib           # Bibliography
    ├── quick_analysis.R         # Quick test script
    │
    ├── data/                    # Data storage (not in git)
    │   ├── raw/
    │   ├── processed/
    │   └── .gitkeep
    │
    └── figures/                 # Generated plots
        └── .gitkeep
```

---

## Adding New Projects

### 1. Create Project Folder

```bash
cd replication-studies
mkdir my-new-project
cd my-new-project
```

### 2. Create index.qmd

```yaml
---
title: "My New Analysis"
author: "Mohan Khanal"
format:
  html:
    toc: true
    code-fold: true
---

# Introduction

Your analysis here...
```

### 3. Update Main Index

Edit `replication-studies/index.qmd`:

```markdown
## 3. My New Project

Brief description...

[**→ View Analysis**](my-new-project/index.html)
```

### 4. Render and Test

```bash
quarto render my-new-project/index.qmd
quarto preview replication-studies/
```

---

## Troubleshooting

### Facebook API Issues

**Error: Invalid token**
- Token may have expired (they typically last 60 days)
- Generate a new token from Facebook Developer Console

**Error: Rate limit exceeded**
- Facebook limits API calls
- Add delays: `Sys.sleep(1)` between requests
- Cache results locally

**Error: Permission denied**
- Ensure your app has Marketing API access
- Check your ad account permissions

### Quarto Rendering Issues

**Error: Package not found**
```r
install.packages("missing_package")
```

**Error: Cannot find file**
- Check working directory
- Use absolute paths or `here::here()`

**HTML not updating**
- Clear cache: `quarto render --no-cache`
- Delete `_site/` and re-render

### Git Issues

**Large files rejected**
- Check `.gitignore` includes data files
- Use Git LFS for large files
- Remove from history: `git rm --cached large_file.csv`

---

## Best Practices

### 1. Code Organization

```r
# Clear section headers
# ==================== #
# 1. SETUP
# ==================== #

# Document your code
# This function calculates...

# Use consistent style
library(tidyverse)  # Not library('tidyverse')
```

### 2. Data Management

```r
# Never commit raw data
# Use .gitignore

# Document data sources
# Data from: https://...
# Downloaded: 2024-01-31
# License: CC BY 4.0

# Version your processed data
saveRDS(data, "data/processed/data_v2024-01-31.rds")
```

### 3. Reproducibility

```r
# Set seed for random processes
set.seed(42)

# Document session info
sessionInfo()

# Use renv for package management
renv::init()
renv::snapshot()
```

### 4. Documentation

```markdown
# Clear structure
## Introduction
## Methods
## Results
## Discussion
## References

# Explain choices
We use logarithmic scale because...

# Note limitations
This analysis assumes...
```

---

## Resources

### Learning Materials

- [Quarto Guide](https://quarto.org/docs/guide/)
- [R for Data Science](https://r4ds.hadley.nz/)
- [Facebook Marketing API Docs](https://developers.facebook.com/docs/marketing-apis/)
- [World Bank Data Help](https://datahelpdesk.worldbank.org/)

### Package Documentation

- [`rsocialwatcher`](https://worldbank.github.io/rsocialwatcher/)
- [`WDI`](https://vincentarelbundock.github.io/WDI/)
- [`tidyverse`](https://www.tidyverse.org/)

### Example Projects

- [World Bank GitHub](https://github.com/worldbank)
- [Our World in Data](https://github.com/owid)
- [RStudio Gallery](https://www.rstudio.com/gallery/)

---

## Support

### Getting Help

1. **Check documentation** first
2. **Search GitHub issues** in relevant packages
3. **Stack Overflow** for coding questions
4. **RStudio Community** for R-specific help

### Contributing

Found a bug? Have a suggestion?

1. Open an issue on GitHub
2. Submit a pull request
3. Email: your.email@example.com

---

## License

- **Content**: [Creative Commons BY 4.0](https://creativecommons.org/licenses/by/4.0/)
- **Code**: [MIT License](https://opensource.org/licenses/MIT)

You're free to use, modify, and share this work with attribution.

---

**Created**: January 2026  
**Last Updated**: `r Sys.Date()`  
**Maintained by**: Mohan Khanal
