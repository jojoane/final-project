PImage begining,story1,story2,story3,end;
//first game
PImage bg,chair,closet1,closet2,ghost1,ghost2,lamp,sofa,table,life,lose1,lose2,win1,win2,littleprince,exit,escapeRule1,escapeRule2;
//second game
PImage background;
PImage start1,start2;
//third game
PImage riverbg,riverRule1,riverRule2;

final int CHAIR_W = 40;
final int CHAIR_H = 64;
final int CLOSET_W =90;
final int CLOSET_H =180;
final int GHOST1_W =150;
final int GHOST1_H =153;
final int LAMP_W =70;
final int LAMP_H =178;
final int SOFA_W =100;
final int SOFA_H =76;
final int TABLE_W =150;
final int TABLE_H =84;
final int LIFE_W =40;
final int LIFE_H =37;
final int GHOST_INIT_Y=200;
final int GHOST_INIT_X=250;
final int littleprince_W=35;
final int littleprince_H=48;
final int EXIT_W=100;
final int EXIT_H=65;

final int CHAIR_INIT_X=150;
final int CHAIR_INIT_Y=250;
final int CLOSET1_INIT_X=20;
final int CLOSET1_INIT_Y=210;
final int CLOSET2_INIT_X=480;
final int CLOSET2_INIT_Y=20;
final int LAMP_INIT_X=50;
final int LAMP_INIT_Y=10;
final int SOFA_INIT_X=350;
final int SOFA_INIT_Y=400;
final int TABLE_INIT_X=180;
final int TABLE_INIT_Y=70;

int gameState; 
final int BEGINING =0;
final int STORY_ONE =1;
final int STORY_TWO =2;
final int STORY_THREE =3;
final int GAME_FIRST = 4;//first game rule
final int GAME_START = 5;//run first game
final int GAME_WIN = 6;
final int GAME_LOSE = 7;
final int GAME_RESTART = 8;
final int GAME_SECOND = 9;//second game rule
final int RUN = 10;//run second game
final int WIN = 11;//win second game
final int LOSE = 12;//lose second game
final int GAME_THIRD = 13;//third game rule
final int GAME_THIRD_RUN = 14;//run third game
final int END = 15;
/**************************
*    0: game is playing   *
*    2: game is lose      *
*    1: game is win       *
*    4: second game is playing   *
***************************/

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

int littleprinceX,littleprinceY;
float littleprincespeed = 5;
float ghostY,chairX;
int heart = 3;

float x_inc = PI/15.0;
float k = 0.0;
float k_inc = PI/40.0;
final float A = 10.0; 
int a=0,b=0;
int d,c;

//second game
int random;
Hammer hammer;
Ghost ghost;
HPBar hp;
Score score;
Timer Timer;
boolean isPlaying;
boolean bad;
boolean good;
int textCounter;
int runManager;


//third game
final int BOAT_X=380;
final int BOAT_Y=270;
final int RIVER_X=100;
final int RIVER_Y=200;
final int SEAT_1_X=365;
final int SEAT_1_Y=200;
final int SEAT_2_X=455;
final int SEAT_2_Y=240;
boolean someThingWrong;
boolean humanOnBoat;
boolean catisHurt;
boolean scaredBySpider;
boolean ghostAttack;

//object of third game
Boat boat;
Button go;
Passenger littlePrince,badBoy,wizard,theGhost;
Pet cat1,cat2,spider1,spider2;
Warning warning;
Restart restart;
Rule rule;


