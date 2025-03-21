import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.apple, color: Colors.white, size: 50), // Leading icon
            SizedBox(width: 8), // Spacing between icon and text
            SizedBox(
              width: 200,
              child: Text(
                'Carousel Ambient Background',
                maxLines: 2,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Spacer(flex: 3), // Spacing between text and trailing icon
            Icon(Icons.share, color: Colors.white),
            Spacer(), // Spacing between text and trailing icon
            Icon(Icons.notifications, color: Colors.white),
            // Trailing share icon
          ],
        ),
      ),
    );
  }
}
