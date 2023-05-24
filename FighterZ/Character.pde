public class character{
  private ArrayList<MyPImage> sprites;
  private char[] keybinds;
  public boolean up, left, down, right, light, medium, heavy, special;
  public int ticks;
  public int[] location; // location data will be (x,y) coord, coord being at the middle of the bottom of the sprite
  
  public character(int PlayerNumber){
    up = false;
    left = false;
    down = false;
    right = false;
    light = false;
    medium = false;
    heavy = false;
    special = false;
    if (PlayerNumber == 1){
      keybinds = new char[] {'w', 'a', 's', 'd', 'e', 'r', 't', 'y'}; // player 1
    }
    else{
      keybinds = new char[] {'o', 'k', 'l', ';', 'p', '[', ']', '\\'}; // player 2
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
    imageMode(CENTER);
    if (up == left == down == right == false && location[1] == 0){
      
    }
    PImage img = sprites1.get(counter).getImage();
    image(img, img.width/2, height - img.height/2); // the y coord should also account for jump height. 
    
  }
  public void playerSwap(char keybind){
  }
}
