import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class QR_Scanner extends StatefulWidget {
  const QR_Scanner({super.key});

  @override
  State<QR_Scanner> createState() => _QR_ScannerState();
}

class _QR_ScannerState extends State<QR_Scanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 66, 6, 122),
        title: const Text(
          "QR Code Scanner ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: 300,
                height: 400,
                child: Center(
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              flex: 1,
              child: Center(
                child: (result != null)
                    ? Column(
                        children: [
                          Text(
                              'Barcode Type: ${result!.format}   Data: ${result!.code}',
                              style: TextStyle(color: Color.fromARGB(255, 20, 20, 20))
                          ),
                          const SizedBox(height: 10,),
                          _buildActionButton(result!.code)
                        ],
                      )
                    : const Text('Place the code inside the frame', style: TextStyle(color: Color.fromARGB(255, 20, 20, 20))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String? result) {
    final Uri? uri = Uri.tryParse(result ?? '');
    final bool isUrl = uri != null && (uri.isScheme('http') || uri.isScheme('https'));

    if (isUrl) {
      return ElevatedButton(
        onPressed: () => _launchURL(result!),
        child: Text('Go to the website'),
      );
    } else {
      return ElevatedButton(
        onPressed: () => _copyText(result!),
        child: Text('Copy Text'),
      );
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Text copied to clipboard')));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
