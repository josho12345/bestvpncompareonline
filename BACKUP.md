# Repository Backup

Backup created: **2026-02-21**

## Branch Snapshots

| Branch | HEAD SHA | Description |
|--------|----------|-------------|
| `main` | `fa81f517bbef514d4d2258d061bdeded38bcebbc` | Production branch — navbar, styles.css, quiz stub |
| `copilot/quick-turnaround` | `160f9e6b1b2248f0b7eb52f12c318a2aa98e2984` | Interactive quiz PR (open, mergeable_state: dirty) |
| `copilot/resolve-pull-request-conflict` | `874ab964d1a5636b6d92028c2d19cfa33e74bbba` | Merged quiz + main structure (this branch) |
| `copilot/review-repository-and-continue` | `eadf5df63478ffbe04c15bd83dff0d40e09423e9` | Deployment infrastructure, SEO, status page |

## File Backup

A complete snapshot of all source files from `main` is stored under `backup/2026-02-21/`.

```
backup/2026-02-21/
├── index.html
├── styles.css
├── config.json
├── status.html
├── js/
│   └── quiz.js
├── android/
│   └── index.html
├── ios/
│   └── index.html
├── mac/
│   └── index.html
└── articles/
    └── use-case/
        ├── best-vpn-streaming.html
        └── styles.css
```

## Restore Instructions

To restore any file from this backup, copy it from `backup/2026-02-21/<path>` back to the repository root:

```bash
cp backup/2026-02-21/index.html index.html
cp backup/2026-02-21/styles.css styles.css
cp backup/2026-02-21/js/quiz.js js/quiz.js
# etc.
```

To restore to the exact `main` commit, checkout the SHA directly:

```bash
git checkout fa81f517bbef514d4d2258d061bdeded38bcebbc
```
