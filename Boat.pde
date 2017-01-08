class Boat{
  boolean isMoving,isHere;
  float x,y,speedX,speedY;
  int passengerNumber;
  int MAX_PASSENGER;
  int boatState;
  PImage img;
  boolean seat1,seat2;
  
  Boat(){
    x = BOAT_X;
    y = BOAT_Y;
    speedX = 1;
    speedY = 2;
    passengerNumber = 0;
    MAX_PASSENGER = 2;
    boatState=0;
    img = loadImage("img/boat.png");
    isMoving=false;
    isHere=true;
    seat1=false;
    seat2=false;
  }

    void display(){
      image(img,x,y,221.4,168.075);
    }  
    
    void move(){
      switch(boatState){
      case 0 : //stop
        isMoving=false;
        if(go.isPressed){
          if( isHere){  
            boatState=1;
          }else{
            boatState=2;
          }      
        }
        break;
              
      case 1: //move forward
        isMoving=true;
        x -= speedX;              
        y -= speedY;
        if(x==BOAT_X-RIVER_X){
          isHere=false;
          boatState=0;
        }
        break;
              
      case 2: //move backward
        isMoving=true;
        x += speedX;
        y += speedY;
        if(x==BOAT_X){
          isHere=true;
          boatState=0;
        } 
        break;  
      }
    }




}
  