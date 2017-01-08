
class Restart{
  PImage img;
  boolean isPressed;

  Restart(){
    img=loadImage("img/restart.png");
    isPressed=false;
  }    
   
  void display(){
    image(img,650,410,60,60);
    
    if(mouseX>=650 && mouseX<=710){
      if(mouseY>=410 && mouseY<=470 ){
        if(mousePressed){
          isPressed=true;
        }else{
          isPressed=false;
        }  
      }
    }    
  }  
}