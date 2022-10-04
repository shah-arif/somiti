import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'admin_control_screen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({
    Key? key,
  }) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password"
                ),
                obscureText: true,
                validator: (value) {
                  var pass = "12345";
                  if (value != pass || value!.isEmpty) {
                    return 'Wrong Input';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminControlScreen()));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
