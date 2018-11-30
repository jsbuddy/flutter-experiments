import 'package:experiments/useless/input.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up', style: TextStyle(fontSize: 15.0),),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Forms().buildTextField(
                      context, 'First Name', null, TextInputType.text, false),
                  Forms().buildTextField(
                      context, 'Last Name', null, TextInputType.text, false),
                  Forms().buildTextField(context, 'Email Address', null,
                      TextInputType.emailAddress, false),
                  Forms().buildTextField(
                      context, 'Password', null, TextInputType.text, true),
                  Forms().buildTextField(context, 'Confirm Password', null,
                      TextInputType.text, true),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text('Register'),
                      onPressed: () {},
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
