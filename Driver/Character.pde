class Character{
  float speed;
  float angle; // in radians
  float xpos;
  float ypos;
  PShape hbox;//no
  float hboxrad;
  Character( float xcord, float ycord, float nspeed){
  /*   speed = spd;
     angle = ang;
     */
     speed = nspeed;
     xpos = xcord;
     ypos = ycord;
     hboxrad = 25;
     hbox = createShape(ELLIPSE, 0, 0, hboxrad, hboxrad);
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
  
  void move(){
     xpos = xpos + speed * cos(angle);
     ypos = ypos + speed * sin(angle); 
  }
  
  float dist_to_chara(Character other){
     return sqrt(  sq(other.getxpos() - this.getxpos())  +  sq( other.getypos() - this.getypos() ));
  }
  
  boolean collision(Character other){
      boolean statement = ((this.gethboxrad() + other.gethboxrad())/2) >= dist_to_chara(other);
      return(statement);
  }
  
  void shoot(){
    //idk
  }
}