# Deployment Guide

## Overview

This document provides comprehensive instructions for deploying the Best VPN Compare Online website to production.

## Prerequisites

- Git installed locally
- Access to the GitHub repository
- Domain configured (bestvpncompareonline.com)
- GitHub Pages enabled in repository settings

## Deployment Architecture

```
Local Development → GitHub Repository → GitHub Actions CI/CD → GitHub Pages → Production
```

## Deployment Process

### 1. Pre-Deployment (Local)

#### Run Validation Script

```bash
./scripts/pre-deploy-check.sh
```

This script checks:
- Required files existence
- HTML structure validity
- Configuration files
- Common code issues
- CNAME configuration

#### Manual Testing

Test locally before deploying:

```bash
# Option 1: Python HTTP Server
python -m http.server 8000

# Option 2: Jekyll (GitHub Pages compatible)
bundle exec jekyll serve

# Option 3: Node.js serve
npx serve
```

Visit http://localhost:8000 and verify:
- [ ] All pages load correctly
- [ ] Navigation works
- [ ] Links are functional
- [ ] Images display properly
- [ ] Responsive design works on mobile
- [ ] No JavaScript errors in console

### 2. Commit and Push

```bash
# Stage changes
git add .

# Commit with descriptive message
git commit -m "feat: Add new feature or fix: Fix issue"

# Push to main branch (triggers deployment)
git push origin main
```

### 3. Automated CI/CD Pipeline

GitHub Actions automatically runs:

1. **Validation Job**
   - HTML validation with html-validate
   - Link checking with lychee
   - Duration: ~2-3 minutes

2. **Security Scan Job**
   - Checks for sensitive data
   - Scans for passwords/API keys
   - Duration: ~1 minute

3. **Deployment Ready Job**
   - Verifies required files
   - Checks CSS and JavaScript
   - Duration: ~1 minute

Monitor progress at: `https://github.com/josho12345/bestvpncompareonline/actions`

### 4. GitHub Pages Deployment

After CI/CD passes:
- GitHub Pages automatically builds and deploys
- Deployment typically takes 1-2 minutes
- Site updates at https://bestvpncompareonline.com

## Monitoring Deployment

### Check Deployment Status

1. **GitHub Actions**: https://github.com/josho12345/bestvpncompareonline/actions
   - Green checkmark = successful
   - Red X = failed (check logs)

2. **GitHub Pages Settings**: Repository → Settings → Pages
   - Shows deployment status
   - Displays custom domain configuration

3. **Live Site**: https://bestvpncompareonline.com
   - Verify changes are live
   - Test functionality
   - Check browser console for errors

### Deployment Verification Checklist

After deployment completes:

- [ ] Site loads at https://bestvpncompareonline.com
- [ ] SSL certificate is valid (HTTPS)
- [ ] All pages are accessible
- [ ] Navigation works correctly
- [ ] No 404 errors on internal links
- [ ] Images and CSS load properly
- [ ] JavaScript functions correctly
- [ ] Mobile responsive design works
- [ ] No console errors

## Rollback Procedure

If issues are discovered in production:

### Quick Rollback

```bash
# Find the last good commit
git log --oneline

# Revert to specific commit
git revert <commit-hash>

# Or revert the last commit
git revert HEAD

# Push the revert
git push origin main
```

### Emergency Rollback

For critical issues:

```bash
# Create a branch from last good commit
git checkout -b hotfix-rollback <last-good-commit>

# Force push to main (use with caution!)
git push origin hotfix-rollback:main --force
```

**Note**: Force push should be used only in emergencies as it rewrites history.

## Troubleshooting

### Deployment Fails

**Issue**: GitHub Actions workflow fails

**Solutions**:
1. Check workflow logs in Actions tab
2. Common issues:
   - Invalid HTML syntax
   - Broken links
   - Missing required files
3. Fix issues locally and re-push

### Site Not Updating

**Issue**: Changes not visible on live site

**Solutions**:
1. Wait 2-5 minutes for CDN cache
2. Hard refresh browser (Ctrl+Shift+R or Cmd+Shift+R)
3. Clear browser cache
4. Check GitHub Pages deployment status
5. Verify CNAME file is correct

### CSS/JS Not Loading

**Issue**: Styles or scripts not working

**Solutions**:
1. Check browser console for 404 errors
2. Verify file paths are relative (not absolute)
3. Check `_config.yml` exclude list
4. Clear browser cache
5. Test locally first

### 404 Errors

**Issue**: Pages showing 404 errors

**Solutions**:
1. Verify file names are correct
2. Check case sensitivity (GitHub Pages is case-sensitive)
3. Ensure files are committed to main branch
4. Check `.gitignore` isn't excluding files

## Environment Management

### Production Environment

- **URL**: https://bestvpncompareonline.com
- **Branch**: main
- **Deployment**: Automatic on push
- **DNS**: CNAME → bestvpncompareonline.com

### Development Environment

- **URL**: http://localhost:8000
- **Branch**: feature/* branches
- **Deployment**: Manual local testing

## Best Practices

### Before Every Deployment

1. Run pre-deployment validation
2. Test locally
3. Review changes in git diff
4. Use descriptive commit messages
5. Monitor deployment pipeline
6. Verify production site after deploy

### Commit Message Format

```
<type>: <description>

Types:
- feat: New feature
- fix: Bug fix
- docs: Documentation changes
- style: CSS/styling changes
- refactor: Code refactoring
- test: Adding tests
- chore: Maintenance tasks
```

Example:
```bash
git commit -m "feat: Add new article about VPN privacy"
git commit -m "fix: Correct navigation link on mobile"
git commit -m "docs: Update deployment guide"
```

### Security Considerations

- Never commit sensitive data (API keys, passwords)
- Review `.gitignore` regularly
- Use environment variables for secrets
- Keep dependencies updated
- Monitor for security vulnerabilities

## Performance Optimization

### Pre-Deployment Optimizations

1. **Minify CSS/JS** (optional)
   ```bash
   # If using build tools in future
   npm run build
   ```

2. **Optimize Images**
   - Use compressed images
   - Appropriate file formats (WebP, JPEG, PNG)
   - Lazy loading for below-fold images

3. **Enable Caching**
   - Leverage browser caching
   - GitHub Pages provides automatic caching

### Monitoring Performance

Tools to check after deployment:
- Google PageSpeed Insights
- GTmetrix
- WebPageTest
- Chrome DevTools Lighthouse

## Support and Contact

For deployment issues:
1. Check this deployment guide
2. Review GitHub Actions logs
3. Check GitHub Pages documentation
4. Contact repository maintainer

## Changelog

Keep track of deployments:

```markdown
## [Date] - Version
### Added
- New features

### Fixed
- Bug fixes

### Changed
- Updates to existing features
```

## Additional Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Jekyll Documentation](https://jekyllrb.com/docs/)
- Repository Issues: https://github.com/josho12345/bestvpncompareonline/issues
