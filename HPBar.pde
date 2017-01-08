
class HPBar{
  int bloodLength;
  PImage hp;
  
  HPBar(){
    bloodLength= 200;
    hp = loadImage("img/hp.png");
  }
  
  void display(){
    image(hp,1,1,250,50);
  }
  
  void drawblood(){
    fill(255,0,0);
    rect(50,10,bloodLength,35);
  }
 
  void addblood(){
    if(bloodLength>=200){
      bloodLength+=0;
    }
    else{bloodLength+=20;}
  }
  void decrease(){
    bloodLength-=40;
  }
  void gameover(){
    if(bloodLength<=0){
      gameState = LOSE;
    }
  }
}