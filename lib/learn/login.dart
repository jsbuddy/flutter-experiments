import 'package:experiments/useless/input.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(children: <Widget>[
            Container(
              padding: EdgeInsets.all(24.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50.0),
                  CircleAvatar(
                    child: Icon(
                      Icons.adb,
                      color: Theme.of(context).accentIconTheme.color,
                    ),
                    backgroundColor: Theme.of(context).backgroundColor,
                  ),
                  SizedBox(height: 80.0),
                  Forms().buildTextField(context, 'Email', Icons.email,
                      TextInputType.emailAddress, false),
                  SizedBox(
                    height: 10.0,
                  ),
                  Forms().buildTextField(context, "Password",
                      Icons.lock_outline, TextInputType.text, true),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlineButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed("Register"),
                          child: Text(
                            'Sign up',
                            style: Theme.of(context).accentTextTheme.button,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text('Login'),
                          elevation: 0.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  FlatButton(
                    child: Text(
                      'Forgot password?',
                      style: Theme.of(context).accentTextTheme.button,
                    ),
                    onPressed: () => {},
                  ),
                  IconButton(
                    icon: Icon(Icons.functions),
                    onPressed: () =>
                        Navigator.of(context).pushNamed("Calculator"),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
