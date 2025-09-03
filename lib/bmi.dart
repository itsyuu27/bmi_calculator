class Bmi {
  double height;
  double weight;
  String? measureSystem;
  late double bmiResult;

  Bmi({required this.height, required this.weight, required this.measureSystem});

  double calculateBmi(){
    if(height <= 0){
      throw ArgumentError("Height must be greater than 0.");
    }

    if(measureSystem == "Metric"){
      bmiResult = weight / (height * height);
    }

    if(measureSystem == "Imperial"){
      bmiResult = (weight / (height * height)) * 703;
      print(bmiResult);
    }
    return bmiResult;
  }

  String getClassification(){
    if(bmiResult < 18.5){
      return 'Underweight';
    }
    else if(bmiResult >= 18.5 && bmiResult <= 24.9){
      return 'Healthy Weight';
    }
    else if(bmiResult >= 25.0 && bmiResult <= 29.9){
      return 'Overweight';
    }
    else{
      return 'Obese';
    }
  }
}