
float x, y;

int numAssets = 300;
int startX = 450;
int startY = 450;
int x_spacing = 50;
int y_spacing = 50;
int gridCols= 12;
float o = 1.6180339887498;

void setup() {
  size(900, 900);
  smooth();
}

void draw() {
  background(#ECECEC);

  for (int i=0; i<numAssets; i++) {
    x = startX + (cos(i*x_spacing) * (i*o));
    //println(cos(i*x_spacing));
    y = startY + (sin(i*y_spacing) * (i*o));
    fill(#FFFFFF);
    ellipse(x, y, 49, 49);
  }
  
}


