# Best VPN Compare Online

A clean, modern static website for comparing VPN services and helping users find the perfect VPN solution for their needs.

## 🌟 Features

- **Interactive Landing Page**: Choose between home or workplace VPN solutions
- **Quiz System**: Multi-layer quiz to determine the best VPN recommendations
- **Article System**: Educational content about VPN use cases
- **Platform-Specific Pages**: Dedicated pages for Android, iOS, and Mac users
- **Responsive Design**: Mobile-friendly interface that works on all devices

## 📁 Project Structure

```
bestvpncompareonline/
├── index.html              # Main landing page
├── styles.css              # Global styles for landing page
├── config.json             # Quiz configuration
├── CNAME                   # GitHub Pages domain configuration
├── js/
│   └── quiz.js            # Quiz logic for home and workplace paths
├── articles/
│   └── use-case/
│       ├── best-vpn-streaming.html    # Streaming VPN guide
│       └── styles.css                  # Article page styles
├── android/
│   └── index.html         # Android VPN redirect page
├── ios/
│   └── index.html         # iOS VPN redirect page
└── mac/
    └── index.html         # Mac VPN redirect page
```

## 🚀 Deployment

This site is deployed using GitHub Pages and is accessible at `bestvpncompareonline.com`.

### Production Deployment Workflow

The site uses automated CI/CD via GitHub Actions:

1. **Pre-Deployment Validation** (Local)
   ```bash
   # Run pre-deployment checks
   ./scripts/pre-deploy-check.sh
   ```

2. **Commit and Push**
   ```bash
   git add .
   git commit -m "Your deployment message"
   git push origin main
   ```

3. **Automated CI/CD Pipeline**
   - HTML/CSS validation
   - Security scanning
   - Link checking
   - Deployment readiness verification

4. **GitHub Pages Auto-Deploy**
   - Deploys from main branch automatically
   - Available at https://bestvpncompareonline.com
   - DNS configured via CNAME file

### Local Development

Since this is a static website, you can simply:

1. Clone the repository
2. Open `index.html` in your web browser
3. Or use a local server:
   ```bash
   # Using Python
   python -m http.server 8000
   
   # Using Jekyll (recommended for GitHub Pages simulation)
   bundle exec jekyll serve
   
   # Using Node.js
   npx serve
   ```

### Deployment Checklist

Before deploying to production:

- [ ] Run `./scripts/pre-deploy-check.sh` validation script
- [ ] Test all pages locally
- [ ] Verify all links work
- [ ] Check mobile responsiveness
- [ ] Review console for JavaScript errors
- [ ] Verify CNAME configuration
- [ ] Check that no sensitive data is committed
- [ ] Ensure copyright year is current
- [ ] Review GitHub Actions workflow results

### Rollback Procedure

If an issue is discovered after deployment:

1. Identify the last known good commit: `git log --oneline`
2. Revert to that commit: `git revert <commit-hash>`
3. Push the revert: `git push origin main`
4. Monitor GitHub Actions for successful deployment

### Monitoring

After deployment, verify:

- Site is accessible at https://bestvpncompareonline.com
- All pages load correctly
- Navigation works across all pages
- No console errors in browser
- Check GitHub Pages deployment status in repository settings

## 🎨 Customization

### Adding New Articles

1. Create a new HTML file in `articles/use-case/`
2. Copy the structure from `best-vpn-streaming.html`
3. Update the content as needed
4. The `styles.css` file provides consistent styling

### Modifying Quiz Questions

Edit `config.json` to update quiz questions and configuration:

```json
{
  "quizQuestions": [
    {
      "question": "Your question here",
      "answers": ["Option 1", "Option 2", "Option 3"]
    }
  ],
  "configurations": {
    "homeUserType": "home",
    "workplaceUserType": "workplace"
  }
}
```

### Updating Quiz Logic

The quiz logic is in `js/quiz.js`. It contains two-layer questions for both home and workplace scenarios.

## 📝 Content Guidelines

- Keep content informative and unbiased
- Update copyright year in footers annually
- Ensure all links are working and up-to-date
- Test on multiple devices before deploying

## 🔒 Security

- No sensitive data is stored on the site
- All external links open in secure contexts
- Regular updates to ensure best practices

## 📄 License

© 2024 BestVPNCompareOnline. All rights reserved.

## 🤝 Contributing

This is a private repository. For any suggestions or improvements, please contact the repository owner.
