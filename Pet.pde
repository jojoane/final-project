
class Pet extends Passenger{
  boolean withBadBoy;
  boolean withLittlePrince;

  Pet(String filename,float startX,float startY,float endX,float endY,float spw,float spu,float spd){
    super(filename,startX,startY,endX,endY,spw,spu,spd);
    withLittlePrince=false;
    withBadBoy=false;
  }

  void check(){
    
    //withLittlePrince
      //on boat   
        if((this.isAboardSeat1 || this.isAboardSeat2)&&(littlePrince.isAboardSeat1 || littlePrince.isAboardSeat2)){
          this.withLittlePrince=true;
        }else if(!(this.isAboardSeat1 || this.isAboardSeat2)&&!(littlePrince.isAboardSeat1 || littlePrince.isAboardSeat2)&&(this.isHere&&littlePrince.isHere)){
          this.withLittlePrince=true;
        }else if(!(this.isAboardSeat1 || this.isAboardSeat2)&&!(littlePrince.isAboardSeat1 || littlePrince.isAboardSeat2)&&(!this.isHere&&!littlePrince.isHere)){
          this.withLittlePrince=true;
        }else{
          this.withLittlePrince=false;
        }      
        
    //withBadBoy
        if((this.isAboardSeat1 || this.isAboardSeat2)&&(badBoy.isAboardSeat1 || badBoy.isAboardSeat2)){
          this.withBadBoy=true;
        }else if(!(this.isAboardSeat1 || this.isAboardSeat2)&&!(badBoy.isAboardSeat1 || badBoy.isAboardSeat2)&&(this.isHere&&badBoy.isHere)){
          this.withBadBoy=true;
        }else if(!(this.isAboardSeat1 || this.isAboardSeat2)&&!(badBoy.isAboardSeat1 || badBoy.isAboardSeat2)&&(!this.isHere&&!badBoy.isHere)){
          this.withBadBoy=true;
        }else{
          this.withBadBoy=false;
        }
    
    
  
  }
  
  

}