import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Import the LoginBottomSheet if it's in a different file

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.BG,
    this.buttonSheet,
    this.activekey,
    this.active = true,
    this.textcolor = Colors.black,
  });

  final String text;
  final Color BG;
  final Color textcolor;
  Widget? buttonSheet;
  GlobalKey<FormState>? activekey;
  bool active;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: Color(0xffFFDE69), width: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: BG,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      ),
      onPressed: () {
        if (active) {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: const Color(0xffFFECAA),
            context: context,
            builder: (BuildContext context) {
              return buttonSheet!;
            },
          );
        } else {
          activekey!.currentState!.validate();
        }
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: textcolor)
      ),
    );
  }
}