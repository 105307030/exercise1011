PImage bg,start1,start2,lose,win,restart,ghost;
float SpeedW1=1;
float SpeedW2=2;
float SpeedW3=3;
float ghostX, ghostY;
float ghostSpeed=5;
float wall=600;
final int GAME_START = 0, GAME_RUN = 1, GAME_WIN = 2, GAME_LOSE = 3;
int gameState=0;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup(){
  size(600,500);
  bg=loadImage("img/bg.jpg");
  start1=loadImage("img/start1.jpg");
  start2=loadImage("img/start2.jpg");
  lose=loadImage("img/lose.jpg");
  win=loadImage("img/win.jpg");
  restart=loadImage("img/restart.jpg");
  ghost=loadImage("img/ghost.jpg");
  //start location for ghost
  ghostX=width/2-25;
  ghostY=0; 
  gameState=GAME_START;
}

void draw(){
background(255);
switch(gameState){
  case GAME_START:
  image(start1,0,0);
   if(mouseY>210&&mouseY<285){
     if(mousePressed){
       gameState=GAME_RUN;
     }else{
       noStroke();
       fill(255,255,0,100);
       rect(150,210,300,75);
     }
   }
 break;
  //GAME_START

    
  //GAME_RUN
case GAME_RUN:
image(bg,0,0);
  //ghost 
  //draw
   image(ghost,ghostX,ghostY,50,50);
  //move    
        if (upPressed){
          ghostY-=ghostSpeed;
            }
        if(downPressed){
          ghostY+=ghostSpeed;
            }
        if(leftPressed){
          ghostX-=ghostSpeed;
            }
        if(rightPressed){
          ghostX+=ghostSpeed;
            }

        //boundary  
        if(ghostX>width){
          ghostX=0;
       
        if(ghostX<0){
          ghostX=width;
        }
        if(ghostY>height){
          ghostY=0;
        }
        if(ghostY<0){
          ghostY=height;
        }
    
    //wall
      //fill(135,200,155);
     // noStroke();
      
      //wall1
      fill(0);
      stroke(0);
        rect(0,100,wall,5);
        rect(wall+300,100,width,5);
        wall+=SpeedW1;
        if(wall<=0){SpeedW1*=-1;}
        if(wall+300>=width){SpeedW1*=-1;}
      //wall2
        rect(0,200,wall,5);
        rect(wall+SpeedW2,200,width,5);
        if(wall<=0){SpeedW2*=-1;}
        if(wall+200>=width){SpeedW2*=-1;}
      //wall3
        rect(0,300,wall,5);
    rect(wall+SpeedW3,300,width,5);
    if(wall<=0){SpeedW1*=-1;}
        if(wall+100>=width){SpeedW3*=-1;}
    //change state    
      //win
     
      //lose
        //wall1
        
        //wall2
        
        //wall3
        

     break;
    
  //GAME_WIN

  //GAME_LOSE

    
        }
        }
}

void keyPressed() {
if(key==CODED){
  switch(keyCode){
    case UP:
     upPressed=true;
     break;
    case DOWN:
     downPressed=true;
     break;
    case LEFT:
     leftPressed=true;
     break;
    case RIGHT:
     rightPressed=true;
     break;
   }
  }
}

void keyReleased() {
if(key==CODED){
  switch(keyCode){
    case UP:
     upPressed=false;
     break;
    case DOWN:
     downPressed=false;
     break;
    case LEFT:
     leftPressed=false;
     break;
    case RIGHT:
     rightPressed=false;
     break;}
   }
}
