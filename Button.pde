
class Button{
  PImage go,goPressed;
  boolean isPressed;
  int x;

  Button(){
    go=loadImage("img/unpressedButton.png");
      //310*272
    goPressed=loadImage("img/pressedButton.png");
      //310*220   
    isPressed=false;
    x=10;
  }    
   
  void display(){
    image(go,x,385,93,81.6);
    if(mouseX>=10 && mouseX<=103){
      if(mouseY>=385 && mouseY<=466.6 ){
        if(mousePressed){
          isPressed=true;
          image(goPressed,10,400.6,93,66);   
          x=1000;
        }else{
          isPressed=false;
          x=10;
        }
      }
    }
  }  
}