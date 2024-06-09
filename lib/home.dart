import 'package:flutter/material.dart';
import 'package:qr_code_scanner_generator/QR_Generator.dart';
import 'package:qr_code_scanner_generator/QR_Scanner.dart';
import 'package:qr_code_scanner_generator/history.dart';
import 'package:qr_code_scanner_generator/settings.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 69, 119, 177),
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
            SizedBox(height: 30,),
            Container(
              height: 60, // Set the desired height here
              decoration: const BoxDecoration(
                color: Colors.black45,
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
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const History(),
                  ),
                ); 
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Scan from Gallery'),
              onTap: () {
                Navigator.pop(context); 
                
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                //Navigator.pop(context); 
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
                Navigator.pop(context); 
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 93, 68, 233)),
                textStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 15,
                )),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const QR_Scanner()));
              },
              child: const Text('Scan QR Code'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 93, 68, 233)),
                textStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 15,
                )),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const QR_Generator()));
              },
              child: const Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }  
}
