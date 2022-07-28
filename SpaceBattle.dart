import "dart:math";

abstract class SpaceShip{
  String name = "";
  double health = 0;
  double firePower = 0;
  double armor = 0;
  double dodge = 0;
  // Figure methods of battle
  // Determine (not) hit
  // Determine win/loss (when HP < 0)
}

// Battleships

// Armored Ship has high HP and can ignore x amount of damage
// But it has low damage
class ArmoredShip extends SpaceShip{
  double armor = 0.1;
  ArmoredShip(String name, double health, double firePower){
    this.name = name;
    this.health = health;
    this.firePower = firePower;
  }

}

// High Speed Ship has medium HP and high dodge skills
// Has medium damage
class HighSpeedShip extends SpaceShip{
  //Override
  double dodge = 0.25;
  HighSpeedShip(String name, double health, double firePower){
    this.name = name;
    this.health = health;
    this.firePower = firePower;
  }

}

void main() {
  var Arena = Battlefield();
  Arena.startBattle(ArmoredShip("Armored Ship", 2000,200), HighSpeedShip("High Speed Ship", 1250,300));
}

// Arena setup
class Battlefield{
  void startBattle(Ship1, Ship2){

    // TODO: choose first player
    int coinToss = Random().nextInt(2);
    var ships = [Ship1, Ship2];

    if (coinToss == 0){
       ships = [Ship1, Ship2];
    } if (coinToss == 1) {
       ships = [Ship2, Ship1];
    }

    print("Coin toss result is $coinToss, ${ships[0].name} will attack first");

    // TODO: engage battle
    while(ships[0].health > 0 && ships[1].health > 0) {
      // Player 1 makes attack
      var decimal1 = Random().nextDouble();
      // print("$decimal1 ${ships[1].dodge}");
      if (decimal1 < ships[1].dodge){
        ships[1].health = ships[1].health;
        print("${ships[1].name} evades damage, ${ships[1].name} has ${ships[1].health} HP");
      } else {
        ships[1].health = ships[1].health - (ships[0].firePower * (1-ships[1].armor)) ;
        print("${ships[0].name} deals ${ships[0].firePower * (1-ships[1].armor)} damage, ${ships[1].name} has ${ships[1]
            .health} HP");
      }
      // Player 2 attacks
      var decimal2 = Random().nextDouble();
      // print("$decimal2 ${ships[0].dodge}");
      if (decimal2 < ships[0].dodge){
        ships[0].health = ships[0].health;
        print("${ships[0].name} evades damage, ${ships[0].name} has ${ships[0].health} HP");
      } else {
        ships[0].health = ships[0].health - (ships[1].firePower * (1-ships[0].armor)) ;
        print("${ships[1].name} deals ${ships[1].firePower * (1-ships[0].armor)} damage, ${ships[0].name} has ${ships[0]
            .health} HP");
      }
    }

    // TODO: check for HP < 0
    if (ships[1].health <= 0) {
      print("Battle over, ${ships[0].name} is victorious");
    } else if (ships[0].health <= 0) {
      print("Battle over, ${ships[1].name} is victorious");
    } else {
      print(ships[0].health);
      print(ships[1].health);
    }
  }
}