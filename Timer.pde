class Timer{
  PFont time;
  int frame;
  int second;
  int warnCounter;
  int s;
  
  Timer(){
    second = 60;
    time = createFont("Arial",40);
    frame = 0;
    warnCounter = 0;
  }
  
  void display(int s){
    this.s = s;
    // make second decrease every second
    frame++;
    second = floor(s -frame/50);
    //warn players there's not much time
    if(second<=10){
      warnCounter++;
      if(warnCounter % 3 !=0){
        fill(255,0,0);
        textFont(time,40);
        text(second,640,50);
      }
    }
    else{
    fill(255);
    textFont(time,40);
    text(second,640,50);
    }     
  }
  
  //make the timer twinkle to warn player that there's not much time
  //void warn(){
    
  //  warnCounter++;
  //  if(warnCounter % 3 !=0){
  //    fill(255,0,0);
  //  textFont(time,40);
  //  text(second,640,50);
  //    }
    
  //}
  
  
  void faster(){
    if(second<=30){
      second = floor(30-frame/40);
    }
  }
      
      
}