void setup(){
  size(720,480);
  littleprinceX=135;
  littleprinceY=height;
  begining = loadImage("img/begining.png");
  story1 = loadImage("img/story1.png");
  story2 = loadImage("img/story2.png");
  story3 = loadImage("img/story3.png");
  end = loadImage("img/end.png");
  escapeRule1 = loadImage("img/escape_rule1.png");
  escapeRule2 = loadImage("img/escape_rule2.png");
  bg = loadImage("img/escape_bg.png");
  chair=loadImage("img/chair.png");
  closet1=loadImage("img/closet1.png");
  closet2=loadImage("img/closet2.png");
  ghost1=loadImage("img/ghost1.png");
  ghost2=loadImage("img/ghost2.png");
  lamp=loadImage("img/lamp.png");
  sofa=loadImage("img/sofa.png");
  table=loadImage("img/table.png");
  life=loadImage("img/life.png");
  lose1=loadImage("img/lose1.png");
  lose2=loadImage("img/lose2.png");
  win1=loadImage("img/win1.png");
  win2=loadImage("img/win2.png");
  littleprince=loadImage("img/littleprince.png");
  exit=loadImage("img/exit.png");
  //second game
  background = loadImage("img/background.png");
  start1 = loadImage("img/rule1.png");
  start2 = loadImage("img/rule2.png");
  hammer = new Hammer();
  ghost = new Ghost();
  hp = new HPBar();
  score = new Score();
  Timer =  new Timer();
  gameState=BEGINING;
  //third game
   riverbg=loadImage("img/river_bg.png");
   riverRule1 = loadImage("img/river_bg_rule1.png");
   riverRule2 = loadImage("img/river_bg_rule2.png");
    win1=loadImage("img/win1.png");
    win2=loadImage("img/win2.png");
    
    boat = new Boat();
    go = new Button();
    littlePrince = new Passenger("littlePrince",100,330,480,0,40,5,15); 
    cat1 = new Pet("cat1",200,260,530,-30,40,75,15); 
    cat2 = new Pet("cat2",250,330,560,0,40,75,15); 
    badBoy = new Passenger("badBoy",-30,230,510,50,40,10,15); 
    spider1 = new Pet("spider1",60,140,560,45,30,65,25); 
    spider2 = new Pet("spider2",130,200,560,80,30,65,25); 
    theGhost = new Passenger("theGhost",100,40,550,140,0,0,10); //ok
    wizard = new Passenger("wizard",-30,60,490,100,40,30,15); 
    warning = new Warning();
    restart = new Restart();
    rule = new Rule();
    
    someThingWrong=false;
    
    humanOnBoat=false;
    catisHurt=false;
    scaredBySpider=false;
    ghostAttack=false;
    
}

