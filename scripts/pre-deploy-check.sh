#!/bin/bash
# Pre-deployment validation script
# Run this before deploying to production

set -e

echo "================================"
echo "Pre-Deployment Validation"
echo "================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Check if we're in the correct directory
if [ ! -f "index.html" ]; then
    print_error "index.html not found. Are you in the correct directory?"
    exit 1
fi

print_success "Found index.html"

# Check for required files
echo ""
echo "Checking required files..."

REQUIRED_FILES=("index.html" "CNAME" "README.md" "styles.css")
for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        print_success "Found $file"
    else
        print_error "Missing $file"
        exit 1
    fi
done

# Check for configuration files
echo ""
echo "Checking configuration files..."

if [ -f "_config.yml" ]; then
    print_success "Found _config.yml"
else
    print_warning "_config.yml not found (optional for GitHub Pages)"
fi

if [ -f ".gitignore" ]; then
    print_success "Found .gitignore"
else
    print_warning ".gitignore not found"
fi

# Validate HTML structure (basic check)
echo ""
echo "Validating HTML files..."

HTML_FILES=$(find . -name "*.html" -not -path "./node_modules/*" -not -path "./.git/*")
HTML_COUNT=$(echo "$HTML_FILES" | wc -l)

print_success "Found $HTML_COUNT HTML file(s)"

for file in $HTML_FILES; do
    # Check if file has <!DOCTYPE html>
    if grep -q "<!DOCTYPE html>" "$file"; then
        print_success "$file has DOCTYPE declaration"
    else
        print_warning "$file missing DOCTYPE declaration"
    fi
    
    # Check if file has closing </html> tag
    if grep -q "</html>" "$file"; then
        print_success "$file has closing html tag"
    else
        print_error "$file missing closing html tag"
    fi
done

# Check CSS files
echo ""
echo "Checking CSS files..."

CSS_FILES=$(find . -name "*.css" -not -path "./node_modules/*" -not -path "./.git/*")
CSS_COUNT=$(echo "$CSS_FILES" | wc -l)

if [ $CSS_COUNT -gt 0 ]; then
    print_success "Found $CSS_COUNT CSS file(s)"
else
    print_warning "No CSS files found"
fi

# Check JavaScript files
echo ""
echo "Checking JavaScript files..."

JS_FILES=$(find . -name "*.js" -not -path "./node_modules/*" -not -path "./.git/*")
JS_COUNT=$(echo "$JS_FILES" | wc -l)

if [ $JS_COUNT -gt 0 ]; then
    print_success "Found $JS_COUNT JavaScript file(s)"
else
    print_warning "No JavaScript files found"
fi

# Check CNAME configuration
echo ""
echo "Checking CNAME configuration..."

if [ -f "CNAME" ]; then
    DOMAIN=$(cat CNAME | tr -d '[:space:]')
    print_success "Domain configured: $DOMAIN"
else
    print_error "CNAME file not found"
    exit 1
fi

# Check for common issues
echo ""
echo "Checking for common issues..."

# Check for console.log statements (should be removed in production)
if grep -r "console.log" . --include="*.js" --exclude-dir=node_modules --exclude-dir=.git > /dev/null 2>&1; then
    print_warning "Found console.log statements in JavaScript files (consider removing for production)"
else
    print_success "No console.log statements found"
fi

# Check for TODO comments
TODO_COUNT=$(grep -r "TODO" . --include="*.html" --include="*.js" --include="*.css" --exclude-dir=node_modules --exclude-dir=.git 2>/dev/null | wc -l)
if [ $TODO_COUNT -gt 0 ]; then
    print_warning "Found $TODO_COUNT TODO comment(s)"
else
    print_success "No TODO comments found"
fi

# Final summary
echo ""
echo "================================"
echo "Validation Summary"
echo "================================"
print_success "Pre-deployment validation completed successfully!"
echo ""
echo "Next steps:"
echo "1. Review any warnings above"
echo "2. Commit your changes: git add . && git commit -m 'Your message'"
echo "3. Push to main branch: git push origin main"
echo "4. GitHub Pages will automatically deploy"
echo ""
