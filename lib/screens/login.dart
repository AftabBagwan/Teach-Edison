import 'package:flutter/material.dart';
import 'package:teach_edison/screens/dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String securityKey;
  bool error = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(
                onChanged: (value) {
                  securityKey = value;
                },
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.deepOrange,
                    width: 2.0,
                  )),
                  hintText: 'Enter security key',
                  labelText: 'Security Key',
                  errorText: error ? 'Incorrect Key' : null,
                  prefixIcon: const Icon(Icons.vpn_key),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(2.0),
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 50, left: 50),
              color: Colors.deepOrange,
              onPressed: () {
                if (securityKey == 'enterapp') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ));
                } else {
                  setState(() {
                    error = true;
                  });
                }
              },
              child: const Text(
                'Validate',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
