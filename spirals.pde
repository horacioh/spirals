import processing.pdf.*;
import geomerative.*;

RShape s;

float x, y, z;
int w = 800;
int h = w;
int numAssets = 10000;
int startX = w/2;
int startY = h/2;
int x_spacing = 10;
int y_spacing = 10;
int gridCols= 12;
float o = 1.6180339887498;
float[] theta;


color[]palette = {
  //#8D7388, #520A2F, #97244C, #8A606E, #AA0526, #E71F41, #F6091A, #E5625B, #FD4624, #DDB1A4, #A79994, #CA9A62, #1A144B, #2D418D, #48285A, #6F8AAF, #698362, #614F69, #E0E3B9, #C1C9AA, #A9B0CC, #BFD9E6, #FBFCDD
  #AE891E, #C0A622, #CDC138, #E3DA4A//, #F1F084
};

color[] pickedColors;

boolean paused = false;
boolean record = false;

void setup() {
  RG.init(this);
  size(w, h);
  s = RG.loadShape("shape.svg");
  smooth();

  pickedColors= new color[numAssets];
  theta = new float[numAssets];

  int colorPick = 0;
  for (int j=0; j<numAssets; j++) {
    theta[j] = j*0.1;
    //pickedColors[j] = palette[(int)random(palette.length)];
    pickedColors[j] = palette[colorPick];
    if (colorPick < palette.length-1)
    {
      colorPick++;
      println("entro en el suma color pick");
    } 
    else {
      colorPick = 0;
      println("entro en el colorPick = 0");
    }
  }
}

void draw() {

  if (record) {
    beginRecord(PDF, "frame-####.pdf");
  }

  background(#ECECEC);

  for (int i=0; i<numAssets; i++) {
    //x = startX + (cos(i*x_spacing) * (i*o));
    //println(cos(i*x_spacing));
    //y = startY + (sin(i*y_spacing) * (i*o));

    x = ((sin(theta[i])*theta[i]) + startX) + x_spacing;
    y = ((cos(theta[i])*theta[i]) + startY) + y_spacing;

    fill( pickedColors[i] );
    noStroke();
    ellipse(x, y, 30, 30);
  }

  z++;

  if (record) {
    endRecord();
    record = false;
  }
}

void keyPressed() {
  if (key == ' ') {
    if (!paused) {
      noLoop();
      paused = true;
    } 
    else {
      loop();
      paused = false;
    }
  }

  if (key == 'r') {
    record = true;
    draw();
  }
}

float xn() {
  return noise(x * 0.01, y * 0.01, z * 0.03) * 100;
}

float yn() {
  return noise(x * 0.01, y * 0.01, z * 0.03) * 100;
}

float sn() {
  return noise(x * 0.01, y * 0.01, z * 0.01) * 100;
}

