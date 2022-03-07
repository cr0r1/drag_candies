import 'dart:math';

class CandieColor {
  int color = generateRandomColor();
  int otherVariable = 2;
}

int generateRandomColor() {
  Random random = Random();
  int randomNumber = random.nextInt(6) + 1;
  return randomNumber;
}
