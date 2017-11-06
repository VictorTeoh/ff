class Character{
  float speed;
  float angle; // in radians
  float xpos;
  float ypos;
  PShape hbox;//no
  float hboxrad;
  float health;
  float dmg; // Character doesnt use it but player and bullet does xd bad organization
  //need moar constructors
  Character( float xcord, float ycord, float nspeed){
  /*   speed = spd;
     angle = ang;
     */
     speed = nspeed;
     xpos = xcord;
     ypos = ycord;
     hboxrad = 25;
     hbox = createShape(ELLIPSE, 0, 0, hboxrad, hboxrad);
     dmg = 10;// just for when the player or character runs into one another
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
  
  float gethealth(){
     return health; 
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
  
  void sethealth(float newhealth){
     health = newhealth;
  }
  
  void move(){
     xpos = xpos + speed * cos(angle);
     ypos = ypos + speed * sin(angle); 
  }
  
  float dist_to_chara(Character other){
     return sqrt(  sq(other.getxpos() - this.getxpos())  +  sq( other.getypos() - this.getypos() ));
  }
  
  boolean collision(Character other){
      boolean statement = ((this.gethboxrad() + other.gethboxrad())/2) >= dist_to_chara(other);
      if(statement){ other.sethealth(other.gethealth() - this.getdmg()); }
      return(statement);
  }
  
  boolean isdead(){
      if(health <= 0){ return true;}
      return false;
  }
  
  
  void shoot(){
    //idk
  }
  
  
  void setdmg(float newdmg){
     dmg = newdmg;
  }
  
  float getdmg(){
     return dmg;
  }
}