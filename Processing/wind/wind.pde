import processing.sound.*;


void setup(){
SoundFile file;
file = new SoundFile(this, "windsound.mp3");
  if (sensor3 > 100){
  file.play(1,1.0);
  }
  else{
   if (file.isPlaying()) {
   file.pause(); 
   }
  }
  
}
  