# Deployment Checklist for Replication Studies

## Pre-Deployment

### 1. File Preparation
- [ ] Download all files from Claude
- [ ] Place files in correct directory structure
- [ ] Verify all paths are correct

### 2. Configuration
- [ ] Update `_quarto.yml` with replication-studies link
- [ ] Verify sidebar configuration (if using)
- [ ] Check theme and CSS compatibility

### 3. API Setup
- [ ] Create Facebook Developer account
- [ ] Set up Marketing API access
- [ ] Get Access Token
- [ ] Get Ad Account ID
- [ ] Add credentials to `index.qmd` (DON'T commit them!)

### 4. R Environment
- [ ] Install all required packages
```r
install.packages(c(
  "rsocialwatcher", "WDI", "dplyr", "tidyr", 
  "ggplot2", "janitor", "ggpubr", "knitr", 
  "kableExtra", "quarto"
))
```
- [ ] Test package loading
- [ ] Check R version compatibility (>= 4.0)

## Testing

### 5. Local Testing
- [ ] Run quick_analysis.R script
- [ ] Verify data fetching works
- [ ] Check outputs are generated
- [ ] Render individual Quarto files
```bash
quarto render replication-studies/fb-marketing-api/index.qmd
```
- [ ] Preview full site
```bash
quarto preview
```
- [ ] Check all links work
- [ ] Verify images display correctly
- [ ] Test code folding/unfolding
- [ ] Check table of contents

### 6. Content Review
- [ ] Proofread all text
- [ ] Verify data accuracy
- [ ] Check citations and references
- [ ] Review code comments
- [ ] Ensure reproducibility

## Security

### 7. Security Check
- [ ] Remove API credentials from committed files
- [ ] Verify `.gitignore` is working
```bash
git status  # Should NOT show sensitive files
```
- [ ] Check for hardcoded paths
- [ ] Remove any personal information
- [ ] Verify data files are not in repo

## Version Control

### 8. Git Operations
```bash
# Stage files
git add replication-studies/

# Check what's being committed
git status
git diff --cached

# Commit
git commit -m "Add replication studies section with FB API analysis"

# Push to GitHub
git push origin main
```

### 9. Post-Deployment Verification
- [ ] Visit your GitHub Pages URL
- [ ] Click through all new links
- [ ] Check mobile responsiveness
- [ ] Verify analytics tracking (if setup)
- [ ] Test external links
- [ ] Check page load times

## Documentation

### 10. Final Documentation
- [ ] Update main README if needed
- [ ] Document any custom configurations
- [ ] Note any dependencies or requirements
- [ ] Add license information
- [ ] Create changelog entry

## Publishing to RPubs (Optional)

### 11. RPubs Deployment
- [ ] Create RPubs account at https://rpubs.com/
- [ ] Render document locally
- [ ] Publish from RStudio or use rsconnect
```r
library(rsconnect)
rsconnect::rpubsUpload(
  "Facebook API Analysis",
  "replication-studies/fb-marketing-api/index.html"
)
```
- [ ] Share RPubs link on your website

## Maintenance

### 12. Ongoing Tasks
- [ ] Set calendar reminder for API token renewal (60 days)
- [ ] Schedule periodic data updates
- [ ] Monitor for broken links
- [ ] Update packages regularly
```r
update.packages(ask = FALSE)
```
- [ ] Keep Quarto updated
```bash
quarto update
```

## Common Issues

### Troubleshooting Checklist

**If site doesn't build:**
- [ ] Check YAML syntax
- [ ] Verify all file paths
- [ ] Look for missing dependencies
- [ ] Check GitHub Actions logs

**If API calls fail:**
- [ ] Verify token is valid
- [ ] Check API version
- [ ] Test with simple query first
- [ ] Review Facebook API status page

**If plots don't render:**
- [ ] Check ggplot2 syntax
- [ ] Verify data exists
- [ ] Look for NA values
- [ ] Check figure paths

## Success Criteria

Your deployment is successful when:
- [✓] Website builds without errors
- [✓] All pages are accessible
- [✓] Navigation works smoothly
- [✓] Code examples are reproducible
- [✓] No sensitive data is exposed
- [✓] Mobile version looks good
- [✓] Load times are reasonable

## Next Steps After Deployment

1. **Share your work:**
   - [ ] Tweet/post about it
   - [ ] Share on LinkedIn
   - [ ] Add to your CV

2. **Get feedback:**
   - [ ] Ask colleagues to review
   - [ ] Post in R communities
   - [ ] Join discussions

3. **Plan next project:**
   - [ ] Identify new datasets
   - [ ] Outline research questions
   - [ ] Start election analysis template

---

**Date Started**: ___________
**Date Completed**: ___________
**URL**: https://khanalmohan.github.io/replication-studies/

**Notes**:
