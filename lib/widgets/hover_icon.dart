import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HoverIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color hoverColor;
  final Color defaultColor;
  final double iconSize;

  const HoverIcon({
    super.key,
    required this.icon,
    required this.label,
    this.hoverColor = const Color(0xFFCED8FB),
    this.defaultColor = const Color.fromARGB(255, 219, 234, 244),
    this.iconSize = 30.0,
  });

  @override
  State<HoverIcon> createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: isHovered ? widget.hoverColor : widget.defaultColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              widget.icon,
              size: widget.iconSize,
              color: const Color(0xff305CF8),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            widget.label,
            style: GoogleFonts.roboto(
              color: const Color(0xff305CF8),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
