import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

LocalhostServer localhostServer = LocalhostServer();

void main() async {
  await localhostServer.start(port: 0);
  runApp(const WeddingInvitationApp());
}

class WeddingInvitationApp extends StatelessWidget {
  const WeddingInvitationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedding Invitation Builder',
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WebViewControllerPlus _controler;
  double _height = 0.001;

  final TextEditingController _titleController = TextEditingController(
    text: 'A Celebration of Love',
  );
  final TextEditingController _namesController = TextEditingController(
    text: 'John & Sarah',
  );

  String _selectedBackgroundColor = 'White';

  final Map<String, String> _colorOptions = {
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

  @override
  void initState() {
    _controler = WebViewControllerPlus()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) async {
            double height = await _controler.webViewHeight;

            if (height != _height) {
              if (kDebugMode) {
                print("Height is: $height");
              }
              setState(() {
                _height = height;
              });
            }
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadHtmlString(_generateHtml());

    super.initState();
  }

  String _generateHtml() {
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
      font-family: Georgia, serif, Arial, sans-serif;
      background: #f3f4f6;
      text-align: center;
    }
    .card {
      position: relative;
      width: 90%;
      max-width: 900px;
      margin: 0 auto;
      background: ${_colorOptions[_selectedBackgroundColor]};
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
        <div class="couple">${_namesController.text}</div>
        <span class="amp">— join us for —</span>
        <div class="title">${_titleController.text}</div>
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

  void _updateWebView() {
    _controler.loadHtmlString(_generateHtml());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wedding Invitation Builder'),
        actions: [
          IconButton(
            onPressed: () {
              _showEditModal(context);
            },
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Invitation',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: WebViewWidget(controller: _controler),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Icon(Icons.edit, color: Colors.blue[600]),
                    const SizedBox(width: 12),
                    Text(
                      'Customize Your Invitation',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Invitation Title',
                          hintText: 'e.g., A Celebration of Love',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.title),
                        ),
                        onChanged: (value) {
                          _updateWebView();
                        },
                      ),

                      const SizedBox(height: 20),

                      TextField(
                        controller: _namesController,
                        decoration: const InputDecoration(
                          labelText: 'Couple Names',
                          hintText: 'e.g., John & Sarah',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        onChanged: (value) {
                          _updateWebView();
                        },
                      ),

                      const SizedBox(height: 20),

                      DropdownButtonFormField<String>(
                        initialValue: _selectedBackgroundColor,
                        decoration: const InputDecoration(
                          labelText: 'Background Color',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.palette),
                        ),
                        items: _colorOptions.keys.map((String colorName) {
                          return DropdownMenuItem<String>(
                            value: colorName,
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Color(
                                      int.parse(
                                        _colorOptions[colorName]!.replaceAll(
                                          '#',
                                          '0xFF',
                                        ),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(colorName),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedBackgroundColor = newValue;
                            });
                            _updateWebView();
                          }
                        },
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _updateWebView();
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.check),
                          label: const Text('Save Changes'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.blue[600],
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue[200]!),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.blue[600],
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Changes are applied automatically as you type. Click Save Changes to close this panel.',
                                style: TextStyle(
                                  color: Colors.blue[800],
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _namesController.dispose();
    super.dispose();
  }
}
