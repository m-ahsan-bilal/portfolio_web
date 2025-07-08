import 'package:flutter/material.dart';
import 'package:ahsan_dev/pages/chatbot_page.dart';

class ChatbotOverlay {
  static OverlayEntry? _entry;

  static void show(BuildContext context) {
    if (_entry != null) return; // Prevent multiple overlays

    _entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Dismiss area
          Positioned.fill(
            child: GestureDetector(
              onTap: hide,
              child: Container(
                color: Colors.black54,
              ),
            ),
          ),
          // Chatbot dialog
          Center(
            child: Material(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: 400,
                height: 600,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ChatbotPage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context, rootOverlay: true).insert(_entry!);
  }

  static void hide() {
    _entry?.remove();
    _entry = null;
  }
}
