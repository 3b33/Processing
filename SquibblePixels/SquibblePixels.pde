// where are the creatures? Was better with bi = 4000 and cb multiplier 0.9

int bg1 = 70;
int bg2 = 100;

void setup(){
  //background(
  //  random(bg1,bg2),
  //  random(bg1,bg2),
  //  random(bg1,bg2)
  //);
  size(800,1000);
  background(00);
  rectMode(CENTER);
  noStroke();
  colorMode(HSB, 255);
  fill(255, 40);
  frameRate(1000);
  noSmooth();
}


int i = 0;
int pos = 5;
int y = int((height / 2 + random(-height / 2, height / 2)) / pos) * pos;
int x = int(width / 2 / pos) * pos;
int y2 = y;//int((height / 2 + random(-height / 2, height / 2)) / pos) * pos;
int y3 = y;//int((height / 2 + random(-height / 2, height / 2)) / pos) * pos;
int x2 = x;
int x3 = x;
int rs =3;
int mpos = 10;
int s = 0;
int o = 80;
int bm = 2;
int m, m2, m3;

int xd;
int yd;
//int c = (int) random(600,1000);
int c = 1000;
float chv = 10;
float csv = 64; // color saturation variability, not used atm.
float cbv = 40;
float scb;
float bi = 6000; // brightness variance loop size, every i
float ch, cs, cb;
int ps = 2;      // palette size (multiplier of pos)

float mh = random(255);        // master hue

float oh = shift255(mh, random(108,148));  // opposite hue

void draw(){
  x = x + (int) random(-2,2)*pos;
  y = y + (int) random(-2,2)*pos;
  if (x < 0){ x = int(width / 2 / pos) * pos; }
  if (y < 0){ y = int(height/2/pos)*pos; }
  if (x > width){ x = int(width / 2 / pos) * pos; }
  if (y > height){y= int(height / 2 / pos) * pos; }
  m = int((width - x) / pos) * pos;
  
  //x2 = x2 + (int) random(-2,2)*pos;
  //y2 = y2 + (int) random(-2,2)*pos;
  //if (x2 < 0){ x2 = int(width / 2 / pos) * pos; }
  //if (y2 < 0){ y2 = int(height/2/pos)*pos; }
  //if (x2 > width){ x2 = int(width / 2 / pos) * pos; }
  //if (y2 > height){y2= int(height / 2 / pos) * pos; }
  //m2 = int((width - x2) / pos) * pos;
  
  //x3 = x3 + (int) random(-2,2)*pos;
  //y3 = y3 + (int) random(-2,2)*pos;
  //if (x3 < 0){ x3 = int(width / 2 / pos) * pos; }
  //if (y3 < 0){ y3 = int(height/2/pos)*pos; }
  //if (x3 > width){ x3 = int(width / 2 / pos) * pos; }
  //if (y3 > height){y3= int(height / 2 / pos) * pos; }
  //m3 = int((width - x3) / pos) * pos;

  // brightness cycle
  cb = i % bi;
  if(cb > bi / 2){cb = bi - cb;}
  cb = cb / (bi / 400);  // boost brightness from 255
  scb = cb;
  for(int i = 0; i < 200; i += 20){
    if(scb < i){ cb *= .8; }
  }
  if (i % c == 0) {  
  if ( 0.7 > random(1) ) { cb = 0; } else { cb = 255; }
  }
  
  // dark borders
  //fill(0,o/4);
  //rect(x-pos, y-pos, pos, pos);
  //rect(x+pos, y-pos, pos, pos);
  //rect(x-pos, y+pos, pos, pos);
  //rect(x+pos, y+pos, pos, pos);
  //rect(m-pos, y-pos, pos, pos);
  //rect(m+pos, y-pos, pos, pos);
  //rect(m-pos, y+pos, pos, pos);
  //rect(m+pos, y+pos, pos, pos);
  
  
  //cb = 255;
  
  if (i % c==0 || i == 0){ 
    
  if (.7 > random(1) ) { ch=oh; } else { ch=mh; }
    ch = shift255(ch, random(-chv, chv));
    
    cs = random(120);
    for (int s=0; s < 135; s+= 10){
      if (cs < s) { cs*=.85; }
    }    
   
  }
  
  // seems like darker colours should have more saturation than bright ones WIP 
  //if (cb > 100) { cs *= .6; }
  
  fill(ch, cs, cb, o);
  

  if(i % (c * 5) == 0){
    x = int(width / 2 / pos) * pos;
    y = (int) (random(200, height - 200) / pos);
    y = y * pos;
    //c = (int) random(1000,5000);
  }
  if(i > c * 150) {
    mh = shift255(mh, random(-chv/2,chv));
    oh = shift255(mh, random(-chv/2,chv));
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
  rect(x, y, pos, pos);
  rect(m, y, pos, pos);
  //rect(x2, y2, pos, pos);
  //rect(m2, y2, pos, pos);
  //rect(x3, y3, pos, pos);
  //rect(m3, y3, pos, pos);
  
  // dispaly color scheme
  if(i == 1){  
    fill(mh, 255, 255);
    rect(pos * ps, pos * ps, pos * ps, pos * ps);
    fill(oh, 255, 255);
    rect(pos * ps * 2 + 1, pos * ps, pos * ps, pos * ps);
    fill(ch, cs, cb, o);
  }
  //if(i%500==0){
  //  fill(0, 20);
  //  rect(0, 0, width*2, height*2);
  //}
  i++;
}


float shift255(float hue, float shift){
 float r = hue + shift;
 if(r < 0){ r = r + 255; }
 else if(r > 255){ r = r - 255; }
 return r;
} 

static final String timestamp(final String name, final String ext) {
  return name + year() + nf(month(), 2) + nf(day(), 2) +
    "-" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ext;
}

void saveImage() {
  save(timestamp("screenshots//SquibblePixels_", ".png"));
}
