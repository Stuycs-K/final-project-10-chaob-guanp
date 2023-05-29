public class MyPImage{
  private PImage image;
  private String name;
  private ArrayList<Hitbox> hitboxes;
  private ArrayList<Hurtbox> hurtboxes;
  
  public MyPImage(File img){
    String path = img.getAbsolutePath();
    name = path.substring(path.lastIndexOf(File.separator) + 1);
    image = loadImage(path);
  }
  
  public PImage getImage(){
    return image;
  }
  
  public String getName(){
    return name;
  }
  
  public void drawHitbox(int pX, int pY, int w, int l) {
    Hitbox one = new Hitbox(pX, pY, w, l);
    hitboxes.add(one);
    rect(pX, pY, w, l);
  }
  public void drawHurtbox(int pX, int pY, int w, int l) {
    Hurtbox one = new Hurtbox(pX, pY, w, l);
    hurtboxes.add(one);
    rect(pX, pY, w, l);
  }
  
}
