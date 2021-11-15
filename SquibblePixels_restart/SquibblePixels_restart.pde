void setup() {
  size(800,800);
  background(0);
  rectMode(CENTER);
  noStroke();
  colorMode(HSB, 255);
  frameRate(1000);
  noSmooth();
}

int i = 0;
int dir;
float opa = 200;
int size = 5;
float x1 = toGrid(random(width));
float y1 = toGrid(random(height));
int cycle = 30;

void draw() {
  fill(abs((i%(256*cycle))/cycle-(i%25*(cycle/3))/(cycle/3)-(i%100)/3), opa);
  dir = int (random(1)*4);

  switch(dir){
    case 0: x1 -= size; break;
    case 1: x1 += size; break;
    case 2: y1 -= size; break;
    case 3: y1 += size; break;
  }
  if (x1 < 0 || x1 > width) { x1 = toGrid(width/2); toGrid(random(height));  }
  if (y1 < 0 || y1 > height) { y1 = toGrid(random(height)); }
  rect(x1, y1, size, size);
  rect(width-x1, y1, size, size);
  
  //// darken screen slowly
  //if(i%1000==0){
  //  fill(0, 20);
  //  rect(0, 0, width*2, height*2);
  //}
  
  i++;
    if(i % 30000 == 0) {
    i = 1;
    saveImage();
  }
  if(mousePressed) {
    //x = int(mouseX / pos) * pos;
    //y = int(mouseY / pos) * pos;
    //fill(get(mouseX, mouseY), o);
    //i = int(i / c) * c;
    saveImage();
  }
}

int toGrid(float g) {
  return int(g/size) * size;
}

static final String timestamp(final String name, final String ext) {
  return name + year() + nf(month(), 2) + nf(day(), 2) +
    "-" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ext;
}

void saveImage() {
  save(timestamp("screenshots//SquibblePixels_", ".png"));
}
