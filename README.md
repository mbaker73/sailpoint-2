# Instruqt Track — Scaling Demo Operations with Instruqt

3-challenge hands-on demo track for SailPoint's Demo Center of Excellence.

## Structure

```
.
├── track.yml                          # Track metadata
├── config.yml                         # Sandbox config (Ubuntu container)
├── 01-fix-the-demo-environment/
│   ├── assignment.md                  # Challenge config + instructions
│   ├── setup-container                # Runs on challenge load
│   └── check-container                # Polled every 10s to pass challenge
├── 02-query-identities-cli/
│   ├── assignment.md
│   ├── setup-container
│   └── check-container
└── 03-see-the-signal/
    ├── assignment.md
    ├── setup-container                # Starts analytics dashboard on :8080
    └── check-container
```

## Before pushing

Edit `track.yml` and replace:
- `your-instruqt-org-slug` → your actual Instruqt org slug
- `your@email.com` → your email

## Push to Instruqt via CLI

```bash
# Install CLI from instruqt.com/downloads, then:
instruqt auth login
instruqt track push
```

## Webhook setup

Settings → Webhooks → add endpoint (use webhook.site for testing)
Select: `track.started`, `track.challenge_completed`, `track.completed`

## Invite URL

Create invite with **Anyone with the link**, then append:
```
?icp_se_name=YourName&icp_prospect_id=sailpoint-internal
```
