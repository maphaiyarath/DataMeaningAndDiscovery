class Yelp {
  final String API_HOST = "api.yelp.com";
  final String DEFAULT_TERM = "dinner";
  final String DEFAULT_LOC = "San Francisco, CA";
  final int SEARCH_LIMIT = 3;
  final String SEARCH_PATH = "/v2/search";
  final String BIZ_PATH = "/v2/business";
  
  final String CON_KEY = "...";
  final String CON_SECRET = "...";
  final String TOKEN = "...";
  final String TOKEN_SECRET = "...";
  
  String loc;
  
  Yelp() {
    //
  }
  
  /*
  Yelp (String conKey, String conSec, String tok, String tokSec) {
    //
  }
  */

  String searchBizByLoc (String term, String loc) {
    return loc;
  }
}



// (10) displays visualization of data
// (10) viz leverages principles (prox, contrast, scale)
// (10) uses data in XML, CSV, or JSON format
// (15) uses appropriate abstraction for parsing data
// (5) doesn't treat data set / structure as pure text / String
// (15) uses at least 2 distinct data sets
// (10) visual design aesthetics are well-chosen, with intent
// (5) leverages appropriate OOP
// (5) uses appropriate data structures for internally managing data
// (10) well written, adhering to best practices in writing & design
// (5) contains comment header with name, project # and description