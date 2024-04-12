import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class SignUpViewbody extends StatelessWidget {
  const SignUpViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Container(
            width: double.infinity,
            height:500,
            decoration: const BoxDecoration(
              image: DecorationImage(
              image: AssetImage("assets/images/bg2.png"),
              fit: BoxFit.fill)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal:24),
              ),
            ),

            )
        ],
      ),
    );
  }
}
