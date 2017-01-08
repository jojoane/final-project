
class Rule{
  PImage img,img2;
  boolean isPressed;
  float x;

  Rule(){
    img=loadImage("img/rules.png");
    img2=loadImage("img/river_bg_rule.png");
    x=0;
    isPressed=false;
  }    
   
  void display(){
    image(img,590,410,60,60);
    
    if(mouseX>=590 && mouseX<=650){
      if(mouseY>=410 && mouseY<=470 ){
        if(mousePressed){
          isPressed=true;
        }
      }
    }    
    if(isPressed){
      x=0;
      image(img2,x,0);
      if(mouseX>=617 && mouseX<=691){
        if(mouseY>=30 && mouseY<=105 ){
          if(mousePressed){
            x=1000;
            isPressed=false;
          }
        }
      }
    }
  }  
}