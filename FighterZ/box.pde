public class Box{
  public Rectangle rectangle;
  private String name;
  public int offsetX; // top left
  public int offsetY; // top left
  
  public Box(int offsetX_, int offsetY_, int width_, int height_, String name_){
    rectangle = new Rectangle(0, 0, width_, height_);
    offsetX = offsetX_;
    offsetY = offsetY_;
    name = name_;
  }
  
  public String getName(){
    return name;
  }
  
  public void setLocation(int x, int y){
    rectangle.setLocation(x, y);
  }
  
  public int getHeight(){
    return (int) rectangle.getHeight();
  }
  
  public int getWidth(){
    return (int) rectangle.getWidth();
  }
  
  /*
  public boolean checkCollides(character other){
    for (int i = posX; i < posX + wid; i++) {
      if (i == other.posX) {
        for (int j = posY; i < posY + ht; j++) {
          if (j == other.posY) {
            return true;
          }
        }
      }
    }
    return false;
  }
  */
}
