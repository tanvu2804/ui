import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/logo.png",
                width: 150,
                height: 150,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Wellcome back!",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("Login to your account"),
              ),
              TextFormFieldCustom(
                hintText: "Username",
                icon: FontAwesomeIcons.user,
              ),
              TextFormFieldCustom(
                hintText: "Password",
                icon: Icons.lock_outline,
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(child: DottedLine()),
                Text("Or sign in with"),
                Expanded(child: DottedLine()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonIconCustom(
                  icon: Image.asset("assets/icons/ic_google.png"),
                ),
                ButtonIconCustom(
                  icon: Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.blue[800],
                  ),
                ),
                ButtonIconCustom(
                  icon: Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "Don't have an account?",
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: "Sign up here",
                    style: TextStyle(
                        color: Color(0xff70c1fe), fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, "/signUp");
                      })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ButtonIconCustom extends StatelessWidget {
  const ButtonIconCustom({super.key, required this.icon});
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 45,
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Color(0xff70c1fe).withOpacity(0.5),
              blurStyle: BlurStyle.outer,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: icon,
      ),
    );
  }
}

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({super.key, this.hintText, this.icon});

  final String? hintText;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0xff70c1fe).withOpacity(0.5),
                  blurStyle: BlurStyle.outer,
                ),
              ],
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(70, 10, 10, 10),
                hintText: hintText ?? "",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0xff70c1fe).withOpacity(0.5),
                  blurStyle: BlurStyle.outer,
                ),
              ],
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
