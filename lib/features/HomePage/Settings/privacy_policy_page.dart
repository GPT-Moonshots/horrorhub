import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 154, 154, 154),
                Color.fromARGB(255, 213, 197, 117)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Privacy and Policy',
          style: GoogleFonts.caveat(
            fontSize: 38.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text('Effective Date: May 1st, 2024',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(
              'Introduction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to Love Verse, an app developed by Love Logic Labs. At Love Logic Labs, we value your privacy and are committed to protecting your personal data. This Privacy Policy explains how we collect, use, store, and protect your information when you use our app, Love Verse, which creates poems for your loved ones. By using Love Verse, you agree to the collection and use of information in accordance with this policy.',
            ),
            SizedBox(height: 16),
            Text(
              '1. Information We Collect',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'When you use Love Verse, we may collect the following information:\n'
              '- Personal Data: Information that identifies you as an individual, such as your name, email address, and any other information you provide when creating an account.\n'
              '- Generated Content: Poems created by the AI in Love Verse based on your input.\n'
              '- Usage Data: Information on how you interact with the app, such as the features you use and the time spent on the app.',
            ),
            SizedBox(height: 16),
            Text(
              '2. How We Use Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We use the information we collect for the following purposes:\n'
              '- To Provide and Maintain Our Service: To create and store poems based on your input.\n'
              '- To Improve Our Service: To understand how users interact with Love Verse and to improve the app’s functionality and user experience.\n'
              '- To Communicate with You: To send you updates, newsletters, and other information related to Love Verse.',
            ),
            SizedBox(height: 16),
            Text(
              '3. Data Storage and Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '- Data Storage: All poems and personal data are stored in our secure database. If you delete your profile, all associated data, including poems, will be permanently deleted from our database.\n'
              '- Data Security: We use industry-standard encryption to protect all data stored and transmitted by Love Verse. We take reasonable measures to safeguard your data from unauthorized access, disclosure, or destruction.',
            ),
            SizedBox(height: 16),
            Text(
              '4. Sharing Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We do not share your personal data or generated content with any third parties. Your poems and personal information are kept confidential and are only used for the purposes described in this Privacy Policy.',
            ),
            SizedBox(height: 16),
            Text(
              '5. Data Deletion',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you choose to delete your profile, we will delete all data associated with your account from our database. This includes your personal information and any poems you have created.',
            ),
            SizedBox(height: 16),
            Text(
              '6. Your Rights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'You have the following rights regarding your personal data:\n'
              '- Access: You have the right to request access to your personal data that we hold.\n'
              '- Correction: You have the right to request correction of any inaccurate or incomplete data.\n'
              '- Deletion: You have the right to request the deletion of your personal data.',
            ),
            SizedBox(height: 16),
            Text(
              '7. Changes to This Privacy Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.',
            ),
            SizedBox(height: 16),
            Text(
              '8. Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
                'If you have any questions about this Privacy Policy, please contact us at:\n'
                '- Email: logiclabs0@gmail.com\n'),
          ],
        ),
      ),
    );
  }
}
