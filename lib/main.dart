import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: MainScreen(),
  )
);

class MainScreen extends StatelessWidget {
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

      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 20),
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                  spreadRadius: 1
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ 
                Text("Enter your BMI",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Height',
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Weight',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                  ),
                  child: Text('Calculate BMI'),
                ),
                /* Text("Results",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}