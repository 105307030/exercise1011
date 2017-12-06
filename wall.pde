 //
//  Created by Rosali Chang on 2016/12/08
//  Updated by Rosali Chang on 2017/11/20
//  Special thanks to Radian Jheng.
//  Photo credit to Youga Chang.
//  Advising Prof. Jones Yu.
//


// background, control button
PImage bgImg ;
PImage btn[]  =  new PImage[2] ;    // 2 button: input turtle, input fish
int btnX[]    =  { 15, 80 } ;
int btnY      =  15 ;
int btnR      =  25 ;               // the radius of button
Aquatics[]Aquaticses;
Fish[]fishes;
// ----- Replace line 19-20 to line 23 -----
//PImage img;
//float w, h, x, y, xSpeed, ySpeed;

// ----- Replace line 19-20 to line 23 -----
//Fish fish1, fish2;       
Fish fish1;
Fish fish2;          
int fishAmount;
void setup() {
  size(800, 600) ;

  // loading bg, control button
  bgImg = loadImage("img/bgImage.png") ;
  for (int i = 0; i < btn.length; i++ ) { 
    btn[i] = loadImage("img/btn_" + i + ".png") ;
  }
  
  // ----- Replace line 36 to line 41-42 -----
  //generateFish();
  
  // ----- Replace line 36 to line 41-42 -----
   
   Aquaticses=new Aquatics[10];
 fishAmount=0;
   
   //fish1 = new Fish("1.png");
   //fish2 = new Fish("2.png");
  
}


void draw() {

  // show the bg, control button
  image(bgImg, 0, 0, width, height) ;
  for (int i = 0; i < btn.length; i++) { 
    image(btn[i], btnX[i], btnY, btnR*2, btnR*2) ;
  }
  
  // ----- Replace line 53-54 to line 57-60 -----
  
  // ----- Replace line 53-54 to line 57-60 -----
   for(int i=0;i<fishAmount;i++ ){
   Aquaticses[i].swim();
   Aquaticses[i].display();
   
   }
   
}


// ----- Rewrite line 65-102 to Fish Class -----
//void generateFish() {
//  String filename = str(floor(random(4))); 
//  img = loadImage("img/" + filename + ".png") ;
//  float ratio = random(0.5, 0.7) ;
//  w = img.width * ratio ;
//  h = img.height * ratio ;
//  x = random(width - w) ;
//  y = 0 ;
//  xSpeed = random(1, 2) * (random(1) < 0.5 ? 1 : -1) ;  
//  ySpeed = random(1, 2) * (random(1) < 0.5 ? 1 : -1) ;
//}

//void swim() {
//  x += xSpeed ;
//  y += ySpeed ;
  
//  if (x < 0 || x > width - w) { 
//    xSpeed *= -1 ;
//  }
//  if (y < 0 || y > height - h) {
//    ySpeed *= -1 ;
//  }
//}

//void display() {
//  int direction = (xSpeed > 0) ? RIGHT : LEFT;
  
//  pushMatrix();
//  translate(x, y);
//  if (direction == RIGHT) {
//    scale(1, 1);
//    image(img, 0, 0, w, h); 
//  } else {
//    scale(-1, 1);
//    image(img, -w, 0, w, h); 
//  }
//  popMatrix();
//}
// ----- Rewrite line 65-102 to Fish Class -----


void mouseClicked() {
 if( fishAmount<10){
  // create a new turtle
  if (dist(mouseX, mouseY, btnX[0] + btnR, btnY + btnR) < btnR) {
 Aquaticses[fishAmount++]=new Turtle();
  // create a new fish 
  } 
 
   
    if (dist(mouseX, mouseY, btnX[1] + btnR, btnY + btnR) < btnR)
  
  {
    Aquaticses[fishAmount++]=new Fish();
  }
}
}


-------------------------------------------
class Aquatics{
  float w,h,x,y,xSpeed, ySpeed;
  PImage img;
 
 Aquatics(String filename) {  
   
  img = loadImage( filename) ;
    float ratio = random(0.5, 0.7) ;
  w = img.width * ratio ;
  h = img.height * ratio ;
  x = random(width - w) ;
  y = 0 ;
 }

  void swim () {
   x += xSpeed ;
  y += ySpeed ;
  
  if (x < 0 || x > width - w) { 
    xSpeed *= -1 ;
  }
  if (y < 0 || y > height - h) {
    ySpeed *= -1 ;
  }
    
    
  } 

  void display () {
  int direction = (xSpeed > 0) ? RIGHT : LEFT;
  
  pushMatrix();
  translate(x, y);
  if (direction == RIGHT) {
    scale(1, 1);
    image(img, 0, 0, w, h); 
  } else {
    scale(-1, 1);
    image(img, -w, 0, w, h); 
  }
  popMatrix();
    
    
  }
}

-----------------------------------------------------------------------------------------
class Fish extends Aquatics{
 
 
 Fish() {  
  
  super("img/" + floor(random(4)) + ".png");
      xSpeed = random(0.5, 1.5) * (random(1) < 0.5 ? 1 : -1) ;  
  ySpeed = random(0.5, 1.5) * (random(1) < 0.5 ? 1 : -1) ; 
  
    
  }

  void swim () {
    super.swim();

    if (y < 0 || y > height - h) {
    ySpeed *= -1 ;
  }
  } 


}

-------------------------------------------------------
class Turtle  extends Aquatics{
  
 
 Turtle() {  
 
  super("img/turtle.png") ;
 
  
    xSpeed = random(0.5, 1.5) * (random(1) < 0.5 ? 1 : -1) ;  
  ySpeed = random(0.5, 1.5) * (random(1) < 0.5 ? 1 : -1) ;   
  }

  void swim () {
    super.swim();

  
  
  
   if(y>height-h){
    ySpeed=0; 
   }
    
  } 


}
