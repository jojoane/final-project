
class Warning{
  PImage img,img2,ghost_attack,spider_attack,badkid_attack;
  int count;
  
  Warning(){
    img = loadImage("img/warning_black.png");
    img2 = loadImage("img/warning_yellow.png");
    ghost_attack=loadImage("img/ghost_attack.png");
    spider_attack=loadImage("img/spider_attack.png");
    badkid_attack=loadImage("img/badkid_attack.png");
    count=150;
  }

  void display(){
    count++;
    if (count<100){
      if(catisHurt){
        if(count%40<=20){
          image(badkid_attack,0,0,1392/2,963/2);
        }
      }else if(scaredBySpider){
        if(count%40<=20){
          image(spider_attack,0,0,1392/2,963/2);
        }
      }else if(ghostAttack){
        if(count%40<=20){
          image(ghost_attack,0,0,1392/2,963/2);
        }
      }else{
        if(count%50<=25){
          image(img,150,80);
        }else{
          image(img2,150,80);
        }
      }
    }

  }
  
  

  
  void restart(){
    count=0;
  }

}