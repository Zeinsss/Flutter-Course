enum Direction { north, east, south, west }

class Position {
    int x;
    int y;
    Position(this.x, this.y);
  }
class Robot {
  Position position;
  Direction direction;
  
  Robot(this.position, this.direction);

  Robot turnRight(Robot robot) {
    switch(robot.direction.name){
      case 'north':
        robot.direction = Direction.east;
        break;
      case 'east':
        robot.direction = Direction.south;
        break;
      case 'south':
        robot.direction = Direction.west;
        break;
      case 'west':
        robot.direction = Direction.north;
        break;
    }
    return robot;
  }
  Robot turnLeft(Robot robot) {
    switch(robot.direction.name){
      case 'north':
        robot.direction = Direction.west;
        break;
      case 'east':
        robot.direction = Direction.north;
        break;
      case 'south':
        robot.direction = Direction.east;
        break;
      case 'west':
        robot.direction = Direction.south;
        break;
    }
    return robot;
  }
  Robot advanceForward(Robot robot) {
    if (direction == Direction.north) {
      robot.position.y++;
      return robot;
    }
    else if (direction == Direction.east) {
      robot.position.x++;
      return robot;
    }
    else if (direction == Direction.south) {
      robot.position.y--;
      return robot;
    }
    else if (direction == Direction.west) {
      robot.position.x--;
      return robot;
    }
    return robot;
  }

  Robot action(Robot robot, String instruction) {
    for (int i = 0; i < instruction.length; i++) {
      if (instruction[i] == 'R'){
        turnRight(robot);
      }
      else if (instruction[i] == 'L') {
        turnLeft(robot);
      }
      else if (instruction[i] == 'A') {
        advanceForward(robot);
      }
    }
    return this;
  }
}

void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALARAALAL";

  // Process the instructions and get the final position and direction
  
  Position position = Position(x, y);

  Robot robot = Robot(position, direction);

  robot.action(robot, instructions);

  // Print the final position and direction
  print("Final position:  (${robot.position.x}, ${robot.position.y})");
  print("Facing:  ${robot.direction.name}");
}
