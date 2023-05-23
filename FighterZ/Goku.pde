public class Goku implements character {
  private boolean up, left, down, right;
  private char[] keybinds;
  private ArrayList<PImage> sprites;
  
  public Goku(int PlayerNumber){
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
    setSprites("Goku");
  }
  
  public void setSprites(String keyword){
    File directory = new File("Mega Pack Extreme Butoden" + File.separator + keyword + " EB");
    File[] files = directory.listFiles();
    for (int i = 0; i < files.length; i++){
      String path = files[i].getAbsolutePath();
      if (path.endsWith(".png")){
        PImage image = loadImage(path);
        sprites.add(image);
      }
    }
  }
  
  public ArrayList<PImage> getSprites(){
    return sprites;
  }
  
  public void normalAttack(){
  }
  
  public void specialAttack(){
  }
  
  public void superAttack(){
  }
  
  public void changeKeybinds(){
  }
  
  public void update(){
  }
  
  public void playerSwap(char keybind){
  }
}
