void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  List<int> output = scores.where((i)=> i >= 50).toList(); 
  print(output);
  var count = output.length;
  print("$count student has passes.");
}