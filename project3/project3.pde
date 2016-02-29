final String URL = "...";
JSONObject demograph, museum;
PImage map;
String event;

void setup() {
  size (1131, 742);
  map = loadImage ("map.png");
  
}

void draw() {
  background (255);
  image (map, 0, 0, 1131, 742);
}

// boolean dataLoaded = false;

/*
void loadData() {
  for (int i = 0; i < 100; ++i) {
    document = loadXML (URL);
    dataLoaded = true;
    println ("loadData finished");
  }
}
*/

// thread ("loadData");
  //println ("setup finished");
  
  /*
  if (dataLoaded) {
    text ("Cool viz.", width/2, height/2);
  } else {
    text ("Waiting on data..", width/2, height/2);
  }
  */