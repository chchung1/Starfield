Particle [] wow = new Particle[500];

void setup() {
  size(600, 600);
  for (int i = 0; i < 50; i++)
  {
    wow[i] = new Particle();
  }
  for (int i = 50; i < wow.length; i++)
  {
    wow[i] = new Oddball();
  }
}
void draw() {
  background(0);
  for (int i = 0; i < wow.length; i++)
  {
    wow[i].move();
    wow[i].show();
  }
}

class Particle {
  float myX, myY;
  double myAngle, mySpeed;
  int myColor;

  Particle() {
    myX=300;
    myY=300;
    myAngle = (Math.random()*3)*Math.PI;
    mySpeed = Math.random()*11;
    myColor = 255;
    //myColor = color((int)(Math.random()*129)+127,(int)(Math.random()*129)+127,(int)(Math.random()*129)+127);
  }

  void move() {
    myX = myX + (float)(Math.cos(myAngle)*mySpeed);
    myY = myY + (float)(Math.sin(myAngle)*mySpeed);
  }

  void show() {
    stroke(0);
    fill(myColor);
    beginShape();
    curveVertex(myX, myY-30);
    curveVertex(myX, myY-30);

    curveVertex(myX-5, myY-5);

    curveVertex(myX-20, myY);

    curveVertex(myX-5, myY+5);

    curveVertex(myX, myY+30);
    curveVertex(myX, myY+30);
    endShape();

    beginShape();
    curveVertex(myX, myY-30);
    curveVertex(myX, myY-30);

    curveVertex(myX+5, myY-5);

    curveVertex(myX+20, myY);

    curveVertex(myX+5, myY+5);

    curveVertex(myX, myY+30);
    curveVertex(myX, myY+30);
    endShape();
  }
}

class Oddball extends Particle {
  Oddball() {
    myX=300;
    myY=300;
    myAngle = (Math.random()*3)*Math.PI;
    mySpeed = (int)(Math.random()*11);
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255), 80);
  }
  void move() {
    myX = myX + (float)(Math.cos(myAngle)*mySpeed);
    myY = myY + (float)(Math.sin(myAngle)*mySpeed);
    if (myX < -10|| myX > 610)
    {
      myX = 300;
      myY = 300;
    }
  }
  void show() {
    noStroke();
    fill(myColor);
    ellipse(myX, myY, 10, 10);
  }
}

