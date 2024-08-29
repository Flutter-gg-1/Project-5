import 'package:flutter/material.dart';
import 'package:project_5/components/text/text_custom.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      appBar: AppBar(
        title: const TextCustom(
            text: "Account",
            color: Colors.white,
            weight: FontWeight.w700,
            fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 337,
              height: 191,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff1E1E1E)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const TextCustom(
                      text: "You are not logged in yet",
                      color: Colors.white,
                      weight: FontWeight.w700,
                      fontSize: 12),
                  Container(
                    height: 50,
                    width: 255,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                      child: TextButton(
                          onPressed: () {},
                          child: const TextCustom(
                              text: "Login",
                              color: Color(0xffBDA6F5),
                              weight: FontWeight.w800,
                              fontSize: 24)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
