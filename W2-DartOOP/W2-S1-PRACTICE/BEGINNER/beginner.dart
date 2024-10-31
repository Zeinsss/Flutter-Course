enum Shape{Rectangle, Half_Circle, Square, Circle, Pyramid}

enum Color{Red, White, Black}

enum Position{Left, Right, Center}

enum RoomType {Kitchen, Living_Room, Bedroom, Bathroom, Storage}

class Flower {
  final String name;
  final double age;

  Flower(this.name, this.age);

  @override
  String toString() {
    return "Name: $name, Age: $age";
  }
}

class GardenBed {
  final List<Flower> flowers = [];
  int amount;
  final Position position;
  final int limit;

  GardenBed(this.position, this.limit): this.amount = 0;

  void addFlower(Flower newFlower) {
    this.flowers.add(newFlower);
    this.amount++;
  }

  @override
  String toString() {
    String result = "Garden Bed: \n\t\tAmount: $amount\n\t\tPosition: $position\n\t\t Limit: $limit";
    for (var i = 0; i < flowers.length; i++) {
      result = result + "\n\t\t\tFlower: ${flowers[i]}";
    }
    return result;
  }
}

class Tree {
  final String name;
  final Position position;

  Tree(this.name, this.position);

  @override
  String toString() {
    // TODO: implement toString
    return "Name: $name, Position: ${position.name}";
  }

}

class Garden {
  final List<GardenBed> gardenBeds = [];
  final Fence fence;
  final List<Tree> trees = [];

  Garden(this.fence);  

  void addGardenBeds(GardenBed newBed) {
    this.gardenBeds.add(newBed);
  }

  void addTree(Tree newTree) {
    this.trees.add(newTree);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Fence: $fence\n\tGarden Beds: $gardenBeds\n\tTrees: $trees";
  }


}

class Fence {
  final String material;
  final Color color;

  Fence(this.material, this.color);

  @override
  String toString() {
    // TODO: implement toString
    return "Material: $material, Color: ${color.name}";
  }
}

class Stair {
  final int step;
  final Position position;
  final int floor;

  Stair(this.step, this.position, this.floor);

  @override
  String toString() {
    // TODO: implement toString
    return "Step: $step, Position: ${position.name}";
  }  
}

class Room {
  final double width;
  final double height;
  final Door door;
  final RoomType type;
  final int floor;
  final List<Window> windows=[];
  Room(this.door, this.height, this.width, this.type, this.floor);

  @override
  String toString() {
    // TODO: implement toString
    return "Width: $width, Height: $height, Door: $door, Room Type: $type, Floor: $floor";
  }

}

class Roof{
  final double width;
  final double height;
  final Shape shape;
  final Color color;

  Roof(this.width, this.height, this.color): this.shape = Shape.Pyramid;

  @override
  String toString() {
    return "Roof: Width($width), Height($height)";
  }
}
class Window {
  final Shape shape;
  final Color color;
  final int floor;
  final Position position;
  final double width;
  final double height;

  Window(this.color, this.floor, this.position, this.height, this.width): this.shape = Shape.Rectangle;
  @override
  String toString() {
    return "Window: Width($width), Height($height), Location($position), Floor($floor), Color($color), Shape($shape)";
  }
}
class Door {
  final double width;
  final double height;
  final Shape shape;
  final Position position;
  Door(this.height, this.width, this.position): this.shape = Shape.Rectangle;

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
  List<Room> rooms = [];
  List<Stair> stairs = [];
  Garden garden;

  
  House(this.chimney,this.door,this.floor_amount,this.height,this.roof,this.width, this.garden);

  void addWindows(Window newWindow) {
    this.windows.add(newWindow);
  }
  void addRoom(Room newRoom) {
    this.rooms.add(newRoom);
  }
  void addStair(Stair newStair) {
    this.stairs.add(newStair);
  }

  @override
  String toString() {
    String result = "House{\n\t${chimney}\n\t${door}\n\t${roof}\n\tWindows:";
    
    for (var i = 0; i < windows.length; i++) {
      result = result + "\n\t\tWindow ${i+1}: ${windows[i]}";
    }
    result = result + "\nGarden: $garden\nRooms: $rooms\n}";
    return result;
  }
}

void main() {
  Window l1 = Window(Color.Red, 1, Position.Left, 2, 5);
  Window r1 = Window(Color.White, 1, Position.Right, 3, 4);
  Chimney chimney = Chimney(1.1, 1.55, "Right");
  Door roomDoor = Door(4, 10, Position.Center);
  Roof roof = Roof(20, 10, Color.Red);
  Flower f1 = Flower("Rose", 10); // Assuming age unit is day
  Flower f2 = Flower("Lavender", 5);
  GardenBed bed1 = GardenBed(Position.Left, 20);
  GardenBed bed2 = GardenBed(Position.Right, 10);
  bed1.addFlower(f1);
  bed1.addFlower(f2);
  bed2.addFlower(f1);
  Fence fence = Fence("wood", Color.Red); 
  Garden garden = Garden(fence);
  Tree tree = Tree("Apple", Position.Center);
  garden.addTree(tree);
  garden.addGardenBeds(bed1);
  Door houseDoor = Door(10, 8, Position.Center);
  House house = House(chimney, houseDoor, 2, 10, roof, 20, garden);
  Room room1 = Room(roomDoor, 10, 5, RoomType.Bedroom, 1);
  Room room2 = Room(roomDoor, 10, 10, RoomType.Living_Room, 1);
  house.addWindows(l1);
  house.addWindows(r1);
  house.addRoom(room2);
  house.addRoom(room1);
  print(house);

}