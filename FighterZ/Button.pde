public class Button{
  public Rectangle rectangle;
  public String name;
  public PImage image;
  
  public Button(Rectangle r, String name_){
    name = name_;
    rectangle = r;
  }
  
  public Button(Rectangle r, String name_, PImage img){
    name = name_;
    rectangle = r;
    image = img;
  }
  
  public void drawRect(){
    rectMode(CORNER);
    stroke(0);
    strokeWeight(3);
    if (contains(mouseX, mouseY)){
      fill(128);
      stroke(255, 195, 0);
    }
    else{
      fill(255);
    }
    if (image != null){
      rect((float) getX(),(float) getY(),(float) getWidth(),(float) getHeight());
      image(image, (float) getX(),(float) getY(),(float) getWidth(),(float) getHeight());
    }
    else{
      rect((float) getX(),(float) getY(),(float) getWidth(),(float) getHeight());
      
      if (!(name.equals("NULL"))){
        int textSize = 20;
        fill(0);
        textSize(textSize);
        text(name, (float) getX() + (getWidth() / 2),(float) getY() + (getHeight() / 2) + (textSize / 2));
      }
    }
  }
  
  public int getX(){
    return (int) rectangle.getX();
  }
  
  public int getY(){
    return (int) rectangle.getY();
  }
  
  public int getWidth(){
    return (int) rectangle.getWidth();
  }
  
  public int getHeight(){
    return (int) rectangle.getHeight();
  }
  
  public boolean contains(int X, int Y){
    return rectangle.contains(X, Y);
  }
}
