public class Goku extends character {
  
  public Goku(int PlayerNumber){
    super(PlayerNumber);
    setSprites("Goku");
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
    
    int current = (ticks % (endIndex - startIndex + 1)) + startIndex;
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      //set mirror hitboxes too
    }
    else{
      img = sprites.get(current).getImage();
      
    }
    image(img, posX + (img.width/2), posY + (height - img.height/2));
    
    for (int i = 0; i < sprites.get(current).hitboxes.size(); i++){
      Hitbox temp = sprites.get(current).hitboxes.get(i);
      temp.setLocation(posX + temp.offsetX, height - (posY + temp.offsetY));
      if (display){
        noFill();
        stroke(0);
        rect(posX + temp.offsetX, height - (posY + temp.offsetY), temp.getWidth(), temp.getHeight());
      }
    }
    for (int i = 0; i < sprites.get(current).hurtboxes.size(); i++){
      Hurtbox temp = sprites.get(current).hurtboxes.get(i);
      temp.setLocation(posX + temp.offsetX, height - (posY + temp.offsetY));
      if (display){
        noFill();
        stroke(255, 0, 0);
        rect(posX + temp.offsetX, height - (posY + temp.offsetY), temp.getWidth(), temp.getHeight());
      }
    }
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
    posY = (-1 * (int) (Math.pow( ( (2 * Math.sqrt(jumpHeight) / (double) (endIndex-startIndex) ) * ticks) - Math.sqrt(jumpHeight), 2) ) + jumpHeight);
    
    if (mirror){
      img = getMirrorPImage(sprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage());
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
    image(img, posX + (img.width/2), (-1 * posY) + (height - img.height/2)); // -25
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
    //ADD COMMENTS THAT SHOW THE ANIMATION NUMBERS SO YOU CAN MANUALLY VIEW AND SET
    //0 idle, 10 crouch, 20 walk, 41 jump
    for (int i = 0; i < sprites.size(); i++){
      MyPImage frame = sprites.get(i);
      if (i >= findFirstSprite(0) && i <= findLastSprite(0)){ // Walk
        frame.hitboxes.add(new Hitbox(0, 44, 95, 44, "Legs"));
        frame.hitboxes.add(new Hitbox(26, 86, 64, 42, "Torso"));
        frame.hitboxes.add(new Hitbox(60, 96, 23, 20, "Head"));
        frame.hurtboxes.add(new Hurtbox(70, 70, 23, 20, "Random"));
      }
    }
  }
}
