# Contributing to Best VPN Compare Online

Thank you for your interest in contributing to Best VPN Compare Online! This document provides guidelines and instructions for contributing to the project.

## Getting Started

### Prerequisites

- Git
- Text editor or IDE
- Web browser for testing
- Basic knowledge of HTML, CSS, and JavaScript

### Setup Development Environment

1. **Clone the repository**
   ```bash
   git clone https://github.com/josho12345/bestvpncompareonline.git
   cd bestvpncompareonline
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Start local development server**
   ```bash
   # Option 1: Python
   python -m http.server 8000
   
   # Option 2: Node.js
   npx serve
   ```

4. **Open in browser**
   ```
   http://localhost:8000
   ```

## Development Workflow

### 1. Making Changes

- Keep changes focused and minimal
- Test all changes locally before committing
- Ensure responsive design works on mobile
- Follow existing code style and conventions

### 2. Before Committing

Run the pre-deployment validation:

```bash
./scripts/pre-deploy-check.sh
```

This checks:
- HTML validity
- Required files
- Common issues
- Configuration files

### 3. Commit Guidelines

Use clear, descriptive commit messages:

```
<type>: <short description>

<optional detailed description>

Types:
- feat: New feature
- fix: Bug fix
- docs: Documentation
- style: Formatting, styling
- refactor: Code restructuring
- test: Adding tests
- chore: Maintenance
```

Examples:
```bash
git commit -m "feat: Add comparison table for VPN providers"
git commit -m "fix: Correct mobile navigation menu alignment"
git commit -m "docs: Update README with new features"
```

### 4. Push and Create Pull Request

```bash
# Push to your feature branch
git push origin feature/your-feature-name

# Create pull request on GitHub
# The CI/CD pipeline will automatically run
```

## Code Style Guidelines

### HTML

- Use semantic HTML5 elements
- Include proper DOCTYPE
- Add descriptive `alt` text for images
- Use consistent indentation (2 spaces)
- Close all tags properly

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Title</title>
</head>
<body>
    <!-- Content here -->
</body>
</html>
```

### CSS

- Use consistent naming conventions
- Group related properties
- Use comments for complex styles
- Mobile-first responsive design
- Prefer classes over IDs for styling

```css
/* Component: Navigation Bar */
.navbar {
    display: flex;
    justify-content: space-between;
    padding: 1rem;
}

/* Responsive design */
@media (max-width: 768px) {
    .navbar {
        flex-direction: column;
    }
}
```

### JavaScript

- Use modern ES6+ syntax
- Add comments for complex logic
- Avoid console.log in production code
- Use meaningful variable names
- Handle errors gracefully

```javascript
// Good
function selectPath(path) {
    fetch('config.json')
        .then(response => response.json())
        .then(data => processData(data))
        .catch(error => console.error('Error:', error));
}

// Avoid in production
console.log('Debug message');
```

## Project Structure

```
bestvpncompareonline/
├── .github/
│   └── workflows/        # CI/CD pipelines
├── android/              # Android-specific pages
├── articles/
│   └── use-case/        # Article content
├── ios/                 # iOS-specific pages
├── js/                  # JavaScript files
├── mac/                 # Mac-specific pages
├── scripts/             # Deployment scripts
├── _config.yml          # Jekyll configuration
├── .gitignore          # Git ignore rules
├── CNAME               # Domain configuration
├── config.json         # Quiz configuration
├── DEPLOYMENT.md       # Deployment guide
├── index.html          # Homepage
├── README.md           # Project documentation
└── styles.css          # Global styles
```

## Adding New Content

### Adding a New Article

1. Create HTML file in `articles/use-case/`
2. Copy template from existing article
3. Update title, meta tags, and content
4. Use the shared `styles.css` for consistency
5. Add navigation menu
6. Test responsiveness

### Adding Platform Pages

1. Create directory for platform (if needed)
2. Add `index.html` with redirect or content
3. Update navigation links
4. Test on target platform if possible

### Modifying Quiz

1. Edit `config.json` for questions
2. Update `js/quiz.js` for logic changes
3. Test quiz flow thoroughly
4. Ensure error handling works

## Testing

### Manual Testing Checklist

Before submitting changes:

- [ ] Test on Chrome, Firefox, Safari
- [ ] Test on mobile devices (or use DevTools)
- [ ] Verify all links work
- [ ] Check for console errors
- [ ] Test navigation menu
- [ ] Verify responsive design
- [ ] Check page load performance
- [ ] Test quiz functionality (if changed)

### Automated Testing

CI/CD pipeline automatically runs:
- HTML validation
- CSS validation
- Link checking
- Security scanning

Monitor results in GitHub Actions.

## Pull Request Process

1. **Create PR** with clear description
2. **Wait for CI/CD** checks to pass
3. **Address feedback** from reviewers
4. **Update documentation** if needed
5. **Squash commits** if requested
6. **Wait for approval** and merge

### PR Description Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Style/UI change

## Testing
- [ ] Tested locally
- [ ] Tested on mobile
- [ ] Verified links work
- [ ] No console errors

## Screenshots
(if UI changes)

## Checklist
- [ ] Code follows style guidelines
- [ ] Pre-deployment checks pass
- [ ] Documentation updated
- [ ] No breaking changes
```

## Common Tasks

### Update Copyright Year

```bash
# Find files with copyright
grep -r "© 202" . --include="*.html"

# Update as needed
```

### Add New VPN Provider

1. Update article content
2. Maintain unbiased tone
3. Include features and pricing
4. Add affiliate links (if applicable)

### Fix Broken Links

1. Use link checker in CI/CD
2. Update or remove broken links
3. Test replacement links
4. Commit and push

## Getting Help

- **Documentation**: Check README.md and DEPLOYMENT.md
- **Issues**: Search existing GitHub issues
- **Questions**: Open a new issue with "question" label
- **Urgent**: Contact repository maintainer

## Code of Conduct

- Be respectful and professional
- Provide constructive feedback
- Help others learn and grow
- Keep discussions focused on the project

## Recognition

Contributors will be:
- Listed in the repository
- Acknowledged in release notes
- Credited for significant contributions

## License

By contributing, you agree that your contributions will be licensed under the same terms as the project.

## Thank You!

Your contributions help make Best VPN Compare Online better for everyone. We appreciate your time and effort!
