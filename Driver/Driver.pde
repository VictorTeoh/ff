
  Ball[] balls;
  
  boolean reactionStarted;
  
  void setup() {
    size(600,600);
    background(0);
    noStroke();
    reactionStarted = false;
    balls = new Ball[26];
    for( int i = 0; i < balls.length; i++ ){
      balls[i] = new Ball();
    }
  }

  void mouseClicked(){
    //only spawns ball if no reaction is already taking place; 
    if( !reactionStarted){ 
      reactionStarted = true; 
      Ball b = new Ball();
      balls[0] = b;
      b.x = mouseX; 
      b.y = mouseY;
      b.grow(); 
    }
  }
  
  //checks if w/in proper distance of another growing and shrinking ball
  void checkState(){
    for(Ball b: balls){
      if(b.state == 1 || b.state == 2){
        for(Ball c : balls){
          if(dist(c.x, c.y, b.x, b.y) <= (c.rad + b.rad)/2 && ((!(c.state == 1) &&!(c.state == 2)) &&(c.state != 4))){c.state = 1;}
        }//end of for
      }//end of if
    }//end of for
  }
  //O(n^2)
  
  void checkReaction(){
    boolean rx = true;
    for(Ball b: balls){
      if(b.state == 1 || b.state == 2){
        rx = false;
      }
    }
    if((rx)) reactionStarted = false;
  }
  void draw() {
    clear();
    for(int i = 0; i < balls.length; i++){
      Ball b = balls[i];
      
      //checks if balls should start following reaction or continue bouncing
      if( reactionStarted ){
        //checks if it's growing -- if it grows too big, it should start shrinking
        if( b.state == 1){
          if(b.rad >= 90){
            b.state = 2;
            b.shrink();
          }
          //if it's not big enough yet, it should keep growing
          else{b.grow();}
        }
        
        else{
          //if it's in shrink mode, it should keep shrinking until death
          if(b.state == 2){
            b.shrink();
          }
          //if it's in moving mode, it should keep moving;
          else if (b.state == 0){
              b.boundary();
              b.move();
            }
         }  
      }
      //if no reaction, should keep moving
      else{
        b.boundary();
        b.move();
      }
    }
    //each ball checks if it should start growing or not
      checkState();
    //checks if reaction is still even happening
    checkReaction();
  }