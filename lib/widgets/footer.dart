import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust layout based on screen width
    bool isSmallScreen = screenWidth < 600;

    return Container(
      color: const Color(0xffF1F4FE),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: isSmallScreen
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Ahsan Bilal",
                  style: TextStyle(
                    fontSize: 24,
                    // color: Color(0xff3D5EFC),
                    fontFamily: 'roboto',
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(FontAwesomeIcons.linkedin,
                        "https://www.linkedin.com/in/ahsan-bilal-90169032a/"),
                    const SizedBox(width: 10),
                    _buildSocialIcon(FontAwesomeIcons.github,
                        "https://github.com/m-ahsan-bilal"),
                    const SizedBox(width: 10),
                    _buildSocialIcon(FontAwesomeIcons.medium,
                        "https://medium.com/@ahsan123.bilal"),
                    const SizedBox(width: 10),
                    _buildSocialIcon(FontAwesomeIcons.upwork,
                        "https://www.upwork.com/freelancers/~01f91421d66ccc3ffa?mp_source=share"),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNavLink(context, '/', 'About'),
                    const SizedBox(width: 15),
                    _buildNavLink(context, '/work', 'Work'),
                    const SizedBox(width: 15),
                    _buildNavLink(context, '/resume', 'Resume'),
                    const SizedBox(width: 15),
                    _buildNavLink(context, '/contact', 'Contact'),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  '© Ahsan Bilal, 2024. All rights reserved.',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            )
          : Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahsan Bilal",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '© Ahsan Bilal, 2024. All rights reserved.',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildSocialLinksRow(),
                      const SizedBox(height: 20),
                      _buildNavigationRow(context),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildSocialLinksRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildSocialIcon(FontAwesomeIcons.linkedin,
            "https://www.linkedin.com/in/ahsan-bilal-90169032a/"),
        const SizedBox(width: 20),
        _buildSocialIcon(
            FontAwesomeIcons.github, "https://github.com/m-ahsan-bilal"),
        const SizedBox(width: 20),
        _buildSocialIcon(
            FontAwesomeIcons.medium, "https://medium.com/@ahsan123.bilal"),
        const SizedBox(width: 20),
        _buildSocialIcon(FontAwesomeIcons.upwork,
            "https://www.upwork.com/freelancers/~01f91421d66ccc3ffa?mp_source=share"),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Icon(
        icon,
        color: const Color(0xff3D5EFC),
        size: 25,
      ),
    );
  }

  Widget _buildNavigationRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildNavLink(context, '/', 'About'),
        const SizedBox(width: 15),
        _buildNavLink(context, '/work', 'Work'),
        const SizedBox(width: 15),
        _buildNavLink(context, '/resume', 'Resume'),
        const SizedBox(width: 15),
        _buildNavLink(context, '/contact', 'Contact'),
      ],
    );
  }

  Widget _buildNavLink(BuildContext context, String route, String label) {
    return InkWell(
      onTap: () => context.go(route),
      child: Text(
        label,
        style: const TextStyle(color: Color(0xff3D5EFC), fontSize: 12),
      ),
    );
  }
}
