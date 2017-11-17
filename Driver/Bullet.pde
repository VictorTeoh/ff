//try Bullet inheriting Character?
//bad idea undo it
class Bullet extends Character{
  float dmg;
  boolean homing;
  int atkdly;
  int atkdlyctr;
  public Bullet(float xcord, float ycord, float nspeed){
   super(xcord, ycord, nspeed); 
   hbox = createShape(ELLIPSE, 0, 0, 10, 10);
  // shape( hbox, xpos, ypos);
  }
  
 // public Bullet (float xcord, float ycord, float nspeed) {
  
  
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
     float a = targetangle(other);
     System.out.println(2*PI-abs(this.getangle()-a));
     float c = dist_to_chara(other)/(sqrt( sq(height/2) + sq(width/2))/ 2);//some finnessing to find a good range
     if (c > 1){ c = 1; }
     if (c < 0.80){ c = 0.80; } //limit how hard the thing can curve
     if(abs(angle - a) < 2*PI*abs(angle - a)){
       
       angle = angle * (c) + a * (1 - c);
     }
     else{
       System.out.println("32!");
       angle = angle * (c) + (a - 2*PI) * (1 - c);
     }
    
  }
  
  //void shoot(angle speed homingb )
  
}