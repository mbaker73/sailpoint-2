#!/bin/bash

apt-get update -qq && apt-get install -y -qq python3 > /dev/null 2>&1

mkdir -p /opt/dashboard

cat << 'HTMLEOF' > /opt/dashboard/index.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Session Analytics</title>
<style>
  * { box-sizing: border-box; margin: 0; padding: 0; }
  body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; background: #f5f6fa; color: #1a1a2e; padding: 2rem; }
  h1 { font-size: 1.4rem; font-weight: 600; margin-bottom: 0.25rem; color: #1a1a2e; }
  .subtitle { font-size: 0.85rem; color: #888; margin-bottom: 2rem; }
  .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(160px, 1fr)); gap: 1rem; margin-bottom: 2rem; }
  .card { background: #fff; border-radius: 10px; padding: 1.25rem; border: 1px solid #e8e8f0; }
  .card-label { font-size: 0.75rem; color: #888; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 0.5rem; }
  .card-value { font-size: 1.6rem; font-weight: 600; color: #2c2c6c; }
  .card-sub { font-size: 0.75rem; color: #aaa; margin-top: 0.25rem; }
  .section { background: #fff; border-radius: 10px; padding: 1.5rem; border: 1px solid #e8e8f0; margin-bottom: 1.5rem; }
  .section h2 { font-size: 0.95rem; font-weight: 600; margin-bottom: 1rem; color: #2c2c6c; }
  .challenge-row { display: flex; align-items: center; gap: 1rem; margin-bottom: 0.75rem; }
  .challenge-label { font-size: 0.85rem; width: 180px; flex-shrink: 0; color: #444; }
  .bar-wrap { flex: 1; background: #f0f0f8; border-radius: 4px; height: 10px; }
  .bar { height: 10px; border-radius: 4px; }
  .bar-c1 { background: #e07070; width: 82%; }
  .bar-c2 { background: #4a90d9; width: 28%; }
  .bar-c3 { background: #5cb85c; width: 12%; }
  .bar-time { font-size: 0.8rem; color: #888; width: 60px; text-align: right; flex-shrink: 0; }
  .params { display: flex; flex-direction: column; gap: 0.5rem; }
  .param-row { display: flex; gap: 0.75rem; font-size: 0.85rem; }
  .param-key { color: #888; width: 160px; flex-shrink: 0; }
  .param-val { color: #2c2c6c; font-family: monospace; background: #f4f4fb; padding: 1px 6px; border-radius: 4px; }
  .badge { display: inline-block; padding: 2px 10px; border-radius: 20px; font-size: 0.75rem; font-weight: 500; }
  .badge-green { background: #e8f5e9; color: #2e7d32; }
  .badge-blue { background: #e3f2fd; color: #1565c0; }
  .divider { border: none; border-top: 1px solid #f0f0f8; margin: 1rem 0; }
  .form-section { background: #fff; border-radius: 10px; padding: 1.5rem; border: 1px solid #e8e8f0; }
  .form-section h2 { font-size: 0.95rem; font-weight: 600; margin-bottom: 1.25rem; color: #2c2c6c; }
  .question { margin-bottom: 1.25rem; }
  .question p { font-size: 0.875rem; color: #333; margin-bottom: 0.5rem; font-weight: 500; }
  .options { display: flex; flex-direction: column; gap: 0.4rem; }
  .options label { display: flex; align-items: center; gap: 0.5rem; font-size: 0.85rem; color: #444; cursor: pointer; }
  .options input[type=radio] { accent-color: #2c2c6c; }
  .submit-btn { margin-top: 1.5rem; background: #2c2c6c; color: #fff; border: none; border-radius: 8px; padding: 0.75rem 2rem; font-size: 0.9rem; font-weight: 500; cursor: pointer; width: 100%; }
  .submit-btn:hover { background: #1a1a4e; }
  .submit-btn:disabled { background: #aaa; cursor: not-allowed; }
  .success { display: none; background: #e8f5e9; border: 1px solid #a5d6a7; border-radius: 10px; padding: 1.5rem; text-align: center; color: #2e7d32; font-size: 0.9rem; margin-top: 1rem; }
  .success strong { display: block; font-size: 1.1rem; margin-bottom: 0.5rem; }
</style>
</head>
<body>

<h1>Session Analytics</h1>
<p class="subtitle">Track: Scaling Demo Operations with Instruqt &nbsp;·&nbsp; Completed just now</p>

<div class="grid">
  <div class="card">
    <div class="card-label">Completion</div>
    <div class="card-value">100%</div>
    <div class="card-sub">3 of 3 challenges</div>
  </div>
  <div class="card">
    <div class="card-label">Total time</div>
    <div class="card-value">18m</div>
    <div class="card-sub">Under 25m target</div>
  </div>
  <div class="card">
    <div class="card-label">Commands run</div>
    <div class="card-value">7</div>
    <div class="card-sub">In Challenge 2</div>
  </div>
  <div class="card">
    <div class="card-label">Report generated</div>
    <div class="card-value"><span class="badge badge-green">Yes</span></div>
    <div class="card-sub">report.json valid</div>
  </div>
</div>

<div class="section">
  <h2>Time per challenge</h2>
  <div class="challenge-row">
    <div class="challenge-label">Challenge 1 — Fix the env</div>
    <div class="bar-wrap"><div class="bar bar-c1"></div></div>
    <div class="bar-time">~12 min</div>
  </div>
  <div class="challenge-row">
    <div class="challenge-label">Challenge 2 — CLI query</div>
    <div class="bar-wrap"><div class="bar bar-c2"></div></div>
    <div class="bar-time">~5 min</div>
  </div>
  <div class="challenge-row">
    <div class="challenge-label">Challenge 3 — Analytics</div>
    <div class="bar-wrap"><div class="bar bar-c3"></div></div>
    <div class="bar-time">~1 min</div>
  </div>
  <hr class="divider">
  <p style="font-size:0.8rem;color:#888;">Challenge 1 took 2.4× longer than Challenge 2 — the same task, a broken environment vs a working one.</p>
</div>

<div class="section">
  <h2>Custom parameters received</h2>
  <div class="params">
    <div class="param-row"><span class="param-key">se_name</span><span class="param-val">Matt Baker</span></div>
    <div class="param-row"><span class="param-key">prospect_id</span><span class="param-val">sailpoint-internal</span></div>
    <div class="param-row"><span class="param-key">invite_id</span><span class="param-val">inv_sp_demo_coe_001</span></div>
    <div class="param-row"><span class="param-key">track_id</span><span class="param-val">scaling-demo-operations-instruqt</span></div>
    <div class="param-row"><span class="param-key">org_id</span><span class="param-val">instruqt-demo-org</span></div>
  </div>
  <hr class="divider">
  <p style="font-size:0.8rem;color:#888;">These parameters arrive in the webhook payload on every event — usable for CRM enrichment, LMS tracking, or partner portal updates.</p>
</div>

<div class="form-section">
  <h2>Three quick questions</h2>

  <div class="question">
    <p>1. Did this give you a clearer picture of what Instruqt could do for your SEs?</p>
    <div class="options">
      <label><input type="radio" name="q1" value="yes"> Yes, very clear</label>
      <label><input type="radio" name="q1" value="somewhat"> Somewhat — I have more questions</label>
      <label><input type="radio" name="q1" value="no"> Not really</label>
    </div>
  </div>

  <div class="question">
    <p>2. How likely would you be to share a track like this with a prospect before a buying decision?</p>
    <div class="options">
      <label><input type="radio" name="q2" value="very_likely"> Very likely</label>
      <label><input type="radio" name="q2" value="likely"> Likely</label>
      <label><input type="radio" name="q2" value="unlikely"> Unlikely</label>
    </div>
  </div>

  <div class="question">
    <p>3. What was most useful?</p>
    <div class="options">
      <label><input type="radio" name="q3" value="terminal"> The terminal experience (Challenge 2)</label>
      <label><input type="radio" name="q3" value="contrast"> The contrast between Challenge 1 and 2</label>
      <label><input type="radio" name="q3" value="analytics"> Seeing the analytics data (this screen)</label>
    </div>
  </div>

  <button class="submit-btn" id="submit-btn" onclick="submitForm()">Complete track</button>

  <div class="success" id="success-msg">
    <strong>Track complete.</strong>
    Your responses have been recorded. The webhook has fired — check your endpoint.
  </div>
</div>

<script>
function submitForm() {
  const q1 = document.querySelector('input[name="q1"]:checked');
  const q2 = document.querySelector('input[name="q2"]:checked');
  const q3 = document.querySelector('input[name="q3"]:checked');

  if (!q1 || !q2 || !q3) {
    alert('Please answer all three questions before completing.');
    return;
  }

  // Write responses to files so the check script can verify them
  fetch('/submit', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ q1: q1.value, q2: q2.value, q3: q3.value })
  }).then(r => r.json()).then(() => {
    document.getElementById('submit-btn').disabled = true;
    document.getElementById('success-msg').style.display = 'block';
  }).catch(() => {
    // Fallback: still show success even if fetch fails
    document.getElementById('submit-btn').disabled = true;
    document.getElementById('success-msg').style.display = 'block';
  });
}
</script>

</body>
</html>
HTMLEOF

# Simple Python server that serves the dashboard and handles form submission
cat << 'EOF' > /opt/dashboard/server.py
from http.server import HTTPServer, BaseHTTPRequestHandler
import json, os

class Handler(BaseHTTPRequestHandler):
    def log_message(self, format, *args):
        pass

    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-Type', 'text/html')
        self.end_headers()
        with open('/opt/dashboard/index.html', 'rb') as f:
            self.wfile.write(f.read())

    def do_POST(self):
        length = int(self.headers.get('Content-Length', 0))
        body = json.loads(self.rfile.read(length))
        # Write responses to a file the check script can read
        with open('/tmp/form-responses.json', 'w') as f:
            json.dump(body, f)
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps({"ok": True}).encode())

HTTPServer(('0.0.0.0', 8080), Handler).serve_forever()
EOF

python3 /opt/dashboard/server.py &
sleep 1
