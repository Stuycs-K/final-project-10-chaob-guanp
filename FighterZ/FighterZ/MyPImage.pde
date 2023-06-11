public class MyPImage{
  private PImage image;
  private String name;
  public ArrayList<Hitbox> hitboxes;
  public ArrayList<Hurtbox> hurtboxes;
  
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
  
}
