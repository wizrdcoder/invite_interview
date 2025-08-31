import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import '../models/wedding_invitation.dart';
import '../services/html_generator.dart';
import '../widgets/edit_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WebViewControllerPlus _controller;
  double _height = 0.001;
  WeddingInvitation _invitation = WeddingInvitation();

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewControllerPlus()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) async {
            double height = await _controller.webViewHeight;
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
      ..loadHtmlString(HtmlGenerator.generateHtml(_invitation));
  }

  void _updateInvitation(WeddingInvitation newInvitation) {
    setState(() {
      _invitation = newInvitation;
    });
    _controller.loadHtmlString(HtmlGenerator.generateHtml(_invitation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wedding Invitation Builder'),
        actions: [
          IconButton(
            onPressed: () => _showEditModal(),
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
              child: WebViewWidget(controller: _controller),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EditModal(
        invitation: _invitation,
        onSave: _updateInvitation,
      ),
    );
  }
}
