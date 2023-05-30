public class MyPImage{
  private PImage image;
  private String name;
  private ArrayList<Hitbox> hitboxes;
  private ArrayList<Hurtbox> hurtboxes;
  
  public MyPImage(File img){
    String path = img.getAbsolutePath();
    name = path.substring(path.lastIndexOf(File.separator) + 1);
    image = loadImage(path);
    hitboxes = new ArrayList<Hitbox>();
    hurtboxes = new ArrayList<Hurtbox>(); 
  }
  
  public PImage getImage(){
    return image;
  }
  
  public String getName(){
    return name;
  }
  
  public void drawHitbox(int pX, int pY, int w, int l) {
    Hitbox one = new Hitbox(pX, height - pY, pX + w, (height-pY) - l);
    hitboxes.add(one);
    //noFill();
    //stroke(255, 0, 0);
    //rect(pX, height - pY, pX + w, (height-pY) - l);
  }
  public void drawHurtbox(int pX, int pY, int w, int l) {
    Hurtbox one = new Hurtbox(pX, height - pY, pX + w, (height-pY) - l);
    hurtboxes.add(one);
    //noFill();
    //stroke(100, 100, 100);
    //rect(pX, height - pY, pX + w, (height-pY) - l);
  }
  
}
