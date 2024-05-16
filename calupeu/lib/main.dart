import 'package:calupeu/comp/CustomAppBar.dart';
import 'package:calupeu/comp/CustomAppBarx.dart';
import 'package:calupeu/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import './comp/CalcButton.dart';
import 'dart:math' as math;

void main() => runApp(CalcApp());

class CalcApp extends StatefulWidget {
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String valorAnt = '';
  String operador = '';
  TextEditingController _controller = TextEditingController();

  void numClick(String text) {
    setState(() => _controller.text += text);
  }

  void clear(String text) {
    setState(() {
      _controller.text = '';
    });
  }

  void opeClick(String text) {
    setState(() {
      valorAnt = _controller.text;
      operador = text;
      _controller.text = '';
    });
  }

  void accion() {
    setState(() {
      // Acción personalizada
    });
  }

  void resultOperacion(String text) {
    setState(() {
      double num1 = double.tryParse(valorAnt) ?? 0;
      double num2 = double.tryParse(_controller.text) ?? 0;
      switch (operador) {
        case "/":
          _controller.text = (num1 / num2).toString();
          break;
        case "*":
          _controller.text = (num1 * num2).toString();
          break;
        case "+":
          _controller.text = (num1 + num2).toString();
          break;
        case "-":
          _controller.text = (num1 - num2).toString();
          break;
        case "%":
          _controller.text = (num1 % num2).toString();
          break;
        case "√":
          _controller.text = math.sqrt(num2).toString();
          break;
        case "π":
          _controller.text = (math.pi).toString();
          break;
        case "^2":
          _controller.text = math.pow(num2, 2).toString();
          break;
        case "^":
          _controller.text = math.pow(num1, num2).toString();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<List> labelList = [
      ["AC", "C", "%", "/"],
      ["7", "8", "9", "*"],
      ["4", "5", "6", "-"],
      ["1", "2", "3", "+"],
      [".", "0", "00", "="],
      ["√", "π", "^2", "^"]
    ];
    List<List<Function>> funx = [
      [clear, clear, opeClick, opeClick],
      [numClick, numClick, numClick, opeClick],
      [numClick, numClick, numClick, opeClick],
      [numClick, numClick, numClick, opeClick],
      [numClick, numClick, numClick, resultOperacion],
      [opeClick, opeClick, opeClick, opeClick]
    ];
    AppTheme.colorX = Colors.blue;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.themeDataLight,
      darkTheme: AppTheme.themeDataDark,
      home: Scaffold(
        appBar: CustomAppBarx(accionx: accion),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  textAlign: TextAlign.end,
                  controller: _controller,
                ),
              ),
              SizedBox(height: 20),
              ...List.generate(
                labelList.length,
                (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                      labelList[index].length,
                      (indexx) => CalcButton(
                        text: labelList[index][indexx],
                        callback: funx[index][indexx],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'YUNGANINA MAMANI GARY FERNANDO',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
