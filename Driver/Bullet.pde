//try Bullet inheriting Character?
//bad idea undo it
class Bullet{
  float speed;
  float angle; // in radians
  float xpos;
  float ypos;
  PShape hbox;//no
  float hboxrad;
  float dmg;
  boolean homing;
  int atkdly; // out of 60 frames what is the lag btwn each shot
  int atkdlyctr;
  
  public Bullet(){
     hbox = createShape(ELLIPSE, 0, 0, 10, 10);
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
   
  float getspeed(){
     return speed; 
  }
  
  float getangle(){
     return angle; 
  }
  
  float getxpos(){
     return xpos; 
  }
  
  float getypos(){
     return ypos; 
  }  
  
  PShape gethbox(){
     return hbox; 
  }
  
  float gethboxrad(){
     return hboxrad; 
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
  
  
  void setxpos(float newxpos){
     xpos = newxpos; 
  }
  
  void setypos(float newypos){
     ypos = newypos; 
  }
  
  void setspeed(float newspeed){
     speed = newspeed;
  }
  
  void setangle(float newangle){
     angle = newangle;
  }
  
  void sethbox(PShape newhbox){
     hbox = newhbox;
  }
  
  void sethboxrad(float newhboxrad){
     hboxrad = newhboxrad;
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
  
  void move(){
    xpos = xpos + speed * cos(angle);
    ypos = ypos + speed * sin(angle); 
  }
  
  boolean collision(Character other){
      boolean statement = ((this.gethboxrad() + other.gethboxrad())/2) >= dist_to_chara(other);
      if(statement){ other.sethealth(other.gethealth() - this.getdmg()); }
      return(statement);
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
  
  float dist_to_chara(Character other){
     return sqrt(  sq(other.getxpos() - this.getxpos())  +  sq( other.getypos() - this.getypos() ));
  }
  
  //void shoot(angle speed homingb )
  
}