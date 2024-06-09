import 'package:flutter/material.dart';

class QR_Generator extends StatefulWidget {
  const QR_Generator({super.key});

  @override
  State<QR_Generator> createState() => _QR_GeneratorState();
}

class _QR_GeneratorState extends State<QR_Generator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 69, 119, 177),
        title: const Text(
          "QR Code Generator ",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}