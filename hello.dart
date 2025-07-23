import 'dart:io';  // Allows input/output operations

void main() {
  print("Enter your name");  // Prompts the user
  String? name = stdin.readLineSync() ?? 'Unknown';  // Reads user input and assigns 'Unknown' if null
  print('Hello $name');  // Prints greeting
}
