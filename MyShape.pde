class MyShape {

  float _x, _y, _z;
  RShape[] _curSVG;
  color[] myStyles;

  MyShape(RShape curSVG, float x, float y) {
    _x = x;
    _y = y;

    int numChildren = curSVG.countChildren();

    _curSVG = new RShape[numChildren];
    myStyles = new color[numChildren];

    for (int j=0; j<numChildren; j++) {
      _curSVG[j] = curSVG.children[j];
      myStyles[j] = palette[(int)random(palette.length)];
    }
  }

  void display() {

   for (int i=0; i<numAssets; i++) {
      x = startX + (cos(i*x_spacing) * (i*o));
      //println(cos(i*x_spacing));
      y = startY + (sin(i*y_spacing) * (i*o));
      fill( pickedColors[i] );
      noStroke();
      //float s = 49 + ((i*0.3) * sin(o));
      ellipse(x + xn(), y + yn(), sn(), sn());
    }
  
    _z++;
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
}

