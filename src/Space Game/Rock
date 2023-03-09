class Rock {
  int x, y, speed, diam;
  PImage rock;
  //constructor
  Rock() {
    x=int(random(width));
    y=0;
    diam=int(random(100, 200));
    speed=int(random(3, 5));
    rock=loadImage("rock1.png");
  }
  void display() {
    imageMode(CENTER);
    rock.resize(diam, diam);
    image(rock, x, y);
  }

  void move() {
    y+=speed;
  }
  boolean reachedBottom() {
    if (y>height+5) {
      y=-10;
      return true;
    } else {
      return false;
    }
  }
}