void draw(){
  if (upPressed) {
      littleprinceY -= littleprincespeed;
    }
    if (downPressed) {
      littleprinceY += littleprincespeed;
    }
    if (leftPressed) {
      littleprinceX -= littleprincespeed;
    }
    if (rightPressed) {
      littleprinceX += littleprincespeed;
    }
  
switch (gameState){
  case BEGINING:
  image(begining,0,0,720,480);
  if(mousePressed){
          setup();
          gameState = STORY_ONE;
         }
  break;
  
  case STORY_ONE:
  image(story1,0,0,720,480);
  if(mousePressed){
          setup();
          gameState = STORY_TWO;
         }
  break;
  
  case STORY_TWO:
  image(story2,0,0,720,480);
  if(mousePressed){
          setup();
          gameState = STORY_THREE;
         }
  break;
  
  case STORY_THREE:
  image(story3,0,0,720,480);
  if(mousePressed){
          setup();
          gameState = GAME_FIRST;
         }
  break;
  
   case GAME_FIRST:
    image(escapeRule1,0,0);
    if(mouseX>=480 && mouseX<=670 && mouseY>=360 && mouseY<=440){
        image(escapeRule2,0,0);
        if(mousePressed){
          setup();
          gameState = GAME_START;
        }
      }
     
   break;
  
  case GAME_START:
  image(bg, 0, 0, 720, 480);
  image(exit, 590, 50, EXIT_W, EXIT_H);
  image(littleprince, littleprinceX, littleprinceY, littleprince_W, littleprince_H);//move the prince by mouse
  if(littleprinceX < 0 ){
          littleprinceX = 0;
        } else if(littleprinceX > 720-littleprince_W) {
          littleprinceX = 720-littleprince_W;
        }
        if(littleprinceY < 0) {
          littleprinceY = 0;
        } else if(littleprinceY > 480-littleprince_H) {
          littleprinceY = 480-littleprince_H;
        }
  
  //life
  for(int i = 0; i < heart; i++) {
    b=i*LIFE_W;
    image(life,710-LIFE_W-b,470-LIFE_H,LIFE_W,LIFE_H);
  }
  
  //ghost wave
  for(int i = 0; i < 1; i++) {
  ghostY =  A * sin(x_inc+k) + GHOST_INIT_Y ;
  k+=k_inc;
  a=i*GHOST1_W;
  image(ghost1,GHOST_INIT_X+a,ghostY);
  }
  
  //ghost die
  if(littleprinceX>GHOST_INIT_X-GHOST1_W/2+50 && littleprinceX<GHOST1_W+GHOST_INIT_X){
    if(littleprinceY<ghostY+GHOST1_H && littleprinceY>ghostY-GHOST1_H/2){
      //restart
      littleprinceX=135;
      littleprinceY=height;
      heart--;
    }
  }
  
  //chair
  image(chair, chairX, CHAIR_INIT_Y ,CHAIR_W, CHAIR_H);
  chairX =  A * sin(x_inc+k) + CHAIR_INIT_X ;
  k+=k_inc;
  if(littleprinceX>chairX-CHAIR_W && littleprinceX<CHAIR_W/2+chairX){
    if(littleprinceY<CHAIR_INIT_Y+CHAIR_H && littleprinceY>CHAIR_INIT_Y-CHAIR_H){
      //restart
      littleprinceX=135;
      littleprinceY=height;
      heart--;
    }
  }
  
  
  //closet1
  image(closet1, CLOSET1_INIT_X, CLOSET1_INIT_Y,CLOSET_W, CLOSET_H);
  if(littleprinceX>CLOSET1_INIT_X-CLOSET_W/2 && littleprinceX<CLOSET_W+CLOSET1_INIT_X){
    if(littleprinceY<CLOSET1_INIT_Y+CLOSET_H && littleprinceY>CLOSET1_INIT_Y-CLOSET_H/2){
      //restart
      littleprinceX=135;
      littleprinceY=height;
      heart--;
    }
  }
  
  
  //lamp
  image(lamp, LAMP_INIT_X, LAMP_INIT_Y, LAMP_W, LAMP_H);
  if(littleprinceX>LAMP_INIT_X-LAMP_W/2 && littleprinceX<LAMP_W+LAMP_INIT_X){
    if(littleprinceY<LAMP_INIT_Y+LAMP_H && littleprinceY>LAMP_INIT_Y-LAMP_H/2){
      //restart
      littleprinceX=135;
      littleprinceY=height;
      heart--;
    }
  }
  
  //sofa
  image(sofa, SOFA_INIT_X+ A * sin(x_inc+k), SOFA_INIT_Y, SOFA_W, SOFA_H);
  if(littleprinceX>SOFA_INIT_X+ A * sin(x_inc+k)-SOFA_W/2+30 && littleprinceX<SOFA_W/2+SOFA_INIT_X+ A * sin(x_inc+k)+30){
    if(littleprinceY<SOFA_INIT_Y+SOFA_H && littleprinceY>SOFA_INIT_Y-SOFA_H+30){
      //restart
      littleprinceX=135;
      littleprinceY=height;
      heart--;
    }
  }
  
  //table
  image(table, TABLE_INIT_X, TABLE_INIT_Y, TABLE_W, TABLE_H);
  if(littleprinceX>TABLE_INIT_X-TABLE_W/2+40 && littleprinceX<TABLE_W+TABLE_INIT_X){
    if(littleprinceY<TABLE_INIT_Y+TABLE_H && littleprinceY>TABLE_INIT_Y-TABLE_H/2){
      //restart
      littleprinceX=135;
      littleprinceY=height;
      heart--;
    }
  }
  
  //closet2
  c+=2;
  c%=480;
  image(closet2, CLOSET2_INIT_X, CLOSET2_INIT_Y+c, CLOSET_W, CLOSET_H);
  if(littleprinceX>CLOSET2_INIT_X-CLOSET_W/2 && littleprinceX<CLOSET_W+CLOSET2_INIT_X){
    if(littleprinceY<CLOSET2_INIT_Y+c+CLOSET_H && littleprinceY>CLOSET2_INIT_Y+c-CLOSET_H/2){
      //restart
      littleprinceX=135;
      littleprinceY=height;
      heart--;
    }
  }
  
  
  
  //game lose
   if (heart <= 0){
     gameState=GAME_LOSE;
   }
  //game win
  if(littleprinceX+littleprince_W/2>width-50 && littleprinceX-littleprince_W/2<width){
    if(littleprinceY<100){
      gameState=GAME_WIN;
    }
  }
  
  break;

    
  case GAME_LOSE:
      image(lose1, 0, 0, 720, 480); 
      if ( mouseX>=470 && mouseX<=670 && mouseY>=370 && mouseY<=430){
        image(lose2, 0, 0);
        if(mousePressed){
          setup();
          gameState = GAME_START;
         }
      }
      //restart
      littleprinceX=135;
      littleprinceY=height;
      heart=3;
  break;
        
  case GAME_WIN:
    image(win1, 0, 0, 720, 480);
      if ( mouseX>=470 && mouseX<=670 && mouseY>=370 && mouseY<=430){
        image(win2, 0, 0);
        if(mousePressed){
          setup();
          gameState = GAME_SECOND;
         }
        }
  break;
  
  case GAME_SECOND:
    image(start1,0,0);
    if(mouseX>=480 && mouseX<=670 && mouseY>=360 && mouseY<=440){
        image(start2,0,0);
        if(mousePressed){
          Timer.second = 60;
          score.score = 0;
          setup();
          gameState = RUN;
        }
      }
     
   break;
      
  case RUN:// run second game
     runManager++;
    if(runManager>=60){
    isPlaying =true;
    }
   random = floor(random(0,100));
  image(background,0,0);
  //hp.gameover();
  hp.drawblood();
  hp.display();
  score.display();
  Timer.display(60);
  hp.gameover();
  if(isPlaying){
  ghost.display();
  ghost.boundary();
      if(mousePressed){
      hammer.hit();
    }
    else{hammer.display();
    }
  }
  
   // if hit bad ghost, "good" appear, if hit good ghost, "OH NO" appear 
  if(textCounter>=30){
    good = false;
    bad = false;
    textCounter = 0;
  }
  
  if(good){
    textCounter++;
    fill(255);
    text("GOOD!",250,100);
  }
  
   if(bad){
      textCounter++;
      fill(255);
      text("OH NO!",250,150);
    }
  
  break;
  
  case WIN://win second game
isPlaying = false;
  image(win1,0,0);
  if(mouseX>=480 && mouseX<=670 && mouseY>=360 && mouseY<=440){
        image(win2,0,0);  
        if(mousePressed){
          setup();
          gameState = GAME_THIRD;
         }
      }
      break;
      
  case LOSE://lose second game
 isPlaying = false;
     image(lose1,0,0);
       if(mouseX>=480 && mouseX<=670 && mouseY>=360 && mouseY<=440){
        image(lose2,0,0);
        if(mousePressed){
          gameState = RUN;
          isPlaying = false;
          Timer.display(60);
          Timer.s = 60;
         
 Timer.frame = 0;
          Timer.second = floor(Timer.s- Timer.frame/48);
          score.score = 0;
          hp.bloodLength = 200;
          runManager = 0;
          bad = false;
          good = false;
        }
      }
      
  break;
  
  case GAME_THIRD:
  image(riverRule1,0,0);
    if(mouseX>=480 && mouseX<=670 && mouseY>=360 && mouseY<=440){
        image(riverRule2,0,0);
        if(mousePressed){
          setup();
          gameState = GAME_THIRD_RUN;
        }
      }
  break;
  
  case GAME_THIRD_RUN:
  image(riverbg,0,0);
  //Object display
    boat.display();
    go.display();
    littlePrince.display();
    cat1.display();
    cat2.display();
    badBoy.display();
    spider1.display();
    spider2.display();
    theGhost.display();
    wizard.display();
    restart.display();
    rule.display();
    
    cat1.check();
    cat2.check();
    spider1.check();
    spider2.check();
    warning.display();
    
   // lot's of boolean~~XDD
//00.if restart is pressed
if(restart.isPressed){
setup();
gameState = GAME_THIRD_RUN;
restart.isPressed=false;
}
//00.if rule is pressed


//1.whether there is a human on boat to control it   
  if(wizard.isAboardSeat1 || wizard.isAboardSeat2){
    humanOnBoat=true;
  }else if(littlePrince.isAboardSeat1 || littlePrince.isAboardSeat2){
    humanOnBoat=true;
  }else if(badBoy.isAboardSeat1 || badBoy.isAboardSeat2){
    humanOnBoat=true;
  }else{
    humanOnBoat=false;
  }
  
  //2.whether cat is with badboy & without littleprince
  if(cat1.withBadBoy && !cat1.withLittlePrince){
    catisHurt=true;
  }else if(cat2.withBadBoy && !cat2.withLittlePrince){
    catisHurt=true;
  }else if( !(littlePrince.isAboardSeat1 || littlePrince.isAboardSeat2) && (badBoy.isAboardSeat1 || badBoy.isAboardSeat2) && littlePrince.isHere && badBoy.isHere && (!(cat1.isHere) || !(cat2.isHere)) ){
    catisHurt=true;
  }else if( !(littlePrince.isAboardSeat1 || littlePrince.isAboardSeat2) && (badBoy.isAboardSeat1 || badBoy.isAboardSeat2) && !(littlePrince.isHere) && !(badBoy.isHere) && ((cat1.isHere) || (cat2.isHere)) ){
    catisHurt=true;
  }else{
    catisHurt=false;
  }
  
  //3.whether littlePrince is scared by spider1
  if(!spider1.withBadBoy && spider1.withLittlePrince){
    scaredBySpider=true;
  }else if(!spider2.withBadBoy && spider2.withLittlePrince){
    scaredBySpider=true;
  }else if( (littlePrince.isAboardSeat1 || littlePrince.isAboardSeat2) && !(badBoy.isAboardSeat1 || badBoy.isAboardSeat2) && littlePrince.isHere && badBoy.isHere && (!(spider1.isHere) || !(spider2.isHere)) ){
    scaredBySpider=true;
  }else if( (littlePrince.isAboardSeat1 || littlePrince.isAboardSeat2) && !(badBoy.isAboardSeat1 || badBoy.isAboardSeat2) && !(littlePrince.isHere) && !(badBoy.isHere) && ((spider1.isHere) || (spider2.isHere)) ){
    scaredBySpider=true;
  }else{
    scaredBySpider=false;
  }
//4.theGhost attack
  if(!wizard.withGhost&&(littlePrince.withGhost||badBoy.withGhost||cat1.withGhost||cat2.withGhost||spider1.withGhost||spider2.withGhost)){
    ghostAttack=true;
  }
  
  //show warning
//test

/*
  if((!humanOnBoat||cat1isHurt||cat2isHurt||scaredBySpider1||scaredBySpider2||ghostAttack) && go.isPressed){
    someThingWrong=true;
    warning.restart();  
  }
*/  
//1.no human on boat

  if(!humanOnBoat && go.isPressed){
    someThingWrong=true;
    warning.restart();  
  }
//4.ghostAttack
  if(ghostAttack && go.isPressed){
    someThingWrong=true;
    warning.restart(); 
  }
//2.catisHurt
  if(catisHurt && go.isPressed){
    someThingWrong=true;
    warning.restart(); 
  }

//3.scaredBySpider
  if(scaredBySpider && go.isPressed){
    someThingWrong=true;
    warning.restart(); 
  }

  //*restart*//
  if(warning.count>100){
    someThingWrong=false;
    catisHurt=false;
    scaredBySpider=false;
    ghostAttack=false;
  }
          
  if(someThingWrong){
  }else{
    boat.move();
    littlePrince.move();
    cat1.move();
    cat2.move();
    badBoy.move();
    spider1.move();
    spider2.move();  
    theGhost.move();
    wizard.move();
  }
  
  if(!wizard.isHere && !littlePrince.isHere && !badBoy.isHere && !cat1.isHere && !cat2.isHere && !spider1.isHere && !spider2.isHere && !theGhost.isHere){
    if((mouseX>465 && mouseX<596) && (mouseY>390 && mouseY<448)){
        image(win2,0,0,720,480);
        if(mousePressed){
          //!!!!!!!!win and move to next case!!!!!!!!//
          setup();
          gameState = END;
        }
    }else{
      image(win1,0,0,720,480);
    }
  }
  break;

  case END:
    image(end,0,0,720,480);
  break;
  
  }//switch
  if(Timer.second ==0){
    if(score.score>=200){
      gameState = WIN;
      
    }
    if(score.score<200){
      gameState = LOSE;
      }
  }
 
  
}//draw
 
  


void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}

void mouseClicked(){ 
      //mouse detection
    if(isPlaying){
  for(int i=0; i<6; i+=1){
   if(mouseX>=ghost.badGhostX[i]+70 && mouseX<=ghost.badGhostX[i]+130 && 
      mouseY>=ghost.badGhostY[i]+30 && mouseY<=ghost.badGhostY[i]+140){
      score.addscore();
      hp.addblood();
      //ghost.baddisappear(i);
      good = true;
   // text("GOOD!",250,100);
      }
  
   
   else if(mouseX>=ghost.goodGhostX[i]+70 && mouseX<=ghost.goodGhostX[i]+130 && 
      mouseY>=ghost.goodGhostY[i]+30 && mouseY<=ghost.goodGhostY[i]+140){
      score.decrease();
      hp.decrease();
      //ghost.baddisappear(i);
      bad = true;
   // text("OH NO!",250,100);
      }
  }
    
      
    
    }//isplaying

}