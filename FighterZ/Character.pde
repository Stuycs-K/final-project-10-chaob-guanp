public class character{
  private char[] keybinds;
  public ArrayList<MyPImage> sprites;
  public boolean up, left, down, right, light, medium, heavy, special;
  public boolean stunned, inAir, jumping, crouching;
  public boolean anim;
  public boolean mirror;
  public int startIndex, endIndex, crouchCD, jumpCD, jumpX;
  public int posX; // bottom right X;
  public int posY; // bottom right Y;
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
      posX = width - 50;
      posY = 0;
      mirror = true;
    }
  }
  
  public void setSprites(String keyword){
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
  
  public void update(){
    
  }
  public void playerSwap(char keybind){
  }
}
