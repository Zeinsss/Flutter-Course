class Roof{
  double width;
  double height;

  Roof(this.width, this.height);

  @override
  String toString() {
    return "Roof: Width($width), Height($height)";
  }
}
class Window {
  String shape;
  String color;
  int floor;
  String location;
  double width;
  double height;

  Window(this.shape, this.color, this.floor, this.location, this.height, this.width);
  @override
  String toString() {
    return "Window: Width($width), Height($height), Location($location), Floor($floor), Color($color), Shape($shape)";
  }
}
class Door {
  double width;
  double height;
  Door(this.height, this.width);

  @override
  String toString() {
    return "Door: Width($width), Height($height)";
  }
}
class Chimney{
  double height;
  double width;
  String location;

  Chimney(this.height, this.width, this.location);

  @override
  String toString() {
    return "Chimney: Width($width), Height($height), Location($location)";
  }
}

class House{
  double width;
  double height;
  int floor_amount;

  Roof roof;
  List<Window> windows = [];
  Door door;
  Chimney chimney;
  
  House(this.chimney,this.door,this.floor_amount,this.height,this.roof,this.width);

  void addWindows(Window newWindow) {
    this.windows.add(newWindow);
  }
  @override
  String toString() {
    String result = "House{\n\t${chimney}\n\t${door}\n\t${roof}\n\tWindows:";
    
    for (var i = 0; i < windows.length; i++) {
      result = result + "\n\t\tWindow ${i+1}: ${windows[i]}";
    }
    result = result + "\n}";
    return result;
  }
}

void main() {
  Window l1 = Window("Rectangle", "Red", 1, "Left", 1.5, 2.5);
  Window l2 = Window("Rectangle", "Green", 2, "Center", 1.5, 2.5);
  Chimney chimney = Chimney(1.1, 1.55, "Right");
  Door door = Door(2.25, 1.2);
  Roof roof = Roof(3, 4);
  House house = House(chimney, door, 2, 10, roof, 20);
  house.addWindows(l1);
  house.addWindows(l2);
  print(house);

}