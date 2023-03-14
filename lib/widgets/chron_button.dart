import 'package:flutter/material.dart';

class ChronButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const ChronButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(icon),
            ),
            Text(text, style: const TextStyle(fontSize: 18)),
          ],
        ));
  }
}
