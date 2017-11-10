//try Bullet inheriting Character?
class Bullet extends Character{
  float dmg;
  boolean homing;
  public Bullet(float xcord, float ycord, float nspeed){
   super(xcord, ycord, nspeed); 
   hbox = createShape(ELLIPSE, 0, 0, 10, 10);
  // shape( hbox, xpos, ypos);
  }
  
  void setdmg(float newdmg){
     dmg = newdmg;
  }
  
  void sethoming(boolean newhoming){
     homing = newhoming; 
  }
  
  float getdmg(){
     return dmg;
  }
  
  boolean gethoming(){
     return homing;  
  }
  
  float targetangle(Character other){
    //for basic testing untill i can finda nice algoor way to organize enemies
    float ang;
    ang = findAngle(( other.getypos() - this.getypos() ) , (other.getxpos() - this.getxpos()));
    return ang;
  }
  
  
  void home(Character other){
     float c = dist_to_chara(other)/(sqrt( sq(height/2) + sq(width/2))/ 2);
     if (c > 1){ c = 1; }
     if (c < 0.5){ c = 0.5; }
     if(abs(targetangle(other) - angle) < abs(-targetangle(other) + angle - 2*PI)){
       angle = angle * (c) + targetangle(other) * (1 - c);
     }
     else{
       System.out.println("32!");
       
     angle = angle * (c) + (targetangle(other)- 2*PI) * (1 - c);
     }
     System.out.println("41");
    
  }
  
  //void shoot(angle speed homingb )
  
}