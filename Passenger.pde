class Passenger{
  float x,y,speedX,speedY;
  final float HERE_X,HERE_Y,THERE_X,THERE_Y;
  float spaceW,spaceUp,spaceDown;
  
  boolean isAboardSeat1;
  boolean isAboardSeat2;
  boolean isHere;
  boolean isPressed;
  boolean withGhost;
  PImage img;
  int h,w;
  int passengerState;
  
  
  Passenger(String filename,float startX,float startY,float endX,float endY,float spw,float spu,float spd){
   img = loadImage("img3/"+filename+".png");
   HERE_X=startX;
   HERE_Y=startY;
   THERE_X=endX;
   THERE_Y=endY;
   x=startX;
   y=startY;
   speedX = 1;
   speedY = 2;
   w=150;
   h=150;
   spaceW=spw;
   spaceUp=spu;
   spaceDown=spd;
    
   isPressed=false;
   isHere=true;
   isAboardSeat1=false;
   isAboardSeat2=false;
   withGhost=false;
 }
   
  
  void display(){
    image(img,x,y,w,h);
        if((this.isAboardSeat1 || this.isAboardSeat2)&&(theGhost.isAboardSeat1 || theGhost.isAboardSeat2)){
          this.withGhost=true;
        }else if(!(this.isAboardSeat1 || this.isAboardSeat2)&&!(theGhost.isAboardSeat1 || theGhost.isAboardSeat2)&&(this.isHere&&theGhost.isHere)){
          this.withGhost=true;
        }else if(!(this.isAboardSeat1 || this.isAboardSeat2)&&!(theGhost.isAboardSeat1 || theGhost.isAboardSeat2)&&(!this.isHere&&!theGhost.isHere)){
          this.withGhost=true;
        }else{
          this.withGhost=false;
        }
  }
    
  void move(){  
    switch(passengerState){
      case 0: //stop here 
      x=HERE_X;
      y=HERE_Y;
        if(mouseX>=x+spaceW && mouseX<=x+w-spaceW){
          if(mouseY>=y+spaceUp && mouseY<=y+h-spaceDown){
            if(mousePressed){
              if(isHere){
                if(boat.isHere&& !boat.isMoving){
                    if(boat.seat1 && boat.seat2){ //full
                    }else{
                      //sit where?
                        if(!boat.seat1){
                          x=SEAT_1_X;
                          y=SEAT_1_Y;
                          boat.seat1=true;
                          isAboardSeat1=true;
                          passengerState=1;
                        }else if(boat.seat1 && !boat.seat2){
                          x=SEAT_2_X;
                          y=SEAT_2_Y;
                          boat.seat2=true;
                          isAboardSeat2=true;
                          passengerState=1;
                        }                          
                    }
                  }
                }
              }
            }
          }      
        break;
        
      case 1: //aboard here

      //go  
        if(go.isPressed){
          passengerState=2;                
        }
      //back to here
        if(mouseX>=x+spaceW && mouseX<=x+w-spaceW){
          if(mouseY>=y+spaceUp && mouseY<=y+h-spaceDown){
            if(mousePressed){
              if(isHere){
                if(isAboardSeat1){
                  boat.seat1=false;
                  isAboardSeat1=false;
                }else if(isAboardSeat2){
                  boat.seat2=false;
                  isAboardSeat2=false;
                }
                passengerState=0;
              }
            }
          }      
        }
         break;   
          
       case 2: //move from here
          x -= speedX;
          y -= speedY;
          if(isAboardSeat1){
            if(x==SEAT_1_X-RIVER_X){
              isHere=false;
              x=SEAT_1_X-RIVER_X;
              boat.seat1=false;
              isAboardSeat1=false;
              passengerState=5;
            }
          }else if(isAboardSeat2){
            if(x==SEAT_2_X-RIVER_X){
              isHere=false;
              x=SEAT_2_X-RIVER_X;
              boat.seat2=false;
              isAboardSeat2=false;
              passengerState=5;
            }           
          }          
         break;
       
       case 3: //move from there
          x += speedX;
          y += speedY;
          if(isAboardSeat1){
            if(x==SEAT_1_X){
              isHere=true;
              x=SEAT_1_X;
              boat.seat1=false;
              isAboardSeat1=false;   
              passengerState=0; 
            }
          }else if(isAboardSeat2){
            if(x==SEAT_2_X){
              isHere=true;
              x=SEAT_2_X;
              boat.seat2=false;
              isAboardSeat2=false;
              passengerState=0; 
            }
            
             }
         break;
       
       case 4: //aboard there 
        //go  
        if(go.isPressed){
          passengerState=3;                
        }
        //back to here
        if(mouseX>=x+spaceW && mouseX<=x+w-spaceW){
          if(mouseY>=y+spaceUp && mouseY<=y+h-spaceDown){
            if(mousePressed){
              if(!isHere){
                if(!boat.isHere){
                  if(isAboardSeat1){
                    boat.seat1=false;
                    isAboardSeat1=false;
                  }else if(isAboardSeat2){
                    boat.seat2=false;
                    isAboardSeat2=false;
                  }
                  passengerState=5;
                }
              }
            }
          }      
        }
         break;
       
       case 5: //stop there
         w=75;
         h=75;
         x=THERE_X;
         y=THERE_Y;
         if(mouseX>=x+0.5*spaceW && mouseX<=x+w-0.5*spaceW){
            if(mouseY>=y+0.5*spaceUp && mouseY<=y+h-0.5*spaceDown){
              if(mousePressed){
                if(!isHere){
                  if(!boat.isHere && !boat.isMoving){
                    if(boat.seat1 && boat.seat2){ //full
                    }else{
                      //sit where?
                        if(!boat.seat1){
                          x=SEAT_1_X-RIVER_X;
                          y=SEAT_1_Y-RIVER_Y;
                          boat.seat1=true;
                          isAboardSeat1=true;
                          w=150;h=150;
                          passengerState=4;
                        }else if(boat.seat1 && !boat.seat2){
                          x=SEAT_2_X-RIVER_X;
                          y=SEAT_2_Y-RIVER_Y;
                          boat.seat2=true;
                          isAboardSeat2=true;
                          w=150;h=150;
                          passengerState=4;
                        }   
                }
              }
            }
          }      
        }
        
          }
       
  }

  }

}