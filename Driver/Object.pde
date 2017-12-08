class Object{
  float speed;
  float rotatespeed;
  float angle; // in radians
  float xpos;
  float ypos;
  float cxpos;
  float cypos;
  PShape hbox;//no
  float hboxrad;
  
  Object(){
     hboxrad = 25;
     hbox = createShape(ELLIPSE, 0, 0, hboxrad, hboxrad);
  }
  
  Object( float xcord, float ycord, float nspeed){
     this();
     rotatespeed = 0;
     speed = nspeed;
     xpos = xcord;
     ypos = ycord;
     cxpos = xcord;
     cypos = ycord;
  }
  
  Object( float xcord, float ycord, float cxcord, float cycord, float nspeed, float nrspeed){
     this();
     rotatespeed = nrspeed;
     speed = nspeed;
     xpos = xcord;
     ypos = ycord;
     cxpos = cxcord;
     cypos = cycord;
  }
  
  float getspeed(){
     return speed; 
  }
  
  float getrotatespeed() {
     return rotatespeed;
  }
  
  float getangle(){
     return angle; 
  }
  
  float getcxpos(){
     return cxpos; 
  }
  
  float getcypos(){
     return cypos; 
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
  
  void setcxpos(float newcxpos){
     cxpos = newcxpos; 
  }
  
  void setcypos(float newcypos){
     cypos = newcypos; 
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
  
  void rotate(float turnangle){
     float distance = dist_to_center();
     //xpos  
  }
  
  void move(){
     xpos = xpos + speed * cos(angle);
     ypos = ypos + speed * sin(angle); 
  }
  
  //center of rotation
  float dist_to_center(){
     return sqrt( sq(cxpos - xpos) + sq(cypos - ypos));
  }
  
  float dist_to_chara(Object other){
     return sqrt(  sq(other.getxpos() - xpos)  +  sq( other.getypos() - ypos ));
  }
  
  boolean collision(Object other){
      boolean statement = ((this.gethboxrad() + other.gethboxrad())/2) >= dist_to_chara(other);
      //if(statement){ other.sethealth(0); }//changed
      return(statement);
  }
  
 Object clone(){//idk what to do with this
    //makes a deep copy
    Object clone = new Object();
    return clone;
  }
  
}