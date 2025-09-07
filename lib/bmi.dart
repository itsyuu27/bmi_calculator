class Bmi {
  double height;
  double weight;
  String? measureSystem;

  Bmi({required this.height, required this.weight, required this.measureSystem});

  double calculateBmi(){
    if(height <= 0 || weight <= 0){
      throw ArgumentError("Height and Weight must be greater than 0.");
    }

    double convertedHeight;

    if(measureSystem == "Metric"){
      convertedHeight = height / 100;
      return weight / (convertedHeight * convertedHeight);
    }
    else if(measureSystem == "Imperial"){
      convertedHeight = height;
      return (weight / (convertedHeight * convertedHeight)) * 703;
    }
    else{
      throw ArgumentError("Unsupported measurement system: $measureSystem");
    }
  }

  String getClassification(double bmiResult){
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