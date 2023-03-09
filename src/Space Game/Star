class Star {
  int x, y, diam, speed;
  //constructor
  Star() {
    x=int(random(width));
    y=int(random(height));
    diam=int(random(1, 4));
    speed=int(random(3, 5));
  }
  void display() {
    fill(222, 225, 0);
    circle(x, y, diam);
  }

  void move() {
    if (y>height+5) {
      y=-10;
    } else {
      y+=speed;
    }
  }
  boolean reachedBottom() {
    return true;
  }
}
