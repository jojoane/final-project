
class Hammer{
  int x,y;
  PImage hammer;
  PImage hammerHit;
  
  Hammer(){
    hammer = loadImage("img/hammer.png");
    hammerHit = loadImage("img/hammer_hit.png");
    x = mouseX - 36;
    y = mouseY-40;
  }
  
  void display(){
    image(hammer,mouseX - 36,mouseY-40,74,98);
  }
  void hit(){
    image(hammerHit,mouseX - 36,mouseY-40,74,98);
  }
  
}