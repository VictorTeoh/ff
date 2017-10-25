class Character{
  float speed;
  float angle; // in radians
  float xpos;
  float ypos;
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
}