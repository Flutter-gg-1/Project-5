import 'package:flutter/material.dart';

class GuestLoginPrompt extends StatelessWidget {
  final VoidCallback onLoginPressed;

  const GuestLoginPrompt({required this.onLoginPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 191,
        width: 373,
        decoration: BoxDecoration(
          color: Color.fromRGBO(30, 30, 30, 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You are not logged in yet",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50.0),
            SizedBox(
              height: 50,
              width: 255,
              child: ElevatedButton(
                onPressed: onLoginPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color:  Color.fromRGBO(189, 166, 245, 0.71),fontSize: 30
                  ,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
