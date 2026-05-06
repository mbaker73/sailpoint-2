# Instruqt Track — Scaling Demo Operations with Instruqt

A 3-challenge hands-on demo track built for SailPoint's Demo Center of Excellence.
Designed to show Chris Hendricks and Mike Stuyt what Instruqt feels like as a learner
— and what it delivers as an operator.

## Track structure

| Challenge | Title | Duration | What it does |
|-----------|-------|----------|--------------|
| 1 | Fix the Demo Environment | ~12 min | Broken env — feels the SE pain |
| 2 | Query Identities with the SailPoint CLI | ~5 min | Clean sandbox — the Instruqt moment |
| 3 | See the Signal | ~1 min | Analytics dashboard + form |

## How to connect to Instruqt

1. Push this repo to GitHub (public or private)
2. In [Instruqt Creator](https://creator.instruqt.com), open your track settings
3. Go to **Repository** and connect your GitHub repo
4. Instruqt will sync the track structure automatically

## Before you connect

Edit `track.yml` and replace:
- `your-instruqt-org-slug` → your actual Instruqt org slug
- `your@email.com` → your email

## Webhook setup

1. Go to **Settings > Webhooks** in your Instruqt org
2. Add endpoint — use [webhook.site](https://webhook.site) for testing
3. Select events: `track.started`, `track.challenge_completed`, `track.completed`

## Invite URL

When creating the invite, set access to **Anyone with the link** and append:

```
?icp_se_name=YourName&icp_prospect_id=sailpoint-internal
```

These values will appear in all webhook payloads as `custom_parameters`.

## No live SailPoint tenant required

Challenge 2 runs against a mock ISC API (Flask server, ~30 lines of Python)
pre-seeded with 12 identities. Three have `accessCount > 5` — the learner
finds them and writes a remediation report.
