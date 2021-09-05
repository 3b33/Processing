int bg1 = 70;
int bg2 = 100;

void setup(){
  //background(
  //  random(bg1,bg2),
  //  random(bg1,bg2),
  //  random(bg1,bg2)
  //);
  background(80);
  rectMode(CENTER);
  noStroke();
  colorMode(HSB, 255);
  fill(255, 40);
  frameRate(600);
}


int i = 0;
int pos = 15;
int y = int(1000/pos)*pos;
int x = ((int) (512/pos))*pos ;
int rs =3;
int mpos = 10;
int s = 0;
int o=70;
int bm = 2;

float rcm;         // random color mode
float[][] rw = {   // random weights
  {100, 100},      // main or opposite hue
  {100, 50}        // dark or bright
};
float[] rl = new float[cw.length];           // random limits as 0-1
for (int i = 0; i < rw.length; i = i + 1) {
  rl[i] = rw[i][0] / rw[i].sum();
}

int xd;
int yd;
int c = (int) random(400,700);
float chv = 0;
float csv = 40; // color sat variability
float cbv = 60;
float ch, cs, cb;
float mh; // master hue
float oh; // opposite hue

mh = random(255);

float shift255(float hue, float shift){
 float r = hue + shift;
 if(hue<0){r=255+r;}
 else if(hue>255) {r=r-255;}
 return r;
} 

oh = shift255(mh, 128);

void draw(){
  x = x + (int) random(-2,2)*pos;
  y = y + (int) random(-2,2)*pos;
  if (x < 0){ x = int(width / 2 / pos) * pos; }
  if (y < 0){ y = int(height/2/pos)*pos; }
  if (x > width){ x = int(width / 2 / pos) * pos; }
  if (y > height){y= int(height / 2 / pos) * pos; }
  int m = int((width - x) / pos) * pos;
  rect(x, y, pos, pos);
  rect(m, y, pos, pos);
  i=i+1;
  
  if(i % c==0){
    if(rm[0]<random(1)){
     ch = mh;
    }
    else {
      ch = oh;
    }
     
    if(rm[1]<random(1)){
       cs = 100;
       cb = csb;
    }
    else {
      cs = 255-csv;
      cb = 255-cbv;
    }
    fill(ch, cs, cb, 40);
  }

  if(i % (5 * c) == 0){
    x = int(width / 2 / pos) * pos;
    y = (int) (random(200, height - 200) / pos);
    y = y * pos;
    c = (int) random(400,700);
  }
  if(mousePressed) {
    x = int(mouseX / pos) * pos;
    y = int(mouseY / pos) * pos;
    //fill(get(mouseX, mouseY), o);
    i = int(i / c) * c;
  }
}
