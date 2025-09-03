import 'package:flutter/material.dart';
import 'bmi.dart';

void main() => runApp(MaterialApp(
    home: MainScreen(),
  )
);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String _bmiResult = '';
  String _classification = '';
  String? _selectedMeasurement;
  final _formKey = GlobalKey<FormState>();

  //text editing controller for the textfields
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  //disposing controllers
  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

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
            child: Form(
              key: _formKey,
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

                  DropdownButton<String>(
                    value: _selectedMeasurement,
                    hint: const Text('Select Measurement'),
                    items: <String>['Metric', 'Imperial']
                      .map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }
                    ).toList(),
                    onChanged: (String? newValue){
                      setState(() {
                        _selectedMeasurement = newValue;
                      });
                    }
                  ),

                  SizedBox(
                    width: 200,
                    //Textfield for height
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      controller: _heightController,
                      decoration: InputDecoration(
                        labelText: _selectedMeasurement == 'Metric' ? 'Height(Meters)' : 'Height(Inches)',
                      ),
                      validator: (value){
                        //check weight textfield is empty or null
                        if(value == null || value.isEmpty)
                        {
                          return 'Please Enter your height.';
                        }
                        if(double.tryParse(value) == null)
                        {
                          return 'Please Enter a valid number.';
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(
                    width: 200,
                    //Textfield for weight
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      controller: _weightController,
                      decoration: InputDecoration(
                        labelText: _selectedMeasurement == 'Metric' ? 'Weight(Kilograms)' : "Weight(Pounds)",
                      ),
                      validator: (value){
                        //check if weight textfield is empty or null
                        if(value == null || value.isEmpty)
                        {
                          return 'Please Enter your weight.';
                        }
                        if(double.tryParse(value) == null)
                        {
                          return 'Please Enter a valid number.';
                        }
                        return null;
                      },
                    ),
                  ),

                  //button for retrieving the input
                  ElevatedButton(
                    onPressed: () {
                      //check the validation
                      if(_formKey.currentState!.validate())
                      {
                        if(_selectedMeasurement != null){
                          final double height = double.parse(_heightController.text);
                          final double weight = double.parse(_weightController.text);

                          try
                          {
                            //create an instance of Bmi class
                            final bmiCalculator = Bmi(
                              height: height,
                              weight: weight,
                              measureSystem: _selectedMeasurement
                            );
                  
                            //upadate the state to display result
                            setState(() {
                              _bmiResult = bmiCalculator.calculateBmi().toStringAsFixed(2);
                              _classification = bmiCalculator.getClassification().toString();
                            });
                          }
                          on ArgumentError catch(e)
                          {
                            //set result message to error
                            setState(() {
                              _bmiResult = "Error: ${e.message}";
                            });
                          }
                        }
                        else{
                          setState(() {
                            _bmiResult = "";
                            _classification = "";
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please Choose a Measurement System"),
                            )
                          );
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.lightBlueAccent),
                      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text('Calculate BMI'),
                  ),

                  //Show only after the result was updated
                  if(_bmiResult.isNotEmpty)
                  Column(
                    children: [
                      Text('Result',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text("Your BMI: $_bmiResult",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text("Your Classification: $_classification",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}