// leverages appropriate OOP
class Info {
  // uses appropriate data structures for internally managing data
  ArrayList<HashMap<String, String>> percentageInfo;
  color berry;
  float p, percentScale, yearScale;
  HashMap<String, String> hm;
  int border;
  // uses data in JSON format
  JSONArray data;
  JSONObject datum, doc;
  String percent, year;
  String[] y;
  
  Info() {
    percentageInfo = new ArrayList<HashMap<String, String>>();
    hm = new HashMap<String, String>();
    berry = color (175, 110, 120);
    border = 100;
  }
  
  void prepData (String URL) {
    doc = loadJSONObject (URL);
    data = doc.getJSONArray ("data");
    
    // uses appropriate abstraction for parsing data
    for (int i = 0; i < data.size(); i++) {
      datum = data.getJSONObject(i);
      
      // doesn't treat data set / structure as pure text / String
      // get year as String
      year = datum.getString ("Time");
      y = split (year, '-');
      year = y[0];
      
      // get percentage as String
      p = datum.getFloat ("Value");
      percent = str(p);
      
      hm.put ("Time", year);
      hm.put ("Value", percent);
      percentageInfo.add (hm);
      
      println ((i + 1) + " - " + year + " - " + percent);
    }
  }
  
  void drawData() {
    for (int i = 0; i < percentageInfo.size(); i++) {
      hm = percentageInfo.get(i);
      
      // x = year, scaled to size of canvas
      int year = int (hm.get("Time"));
      yearScale = map (year, 1985, 2015, border, width - border);
      
      // y = income share held by percentage, scaled to size of canvas
      float percent = float (hm.get ("Value"));
      percentScale = map (percent, 0, 35, height - border, border);
      
      // displays viz of data
      noStroke();
      fill (berry);
      rect (yearScale, percentScale, 5, 5);
      
      // why is it only printing / drawing last value over & over,
      // instead of the 9 dif points?
      // println ((i + 1) + " - " + year + " - " + percent);
    }
  }
}