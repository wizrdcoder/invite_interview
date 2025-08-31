import '../models/wedding_invitation.dart';

class HtmlGenerator {
  static const Map<String, String> colorOptions = {
    'White': '#ffffff',
    'Ivory': '#fffff0',
    'Cream': '#fff5ee',
    'Light Gray': '#f8f9fa',
    'Light Blue': '#f0f8ff',
    'Light Pink': '#fff0f5',
    'Light Yellow': '#fffff8',
    'Light Green': '#f0fff0',
    'Black': '#000000',
    'Dark Gray': '#2c3e50',
    'Navy Blue': '#1e3a8a',
    'Burgundy': '#800020',
  };

  static const Map<String, String> fontOptions = {
    'Georgia': 'Georgia, serif',
    'Arial': 'Arial, sans-serif',
    'Times New Roman': 'Times New Roman, serif',
    'Helvetica': 'Helvetica, Arial, sans-serif',
    'Verdana': 'Verdana, sans-serif',
    'Trebuchet MS': 'Trebuchet MS, sans-serif',
    'Palatino': 'Palatino, serif',
    'Garamond': 'Garamond, serif',
  };

  static const Map<String, String> textColorOptions = {
    'Black': '#000000',
    'Dark Gray': '#374151',
    'Charcoal': '#111827',
    'Navy Blue': '#1e3a8a',
    'Dark Green': '#065f46',
    'Burgundy': '#800020',
    'Dark Purple': '#581c87',
    'Brown': '#92400e',
    'Dark Red': '#dc2626',
  };

  static String generateHtml(WeddingInvitation invitation) {
    String fontWeight = invitation.isBold ? 'bold' : 'normal';
    String fontStyle = invitation.isItalic ? 'italic' : 'normal';
    String fontFamily = fontOptions[invitation.fontFamily] ?? 'Georgia, serif';
    
    return '''
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Wedding Invitation — Ankara & Gold</title>
  <style>
    body {
      margin: 0;
      padding: 20px;
      font-family: $fontFamily;
      background: #f3f4f6;
      text-align: center;
      /* Applied dynamic font styling */
      font-weight: $fontWeight;
      font-style: $fontStyle;
      font-size: ${invitation.fontSize}px;
      color: ${invitation.textColor};
    }
    .card {
      position: relative;
      width: 90%;
      max-width: 900px;
      margin: 0 auto;
      background: ${colorOptions[invitation.backgroundColor]};
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
      font-size: ${invitation.fontSize + 16}px;
      font-weight: 800;
      /* Use dynamic accent color instead of hardcoded green */
      color: ${invitation.accentColor};
      margin-bottom: 10px;
      text-transform: uppercase;
      letter-spacing: 2px;
    }
    .amp {
      display: block;
      font-size: ${invitation.fontSize + 20}px;
      color: #C6A664;
      margin: 15px 0;
      font-weight: 800;
    }
    .title {
      font-size: ${invitation.fontSize + 4}px;
      /* Use dynamic text color */
      color: ${invitation.textColor};
      font-weight: 700;
      margin-bottom: 20px;
    }
    .event-date {
      font-size: ${invitation.fontSize + 8}px;
      /* Use dynamic text color */
      color: ${invitation.textColor};
      font-weight: 600;
      margin-bottom: 10px;
    }
    .event-location {
      font-size: ${invitation.fontSize}px;
      color: ${invitation.textColor};
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
      font-size: ${invitation.fontSize}px;
      margin-bottom: 5px;
    }
    .tile-gold {
      color: #C6A664;
    }
    .tile-green {
      /* Use dynamic accent color */
      color: ${invitation.accentColor};
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
      font-size: ${invitation.fontSize - 2}px;
      /* Use dynamic text color */
      color: ${invitation.textColor};
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
        <div class="couple">${invitation.coupleNames}</div>
        <span class="amp">— join us for —</span>
        <div class="title">${invitation.title}</div>
      </div>
      
      <div class="event-date">${invitation.eventDate} • ${invitation.eventTime}</div>
      <div class="event-location">${invitation.eventLocation}</div>
      
      <div class="grid">
        <div class="tile">
          <div class="tile-title tile-gold">${invitation.ceremonyVenue}</div>
          ${invitation.eventLocation} • ${invitation.ceremonyTime}
        </div>
        <div class="tile">
          <div class="tile-title tile-green">Reception</div>
          ${invitation.receptionVenue} • ${invitation.receptionTime} • Ankara glam
        </div>
      </div>
      
      <div class="footer">
        <div class="rsvp">
          <span class="pill">RSVP: ${invitation.rsvpPhone}</span>
          <span class="pill">Dress Code: ${invitation.dressCode}</span>
          ${invitation.gatePassRequired ? '<span class="pill">Gate Pass Required</span>' : ''}
        </div>
      </div>
    </div>
  </div>
</body>
</html>
    ''';
  }
}
