class Bmi {
  double height;
  double weight;

  Bmi({required this.height, required this.weight});

  double CalculateBmi(){
    if(height <= 0){
      throw ArgumentError("Height must be greater than 0.");
    }

    return weight / (height * height);
  }
}