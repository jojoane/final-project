class Score{
  int score;
  PFont s;
  
  Score(){
    s = createFont("Arial",40);
    score = 0;
  }
  
  void display(){
    fill(255);
    textFont(s,40);
    text(score,10,440);
  }
  void addscore(){
    score+=20;
  }
  void decrease(){
    score-=40;
  }
}
  