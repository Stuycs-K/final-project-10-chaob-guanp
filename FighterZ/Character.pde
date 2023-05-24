public class character{
  private ArrayList<MyPImage> sprites;
  private char[] keybinds;
  public boolean up, left, down, right;
  
  public character(int PlayerNumber){
    up = false;
    left = false;
    down = false;
    right = false;
    if (PlayerNumber == 1){
      keybinds = new char[] {'w', 'a', 's', 'd'}; // player 1
    }
    else{
      keybinds = new char[] {'p', 'l', ';', '\''}; // player 2
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
  public void update(){
  }
  public void playerSwap(char keybind){
  }
}
