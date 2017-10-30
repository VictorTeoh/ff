  //to do proper images later on use loadShape() look it up
  Player player;
  Bullet[] bullets;
  int[] keys_to_check = { UP, DOWN, LEFT, RIGHT, SHIFT, 90, 88 };
  //ascii values of z and x
  boolean[] keys_down = new boolean[keys_to_check.length];
  boolean move_key_pressed = false;
  int i;
  
  //current display seems like the higher positive values are at the bottom and
  //negative at the top  
  void setup() {
    //fullScreen();    //0-1370 domain ~ 0-875 range
    size(600,600);
    //surface.setResizable(true);
    //surface.setSize(width, height);
    frameRate(60);
    background(0);
    noStroke();
    player = new Player(0,0);//move this later
    bullets = new Bullet[10];
  }
  
  void keyPressed(){
     copeWithKeys(true); // TRUE MEANS KEY PRESSED
  }
 
  void keyReleased(){
     copeWithKeys(false); // FALSE MEANS KEY NOT PRESSED
  }
  
  void copeWithKeys(boolean state){
    for( int i = 0; i < keys_to_check.length; i++){
      if( keys_to_check[i] == keyCode ){ keys_down[i] = state; }
    }
  }
  
  void deletbullets(){
    for( int i = 0; i < bullets.length; i++){
      if(bullets[i] == null){
         break; 
      }
      if(bullets[i].getypos() < -50.0 || bullets[i].getypos() > height+50.0 ||
      bullets[i].getxpos() < -50.0 || bullets[i].getxpos() > width+50){
        bullets[i] = null;
      }
    }
  }
  
  
  void drawthethings(){
    shape( player.gethbox(), player.getxpos(), player.getypos());
    for(i = 0; i < bullets.length; i++){
      if(bullets[i] != null){
        System.out.println(bullets[i].getxpos());
        //System.out.println(bullets[i].getxpos() == player.getxpos());
        shape( bullets[i].gethbox(), bullets[i].getxpos(), bullets[i].getypos());
      }
    }
  }
  
  void movethethings(){
    for(i = 0; i < 4; i++){//4 is the movement keys
      if(keys_down[i]){
          move_key_pressed = true;
          break;
      }
    }
    for(i = 0; i < bullets.length; i++){
      if(bullets[i] != null){
        bullets[i].move();
      }
    }
  }
  
  
  void pshoot(){
    if(move_key_pressed){
      player.move();//make play function when menu stuff done
      move_key_pressed = false;//slightly inefficient?
    }
    if(keys_down[5] && bullets[0] == null){
      player.shoot(); 
    } 
  }
  
  void draw() {
    clear();
    drawthethings();
    deletbullets();
    movethethings();
    pshoot();
    //bring the conditon for shooting outside of player, same with shoot
      
    //System.out.println(player.getxpos());
    //System.out.println(player.getypos());
  }