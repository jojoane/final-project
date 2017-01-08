
class Ghost{
  int ghostNumber = 6;
  PImage[] badGhost = new PImage[ghostNumber];
  PImage[] goodGhost = new PImage[ghostNumber];
  float []goodGhostX = new float [ghostNumber];
  float []goodGhostY = new float[ghostNumber];
  float []badGhostX = new float [ghostNumber];
  float []badGhostY = new float[ghostNumber];
  
  int appear;
  int ghostTime;
  float speed;
  
  
  Ghost(){
    
    for(int i=0; i<ghostNumber; i++){
      badGhost[i] = loadImage("img/bad"+i+".png");
    }
    for(int i=0; i<ghostNumber; i++){
      goodGhost[i] = loadImage("img/good"+i+".png");
    }
    for(int i=0; i<ghostNumber; i++){
      goodGhostX[i] = random(50,520);
    }
    for(int i=0; i<ghostNumber; i++){
      goodGhostY[i] = random(50,340);
    }
    for(int i=0; i<ghostNumber; i++){
      badGhostX[i] = random(50,520);
    }
    for(int i=0; i<ghostNumber; i++){
      badGhostY[i] = random(50,340);
    }
    speed = 0.5;
    
    
  }

  void display(){
      ghostTime++;
      if(ghostTime % 45 ==0){
        appear++;
      }
      for(int i=0; i<ghostNumber; i++){ // decide which ghost and when do they appear
      if(appear!=0 && appear % 3 ==0){
        image(badGhost[0] , badGhostX[0],badGhostY[0],200,200);
        badGhostX[0]+=speed; badGhostY[0]+=speed;
        image(goodGhost[4] , goodGhostX[4],goodGhostY[4],200,200);
        goodGhostX[4]-=speed; goodGhostY[4]+=speed;
      }
      else{
        image(badGhost[0],1000,1000);
        image(goodGhost[4] , 1000,1000);
      }
       if(appear!=0 && appear % 2 ==0){
        image(badGhost[2] , badGhostX[2],badGhostY[2],200,200);
        badGhostX[2]+=speed; badGhostY[2]-=speed;
        image(goodGhost[1] , goodGhostX[1],goodGhostY[1],200,200);
        goodGhostX[1]-=speed; goodGhostY[1]-=speed;
      }
      else{
        image(badGhost[2],1000,1000);
        image(goodGhost[1] , 1000,1000);
      }
      if(appear!=0 && appear % 5==0){
        image(badGhost[3] , badGhostX[3],badGhostY[3],200,200);
        badGhostX[3]-=speed; badGhostY[3]+=speed;
        image(goodGhost[0] , goodGhostX[0],goodGhostY[0],200,200);
        goodGhostX[0]+=speed; goodGhostY[0]+=speed;
      }
      else{
        image(badGhost[3],1000,1000);
        image(goodGhost[0] , 1000,1000);
      }
      if(appear!=0 && appear % 7 ==0){
        image(badGhost[5] , badGhostX[5],badGhostY[5],200,200);
        badGhostX[5]+=speed; badGhostY[5]-=speed;
        image(goodGhost[3] , goodGhostX[3],goodGhostY[3],200,200);
        goodGhostX[3]-=speed; goodGhostY[3]+=speed;
      }
      else{
        image(badGhost[5],1000,1000);
        image(goodGhost[3] , 1000,1000);
      }
      if(appear!=0 && appear % 11 ==0){
        image(badGhost[4] , badGhostX[4],badGhostY[4],200,200);
        badGhostX[4]+=speed; badGhostY[4]-=speed;
        image(goodGhost[2] , goodGhostX[2],goodGhostY[2],200,200);
        goodGhostX[2]-=speed; goodGhostY[2]-=speed;
      }
      else{
        image(badGhost[4],1000,1000);
        image(goodGhost[2] , 1000,1000);
      }
       if(appear!=0 && appear % 13 ==0){
        image(badGhost[1] , badGhostX[1],badGhostY[1],200,200);
        badGhostX[1]-=speed; badGhostY[1]+=speed;
        image(goodGhost[5] , goodGhostX[5],goodGhostY[5],200,200);
        goodGhostX[5]+=speed; goodGhostY[5]-=speed;
      }
      else{
        image(badGhost[1],1000,1000);
        image(goodGhost[5] , 1000,1000);
      }
      }      
     
  }
  
  void boundary(){ // lest the ghost float out of the screen
    for(int i=0; i<ghostNumber; i++){
      if(badGhostX[i]<=-300 || badGhostX[i]>=1000){
        speed*= -1;
      }
      if(badGhostY[i]<=-300|| badGhostY[i]>=1000){
        speed*= -1;
      }
      if(goodGhostX[i]<=-300 || goodGhostX[i]>=1000){
        speed*= -1;
      }
      if(goodGhostY[i]<=-300 || goodGhostY[i]>=1000){
        speed*= -1;
      }
    }
  }
  // make the bad ghost disappear when hitted
  void baddisappear(int badGhostIndex){ 
    for(badGhostIndex=0; badGhostIndex<ghostNumber; badGhostIndex++){
      badGhostY[badGhostIndex] = 1000;
    }
  }
  // make the good ghost disappear when hitted
  void gooddisappear(int goodGhostIndex){
    for(goodGhostIndex = 0; goodGhostIndex<ghostNumber; goodGhostIndex++){
      goodGhostY[goodGhostIndex] = 1000;
    }
  }
  //(optional)- when the second is less than 30, the ghosts will move faster
  void faster(){
    if(Timer.second<=30){
      speed = 1;
    }
  }
  
}