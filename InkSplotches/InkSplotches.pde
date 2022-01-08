IntList m = new IntList();
int v = 2; // vertices in master shape
float x, y, s, r, tx;
int l;
int lm = 1;
int mc = 0; // count of middle clicks
int o = 250;
String[] me = {""};
String[] mel;
String mes;
int newVert;
String saveName;
int f = 0;

void setup() {
  //m.clear();
  size(720,720);
  for(int i=0;i<=2*v+2;i+=1){
    if(m.size() == i) {
      m.append((int) random(-100,100));
   } 
  }
  background(0);
  noStroke();
  fill(255, o);
}

void draw() {
  if (f == 0 && l > 0){
    if(random(100) < 50 ) { fill(255, o); } else { fill(0); }
  }
  l+=1;
  if(l<=lm){
    translate(width/2,height/2);
    tx = random(width/3)-width/6;
    translate(tx,random(width/3)-width/6);
    r = random(TWO_PI);
    rotate(r);
    s=random(0.2, 2);
    scale(s);
    for(int mirror=0;mirror<2;mirror+=1){
    beginShape();
    curveVertex(m.get(0),m.get(1));
    for(int i=0;i<m.size()-1;i+=2){
      curveVertex(m.get(i), m.get(i+1));
    }
    curveVertex(m.get(m.size()-2),m.get(m.size()-1));
    curveVertex(m.get(m.size()-2),m.get(m.size()-1));
    endShape();
    scale(1/s);
    rotate(-r);
    translate(-tx,0);
    scale(-1,1);
    translate(tx, 0);
    rotate(r);
    scale(s);
    }
  }
  f = 1;
  
}

void mousePressed(){
  if(mouseButton == RIGHT){ saveImage(); }
  else if(mouseButton == CENTER){
    l = 0;
    lm = (int) random(3,6);
    if(mc == 2){ fill(0); }
    if(mc == 3){ fill(255, o); mc = 1; }
    mc += 1;
  }
  else{
    fill(255, o);
    mc = 0;
    lm=(int) random(4,12);
    l=0;
    v=(int) random(3,6);
    m.clear();
    m = new IntList();
    for(int i=0;i<=2*v+2;i+=1){
      m.set(i, (int) random(-100,100));
    }
    background(0);
    f = 0;
  }
}

void keyPressed(){
  // a = Again with the same shape
  // o = display only one shape (and mirror though)
  if (key == 'a' || key == 'o'){
    l = 0;
    if (key == 'o'){
      lm = 1;
    }
    else { 
      lm=(int) random(4,12); 
      f = 0;
    }
    mc = 0;
    background(0);
    fill(255,o);
  }
  else if (key == 'b'){
    fill(0);
    lm = (int) random(4, 12);
    l = 0;
  }
  else if (key == 'w'){
    fill(255, o);
    lm = (int) random(4, 12);
    l = 0;
  }
  else if (key == 'm'){
    fill(255, o);
    mc = 0;
    lm=(int) random(20,80);
    l=0;
    background(0);
    f = 0; 
  }
}

static final String timestamp(final String name, final String ext) {
  return name + year() + nf(month(), 2) + nf(day(), 2) +
    "-" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ext;
}
void saveImage() {
  saveName = timestamp("images//InkSplotches_", ".png");
  save(saveName);
  mes = "{";
  for(int i=1; i < m.size(); i += 1){
    mes += str(m.get(i));
    if(i != m.size()-1){ mes += ","; }
  }
  mes += "} ";
  mes += saveName;
  mel = loadStrings("points.txt");
  mel = append(mel, mes);
  saveStrings("points.txt", mel);
}
