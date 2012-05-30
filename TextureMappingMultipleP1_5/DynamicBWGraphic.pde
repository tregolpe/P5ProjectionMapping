//------------------------------------------------------------------
// This draws a black and white grid that chages over time
//------------------------------------------------------------------

public class DynamicBWGraphic extends DynamicGraphic
{
  // Based in part on WhitneyScope by Jim Bumgardner
  // http://www.coverpop.com/p5/whitney_2/applet/whitney_2.pde
  // From ideas by John Whitney -- see his book "Digital Harmony"

  static final String NAME = "bwgraphic";

  float[] rates = { 0.5f, 1f, 2f, 3.5f, 4f };

  float rectWidth;

  DynamicBWGraphic(PApplet app, int iwidth, int iheight)
  {
    super( app, iwidth, iheight);
    
    // add ourself to the glboal lists of dynamic images
    // Do we want to do this in the constructor or is that potentially evil?
    // Maybe we want to register copies with different params under different names...
    // Or potentially check for other entries in the HashMap and save to a different name
    sourceDynamic.put( NAME, this );
    sourceImages.put( NAME, this );    
    
    rectWidth = iwidth / rates.length; // width of a single rectangle
  }

  void initialize()
  {    
  }


  //
  // do the actual drawing (off-screen)
  //
  void pre()
  {
 

    this.beginDraw();
    this.noStroke();
    
    GL gl = this.beginGL();
    gl.glClearColor(0f,0f,0f,0f);
    gl.glClear(GL.GL_COLOR_BUFFER_BIT | GL.GL_DEPTH_BUFFER_BIT);
    this.endGL();
    
    float currentTime = millis() * 0.005;
    
    // draw a rect for each
    for (int i=0; i < rates.length; i++)
    {
       this.fill( 255f*0.5f*(sin( rates[i] * currentTime ) + 1f) );
       this.rect(i*rectWidth, 0, rectWidth, this.height);
    }
    this.endDraw();
  }

  // end class DynamicBWGraphic
}

