import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final bool isOutlined;

  const HoverButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.isOutlined = false,
  }) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.isOutlined ? Colors.white : widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _currentColor = widget.isOutlined
              ? widget.color.withOpacity(0.1)
              : widget.color.withOpacity(0.8);
        });
      },
      onExit: (_) {
        setState(() {
          _currentColor = widget.isOutlined ? Colors.white : widget.color;
        });
      },
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _currentColor,
          elevation: widget.isOutlined ? 0 : 4,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isOutlined ? widget.color : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
