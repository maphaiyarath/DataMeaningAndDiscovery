// Michelle Aphaiyarath
// Project 3 -> Consuming Structured Data

// uses at least 2 distinct data sets
final String low10 = "http://knoema.com/api/1.0/data/WBWDIGDF2015Dec?Time=1986-2015&country=1001620&series=1011820&Frequencies=A";
final String high10 = "http://knoema.com/api/1.0/data/WBWDIGDF2015Dec?Time=1960-2015&country=1001620&series=1011800&Frequencies=A";

Graph graph;
Info low, hi;

void setup() {
  size (700, 700);
  graph = new Graph();
  low = new Info();
  hi = new Info();
  low.prepData (low10);
  hi.prepData (high10);
}

void draw() {
  background (230, 210, 170);
  graph.drawAxes();
  graph.label();
  low.drawData();
  hi.drawData();
}

// (10) viz leverages principles (prox, contrast, scale)
// (10) visual design aesthetics are well-chosen, with intent
// (5) leverages appropriate OOP