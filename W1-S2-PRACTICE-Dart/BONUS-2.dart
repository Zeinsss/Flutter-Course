
bool match(String input) {
  const List<String> leftBracket = ["{", "[", "("];
  const List <String> rightBracket = ["}", "]", ")"];
  int i = 0;
  int j = input.length - 1;
  bool matched = true;
  String temp = "";

  while (i < j) {
    // Left side
    if (leftBracket.contains(input[i])) {
      
      if (input[i] == '{') {
        temp = '}';
        if (temp == input[j]) {
          input = input.substring(i+1, j);
          i = 0;
          j = input.length-1;
        }
        else if (input[i] != input[j]){
          j--;
          if (j <= i) {
            matched = false;
            break;
          }
        }
      }
      else if (input[i] == '[') {
        temp = ']';
        if (temp == input[j]) {
          input = input.substring(i+1, j);
          i = 0;
          j = input.length-1;
        }
        else if (input[i] != input[j]){
          j--;
          if (j <= i) {
            matched = false;
            break;
          }
        }
      }
      else if (input[i] == '(') {
        temp = ')';
        if (temp == input[j]) {
          input = input.substring(i+1, j);
          i = 0;
          j = input.length-1;
        }
        else if (input[i] != input[j]){
          j--;
          if (j <= i) {
            matched = false;
            break;
          }
        }
      }
    }

    // Right Side
    else if (rightBracket.contains(input[j])) {
      if (input[j] == '}') {
        temp = '{';
        if (temp == input[i]) {
          input = input.substring(i+1,j);
          i = 0;
          j = input.length-1;
        }
        else {
          i++;
          if (i >= j) {
            matched = false;
            break;
          }
        }
      }
      else if (input[j] == ']') {
        temp = '[';
        if (temp == input[i]) {
          input = input.substring(i+1, j);
          i = 0;
          j = input.length-1;
        }
        else if (input[i] != input[j]){
          i++;
          if (i >= j) {
            matched = false;
            break;
          }
        }
      }
      else if (input[j] == ')') {
        temp = '(';
        if (temp == input[i]) {
          input = input.substring(i+1,j);
          i = 0;
          j = input.length-1;
        }
        else {
          i++;
          if (i >= j) {
            matched = false;
            break;
          }
        }
      }
    }
    else {
      i++;
      j--;
    }
  }
  print("Remainder result: $input");
  if (matched){
    return true;
  } 
  else 
  {
    return false;
  }
}
void main() {
  // Test case
  String input =
    "{what is (42)}"
    // "[text}"
    // "{[[(a)b]c]d}"
  ;

  // It actually works
  if (match(input) == true) {
    print("Balanced");
  }
  else {
    print("Not Balanced");
  }
  // String test = "(";
  // print(test.codeUnits);

}