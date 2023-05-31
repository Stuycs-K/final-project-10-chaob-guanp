public class Goku extends character {
  
  public Goku(int PlayerNumber){
    super(PlayerNumber);
    setSprites("Goku", PlayerNumber);
    boxLibrary = new Box[sprites.size()];
    setBoxes();
  }
 
  public void update(){
    imageMode(CENTER);
    if (!stunned){
      if(up && !down && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching){ // Jump
        if (jumpCD == 0){
          jumping = true; 
        }
        else{
          idle();
        }
      }
      else if(!up && down && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching){ // Crouch
        if (crouchCD == 0){
          crouching = true;
        }
        else{
          idle();
        }
      }
    
      if (jumping){
        jump();
      }
      else if (crouching){
        crouch();
      }
      else if (!(up ^ down) && !(right ^ left) && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching){ // Idle
        idle();
      }
      else if(!(up ^ down) && (right ^ left) && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching ){ // Left and right walk
        walk();
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
    }
  }
  
  private void idle(){
    PImage img;
    startIndex = findFirstSprite(0);
    endIndex = findLastSprite(0);
      
    if (ticks > endIndex - startIndex){
      ticks = 0;
    } 
    
    if (mirror){
      img = getMirrorPImage(sprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage());

    //  img = changeColor(img);
      //set mirror hitboxes too
    }
    else{
      img = sprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage();
    }

    image(img, posX + (img.width/2), posY + (height - img.height/2));
  }
  
  private void walk(){
    PImage img;
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
    
    if (mirror){
      img = getMirrorPImage(sprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage());
      //img = changeColor(img);
      //set mirror hitboxes too
    }
    else{
      img = sprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage();
    }
    
    image(img, posX + (img.width/2), posY + (height - img.height/2)); 

    if (posX + img.width >= width){
      posX = width - img.width;
    }
    if (posX <= 0){
      posX = 0;
    }
  }
  
  private void jump(){
    PImage img;
    if (!anim){
      ticks = 0;
      anim = true;
    }
          
    startIndex = findFirstSprite(41);
    endIndex = findLastSprite(41);
  
    if (ticks == 0){
      if (left && !right){
        jumpX = -18;
      }
      else if (right && !left){
        jumpX = 18;
      }
      else{
        jumpX = 0;
      }
    }
     
    int jumpHeight = 150;
    posX += jumpX;
    posY = -1 * (-1 * (int) (Math.pow( ( (2 * Math.sqrt(jumpHeight) / (double) (endIndex-startIndex) ) * ticks) - Math.sqrt(jumpHeight), 2) ) + jumpHeight);
    
    if (mirror){
      img = getMirrorPImage(sprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage());
     // img = changeColor(img);
      //set mirror hitboxes too
    }
    else{
      img = sprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage();
    }
    
    if (posX + img.width >= width){
      posX = width - img.width;
    }
    if (posX <= 0){
      posX = 0;
    }
    if (posY - img.height > height){
      posY = height - img.height;
    }
    image(img, posX + (img.width/2), posY + (height - img.height/2)); // -25
   // drawHitbox(posX, posY + posY - height + posY, 100, 100);
       
    if (ticks >= endIndex - startIndex){
      jumpCD = 4;
      jumping = false;
      anim = false;
    }
  }
  
  private void crouch(){
    PImage img;
    if (mirror){
      img = getMirrorPImage(sprites.get(findLastSprite(10)).getImage());
      //img = changeColor(img);
      //set mirror hitboxes too
    }
    else{
      img = sprites.get(findLastSprite(10)).getImage();
      
    }
    image(img, posX + (img.width/2), posY + (height - img.height/2));

    if (!down){
      crouchCD = 4;
      crouching = false;
    }
  }
  
  private void setBoxes(){
    for (int i = 0; i < boxLibrary.length; i++){
      
    }
  }
}
