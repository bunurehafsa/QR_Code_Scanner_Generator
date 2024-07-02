import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service',style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 66, 6, 122),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'bg3.png', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Terms of Service',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Introduction',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'These Terms of Service ("Terms") govern your use of our app. By accessing or using our app, you agree to be bound by these Terms. If you do not agree with any part of these Terms, you must not use our app.',
              ),
              SizedBox(height: 20),
              Text(
                'Use of the App',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'You agree to use the app only for lawful purposes and in a way that does not infringe the rights of, restrict, or inhibit anyone else\'s use and enjoyment of the app. Prohibited behavior includes harassing or causing distress or inconvenience to any other user, transmitting obscene or offensive content, or disrupting the normal flow of dialogue within the app.',
              ),
              SizedBox(height: 20),
              Text(
                'User Accounts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'To access certain features of the app, you may need to create an account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account or any other breach of security.',
              ),
              SizedBox(height: 20),
              Text(
                'Intellectual Property',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'All content included in the app, such as text, graphics, logos, images, and software, is the property of the app owner or its content suppliers and is protected by international copyright laws. You may not modify, copy, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any information, software, products, or services obtained from the app without the written consent of the app owner.',
              ),
              SizedBox(height: 20),
              Text(
                'Termination',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We reserve the right to terminate or suspend your access to the app immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms. Upon termination, your right to use the app will cease immediately.',
              ),
              SizedBox(height: 20),
              Text(
                'Limitation of Liability',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'In no event shall the app owner be liable for any indirect, incidental, special, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from (i) your use or inability to use the app; (ii) any unauthorized access to or use of our servers and/or any personal information stored therein; (iii) any interruption or cessation of transmission to or from the app; (iv) any bugs, viruses, trojan horses, or the like that may be transmitted to or through the app by any third party; (v) any errors or omissions in any content or for any loss or damage incurred as a result of the use of any content posted, emailed, transmitted, or otherwise made available through the app; and/or (vi) user content or the defamatory, offensive, or illegal conduct of any third party.',
              ),
              SizedBox(height: 20),
              Text(
                'Governing Law',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'These Terms shall be governed and construed in accordance with the laws of the country in which the app owner is headquartered, without regard to its conflict of law provisions.',
              ),
              SizedBox(height: 20),
              Text(
                'Changes to Terms',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.',
              ),
              SizedBox(height: 20),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'If you have any questions about these Terms, please contact us at: qrscanner@gmail.com',
              ),
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}
