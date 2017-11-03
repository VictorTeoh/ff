  //to do proper images later on use loadShape() look it up
  Player player;
  Character enemy;
  Bullet[] bullets;
  int[] keys_to_check = { UP, DOWN, LEFT, RIGHT, SHIFT, 90, 88 };
  //ascii values of z and x
  boolean[] keys_down = new boolean[keys_to_check.length];
  boolean[] pkeys_down = new boolean[keys_to_check.length];
  boolean move_key_pressed = false;
  int i;
  int atkdly = 6;// out of 60 frames what is the lag btwn each shot
  int atkdlyctr = 0;
  
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
    player = new Player(width/2,3*height/4, 10);//move this later
    
    enemy = new Character(width/2,height/4, 10);
    bullets = new Bullet[5];
  }
  
  void keyPressed(){
     copeWithKeys(true); // TRUE MEANS KEY PRESSED
  }
 
  void keyReleased(){
     copeWithKeys(false); // FALSE MEANS KEY NOT PRESSED
  }
  
  void copeWithKeys(boolean state){
    for( int i = 0; i< pkeys_down.length; i++){
      pkeys_down[i] = false;
    }
    for( int i = 0; i < keys_to_check.length; i++){
      if( keys_to_check[i] == keyCode ){
         keys_down[i] = state; 
         pkeys_down[i] = state;
      }
    }
  }
  
  void deletbullets(){
    for( int i = 0; i < bullets.length; i++){
      if(bullets[i] == null){
         break; 
      }
      //System.out.println(bullets[i].getxpos());
      if(bullets[i].getypos() < -50.0 || bullets[i].getypos() > height+50.0 ||
      bullets[i].getxpos() < -50.0 || bullets[i].getxpos() > width+50){
        bullets[i] = null;
      }
    }
  }
  
  
  void drawthethings(){
    for(i = 0; i < bullets.length; i++){
      if(bullets[i] != null){
        //System.out.println(bullets[i].getxpos());
        shape( bullets[i].gethbox(), bullets[i].getxpos(), bullets[i].getypos());
      }
    }
    shape( player.gethbox(), player.getxpos(), player.getypos());
    //fill(#0000ff);//idk
  }
  
  void movethethings(){ 
    for(i = 0; i < bullets.length; i++){
      if(bullets[i] != null){
        bullets[i].move();
      }
    }
    for(i = 0; i < 4; i++){//4 is the movement keys
      if(keys_down[i]){
        move_key_pressed = true;
        break;
      }
    }
    if(move_key_pressed){
      player.move();//make play function when menu stuff done
      if(player.getypos() < 5.0){ player.setypos(5.0);}
      if(player.getypos() > height-5.0){ player.setypos(height-5.0);}
      if(player.getxpos() < 5.0){ player.setxpos(5.0);}
      if(player.getxpos() > width-5.0){player.setxpos(width-5.0);}
      move_key_pressed = false;
    }
  }
  
  
  void pshoot(){
    if(atkdlyctr == atkdly && keys_down[5] && bullets[bullets.length-1] == null){
      player.shoot(); 
      atkdlyctr = 0;
    } 
  }
  
  void draw() {
    clear();
    drawthethings();
    deletbullets();
    movethethings();
    
    pshoot();// need to put a cd on this
    if(atkdlyctr != atkdly){
      atkdlyctr++;
    }
    //bring the conditon for shooting outside of player, same with shoot
      
    //System.out.println(player.getxpos());
    //System.out.println(player.getypos());
  }