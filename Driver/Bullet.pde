//try Bullet inheriting Character?
class Bullet extends Character{
  /*
  float speed;
  float angle; // in radians
  float xpos;
  float ypos;
  PShape hbox;//no
  //redo the constructor
  Bullet( float xcord, float ycord){
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
  */
  public Bullet(float xpos, float ypos){
   super(xpos, ypos); 
   hbox = createShape(ELLIPSE, 0, 0, 10, 10);
   shape( hbox, getxpos(), getypos());
  }
  
  void move(){
   xpos = xpos + speed * cos(angle);
   ypos = ypos + speed * sin(angle); 
  }
}