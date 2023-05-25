public class Goku extends character {
  //boxes library?
  
  public Goku(int PlayerNumber){
    super(PlayerNumber);
    setSprites("Goku");
  }
  
  public void update(){
    try{
      tickDelay = 60;
      imageMode(CENTER);
      PImage img;
      
      if (!stunned){
        if(up && !down && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching){ 
          if (jumpCD == 0){
            jumping = true;
          }
          else{
            up = false;
          }
        }
        else if(!up && down && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching){ // Crouch
          if(jumpCD == 0){
            crouching = true;
          }
          else{
            down = false;
          }
        }
      
        if (jumping){
          if (!anim){
            ticks = 0;
            anim = true;
          }
            
          startIndex = findFirstSprite(41);
          endIndex = findLastSprite(41);
        
          if (ticks == 0){
            if (left){
              jumpX = -15;
            }
            else if (right){
              jumpX = 15;
            }
            else{
              jumpX = 0;
            }
          }
          
          posX += jumpX;
          posY = -1 * (-1 * (int) (Math.pow( ( (2 * Math.sqrt(100) / (double) (endIndex-startIndex) ) * ticks) - Math.sqrt(100), 2) ) + 100);
          img = sprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage(); 
          
          if (posX + img.width >= width){
            posX = width - img.width;
          }
          if (posX <= 0){
            posX = 0;
          }
          if (posY - img.height > height){
            posY = height - img.height;
          }
          image(img, posX + (img.width/2), posY + (height - img.width/2) - 25);
            
          if (ticks >= endIndex - startIndex){
            jumping = false;
            anim = false;
            jumpCD = 4;
          }
        }
        else if (crouching){
          img = sprites.get(findLastSprite(10)).getImage();
          image(img, posX + (img.width/2), posY + (height - img.width/2));
          if (!down){
            crouching = false;
            crouchCD = 3;
          }
        }
        else if (!(up ^ down) && !(right ^ left) && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching){ // Idle
          startIndex = findFirstSprite(0);
          endIndex = findLastSprite(0);
      
          if (ticks > endIndex - startIndex){
            ticks = 0;
          }
      
          img = sprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage(); // 
          image(img, posX + (img.width/2), posY + (height - img.width/2)); // the posY coord should also account for jump height. 
        }
        else if(!(up ^ down) && (right ^ left) && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching ){ // Left and right walk
          if (right){
            posX+=5;
          }
          else{
            posX-=5;
          }
          startIndex = findFirstSprite(20);
          endIndex = findLastSprite(20);
      
          if (ticks > endIndex - startIndex){
            ticks = 0;
          }
      
          img = sprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage(); // 
          image(img, posX + (img.width/2), posY + (height - img.width/2)); // the y coord should also account for jump height. 
      
          if (posX + img.width >= width){
            posX = width - img.width;
          }
          if (posX <= 0){
            posX = 0;
          }
        }
      }
    
      if (posY > 0){
        inAir = true;
      }
      else{
        inAir = false;
      }
      
      if (jumpCD > 0){
        jumpCD--;
      }
      if (crouchCD > 0){
        crouchCD--;
      }
      
      ticks++;
      Thread.sleep(tickDelay);
    }
    catch(InterruptedException e){
      print("THREADSLEEP EXCEPTION");
    }
  }
}
