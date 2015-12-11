//your variable declarations here
Star[] stars = new Star[200];
SpaceShip ship = new SpaceShip();
Bullet b = new Bullet(ship);
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
int score = 0;
//Asteroid rock = new Asteroid();
public void setup() 
{
  //your code here
  size(600,600);
  background(0,0,12);
  for(int i = 0; i<stars.length; i++){
    stars[i] = new Star(); 
  }
  for(int i = 0; i< 20; i++){
     asteroids.add(new Asteroid());
  }

}
public void draw() 
{
  //your code here
  background(0,0,0);
  for(int i = 0; i<stars.length; i++){
    stars[i].show(); 
  }
  ship.move();
  ship.show();
  for(int b = 0; b<bullets.size(); b++){
    bullets.get(b).move();
    bullets.get(b).show();
  }

  for(int i = 0; i<asteroids.size(); i++){
    asteroids.get(i).move();
    asteroids.get(i).show();
      if(dist(asteroids.get(i).getX(), asteroids.get(i).getY(), ship.getX(),ship.getY()) <20){
         asteroids.remove(i);
         break;
        } 
      for(int b = 0; b< bullets.size(); b++){
        //bullets.get(b).move();
        //bullets.get(b).show();
        if(dist((float)bullets.get(b).getX(),(float)bullets.get(b).getY(),(float)asteroids.get(i).getX(), (float)asteroids.get(i).getY()) < 25){
          asteroids.remove(i);
          bullets.remove(b);
          score ++; 
          break;
        }
        if(bullets.get(b).getX() > 595 || bullets.get(b).getY() > 595){
          bullets.remove(b);
        }
        
  }
}

  stroke(255,255,255);
  text("Score: " + score, 50, 50);
}

class Star{
  private int myX,myY;
  private int cR; 
  private int cG;
  private int cB;
  public Star(){
    myX = (int)(Math.random()*600);
    myY = (int)(Math.random()*600);
    cR =(int)(Math.random()*186); 
    cG =(int)(Math.random()*136)+112;
    cB =(int)(Math.random()*147)+116;
  }
  public void show(){
    stroke(cR,cG,cB);
    ellipse(myX, myY, 1,1);
  }

}
class SpaceShip extends Floater  
{   
    //your code here
    public SpaceShip(){
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = -3;
      yCorners[3] = 0;
      
      myColor = color(224,224,224);
      myCenterX = 300;
      myCenterY = 300;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    
    }
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;} 
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}
   
    
}

class Asteroid extends Floater
{
  private int rotateSpeed;
  public Asteroid()
  {
    
  corners = 10;
  int[] xS = {16,8,4,0,-10,-8,-12,-14,-6,0};
  int[] yS = {0,-4,-10,12,12,8,4,-4,-8,-6}; 
  xCorners = xS;
  yCorners = yS;


  myColor = color(92,90,90); 
  myCenterX = Math.random()*600;
  myCenterY = Math.random()*600;
  myDirectionX = (Math.random()*2)-1;
  myDirectionY = (Math.random()*2)-1;
  myPointDirection = 0;

  rotateSpeed = (int)(Math.random()*10)-5;
  }

  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;} 
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
  
  public void move(){
    rotate(rotateSpeed);
    super.move();
  }
}
class Bullet extends Floater{
    public Bullet(SpaceShip ship){
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myPointDirection = ship.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5*Math.cos(dRadians)+ ship.getDirectionX();
    myDirectionY = 5*Math.sin(dRadians)+ ship.getDirectionX();
  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;} 
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}

  public void move(){
    super.move();
  }
  public void show(){
    fill(255,0,0);
    ellipse(getX(),getY(),5,5);
  }
}
public void keyPressed(){
   if (key == 'h'){
     ship.setX((int)(Math.random()*600));
     ship.setY((int)(Math.random()*600));
     ship.setDirectionX(0);
     ship.setDirectionY(0);
     ship.setPointDirection((int)(Math.random()*180));
    }
    if(keyCode == UP){
      ship.accelerate(0.1);
    }
    if(keyCode == DOWN){
      ship.accelerate(-0.1);
    }
   if(keyCode == LEFT){
      ship.rotate(-15);
    }
    if(keyCode == RIGHT){
      ship.rotate(15);
    }
    if(keyCode == ' '){
      bullets.add(new Bullet(ship));
    }
}


  
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

