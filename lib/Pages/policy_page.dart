import 'package:flutter/material.dart';

class PoliciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Policies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We prioritize your privacy! Our e-commerce Android app collects minimal personal information necessary for seamless transactions. We securely store and protect your data, including contact details and purchase history. Rest assured, we never share your information with third parties without explicit consent. Our app employs robust security measures to safeguard your sensitive data. By using our app, you agree to our Privacy Policy. For detailed information on data collection, usage, and your rights, please refer to the complete Privacy Policy on our website. Your trust is our priority.\neBUY',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Terms of Service',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to eBUY!\nBy accessing our e-commerce Android app, you agree to abide by our terms. These include responsible usage, adherence to applicable laws, and acknowledgment of our intellectual property rights. Happy shopping!',
              style: TextStyle(fontSize: 16),
            ),
            // Add more sections as needed for your specific policies
          ],
        ),
      ),
    );
  }
}


