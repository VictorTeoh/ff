class Character{
  float speed;
  float angle; // in radians
  float xpos;
  float ypos;
  PShape hbox;//no
  Character( float xcord, float ycord, float nspeed){
  /*   speed = spd;
     angle = ang;
     */
     speed = nspeed;
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
  
  void move(){
   xpos = xpos + speed * cos(angle);
   ypos = ypos + speed * sin(angle); 
  }
  
  void shoot(){
    
  }
}