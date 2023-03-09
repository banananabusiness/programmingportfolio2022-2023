class Ship {
  int x, y, w, laserCount, turretCount, health;
  PImage ship;
  //constructor
  Ship() {
    x=0;
    y=0;
    w=90;
    laserCount=100;
    turretCount=2;
    health=1000;
    ship=loadImage("ship1.png");
  }
  void display() {
    ship.resize(90, 90);
    image(ship, x, y);
    imageMode(CENTER);
  }
  void move(int tempX, int tempY) {
    x=tempX;
    y=tempY;
  }

  boolean fire() {
    if (laserCount>0) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock rock) {
    float d=dist(x, y, rock.x, rock.y);
    if (d<40) {//refine collsion dection
      return true;
    } else {
      return false;
    }
  }
}
