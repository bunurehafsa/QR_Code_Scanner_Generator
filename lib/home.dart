import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import 'package:qr_code_scanner_generator/QR_Generator.dart';
import 'package:qr_code_scanner_generator/QR_Scanner.dart';
import 'package:qr_code_scanner_generator/history.dart';
import 'package:qr_code_scanner_generator/settings.dart';
import 'package:qr_code_scanner_generator/about.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  
  String? scannedResult;

  
  Future<void> scanFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      try {
        final String? result = await QrCodeToolsPlugin.decodeFrom(imageFile.path);
        if (result != null) {
          setState(() {
            scannedResult = result;
          });
          showResultDialog(result);
        } else {
          showResultDialog('No QR code found.');
        }
      } catch (e) {
        showResultDialog('Error decoding QR code: $e');
      }
    }
  }

  void showResultDialog(String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Scan Result'),
          content: Text(result),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 66, 6, 122),
        title: const Text(
          "QR Code Scanner and Generator",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(height: 30),
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 66, 6, 122),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('History'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const History(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Select from this device'),
              onTap: () {
                scanFromGallery();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Aboutpage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'bg3.png',
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    )),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 93, 68, 233)),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 15,
                    )),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QR_Scanner()
                    ));
                  },
                  child: const Text('Scan QR Code'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    )),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 93, 68, 233)),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 15,
                    )),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QR_Generator()
                    ));
                  },
                  child: const Text('Generate QR Code'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
