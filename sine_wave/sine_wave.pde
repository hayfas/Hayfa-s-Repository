import ddf.minim.*; //this loads the minim library
import ddf.minim.ugens.*; //this loads more stuff out of the minim library

Minim minim;
AudioOutput out; //this represents the output (speakers)
Oscil wave; //this is an oscillator

int[] scale = {60, 62, 64, 65, 67, 69, 71, 72, 84, 23, 23, 75, 82, 98};
int whichnote = 0;

void setup()
{
  size(512, 512);
  //initialize the minim and out objects
  minim = new Minim(this); //start the audio engine
  out = minim.getLineOut(); //sets the output to your laptop output
  
  wave = new Oscil( 440., 0.6, Waves.SINE ); //this sets up the oscillator
  wave.patch( out ); //this plugs into the speakers
}

void draw()
{
  frameRate(4);
  int pitch = int(random(60, 84));
  wave.setFrequency(mtof(pitch));
  wave.setAmplitude( map(mouseY, 0, height, 1., 0.) );
  
  whichnote = (whichnote+1) % scale.length;
}

float mtof(int note)
{
  return (440. * exp(0.057762265 * (note - 69.)));
}
