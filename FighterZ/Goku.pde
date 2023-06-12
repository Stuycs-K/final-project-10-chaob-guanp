public class Goku extends character {
  
  public Goku(int PlayerNumber){
    super(PlayerNumber);
    health = 150;maxHealth = 150;
    setSprites("Goku", PlayerNumber);
    setBoxes();
  }
 
  public MyPImage update(){
    MyPImage currentFrame = null;
    imageMode(CORNER);
    
    if (gameStart){
      if (!stunned || blocking){
        if(up && !down && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching && !lightIng && !mediumIng && !heavyIng && !stunned){ // Jump
          if (jumpCD == 0){
            jumping = true;
          }
          else{
            currentFrame = idle();
          }
        }
        else if(!up && down && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching && !lightIng && !mediumIng && !heavyIng){ // Crouch
          if (crouchCD == 0){
            crouching = true;
          }
          else{
            currentFrame = idle();
          }
        }
        else if (!up && !down && light && !medium && !heavy && !special && !inAir && !jumping && !crouching && !lightIng && !mediumIng && !heavyIng && !stunned){
          if (lightCD == 0){
            lightIng = true;
          }
          else{
            currentFrame = idle();
          }
        }
        else if (!up && !down && !light && medium && !heavy && !special && !inAir && !jumping && !crouching && !lightIng && !mediumIng && !heavyIng && !stunned){
          if (mediumCD == 0){
            mediumIng = true;
          }
          else{
            currentFrame = idle();
          }
        }
        else if (!up && !down && !light && !medium && heavy && !special && !inAir && !jumping && !crouching && !lightIng && !mediumIng && !heavyIng){
          if (heavyCD == 0){
            heavyIng = true;
          }
          else{
            currentFrame = idle();
          }
        }
    
        if (jumping && !crouching && !lightIng && !mediumIng && !heavyIng){
          currentFrame = jump();
        }
        else if (crouching && !jumping && !lightIng && !mediumIng && !heavyIng){
          currentFrame = crouch();
        }
        else if (lightIng && !jumping && !crouching && !mediumIng && !heavyIng){
          currentFrame = light();
        }
        else if (mediumIng && !jumping && !crouching && !lightIng && !heavyIng){
          currentFrame = medium();
        }
        else if (heavyIng && !jumping && !crouching && !lightIng && !mediumIng){
          currentFrame = heavy();
        }
        else if (!(up ^ down) && !(right ^ left) && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching){ // Idle
          currentFrame = idle();
        }
        else if (!(up ^ down) && (right ^ left) && !light && !medium && !heavy && !special && !inAir && !jumping && !crouching){ // Left and right walk
          if (!blocking || !stunned){
            currentFrame = walk();
          }
          else{
            currentFrame = block();
          }
        }
        else if (!inAir){ //if nothing else somehow, or a nothing combo of keys, or locked by bad booleans
          jumping = false;
          crouching = false;
          lightIng = false;
          mediumIng = false;
          heavyIng = false;
          currentFrame = idle();
        }
        else if (inAir){
          currentFrame = fall();
        }
      }
      else{
        jumping = false;
        crouching = false;
        lightIng = false;
        mediumIng = false;
        heavyIng = false;
        currentFrame = stun();
      }
    }
    else{
      if (inAir){
        currentFrame = fall();
      }
      else{
        if (health > 0){
          currentFrame = victory();
        }
        else{
          currentFrame = defeat();
        }
      }
    }
    
    if (stunned){
      if (stunTime > 0){
        stunned = true;
        stunTime--;
      }
      else{
        stunned = false;
        alreadyHit = false;
        anim = false;
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
    
    if (lightCD > 0){
      lightCD--;
    }
    
    if (mediumCD > 0){
      mediumCD--;
    }
    
    if (heavyCD > 0){
      heavyCD--;
    }
    
    if (posX >= width){
      posX = width;
    }
    if (posX <= 0){
      posX = 0;
    }
    if (posY < 0){
      posY = 0;
      inAir = false;
    }
    
    ticks++;
    return currentFrame;
  }
  
  private void updateBoxes(PImage img, int current){
    rectMode(CORNER);
    for (int i = 0; i < sprites.get(current).hitboxes.size(); i++){
      Hitbox temp = sprites.get(current).hitboxes.get(i);
      int offX = temp.offsetX;
      int offY = temp.offsetY;
      if (mirror){
        offX = -temp.getWidth() - offX;
      }
      temp.setLocation(posX + offX, height - (posY + offY));
      if (display){
        noFill();
        strokeWeight(1);
        stroke(0, 255, 0, 255);
        rect(posX + offX, height - (posY + offY), temp.getWidth(), temp.getHeight());
      }
    }
    for (int i = 0; i < sprites.get(current).hurtboxes.size(); i++){
      Hurtbox temp = sprites.get(current).hurtboxes.get(i);
      int offX = temp.offsetX;
      int offY = temp.offsetY;
      if (mirror){
        offX = -temp.getWidth() - offX;
      }
      temp.setLocation(posX + offX, height - (posY + offY));
      if (display){
        noFill();
        strokeWeight(1);
        stroke(255, 0, 0, 255);
        rect(posX + offX, height - (posY + offY), temp.getWidth(), temp.getHeight());
      }
    }
  }
  
  private MyPImage idle(){
    PImage img;
    startIndex = findFirstSprite(0);
    endIndex = findLastSprite(0);
      
    if (ticks > endIndex - startIndex){
      ticks = 0;
    }
    
    int current = (ticks % (endIndex - startIndex + 1)) + startIndex;
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      img = sprites.get(current).getImage();
      image(img, posX, -posY + (height - img.height));
    }
    
    updateBoxes(img, current);
    return sprites.get(current);
  }
  
  private MyPImage walk(){
    PImage img;
    if (right){
      posX+=5;
      if (mirror){
        blocking = true;
      }
      else{
        blocking = false;
      }
    }
    else{
      posX-=5;
      if (mirror){
        blocking = false;
      }
      else{
        blocking = true;
      }
    }
    startIndex = findFirstSprite(20);
    endIndex = findLastSprite(20);
      
    if (ticks > endIndex - startIndex){
      ticks = 0;
    }
    
    int current = (ticks % (endIndex - startIndex + 1)) + startIndex;
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      img = sprites.get(current).getImage();
      image(img, posX, -posY + (height - img.height));
    }
    
    updateBoxes(img, current);
    return sprites.get(current);
  }
  
  private MyPImage block(){
    PImage img;
    
    int current = findFirstSprite(120) + 1;
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      img = sprites.get(current).getImage();
      image(img, posX, -posY + (height - img.height));
    }
    updateBoxes(img, current);
    
    return sprites.get(current);
  }
  
  private MyPImage jump(){
    PImage img;
    if (!anim){
      ticks = 0;
      anim = true;
    }
          
    startIndex = findFirstSprite(41);
    endIndex = findLastSprite(41);
  
    if (ticks == 0){
      if (left && !right){
        jumpX = -10;
      }
      else if (right && !left){
        jumpX = 10;
      }
      else{
        jumpX = 0;
      }
    }
     
    int jumpHeight = 150;
    posX += jumpX;
    posY = (-1 * (int) (Math.pow( ( (2 * Math.sqrt(jumpHeight) / (double) (endIndex-startIndex) ) * ticks) - Math.sqrt(jumpHeight), 2) ) + jumpHeight);
    
    int current = (ticks % (endIndex - startIndex + 1)) + startIndex;
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
    }
    else{
      img = sprites.get(current).getImage();
    }
    
    if (posY - img.height > height){
      posY = height - img.height;
    }
    
    if (mirror){
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      image(img, posX, -posY + (height - img.height));
    }
    
    updateBoxes(img, current);
       
    if (ticks >= endIndex - startIndex){
      jumpCD = 8;
      jumping = false;
      anim = false;
    }
    return sprites.get(current);
  }
  
  private MyPImage crouch(){
    PImage img;
    blocking = true; // temporary
    
    int current;
    if (stunned){
      current = findLastSprite(130);
    }
    else{
      current = findLastSprite(10);
    }
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      img = sprites.get(current).getImage();
      image(img, posX, -posY + (height - img.height));
    }
    updateBoxes(img, current);

    if (!down){
      crouchCD = 4;
      crouching = false;
      
      blocking = false; //  temporary
    }
    return sprites.get(current);
  }
  
  private MyPImage light(){
    PImage img;
    
    startIndex = findFirstSprite(200);
    endIndex = findLastSprite(200);
    
    if (!anim){
      ticks = 0;
      anim = true;
      lightCD = 6 + (endIndex - startIndex); // 6 + 4
      mediumCD += (endIndex - startIndex);
      heavyCD += (endIndex - startIndex);
    }
    
    int current = (ticks % (endIndex - startIndex + 1)) + startIndex;
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      img = sprites.get(current).getImage();
      image(img, posX, -posY + (height - img.height));
    }
    
    updateBoxes(img, current);
       
    if (ticks >= endIndex - startIndex){
      lightIng = false;
      anim = false;
      alreadyHit = false;
    }
    return sprites.get(current);
  }
  
  private MyPImage medium(){
    PImage img;
    
    startIndex = findFirstSprite(220);
    endIndex = findLastSprite(220);
    
    if (!anim){
      ticks = 0;
      anim = true;
      mediumCD = 9 + (endIndex - startIndex); // 9 + 6
      lightCD += (endIndex - startIndex);
      heavyCD += (endIndex - startIndex);
    }
    
    int current = (ticks % (endIndex - startIndex + 1)) + startIndex;
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      img = sprites.get(current).getImage();
      image(img, posX, -posY + (height - img.height));
    }
    
    updateBoxes(img, current);
       
    if (ticks >= endIndex - startIndex){
      mediumIng = false;
      anim = false;
      alreadyHit = false;
    }
    return sprites.get(current);
  }
  
  private MyPImage heavy(){
    PImage img;
    
    startIndex = findFirstSprite(240);
    endIndex = findLastSprite(240);
    
    if (!anim){
      ticks = 0;
      anim = true;
      heavyCD = 12 + (endIndex - startIndex); // 12 + 5
      lightCD += (endIndex - startIndex);
      mediumCD += (endIndex - startIndex);
    }
    
    int current = (ticks % (endIndex - startIndex + 1)) + startIndex;
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      img = sprites.get(current).getImage();
      image(img, posX, -posY + (height - img.height));
    }
    
    updateBoxes(img, current);
       
    if (ticks >= endIndex - startIndex){
      heavyIng = false;
      anim = false;
      alreadyHit = false;
    }
    return sprites.get(current);
  }
  
  private MyPImage stun(){
    PImage img;
    
    startIndex = findFirstSprite(5000);
    endIndex = findLastSprite(5000);
    
    if (!anim){
      ticks = 0;
      anim = true;
    }
    
    if (ticks >= endIndex - startIndex){
      ticks = endIndex- startIndex;
      alreadyHit = false;
    }
    
    int current = (ticks % (endIndex - startIndex + 1)) + startIndex;
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      img = sprites.get(current).getImage();
      image(img, posX, -posY + (height - img.height));
    }
    
    updateBoxes(img, current);
    return sprites.get(current);
  }
  
  private MyPImage fall(){
    PImage img;
    int current;
    
    if (health > 0){
      current = findLastSprite(41) - 2;
    }
    else{
      current = findLastSprite(5070);
    }
    
    if (!anim || jumping){
      ticks = 0;
      jumping = false;
      anim = true;
    }
    
    posY -= ticks * 10;
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      img = sprites.get(current).getImage();
      image(img, posX, -posY + (height - img.height));
    }
    
    updateBoxes(img, current);
    
    if (posY <= 0){
      anim = false;
    }
    
    return sprites.get(current);
  }
  
  private MyPImage victory(){
    PImage img;
    
    startIndex = findFirstSprite(180);
    endIndex = findLastSprite(180);
    
    if (!anim){
      ticks = 0;
      anim = true;
    }
    
    if (ticks > endIndex - startIndex){
      ticks = endIndex- startIndex;
    }
    
    int current = (ticks % (endIndex - startIndex + 1)) + startIndex;
    
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      img = sprites.get(current).getImage();
      image(img, posX, -posY + (height - img.height));
    }
    
    updateBoxes(img, current);
    
    return sprites.get(current);
  }
  
  private MyPImage defeat(){
    PImage img;
    
    int current = findFirstSprite(5120);
    if (mirror){
      img = getMirrorPImage(sprites.get(current).getImage());
      image(img, posX - img.width, -posY + (height - img.height));
    }
    else{
      img = sprites.get(current).getImage();
      image(img, posX, -posY + (height - img.height));
    }
    updateBoxes(img, current);
    
    return sprites.get(current);
  }
  
  private void setBoxes(){
    //ADD COMMENTS THAT SHOW THE ANIMATION NUMBERS SO YOU CAN MANUALLY VIEW AND SET
    //0 idle, 10 crouch, 20 walk, 41 jump, 200 light, 220 medium, 240 heavy
    // Constructor takes: offsetX from left, offsetY from bottom (at top of box, from bottom of sprite), width, height
    // 6 is minimum stun time for combo use
    for (int i = 0; i < sprites.size(); i++){
      MyPImage frame = sprites.get(i);
      if (i >= findFirstSprite(0) && i <= findLastSprite(0)){ // Walk
        frame.hitboxes.add(new Hitbox(0, 44, 95, 44, "Legs"));
        frame.hitboxes.add(new Hitbox(26, 86, 64, 42, "Torso"));
        frame.hitboxes.add(new Hitbox(60, 96, 23, 20, "Head"));
      }
      else if (i == findLastSprite(10)){ // Crouch
        frame.hitboxes.add(new Hitbox(15, 46, 78, 42, "Legs"));
        frame.hitboxes.add(new Hitbox(35, 88, 44, 42, "Torso"));
        frame.hitboxes.add(new Hitbox(10, 100, 40, 25, "Hand"));
      }
      else if (i >= findFirstSprite(20) && i <= findLastSprite(20)){ // Walk
        frame.hitboxes.add(new Hitbox(0, frame.getImage().height, frame.getImage().width, frame.getImage().height, "Whole"));
      }
      else if (i >= findFirstSprite(41) && i <= findLastSprite(41)){ // Jump
        frame.hitboxes.add(new Hitbox(0, frame.getImage().height, frame.getImage().width, frame.getImage().height, "Whole"));
      }
      else if (i >= findFirstSprite(200) && i <= findLastSprite(200)){ // Light
        frame.hitboxes.add(new Hitbox(0, frame.getImage().height, frame.getImage().width - 40, frame.getImage().height, "Whole"));
        if (i == findFirstSprite(200) + 1){
          frame.hurtboxes.add(new Hurtbox(110, 90, 36, 15, "Punch", 3, 7));
        }
      }
      else if (i >= findFirstSprite(220) && i <= findLastSprite(220)){ // Medium
        frame.hitboxes.add(new Hitbox(0, frame.getImage().height, frame.getImage().width - 50, frame.getImage().height, "Whole"));
        if (i == findFirstSprite(220) + 2 || i == findFirstSprite(220) + 3){
          frame.hurtboxes.add(new Hurtbox(100, 80, 40, 20, "Punch", 5, 6));
        }
      }
      else if (i >= findFirstSprite(240) && i <= findLastSprite(240)){ // Heavy
        frame.hitboxes.add(new Hitbox(0, frame.getImage().height, frame.getImage().width - 60, frame.getImage().height, "Whole"));
        if (i == findFirstSprite(240) + 2){
          frame.hurtboxes.add(new Hurtbox(110, 135, 40, 40, "Kick", 7, 4));
        }
      }
      else if (i == findLastSprite(5000)){
        frame.hitboxes.add(new Hitbox(0, frame.getImage().height, frame.getImage().width, frame.getImage().height, "Whole"));
      }
    }
  }
}
