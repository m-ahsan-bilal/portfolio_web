// Footer Widget
import 'package:ahsan_dev/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  // Function to open URL in a new tab
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF1F4FE),
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "AhsanBilal",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '© Ahsan Bilal,2024. All rights reserved.',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      _launchUrl(
                          "https://www.linkedin.com/in/ahsan-bilal-90169032a/");
                    },
                    child: Image.asset(
                      "assets/images/linkedin.png",
                      height: 25,
                      width: 25,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      _launchUrl("https://github.com/m-ahsan-bilal");
                    },
                    child: Image.asset(
                      'assets/images/github.png',
                      height: 25,
                      width: 25,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      _launchUrl("https://www.fiverr.com/s/Zm228V4");
                    },
                    child: Image.asset(
                      'assets/images/fiverr.png',
                      height: 25,
                      width: 25,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      _launchUrl(
                          "https://www.upwork.com/freelancers/~01f91421d66ccc3ffa?mp_source=share");
                    },
                    child: Image.asset(
                      'assets/images/upwork.png',
                      height: 25,
                      width: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      context.go('/');
                    },
                    child: const Text(
                      'About',
                      style: TextStyle(color: Color(0xff3D5EFC), fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () => context.go('/work'),
                    child: const Text(
                      'Work',
                      style: TextStyle(color: Color(0xff3D5EFC), fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () => context.go('/resume'),
                    child: const Text(
                      'Resume',
                      style: TextStyle(color: Color(0xff3D5EFC), fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () => context.go('/contact'),
                    child: const Text(
                      'Contact',
                      style: TextStyle(color: Color(0xff3D5EFC), fontSize: 12),
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
