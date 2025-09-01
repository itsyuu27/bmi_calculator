import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: MainScreen(),
  )
);

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //topbar
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: Text('BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // TODO: add a textfield for the height and weight
      body: Center(
        child: Text('add a textfield.'),
      ),

    );
  }
}