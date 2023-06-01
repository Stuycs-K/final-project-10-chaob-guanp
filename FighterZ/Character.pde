public class character{
  public char[] keybinds;
  public ArrayList<MyPImage> sprites;
  public int health;
  public boolean up, left, down, right, light, medium, heavy, special;
  public boolean stunned, inAir, jumping, crouching, blocking, attacking;
  public boolean anim;
  public boolean mirror; // When mirrored, posX will be the sprite's image's width off. As in, it will be image.width greater than it should be to be representing the left side
  public int startIndex, endIndex, crouchCD, jumpCD, lightCD, jumpX, stunTime;
  public int posX; // left;
  public int posY; // down;
  //Coords stored at bottom left corner
  public int ticks;
  
  public character(int PlayerNumber){
    up = false;left = false;down = false;right = false;light = false;medium = false;heavy = false;special = false;stunned = false;inAir = false;jumping = false;crouching = false;blocking = false;attacking = false;anim = false;
    startIndex = 0;endIndex = 0;crouchCD = 0;jumpCD = 0;lightCD = 0;jumpX = 0;stunTime = 0;
    ticks = 0;
    if (PlayerNumber == 1){
      keybinds = new char[] {'w', 'a', 's', 'd', 'e', 'r', 't', 'y'}; // player 1
      posX = 0;
      posY = 0;
      mirror = false;
    }
    else{
      keybinds = new char[] {'o', 'k', 'l', ';', 'p', '[', ']', '\\'}; // player 2
      posX = width;
      posY = 0;
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
      sprites.add(img);
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
 
  public MyPImage update(){
    return null;
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
}
