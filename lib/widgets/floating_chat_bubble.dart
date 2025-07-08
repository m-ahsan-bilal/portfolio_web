import 'package:flutter/material.dart';

class FloatingChatBubble extends StatelessWidget {
  final VoidCallback onTap;
  const FloatingChatBubble({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32,
      right: 32,
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: 6,
          shape: const CircleBorder(),
          color: Colors.blue.shade700,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child:
                Icon(Icons.chat_bubble_outline, color: Colors.white, size: 32),
          ),
        ),
      ),
    );
  }
}
