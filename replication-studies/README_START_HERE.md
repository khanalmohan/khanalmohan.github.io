# Replication Studies - Complete Package

## 📦 What You've Got

A complete, professional "Replication Studies" section for your GitHub Pages website at `khanalmohan.github.io`, featuring:

1. **Facebook Marketing API Analysis** - A comprehensive study of social media penetration and development
2. **Structured folder system** - Ready for future projects (election analysis, etc.)
3. **Professional documentation** - Setup guides, checklists, and best practices
4. **Reproducible workflow** - Quarto-based with code folding and interactive elements

## 🚀 Quick Start (5 Minutes)

### Step 1: Copy Files
```bash
cd ~/Documents/khanalmohan.github.io
```

Download the `replication-studies` folder from Claude and place it in your website root.

### Step 2: Update Navigation

Edit your `_quarto.yml` file and add to the navbar section:

```yaml
navbar:
  left:
    - text: "Replication Studies"
      href: replication-studies/index.qmd
```

### Step 3: Install R Packages

Open R or RStudio:
```r
install.packages(c(
  "rsocialwatcher", "WDI", "dplyr", "tidyr", 
  "ggplot2", "janitor", "ggpubr", "knitr", "kableExtra"
))
```

### Step 4: Add Facebook Credentials

Edit `replication-studies/fb-marketing-api/index.qmd` and update the credentials section (line ~60):

```r
TOKEN        <- "YOUR-FACEBOOK-TOKEN"
CREATION_ACT <- "YOUR-AD-ACCOUNT-ID"
VERSION      <- "v19.0"
```

### Step 5: Test Locally

```bash
# Preview the site
quarto preview

# Or render just this section
quarto render replication-studies/
```

### Step 6: Deploy

```bash
git add replication-studies/
git commit -m "Add replication studies section"
git push origin main
```

Done! Visit: `https://khanalmohan.github.io/replication-studies/`

## 📁 File Structure

```
replication-studies/
├── index.qmd                       # Landing page
├── README.md                       # Project documentation
├── SETUP_GUIDE.md                  # Detailed setup instructions
├── DEPLOYMENT_CHECKLIST.md         # Step-by-step deployment
├── .gitignore                      # Git ignore rules
├── _quarto.yml.sample             # Sample configuration
├── setup.sh                        # Automated setup script
│
├── fb-marketing-api/               # Facebook analysis project
│   ├── index.qmd                   # Main analysis (Quarto doc)
│   ├── references.bib              # Bibliography
│   ├── quick_analysis.R            # Quick test script
│   └── data/                       # Data folder (not tracked)
│
└── election-analysis/              # Future project template
    └── index.qmd                   # Placeholder page
```

## 🎯 What Each File Does

### Main Files

- **`index.qmd`**: Landing page with project overview
- **`README.md`**: Technical documentation for developers
- **`SETUP_GUIDE.md`**: Complete step-by-step guide (start here!)
- **`DEPLOYMENT_CHECKLIST.md`**: Checklist to ensure nothing is missed

### Facebook Analysis Files

- **`fb-marketing-api/index.qmd`**: Full analysis with:
  - Introduction and methodology
  - Data collection code
  - Visualizations (histograms, scatterplots, maps)
  - Statistical analysis
  - Discussion and conclusions
  
- **`quick_analysis.R`**: Standalone R script for quick testing without Quarto

- **`references.bib`**: Bibliography for citations

### Configuration

- **`.gitignore`**: Prevents committing API keys and data files
- **`_quarto.yml.sample`**: Example configuration to merge with your main config
- **`setup.sh`**: Bash script to automate folder creation

## 🎨 Key Features

### Professional Documentation
- Clean, modern Quarto theme
- Collapsible code sections
- Interactive table of contents
- Mobile-responsive design
- Citation support

### Reproducible Analysis
- All code visible and documented
- Clear section structure
- Step-by-step data processing
- Inline explanations

### Extensible Framework
- Easy to add new projects
- Template for election analysis included
- Consistent styling across projects
- Modular design

### Publication Ready
- Can publish to RPubs
- Can export to PDF
- HTML works standalone
- Academic citation format

## 🔧 Customization Options

### Change Region
In either `index.qmd` or `quick_analysis.R`:
```r
filter(region == "Sub-Saharan Africa")  # or any other region
```

### Change Year
```r
start = 2023,
end = 2023
```

### Add More Indicators
Find codes at https://data.worldbank.org/
```r
indicator = c(
  "SP.POP.TOTL",
  "NY.GDP.PCAP.CD",
  "NEW.INDICATOR.CODE"
)
```

