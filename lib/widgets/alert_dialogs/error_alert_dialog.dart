import 'package:flutter/material.dart';
import 'package:project5/extensions/screen_size.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String message;
  const ErrorAlertDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff3e3e3e),
      content: Container(
        width: 50,
        height: context.getHeight(divideBy: 6.5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.close, color: Colors.red,size: 70),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              )
            )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(const Color(0xffBDA6F5).withOpacity(0.71))),
          onPressed: ()=>Navigator.pop(context),
          child: const Text("Back", style: TextStyle(color: Colors.white),)
        )
      ],
    );
  }
}