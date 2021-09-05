int bg1 = 70;
int bg2 = 100;

void setup(){
background(
random(bg1,bg2),
random(bg1,bg2),
random(bg1,bg2)
);
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
float rcm; // random color mode
float[] cw = {100, 100}; // color mode weights

float cws = cw.sum();
float[] cl = new float[cw.length]; // color mode limits
for (int i = 0; i < cw.length; i = i + 1) {
  cl[i] = cw[i] / cws;
}
int xd;
int yd;
int c = (int) random(400,700);
float chv = 0;
float cs, cb;
float csv = 40; // color sat variability
float cbv = 60;
float mh; // master hue
float oh; // opposite hue
float toh, moh;
mh = random(255);

float shiftHue(float hue, float shift){
 float r = hue + shift;
 if(hue<0){r=255+r;}
 else if(hue>255) {r=r-255;}
 return r;
} 

oh = shiftHue(mh, 128);

void draw(){
  
 x = x + (int) random(-2,2)*pos;
 y = y + (int) random(-2,2)*pos;
 if (x < 0){x=int(width/2/pos)*pos;}
 if(y <0){y=int(height/2/pos)*pos;}
 if(x>width){x=int(width/2/pos)*pos;}
 if(y>height){y=int(height/2/pos)*pos;}
  int m = int((width-x)/pos) *pos;
  rect(x, y, pos, pos);
  rect(m, y, pos, pos);
 i=i+1;
 if(i%c==0){
   rcm = random(1);
   if(rcm<cw[1]){
     cs = 100;
     cb = csb;
   }
   else{
     cs = 255-csv;
     cb = 255-cbv;
   }
   if(rcm<cw[0]){
     fill(
      shiftHue(oh, chv), 
      shiftHue(cs, csv), 
      shiftHue(cb, cbv);
   }
   else if(rcm<cw[1]){
     fill(
      shiftHue(mh, chv), 
      shiftHue(cs, csv), 
      shiftHue(cb, cbv);
   }
   else if(rcm<cw[2]){
     fill(
      shiftHue(oh, chv), 
      shiftHue(cs, csv), 
      shiftHue(cb, cbv);
   }

if(i%(5*c)==0){
  x=int(width/2/pos)*pos;
  y=(int) (random(200,height-200)/pos);
  y=y*pos;
  c = (int) random(400,700);
}
if(mousePressed) {
  x=int(mouseX/pos) *pos;
  y=int(mouseY/pos) *pos;
  //fill(get(mouseX, mouseY), o);
  i=int(i/c)*c;
}
}
