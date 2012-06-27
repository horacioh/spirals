
float x, y, z;
int w = 1100;
int h = w;
int numAssets = 400;
int startX = w/2;
int startY = h/2;
int x_spacing = 50;
int y_spacing = 50;
int gridCols= 12;
float o = 1.6180339887498;

color[]palette = {
   #8D7388, #520A2F, #97244C, #8A606E, #AA0526, #E71F41, #F6091A, #E5625B, #FD4624, #DDB1A4, #A79994, #CA9A62, #1A144B, #2D418D, #48285A, #6F8AAF, #698362, #614F69, #E0E3B9, #C1C9AA, #A9B0CC, #BFD9E6, #FBFCDD
};

color[] pickedColors;

boolean paused = false;
boolean record = false;

void setup() {
  size(w, h);
  smooth();
  
   pickedColors= new color[numAssets];
  
  for (int j=0; j<numAssets; j++) {
    pickedColors[j] = palette[(int)random(palette.length)];
  }
}

void draw() {
  
  if (record) {
    beginRecord(PDF, "frame-####.pdf");
  }
  
  background(#ECECEC);

  for (int i=0; i<numAssets; i++) {
    x = startX + (cos(i*x_spacing) * (i*o));
    //println(cos(i*x_spacing));
    y = startY + (sin(i*y_spacing) * (i*o));
    fill( pickedColors[i] );
    noStroke();
    //float s = 49 + ((i*0.3) * sin(o));
    ellipse(x + xn(), y + yn(), sn(), sn());
  }
  
  z++;
  
  if (record) {
    endRecord();
    record = false;
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

void keyPressed() {
  if (key == ' ') {
    if (!paused) {
      noLoop();
      paused = true;
    } else {
      loop();
      paused = false;
    }
  }

  if (key == 'r') {
    record = true;
    draw();
  }
}


