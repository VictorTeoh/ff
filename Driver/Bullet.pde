//try Bullet inheriting Character?
class Bullet extends Character{
  public Bullet(float xpos, float ypos){
   super(xpos, ypos); 
   hbox = createShape(ELLIPSE, 0, 0, 10, 10);
  // shape( hbox, xpos, ypos);
  }
  
  void move(){
   xpos = xpos + speed * cos(angle);
   ypos = ypos + speed * sin(angle); 
  }
}