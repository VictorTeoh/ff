//try Bullet inheriting Character?
class Bullet extends Character{
  float dmg;
  public Bullet(float xcord, float ycord, float nspeed){
   super(xcord, ycord, nspeed); 
   hbox = createShape(ELLIPSE, 0, 0, 10, 10);
  // shape( hbox, xpos, ypos);
  }
  
  void setdmg(float newdmg){
     dmg = newdmg;
  }
  
  float getdmg(){
     return dmg;
  }
  
  void target(){
    //for basic testing untill i can finda nice algoor way to organize enemies
    //homing will be on the first in the array
    //atan doesnt get every angle desired only those in Q1 and Q4 idk 
    angle = atan(( Characters[0].getypos() - this.getypos() ) / (Characters[0].getxpos() - this.getxpos()));
    System.out.println(angle);
  }
  
  //void shoot(angle speed homingb )
  
}