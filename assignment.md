---
slug: fix-the-demo-environment
id: fix-the-demo-environment
type: challenge
title: Fix the Demo Environment
teaser: Your prospect call starts in 10 minutes. Get the demo environment running.
notes:
- type: text
  contents: |-
    ## Welcome

    This track puts you in the seat of a SailPoint SE.

    You have three challenges ahead. The first one starts right now — and something is already broken.
tabs:
- title: Shell
  type: terminal
  hostname: container
difficulty: basic
timelimit: 900
---

# Fix the Demo Environment

Your prospect call starts in 10 minutes.

Your job is to get the SailPoint demo environment running. A colleague set it up yesterday but something's broken. The startup script is at `~/demo-start.sh`.

## Your task

Run the script and fix whatever is broken:

```
./demo-start.sh
```

Read the error output carefully. There are **three things wrong**. Fix all of them and run the script again until it exits cleanly.

## Hints

- Check your environment variables
- Check whether all required tools are installed
- Check `config.yaml` for any obvious problems

When the script exits cleanly, this challenge will auto-complete.
