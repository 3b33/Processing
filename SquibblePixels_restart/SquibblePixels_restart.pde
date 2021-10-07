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
float opa = 60;
int size = 5;
float x1 = toGrid(random(width));
float y1 = toGrid(random(height));

void draw() {
  fill(255, opa);
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
  if(i%1000==0){
    fill(0, 20);
    rect(0, 0, width*2, height*2);
  }
  i++;
}

int toGrid(float g) {
  return int(g/size) * size;
}
