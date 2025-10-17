import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/foundation.dart';


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



// Future<void> _launchEmail() async {
//   final Uri emailUri = Uri(
//     scheme: 'mailto',
//     path: 'emmaueldouglas2121@gmail.com',
//     query: 'subject=Hello!',
//   );

//   if (await canLaunchUrl(emailUri)) {
//     await launchUrl(emailUri, mode: LaunchMode.externalApplication);
//   } else {
//     throw 'Could not launch $emailUri';
//   }
// }

// Future<void> _launchLinkedIn() async {
//   const url = 'https://www.linkedin.com/in/douglas-emmanuel-554452203';
//   final Uri uri = Uri.parse(url);
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// Future<void> _launchGitHub() async {
//   const url = 'https://github.com/Douglasemmanuel/';
//   final Uri uri = Uri.parse(url);
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// Future<void> _launchTwitter() async {
//   const url = 'https://x.com/_douglasemma21';
//   final Uri uri = Uri.parse(url);
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//   } else {
//     throw 'Could not launch $url';
//   }
// }





/// General helper that tries external app first, then in-app webview as fallback.
Future<void> _safeLaunchUrl(Uri uri) async {
  try {
    // 1️⃣ Try opening with an external app (e.g., Chrome, Gmail)
    bool launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    // 2️⃣ If that fails and it's a web link, open inside app instead
    if (!launched && (uri.scheme == 'http' || uri.scheme == 'https')) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    }
  } catch (e) {
    debugPrint('⚠️ Could not launch $uri: $e');

    // 3️⃣ Fallback to in-app webview if it’s a web URL
    if (uri.scheme == 'http' || uri.scheme == 'https') {
      try {
        await launchUrl(uri, mode: LaunchMode.inAppWebView);
      } catch (e2) {
        debugPrint('❌ Even fallback failed for $uri: $e2');
      }
    }
  }
}

Future<void> _launchEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'emmaueldouglas2121@gmail.com',
    query: Uri.encodeFull('subject=Hello!'),
  );

  try {
    // email links can only open externally; there’s no in-app fallback
    bool launched = await launchUrl(emailUri, mode: LaunchMode.externalApplication);

    if (!launched) {
      debugPrint('⚠️ No email app found to handle mailto link.');
    }
  } catch (e) {
    debugPrint('❌ Failed to open email app: $e');
  }
}

Future<void> _launchLinkedIn() async {
  const url = 'https://www.linkedin.com/in/douglas-emmanuel-554452203';
  await _safeLaunchUrl(Uri.parse(url));
}

Future<void> _launchGitHub() async {
  const url = 'https://github.com/Douglasemmanuel/';
  await _safeLaunchUrl(Uri.parse(url));
}

Future<void> _launchTwitter() async {
  const url = 'https://x.com/_douglasemma21';
  await _safeLaunchUrl(Uri.parse(url));
}
