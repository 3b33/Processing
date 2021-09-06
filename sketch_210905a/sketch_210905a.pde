// where are the creatures?
// add monochrome pixels

int bg1 = 70;
int bg2 = 100;

void setup(){
  //background(
  //  random(bg1,bg2),
  //  random(bg1,bg2),
  //  random(bg1,bg2)
  //);
  size(800,1000);
  background(40);
  rectMode(CENTER);
  noStroke();
  colorMode(HSB, 255);
  fill(255, 40);
  frameRate(1000);
}


int i = 0;
int pos = 5;
int y = int(height / 2 / pos + random(-height / 2, height / 2)) * pos;
int x = int(width / 2 / pos) * pos ;
int y2 = int(height / 2 / pos + random(-height / 2, height / 2)) * pos;
int y3 = int(height / 2 / pos + random(-height / 2, height / 2)) * pos;
int x2 = x;
int x3 = x;
int rs =3;
int mpos = 10;
int s = 0;
int o = 60;
int bm = 2;
int m, m2, m3;

int xd;
int yd;
int c = (int) random(400,700);
float chv = 30;
float csv = 128; // color sat variability
float cbv = 100;
float ch, cs, cb;
int ps = 3;      // palette size (multiplier of pos)

float mh = random(255);        // master hue

float shift255(float hue, float shift){
 float r = hue + shift;
 if(r < 0){ r = r + 255; }
 else if(r > 255){ r = r - 255; }
 return r;
} 

float oh = shift255(mh, random(108,148));  // opposite hue

void draw(){
  x = x + (int) random(-2,2)*pos;
  y = y + (int) random(-2,2)*pos;
  if (x < 0){ x = int(width / 2 / pos) * pos; }
  if (y < 0){ y = int(height/2/pos)*pos; }
  if (x > width){ x = int(width / 2 / pos) * pos; }
  if (y > height){y= int(height / 2 / pos) * pos; }
  m = int((width - x) / pos) * pos;
  
  x2 = x2 + (int) random(-2,2)*pos;
  y2 = y2 + (int) random(-2,2)*pos;
  if (x2 < 0){ x2 = int(width / 2 / pos) * pos; }
  if (y2 < 0){ y2 = int(height/2/pos)*pos; }
  if (x2 > width){ x2 = int(width / 2 / pos) * pos; }
  if (y2 > height){y2= int(height / 2 / pos) * pos; }
  m2 = int((width - x2) / pos) * pos;
  
  x3 = x3 + (int) random(-2,2)*pos;
  y3 = y3 + (int) random(-2,2)*pos;
  if (x3 < 0){ x3 = int(width / 2 / pos) * pos; }
  if (y3 < 0){ y3 = int(height/2/pos)*pos; }
  if (x3 > width){ x3 = int(width / 2 / pos) * pos; }
  if (y3 > height){y3= int(height / 2 / pos) * pos; }
  m3 = int((width - x3) / pos) * pos;
  
  i=i+1;
  
  if(i % c==0){ 
    if(0.18 < random(1)){  // number = change for bright
      // dark
      cs = random(0, csv);
      cb = random(0, cbv / 3 * 2);
      if(.7 < random(1)){ ch = mh; } else { ch = oh; }
      ch = shift255(ch, random(-chv / 1.5, chv / 1.5));
    }
    else { // bright
      cs = random(80, 150);
      cb = random(128, 210);
      if(.14 < random(1)){ ch = mh; } else { ch = oh; }
      ch = shift255(ch, random(-chv / 3, chv / 3));
    }
    if(.4 > random(1)){ cs = 0; }  // chance for monochrome
    fill(ch, cs, cb, o);
  }
  

  if(i % (c * 5) == 0){
    x = int(width / 2 / pos) * pos;
    y = (int) (random(200, height - 200) / pos);
    y = y * pos;
    c = (int) random(400,700);
  }
  if(i > c * 150) {
    mh = shift255(mh, random(30,225));
    oh = shift255(mh, random(108,148));
    i = 1;
    save(timestamp("screenshots//SquiqqlePixels_", ".png"));
  }
  if(mousePressed) {
    //x = int(mouseX / pos) * pos;
    //y = int(mouseY / pos) * pos;
    //fill(get(mouseX, mouseY), o);
    //i = int(i / c) * c;
    save(timestamp("screenshots//SquiqqlePixels_", ".png"));
  }
  rect(x, y, pos, pos);
  rect(m, y, pos, pos);
  rect(x2, y2, pos, pos);
  rect(m2, y2, pos, pos);
  rect(x3, y3, pos, pos);
  rect(m3, y3, pos, pos);
  if(i == 1){
    fill(mh, 255, 255);
    rect(pos * ps, pos * ps, pos * ps, pos * ps);
    fill(oh, 255, 255);
    rect(pos * ps * 2 + 1, pos * ps, pos * ps, pos * ps);
    fill(ch, cs, cb, 80);
  }
}

static final String timestamp(final String name, final String ext) {
  return name + "-" + year() + nf(month(), 2) + nf(day(), 2) +
    "-" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ext;
}
