public class character{
  public char[] keybinds;
  public Box[] boxLibrary;
  public ArrayList<MyPImage> sprites;
  public boolean up, left, down, right, light, medium, heavy, special;
  public boolean stunned, inAir, jumping, crouching;
  public boolean anim;
  public boolean mirror;
  public boolean didSwap = true;
  public int startIndex, endIndex, crouchCD, jumpCD, jumpX;
  public int posX; // bottom right;
  public int posY; // bottom down;
  //Coords stored at bottom right corner
  public int ticks;
  
  public character(int PlayerNumber){
    up = false;left = false;down = false;right = false;light = false;medium = false;heavy = false;special = false;stunned = false;inAir = false;jumping = false;crouching = false;anim = false;
    startIndex = 0;endIndex = 0;crouchCD = 0;jumpCD = 0;jumpX = 0;
    ticks = 0;
    if (PlayerNumber == 1){
      keybinds = new char[] {'w', 'a', 's', 'd', 'e', 'r', 't', 'y'}; // player 1
      posX = 50;
      posY = 0;
      mirror = false;
    }
    else{
      keybinds = new char[] {'o', 'k', 'l', ';', 'p', '[', ']', '\\'}; // player 2
      posX = width - 150;
      posY = 0;
      didSwap = false;
      mirror = true;
    }
  }
 
  public void setSprites(String keyword, int PlayerNumber){
    sprites = new ArrayList<MyPImage>();
    File directory = new File(sketchPath("Mega Pack Extreme Butoden" + File.separator + keyword + " EB"));
      
    FileFilter filter = new FileFilter() {
      public boolean accept(File directory){
        return directory.getName().endsWith("png");
      }
    };
      
    File[] files = directory.listFiles(filter);
    Arrays.sort(files);
      
    for (int i = 0; i < files.length; i++){
      MyPImage img = new MyPImage(files[i]); 
      if (PlayerNumber == 1) {
        sprites.add(img);
      }
      else {
        MyPImage temp = (changeColor(img));
        sprites.add(temp);
      }

    }
  }
  
  public ArrayList<MyPImage> getSprites(){
  return sprites;
  }
  public void setKeybinds(){
  }
  public char[] getKeybinds(){
  return keybinds;
  }
 
  public void normalAttack(){
  }
  public void superAttack(){
  }
  public void specialAttack(){
  }
 
  public int findFirstSprite(int value){
    for (int i = 0; i < sprites.size(); i++){
      if (sprites.get(i).getName().startsWith(value + "-")){
        return i;
      }
    }
    return -1;
  }

  public int findLastSprite(int value){
    for (int i = sprites.size() - 1; i >= 0; i--){
      if (sprites.get(i).getName().startsWith(value + "-")){
        return i;
      }
    }
    return -1;
  }
 
  public void update(){
    
  }
  
  public MyPImage changeColor(MyPImage image) {
    for(int i=0; i < image.getImage().width; i++){
      for(int j=0; j < image.getImage().height; j++) {
        if (red(image.getImage().get(j, i)) > 98 && green(image.getImage().get(j, i)) > 60 && blue(image.getImage().get(j, i)) < 50) {
         color gray = color(100, 100, 100);
          image.getImage().set(j, i, gray);
        }
        /*
        if (red(image.getImage().get(j, i)) < 200 && green(image.getImage().get(j, i)) < 200 && blue(image.getImage().get(j, i)) < 200 ) {
          image.getImage().set(j, i, color(red(image.getImage().get(j, i)), green(image.getImage().get(j, i)), 0));
        } */
      }
    }
    return image;
  }
  
  public PImage getMirrorPImage(PImage image) {
    PImage mirror;
    mirror = createImage(image.width, image.height, ARGB);
    for(int i=0; i < image.width; i++){
      for(int j=0; j < image.height; j++){
        int xPixel = image.width - i - 1;
        int yPixel = j;
        mirror.pixels[yPixel*image.width+xPixel] = image.pixels[j*image.width+i];
      }
    }
    return mirror;
  }
  
  public void setMirrorBoxes(){
  }

  public void playerSwap(char keybind){
  }
  
  public void drawHitbox(int pX, int pY, int w, int l) {
    Hitbox one = new Hitbox(pX, height - pY, pX + w, (height-pY) - l);
   // img.hitboxes.add(one); 
    noFill();
    stroke(0);
    rectMode(CORNERS);
    rect(pX, height - pY, pX + w, (height-pY) - l);
  }
}
