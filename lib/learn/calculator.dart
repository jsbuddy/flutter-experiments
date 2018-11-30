import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _current = '';
  String _previous = '';
  String _expression = '';
  String _holder = '';
  bool _operatorClicked = false;
  bool _equalClicked = false;
  var _operation;

  Widget button(String text, operator, handler) {
    return RawMaterialButton(
      child: Text(text, style: TextStyle(fontSize: 25.0, color: Colors.white)),
      onPressed: handler,
      fillColor: operator ? Colors.black45 : null,
      elevation: 0.0,
    );
  }

  equals() {
    setState(() {
      _expression = '$_expression $_current';
      _current =
          '${_operation(double.parse(_previous), double.parse(_current))}';
      _operatorClicked = false;
      _equalClicked = true;
      _previous = '';
    });
  }

  expression(operator) {
    setState(() {
      _expression =
          '${_expression.isNotEmpty ? '($_expression ${_equalClicked ? '' : _holder}) $operator' : '$_current $operator'}';
      _holder = '';
      _equalClicked = false;
    });
  }

  operate(operator) {
    if (_current.isNotEmpty && _previous.isNotEmpty) {
      _current =
          '${_operation(double.parse(_previous), double.parse(_current))}';
    }
    switch (operator) {
      case 'add':
        _operation = (a, b) => (a + b).toString();
        expression('+');
        break;
      case 'substract':
        _operation = (a, b) => (a - b).toString();
        expression('-');
        break;
      case 'multiply':
        _operation = (a, b) => (a * b).toString();
        expression('*');
        break;
      case 'divide':
        _operation = (a, b) => (a / b).toString();
        expression('/');
        break;
    }
    _operatorClicked = true;
    _previous = _current;
    debugPrint(_expression);
  }

  append(String str) {
    setState(() {
      if (_operatorClicked) _current = '';
      _current = (_current.isEmpty) ? '$str' : '$_current$str';
      if (_holder.isNotEmpty) {
        _holder = '$_holder$str';
      } else {
        _holder = str;
      }
      _operatorClicked = false;
    });
  }

  clear() {
    setState(() {
      _current = '';
      _previous = '';
      _expression = '';
      _holder = '';
      _operatorClicked = false;
      _operation = null;
    });
  }

  backspace() => display('${_current.substring(0, _current.length - 1)}');

  percent() {
    display('${double.parse(_current) / 100}');
    setState(() {
      _expression = '($_expression) / 100';
    });
  }

  dot() => display(_current.contains('.') ? _current : '$_current.');

  display(str) {
    setState(() {
      _current = str;
    });
  }

  show(context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => ListView(
          children: <Widget>[
            ListTile(
              title: Text('Jude Francis'),
              subtitle: Text('judecode@yahoo.com'),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text('Jason Kaeze'),
              subtitle: Text('jaysins@gmail.com'),
              leading: Icon(Icons.person_outline),
            ),
            ListTile(
              title: Text('Victor Francis'),
              subtitle: Text('judecode@yahoo.com'),
              leading: Icon(Icons.person_pin_circle),
            ),
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 143.0,
//            color: Colors.black38,
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Text(
                      _expression,
                      style: TextStyle(fontSize: 18.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                    alignment: FractionalOffset.centerRight,
                  ),
                  Expanded(
                    child: Container(
                      alignment: FractionalOffset.bottomRight,
                      child: Text(
                        _current.isEmpty ? '0' : _current.toString(),
                        style: TextStyle(fontSize: 40.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height - 143.0,
                color: Colors.red,
                child: GridView.count(
                  crossAxisCount: 4,
                  padding: EdgeInsets.all(0.0),
                  children: <Widget>[
                    button('C', false, () => clear()),
                    button('%', false, () => percent()),
                    button('👈', false, () => backspace()),
                    button('÷', true, () => operate('divide')),
                    button('7', false, () => append('7')),
                    button('8', false, () => append('8')),
                    button('9', false, () => append('9')),
                    button('x', true, () => operate('multiply')),
                    button('4', false, () => append('4')),
                    button('5', false, () => append('5')),
                    button('6', false, () => append('6')),
                    button('-', true, () => operate('substract')),
                    button('1', false, () => append('1')),
                    button('2', false, () => append('2')),
                    button('3', false, () => append('3')),
                    button('+', true, () => operate('add')),
                    button('0', false, () => append('0')),
                    button('.', false, () => dot()),
                    button('🎁', false, () => show(context)),
                    button('=', true, () => equals()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
