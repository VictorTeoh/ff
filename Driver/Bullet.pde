//try Bullet inheriting Character?
//bad idea undo it
class Bullet extends Object{
  float dmg;
  boolean homing;
  int atkdly; // out of 60 frames what is the lag btwn each shot
  int atkdlyctr;
  
  public Bullet(){
     super();
     hboxrad = 10;
     hbox = createShape(ELLIPSE, 0, 0, hboxrad, hboxrad);
     xpos = 0;
     ypos = 0;
  }
  public Bullet(float setspeed, float ang, float damage, int dly, boolean homes){
     this();
     speed = setspeed;
     angle = ang;
     dmg = damage;
     atkdly = dly;
     homing = homes;
    // shape( hbox, xpos, ypos);
  }  
  
  float getdmg(){
     return dmg;
  }
  
  boolean gethoming(){
     return homing;  
  }
  
  int getatkdly(){
     return atkdly; 
  }
  
  int getatkdlyctr(){
     return atkdlyctr;  
  }
  
  void setdmg(float newdmg){
     dmg = newdmg;
  }
  
  void sethoming(boolean newhoming){
     homing = newhoming; 
  }
  
  void setatkdly(int natkdly){
     atkdly = natkdly; 
  }
  
  void setatkdlyctr(int natkdlyctr){
     atkdlyctr = natkdlyctr;  
  }
  
  void updatectr(){
    if(atkdlyctr < atkdly){
      atkdlyctr++;
    }
  }
 
  boolean ready(){
    if(atkdly == atkdlyctr){
      return true;
    }
    return false;
  }
  
  float targetangle(Object other){
    //for basic testing untill i can finda nice algoor way to organize enemies
    float ang;
    ang = findAngle(( other.getypos() - this.getypos() ) , (other.getxpos() - this.getxpos()));
    return ang;
  }
  
  
  void home(Object other){
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
  
  Bullet clone(){
     Bullet clone = new Bullet(this.getspeed(), this.getangle(), this.getdmg(),
                               this.getatkdly(), this.gethoming());
     clone.sethboxrad(this.gethboxrad());
     clone.sethbox(this.gethbox());
     clone.setxpos(this.getxpos());
     clone.setxpos(this.getypos());
     return clone;  
  }    
  
  boolean collision(Character other){
      boolean statement = ((this.gethboxrad() + other.gethboxrad())/2) >= dist_to_chara(other);
      if(statement){ other.sethealth(other.gethealth() - this.getdmg()); }//changed
      return(statement);
  }
}