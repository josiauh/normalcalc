import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'justbfdilines.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Normal Calc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system, // Use system theme mode
      home: MyHomePage(title: 'Normal Calc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: use_super_parameters
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = "0";
  String _input = "";
  bool _shouldClear = false;
  int _bfdicounter = -1;
  int triplebaka = 0;
  bool tetodone = false;
  bool mikudone = false;
  bool nerudone = false;
  final TextEditingController _controller = TextEditingController();

  void _buttonPressed(String buttonText) {
    if (_shouldClear && buttonText != "=") {
      _input = "";
      _controller.clear();
      _shouldClear = false;
    }
    setState(() {
      if (buttonText == "C") {
        _input = "";
        _output = "0";
        _bfdicounter = -1;
        _controller.clear();
      } else if (buttonText == "=") {
        try {
          _output = _calculateResult(_input);
        } catch (e) {
          _output = "Error";
        }
      } else {
        _input += buttonText;
        _controller.text = _input;
      }
    });
  }

  String _calculateResult(String input) {
    // Simple calculation logic (only supports +, -, *, /)
    // Note: This is a very basic implementation and does not handle all edge cases.
    _shouldClear = true;
    try {
      if (kDebugMode) {
        print(input);
      }
      switch (input) {
        case "0/0":
          return "use a calculator";
        case "calc":
          return "(short for calculator)";
        case "2763":
          _bfdicounter++;
          if (_bfdicounter == bfdiLines.length) {
            _bfdicounter = 0;
          }
          return bfdiLines[_bfdicounter];
        case "teto":
          tetodone = true;
          if (nerudone && tetodone && mikudone) {
            return "Baka baka baka! Nani ga koko made anata o ugokasu no?";
          }
          return "THIS IS MY KASANE TERRITORY";
        case "miku":
          mikudone = true;
          if (nerudone && tetodone && mikudone) {
            return "Baka baka baka! Nani ga koko made anata o ugokasu no?";
          }
          return "MIKU MIKU BEAAAAAAAMMMMM";
        case "neru":
          nerudone = true;
          if (nerudone && tetodone && mikudone) {
            return "Baka baka baka! Nani ga koko made anata o ugokasu no?";
          }
          return "MePhone 4";
        case "taco":
          return "Look at them, it's, so pathetic! How they run to fetch their sticks.";
        case "cute winter boots":
          return "Deny. Defend. Depose.";
        case "banme":
          return "You've been banned from Normal Calc.";
        case "1337":
          return "CALCULEETOR ACTIVATED!!!!";
        case "its time for the":
          return "Wheel, vase, the sun, words with friends tile...";
        case "yeeps":
          return "Build, Play, Yeep.";
        case "gtag":
          return "Where a kid can be a racist.";
        case "where there's rain theres thunder":
          return "💨";
        case "rotten":
          return "I swore I'd never sin again";
        case "massive":
          return "LOW TAPER FADE";
        case "adobe":
          return "MONEY!!! ARG ARG ARG ARG ARG";
        case "pinkeye":
          return "VERY DEADLY";
        case "x":
          return "You mean Twitter?";
        case "twitter":
          return "You mean X?";
        case "cupertino":
          return "Preinstalled";
        case "gg no re":
          showDialog(context: context, builder: (BuildContext context) => _buildNoRe(context));
          return "no re";
        case "Wireless Fidelity":
          return "WRONG!!!";
      }
      double result = double.parse(input);
      if (result.truncateToDouble() == result) {
        return result.truncate().toString();
      }
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  Widget _buildNoRe(BuildContext context) {
    return AlertDialog(
      title: const Text("gg no re"),
      content: const Text("gg no re."),
      actions: [
          ElevatedButton(
            onPressed: () => exit(667073),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16),
              textStyle: TextStyle(fontSize: 24),
            ),
            child: Text("Recover", style: TextStyle(fontSize: 24)),
          ),
        ],
      );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          textStyle: TextStyle(fontSize: 24),
        ),
        child: Text(buttonText, style: TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: TextField(
                controller: _controller,
                style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 112, 112, 112)),
                decoration: InputDecoration(border: InputBorder.none, icon: Icon(CupertinoIcons.add_circled_solid, color: Colors.amber, size: 24.0, semanticLabel: "Equation Field Icon",)),
                onChanged: (text) {
                  if (kDebugMode) {
                    print("got text change");
                    print(text);
                  }
                  _input = text;
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("/"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("*"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("C"),
                  _buildButton("0"),
                  _buildButton("="),
                  _buildButton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("."),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}