### Modify Visualizations
All plots use ggplot2 - easy to customize:
```r
p_1a <- fb_clean_df %>%
  ggplot(aes(x = per_fb_pop)) +
  geom_histogram(fill = "your_color") +
  # Add your customizations
  theme_minimal()
```

## 📊 Analysis Outputs

The Facebook analysis generates:

1. **Summary Statistics Table**: Overview of all countries
2. **Distribution Plot**: Histogram of FB penetration
3. **Connectivity Plot**: FB vs Internet usage scatter
4. **GDP Plot**: Economic development relationship
5. **Gender Analysis**: Female representation comparison
6. **Correlation Matrix**: Statistical relationships
7. **Regression Results**: Formal statistical models

All outputs are publication-quality with proper labels, legends, and formatting.

## 🌐 Integration with Your Site

This section integrates seamlessly with your existing:
- Microeconomics notes
- R Tutorial
- Econometrics work

It maintains the same:
- Visual theme
- Navigation structure
- Code style
- Documentation standard

## 🔐 Security Notes

**IMPORTANT**: Never commit your Facebook API credentials!

The `.gitignore` file is configured to exclude:
- API tokens and keys
- Raw data files
- Cached outputs
- Personal credentials

Before committing, always check:
```bash
git status  # Should not show sensitive files
```

## 📚 Resources Included

### Documentation
- Complete setup guide (SETUP_GUIDE.md)
- Deployment checklist (DEPLOYMENT_CHECKLIST.md)
- README with technical details
- Inline code comments

### Code Examples
- Working Quarto document
- Standalone R script
- BibTeX references
- Sample configuration

### Templates
- Election analysis placeholder
- Structure for future projects
- Reusable theme settings

## 🚀 Next Steps

### Immediate (Today)
1. Copy files to your website
2. Update _quarto.yml
3. Test locally with `quarto preview`
4. Deploy to GitHub

### Short-term (This Week)
1. Get Facebook API credentials
2. Run the analysis with real data
3. Customize for your region of interest
4. Add your own insights

### Medium-term (This Month)
1. Start election analysis project
2. Add more visualizations
3. Publish to RPubs
4. Share on social media

### Long-term (Ongoing)
1. Add more replication studies
2. Create tutorial content
3. Build portfolio of analyses
4. Collaborate with others

## 🤝 Sharing Your Work

### Academic
- Include in CV
- Add to research portfolio
- Submit to conferences
- Cite in papers

### Professional
- LinkedIn showcase
- GitHub profile
- Personal website highlight
- Job applications

### Community
- R-bloggers
- Twitter/X thread
- Medium article
- YouTube walkthrough

## ❓ Getting Help

If you run into issues:

1. **Check the guides**:
   - SETUP_GUIDE.md (most comprehensive)
   - DEPLOYMENT_CHECKLIST.md (step-by-step)
   - README.md (technical reference)

2. **Common issues**:
   - API errors → Check credentials and token validity
   - Rendering errors → Check YAML syntax and packages
   - Git issues → Review .gitignore settings

3. **Online resources**:
   - Quarto docs: https://quarto.org/
   - rsocialwatcher: https://github.com/worldbank/rsocialwatcher
   - Stack Overflow for specific errors

## ✅ Success Checklist

You'll know it's working when:
- [ ] Website builds without errors
- [ ] "Replication Studies" appears in navbar
- [ ] Landing page displays correctly
- [ ] FB analysis page loads (even without data)
- [ ] Code folding works
- [ ] Table of contents navigates properly
- [ ] All links are functional
- [ ] Mobile version looks good

## 🎉 What Makes This Special

1. **Professional Quality**: Matches academic/industry standards
2. **Fully Documented**: Every step explained
3. **Reproducible**: Others can verify your work
4. **Extensible**: Easy to add more projects
5. **Modern Tools**: Quarto, tidyverse, latest best practices
6. **Portfolio Ready**: Impressive for employers/collaborators

## 📝 Final Notes

- Your original FB API work has been completely revamped
- All child nutrition code removed (clean slate)
- Ready for South Asia region (but easily changed)
- Can accommodate multiple future projects
- Professional presentation for technical audience

## 🎓 Learning Opportunity

This project demonstrates:
- API integration
- Data wrangling
- Statistical visualization
- Reproducible research
- Web publishing
- Documentation skills
- Version control

Perfect for showcasing to:
- Potential employers
- Academic advisors
- Collaborators
- The R community

---

**Ready to go live?** Follow the Quick Start above and you'll be up and running in minutes!

**Questions?** Review the SETUP_GUIDE.md for detailed explanations.

**Good luck!** 🚀

---

**Created for**: Mohan Khanal  
**Created by**: Claude  
**Date**: January 31, 2026  
**Version**: 1.0
