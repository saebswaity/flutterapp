import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/Screens/Waiting/Waiting.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var value1 = "324234fvsd";

    // Fetch content from the json file
    Future<void> readJson() async {
      final String response =
          await rootBundle.loadString('assets/employee data/dataemp.json');
      final data = await json.decode(response);
      setState(() {
        value1 = data["email"];
      });
    }

    Future<void> writejson(c) async {
      final String response =
          await rootBundle.loadString('assets/employee data/dataemp.json');
      final data = await json.decode(response);
      setState(() {
        data["email"] = c;
      });
    }

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            /*
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            */
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your ID",
              onChanged: (value) {
                readJson();
                print(value1);
                print(value);
                writejson(value);
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                //value = value1;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Waiting();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
