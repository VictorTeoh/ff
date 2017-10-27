class Character{
  float speed;
  float angle; // in radians
  float xpos;
  float ypos;
  PShape hbox;//no
  Character( float xcord, float ycord){
  /*   speed = spd;
     angle = ang;
     */
     speed = 10;
     xpos = xcord;
     ypos = ycord;
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
  
  void setspeed(float newspeed){
     speed = newspeed;
  }
  
  void setangle(float newangle){
     angle = newangle;
  }
  
  void sethbox(PShape newhbox){
     hbox = newhbox;
  }
}