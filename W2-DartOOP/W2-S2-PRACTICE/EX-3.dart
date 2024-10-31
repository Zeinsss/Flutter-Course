
const double toHours = toMinutes * 60;
const double toMinutes = toSeconds * 60;
const double toSeconds = 1000;

class MyCustomDuration {
  double _milliseconds = 0;

  double get milliseconds => _milliseconds;

  set milliseconds(double newMiliseconds) {
    if (newMiliseconds >= 0) {
      _milliseconds = newMiliseconds;
    }
    else {
      throw new ArgumentError("Duration must not be in negative value");
    }
  } 

  MyCustomDuration([double initialMilliseconds = 0]) {
    milliseconds = initialMilliseconds;
  }

  MyCustomDuration.fromHours(int hours): this._milliseconds = hours * toHours;
  MyCustomDuration.fromMinutes(int minutes): this._milliseconds = minutes * toMinutes;
  MyCustomDuration.fromSeconds(int seconds): this._milliseconds = seconds * toSeconds;
  
  

  bool operator >(covariant MyCustomDuration newDuration) {
    if (this._milliseconds > newDuration._milliseconds) return true;
    else {
      return false;
    } 
  }

  MyCustomDuration operator +(covariant MyCustomDuration newDuration) {
    
    return MyCustomDuration(this._milliseconds + newDuration._milliseconds);
  }

  MyCustomDuration operator -(covariant MyCustomDuration newDuration) {
    if (this._milliseconds >= newDuration._milliseconds){
      return MyCustomDuration(this._milliseconds - newDuration._milliseconds);
    }
    else {
      throw new ArgumentError("Duration cannot be negative value");
    }
  }
  




  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyCustomDuration duration1 = MyCustomDuration.fromHours(3); // 3 hours
  MyCustomDuration duration2 = MyCustomDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
  try {
    MyCustomDuration duration3 = MyCustomDuration(-3.2);
  } catch (e) {
    print(e);
  }
}
