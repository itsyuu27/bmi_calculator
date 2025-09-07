# BMI Calculator

A simple Flutter app that calculates a user's Body Mass Index (BMI) based on their height and weight, and provides a health classification.

---

### Features

* **Dual Measurement Systems**: Supports both the **Metric** (kilograms, meters) and **Imperial** (pounds, inches) systems.
* **Dynamic UI**: The input field labels change dynamically to guide the user to enter the correct units based on their selected measurement system.
* **Input Validation**: Ensures that the user enters valid numerical data and displays clear error messages for empty or invalid inputs.
* **Health Classification**: Classifies the calculated BMI into standard health categories (Underweight, Healthy Weight, Overweight, and Obese).
* **User Feedback**: Displays a pop-up message (Snackbar) to alert the user if they try to calculate their BMI without selecting a measurement system.
* **Error Handling**: Catches potential errors, such as a height of zero, to prevent the app from crashing.

---

### Getting Started

Follow these steps to get a copy of the project up and running on your local machine.

#### Prerequisites

* **Flutter SDK**: Ensure you have Flutter installed. You can follow the official [Flutter installation guide](https://flutter.dev/docs/get-started/install).
* An IDE like VS Code or Android Studio with the Flutter and Dart plugins.

#### Running the App

1.  Clone the repository:
    ```
    git clone [https://github.com/your-username/bmi_calculator.git](https://github.com/your-username/bmi_calculator.git)
    ```
    (Note: Replace the URL with your actual repository URL)
2.  Navigate to the project directory:
    ```
    cd bmi_calculator
    ```
3.  Install the required dependencies:
    ```
    flutter pub get
    ```
4.  Run the app on a connected device or emulator:
    ```
    flutter run
    ```

---

### Code Structure

The project is organized into two main files to separate the UI and business logic.

* `lib/main.dart`: Contains the `MainScreen` StatefulWidget, which is responsible for building the user interface, managing state, handling user input, and displaying the results.
* `lib/bmi.dart`: Defines the `Bmi` class, which holds the core logic for calculating the BMI and determining the health classification based on the chosen measurement system.

---

### Usage

1.  Launch the app on your device.
2.  Select your preferred **Measurement System** from the dropdown menu.
3.  Enter your **Height** and **Weight** in the corresponding text fields.
4.  Tap the **"Calculate BMI"** button to view your result and classification.
