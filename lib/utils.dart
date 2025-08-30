class HtmlHelper {
  // Original HTML with complex CSS (commented out for WebView compatibility)
  /*
  static const template = '''
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Wedding Invitation — Ankara & Gold</title>
  <style>
    :root {
      --card:#ffffff;
      --gold:#C6A664;
      --green:#0AA83F;
    }
    body {
      margin:0;
      font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Noto Sans, Ubuntu, Cantarell, Helvetica Neue, Arial;
      background:#f3f4f6;
      display:grid;
      place-items:center;
      min-height:100vh;
    }
    .card {
      position:relative;
      width:min(900px, 92vw);
      aspect-ratio:7/10;
      background:var(--card);
      border-radius:28px;
      overflow:hidden;
      box-shadow:0 20px 60px rgba(0,0,0,.25);
      border:1px solid rgba(0,0,0,.06);
    }
    .inner {
      position:relative;
      height:100%;
      padding:28px;
      display:grid;
      grid-template-rows:auto 1fr auto;
    }
    .rsvp {
      display:flex;
      gap:10px;
      flex-wrap:wrap;
    }
    .pill {
      padding:10px 14px;
      border-radius:999px;
      background:#f1f5f9;
      border:1px solid #e5e7eb;
      font-weight:700;
    }
    .topbar {
      height:26%;
      background:
        radial-gradient(1100px 400px at 10% -50%, rgba(246,211,101,.45), transparent 60%),
        radial-gradient(1000px 370px at 90% -40%, rgba(253,160,133,.4), transparent 60%),
        linear-gradient(135deg, #0f172a 0%, #0b1220 35%, #0f172a 100%);
      position:relative;
    }
    .ankara {
      position:absolute; inset:0; opacity:.18;
      background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 120" width="120" height="120"><defs><pattern id="p" width="24" height="24" patternUnits="userSpaceOnUse"><circle cx="12" cy="12" r="10" stroke="%23C6A664" stroke-width="2" fill="none"/><circle cx="12" cy="12" r="3" fill="%230AA83F"/><path d="M12 0 L12 6 M12 24 L12 18 M0 12 L6 12 M24 12 L18 12" stroke="%23ffffff" stroke-width="1" opacity="0.5"/></pattern></defs><rect width="120" height="120" fill="url(%23p)"/></svg>');
    }
    .crest {
      position:absolute; inset:auto 0 -54px 0; margin:auto;
      width:220px; height:220px; border-radius:999px;
      border:6px solid var(--gold);
      box-shadow:0 10px 40px rgba(0,0,0,.35);
      background:radial-gradient(circle at 50% 40%, #1f2937, #0f172a 60%);
      display:grid; place-items:center;
    }
    .badge {
      height:120px; width:120px;
      border-radius:999px;
      border:5px solid var(--gold);
      display:grid; place-items:center;
      color:#fef3c7;
      font-weight:900; letter-spacing:1px;
    }
    .names {
      font-family:"Georgia", ui-serif, serif;
      font-weight:800; text-transform:uppercase;
      letter-spacing:1.8px;
      color:#0b1220; text-align:center;
    }
    .names .amp {
      display:block; font-size:44px; color:var(--gold);
      letter-spacing:0; margin:6px 0;
    }
    .names .couple {
      font-size:34px; color:var(--green);
    }
    .mid {
      padding:20px 24px 0;
      display:grid; gap:12px; text-align:center;
    }
    .mid h2 { font-size:28px; margin:4px 0 0; color:#111827 }
    .mid p { margin:0; color:#374151 }
    .grid {
      display:grid; grid-template-columns:1fr 1fr;
      gap:16px; margin-top:8px;
    }
    .tile {
      border:2px dashed var(--gold);
      border-radius:16px;
      padding:14px;
    }
    .footer {
      display:flex; justify-content:space-between; align-items:center;
      gap:16px; flex-wrap:wrap;
    }
  </style>
</head>
<body>
  <div class="card">
    <div class="topbar">
      <div class="ankara"></div>
      <div class="crest">
        <div class="badge">W ❤ B</div>
      </div>
    </div>
    <div class="inner">
      <div></div>
      <div class="mid">
        <div class="names">
          <div class="couple">John &amp; Sarah</div>
          <span class="amp">— join us for —</span>
          <div style="font-size:22px; color:#111827; font-weight:700">A Celebration of Love</div>
        </div>
        <h2>Saturday, 11 October 2025 • 2:00 PM</h2>
        <p class="muted">Harbour Point, Victoria Island, Lagos</p>
        <div class="grid">
          <div class="tile">
            <div class="title" style="color:var(--gold)">Quila Hall</div>
            Ikeja, Lagos • 11:00 AM
          </div>
          <div class="tile">
            <div class="title" style="color:var(--green)">Reception</div>
            Harbour Point • 2:00 PM • Ankara glam
          </div>
        </div>
      </div>
      <div class="footer">
        <div class="rsvp">
          <span class="pill">RSVP: +234 801 234 5678</span>
          <span class="pill">Dress Code: Emerald & Gold</span>
          <span class="pill">Gate Pass Required</span>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
  ''';
  */

  static const template = '''
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Wedding Invitation — Ankara & Gold</title>
  <style>
    body {
      margin: 0;
      padding: 20px;
      font-family: Georgia, serif, Arial, sans-serif;
      background: #f3f4f6;
      text-align: center;
    }
    .card {
      position: relative;
      width: 90%;
      max-width: 900px;
      margin: 0 auto;
      background: #ffffff;
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 10px 30px rgba(0,0,0,0.3);
      border: 1px solid rgba(0,0,0,0.1);
    }
    .topbar {
      height: 200px;
      background: linear-gradient(135deg, #0f172a 0%, #0b1220 35%, #0f172a 100%);
      position: relative;
    }
    .crest {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 180px;
      height: 180px;
      border-radius: 50%;
      border: 6px solid #C6A664;
      box-shadow: 0 10px 30px rgba(0,0,0,0.4);
      background: radial-gradient(circle at 50% 40%, #1f2937, #0f172a 60%);
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .badge {
      height: 100px;
      width: 100px;
      border-radius: 50%;
      border: 5px solid #C6A664;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fef3c7;
      font-weight: 900;
      font-size: 20px;
    }
    .inner {
      padding: 30px;
    }
    .names {
      margin-bottom: 30px;
    }
    .couple {
      font-size: 32px;
      font-weight: 800;
      color: #0AA83F;
      margin-bottom: 10px;
      text-transform: uppercase;
      letter-spacing: 2px;
    }
    .amp {
      display: block;
      font-size: 36px;
      color: #C6A664;
      margin: 15px 0;
      font-weight: 800;
    }
    .title {
      font-size: 20px;
      color: #111827;
      font-weight: 700;
      margin-bottom: 20px;
    }
    .event-date {
      font-size: 24px;
      color: #111827;
      font-weight: 600;
      margin-bottom: 10px;
    }
    .event-location {
      font-size: 16px;
      color: #374151;
      margin-bottom: 25px;
    }
    .grid {
      display: flex;
      flex-direction: column;
      gap: 15px;
      margin: 20px 0;
    }
    .tile {
      border: 2px dashed #C6A664;
      border-radius: 12px;
      padding: 15px;
      text-align: left;
    }
    .tile-title {
      font-weight: 700;
      font-size: 16px;
      margin-bottom: 5px;
    }
    .tile-gold {
      color: #C6A664;
    }
    .tile-green {
      color: #0AA83F;
    }
    .footer {
      margin-top: 25px;
    }
    .rsvp {
      display: flex;
      flex-direction: column;
      gap: 10px;
      align-items: center;
    }
    .pill {
      padding: 10px 16px;
      border-radius: 25px;
      background: #f1f5f9;
      border: 1px solid #e5e7eb;
      font-weight: 700;
      font-size: 14px;
      color: #374151;
    }
    @media (min-width: 768px) {
      .grid {
        flex-direction: row;
      }
      .tile {
        flex: 1;
      }
      .rsvp {
        flex-direction: row;
        justify-content: center;
        flex-wrap: wrap;
      }
    }
  </style>
</head>
<body>
  <div class="card">
    <div class="topbar">
      <div class="crest">
        <div class="badge">W ❤ B</div>
      </div>
    </div>
    <div class="inner">
      <div class="names">
        <div class="couple">John &amp; Sarah</div>
        <span class="amp">— join us for —</span>
        <div class="title">A Celebration of Love</div>
      </div>
      
      <div class="event-date">Saturday, 11 October 2025 • 2:00 PM</div>
      <div class="event-location">Harbour Point, Victoria Island, Lagos</div>
      
      <div class="grid">
        <div class="tile">
          <div class="tile-title tile-gold">Quila Hall</div>
          Ikeja, Lagos • 11:00 AM
        </div>
        <div class="tile">
          <div class="tile-title tile-green">Reception</div>
          Harbour Point • 2:00 PM • Ankara glam
        </div>
      </div>
      
      <div class="footer">
        <div class="rsvp">
          <span class="pill">RSVP: +234 801 234 5678</span>
          <span class="pill">Dress Code: Emerald & Gold</span>
          <span class="pill">Gate Pass Required</span>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
  ''';
}
