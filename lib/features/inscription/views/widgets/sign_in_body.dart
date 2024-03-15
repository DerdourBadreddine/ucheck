import 'package:flutter/widgets.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 571,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 385,
                  ),
                  Text("Welcome !"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("make your exams less frustrating"),
                ]),
          ),
        ),
      ],
    );
  }
}
