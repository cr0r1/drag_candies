import 'dart:math';

class CandieColor {
  CandieColor({required this.otherVariable});
  int color = generateRandomColor();
  int otherVariable;
}

int generateRandomColor() {
  Random random = Random();
  int randomNumber = random.nextInt(5) + 1;
  // debugPrint(randomNumber.toString());&
  return randomNumber;
}
