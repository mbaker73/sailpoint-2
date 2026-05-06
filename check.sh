#!/bin/bash

RESPONSES="/tmp/form-responses.json"

if [ ! -f "$RESPONSES" ]; then
  echo "Form not submitted yet. Answer all three questions and click Complete track."
  exit 1
fi

if ! jq '.' "$RESPONSES" > /dev/null 2>&1; then
  echo "Form response file is malformed."
  exit 1
fi

Q1=$(jq -r '.q1 // ""' "$RESPONSES")
Q2=$(jq -r '.q2 // ""' "$RESPONSES")
Q3=$(jq -r '.q3 // ""' "$RESPONSES")

if [ -z "$Q1" ] || [ -z "$Q2" ] || [ -z "$Q3" ]; then
  echo "Incomplete responses. Make sure all three questions are answered."
  exit 1
fi

echo "All responses received. Track complete."
exit 0
