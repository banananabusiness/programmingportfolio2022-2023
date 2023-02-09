//Brianna Yang | nov 1 2022 | Calc Project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button [12];
String dVal = "0.0";
float l, r, result;
char op = ' ';
boolean left = true;

void setup() {
  size(432, 668);
  opButtons[0] = new Button(70, 252, 80, 80, 'C', color(#7A51A0), color(#6E5386));
  numButtons[0] = new Button(70, 342, 80, 80, '7', color(#7A67B9), color(#7C6293));
  numButtons[1] = new Button(70, 432, 80, 80, '4', color(#7A67B9), color(#7C6293));
  numButtons[2] = new Button(70, 522, 80, 80, '1', color(#7A67B9), color(#7C6293));
  opButtons[1] = new Button(49, 592, 43, 43, '√', color(#83699B), color(#7B688B));
  opButtons[2] = new Button(98, 592, 43, 43, 'π', color(#83699B), color(#7B688B));
  opButtons[3] = new Button(70, 636, 91, 33, '.', color(#83699B), color(#7B688B));

  opButtons[4] = new Button(165, 252, 80, 80, '%', color(#7A51A0), color(#6E5386));
  numButtons[3] = new Button(165, 342, 80, 80, '8', color(#7A67B9), color(#7C6293));
  numButtons[4] = new Button(165, 432, 80, 80, '5', color(#7A67B9), color(#7C6293));
  numButtons[5] = new Button(165, 522, 80, 80, '2', color(#7A67B9), color(#7C6293));
  numButtons[6] = new Button(165, 612, 80, 80, '0', color(#7A67B9), color(#7C6293));

  opButtons[5] = new Button(260, 252, 80, 80, 's', color(#7A51A0), color(#6E5386));
  numButtons[7] = new Button(260, 342, 80, 80, '9', color(#7A67B9), color(#7C6293));
  numButtons[8] = new Button(260, 432, 80, 80, '6', color(#7A67B9), color(#7C6293));
  numButtons[9] = new Button(260, 522, 80, 80, '3', color(#7A67B9), color(#7C6293));
  opButtons[6] = new Button(260, 612, 80, 80, 'x', color(#83699B), color(#7B688B));

  opButtons[7] = new Button(355, 252, 80, 80, '/', color(#7A51A0), color(#6E5386));
  opButtons[8] = new Button(355, 342, 80, 80, '*', color(#7A51A0), color(#6E5386));
  opButtons[9] = new Button(355, 432, 80, 80, '-', color(#7A51A0), color(#6E5386));
  opButtons[10] = new Button(355, 522, 80, 80, '+', color(#7A51A0), color(#6E5386));
  opButtons[11] = new Button(355, 612, 80, 80, '=', color(#7A51A0), color(#6E5386));
}

void draw() {
  background(#C29EE3);
  textSize(50);
  updateDisplay();
  fill(89567  );
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i ++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void mousePressed () {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      numButtons[i].on = true;
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on) {
      opButtons[i].on = true;
    }
  }
}

void updateDisplay () {
  rectMode(CENTER);
  rect(width/2, 100, width-20, 170, 10);
  fill(#FFFDFA);
  textAlign(RIGHT);
  textSize(43);
  if (dVal.length() < 9) {
    textSize(40);
  } else if (dVal.length() < 10) {
    textSize(38);
  }
  text(dVal, width-40, 150);
}

void keyPressed () {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 107) { // +
    handleEvent("+", false);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (key == CODED) {
    if (keyCode == ESC) {
      handleEvent("C", false);
    }
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 10) {
    handleEvent("ENTER", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 106) {
    handleEvent("*", false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent("/", false);
  }
}


void handleEvent (String val, boolean num) {
  if (num && dVal.length() < 18) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    left = true;
    l = 0;
    r = 0;
    result = 0;
    op = ' ';
  } else if (val.equals(".")) {
    if (dVal.contains(".") == false) {
      dVal += ".";
    }
  } else if (val.equals("+")) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (val.equals("ENTER")) {
    performCalculation ();
  } else if (val.equals("-")) {
    op = '-';
    left = false;
    dVal = "0";
  } else if (val.equals("*")) {
    op = '*';
    left = false;
    dVal = "0";
  } else if (val.equals("/")) {
    op = '/';
    left = false;
    dVal = "0";
  }
}


void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length() <19) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("C", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons [i].on && opButtons [i].val == '=') {
      handleEvent("ENTER", false);
    } else if (opButtons [i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons [i].on && opButtons [i].val == '*') {
      handleEvent("*", false);
    } else if (opButtons [i].on && opButtons [i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons [i].on && opButtons [i].val == '/') {
      handleEvent("/", false);
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      if (left) {
        l  =sq(l);
        dVal = str(l);
        opButtons[i].on = false;
      } else {
        r = sq(r);
        dVal = str(r);
        opButtons[i].on = false;
      }
      opButtons[i].on= false;
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      if (left) {
        l  =l*.01;
        dVal = str(l);
        opButtons[i].on = false;
      } else {
        r = r*.01;
        dVal = str(r);
        opButtons[i].on = false;
      }
      opButtons[i].on = false;
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l  =sqrt(l);
        dVal = str(l);
        opButtons[i].on = false;
      } else {
        r = sqrt(r);
        dVal = str(r);
        opButtons[i].on = false;
      }
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l  = PI;
        dVal = str(l);
        opButtons[i].on = false;
      } else {
        r = sqrt(PI);
        dVal = str(PI);
        opButtons[i].on = false;
      }
    }
  }
  println("L:" + l + "Op:" +op + "R:" + r + "Result:" + result + "Left:" + left);
}


void performCalculation() {

  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  }
  dVal = str(result);
  l = result;
  left = true;
}
