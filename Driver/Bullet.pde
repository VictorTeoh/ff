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
  
  void targetplayer(){
    angle = 0;
  }
  
  //void shoot(angle speed homingb )
  
}