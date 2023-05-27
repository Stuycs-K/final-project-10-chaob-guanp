public class MyPImage{
  private PImage image;
  private String name;
  private Hitbox[] hitboxes;
  private Hurtbox[] hurtboxes;
  
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
  
  public int returnHitbox(int pX, int pY, int w, int l) {
    rect(pX, pY, w, l);
    return 1;
  }
}
