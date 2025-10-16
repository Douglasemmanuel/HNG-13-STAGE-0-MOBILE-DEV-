import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Center(
      child: Column(
        children: [
          Text(
            'Contact',
            style: TextStyle(
               fontSize: 24, fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 15),
           Wrap(
            alignment: WrapAlignment.center,
            spacing: 30,
            runSpacing: 25,
            children: [
              clickableCard(
                icon: FontAwesomeIcons.envelope,
                label: 'Email',
                onPressed: _launchEmail,
              ),
              clickableCard(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                onPressed: _launchGitHub,
              ),
              clickableCard(
                icon: FontAwesomeIcons.twitter,
                label: 'Twitter',
                onPressed: _launchTwitter,
              ),
              clickableCard(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                onPressed: _launchLinkedIn,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


 Widget clickableCard({
  required IconData icon,
  required String label,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    borderRadius: BorderRadius.circular(12),
    splashColor: Colors.blue.withOpacity(0.2),
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.blueAccent,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'emmaueldouglas2121@gmail.com',
      query: 'subject=Hello!',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> _launchLinkedIn() async {
    const url = 'https://www.linkedin.com/in/douglas-emmanuel-554452203';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  Future<void> _launchGitHub() async {
    const url = 'https://github.com/Douglasemmanuel/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  Future<void> _launchTwitter() async {
    const url = 'https://x.com/_douglasemma21';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
