// Michelle Aphaiyarath
// Project 3 -> Consuming Structured Data
//           -> visualizing income distribution in the US

// http://knoema.com/WBWDIGDF2015Dec/world-development-indicators-wdi-december-2015

// uses at least 2 distinct data sets
final String low10 = "http://knoema.com/api/1.0/data/WBWDIGDF2015Dec?Time=1986-2015&country=1001620&series=1011820&Frequencies=A";
final String high10 = "http://knoema.com/api/1.0/data/WBWDIGDF2015Dec?Time=1960-2015&country=1001620&series=1011800&Frequencies=A";

color berry, coal;
Graph graph;
Info low, hi;

void setup() {
  size (700, 700);
  berry = color (175, 110, 120);
  coal = color (120, 30, 55);
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
  graph.drawBox();
  graph.drawLegend (height - 67, berry, "LOWEST");
  graph.drawLegend (height - 33, coal, "HIGHEST");
  low.drawData (berry);
  hi.drawData (coal);
}

// (10) viz leverages principles (prox, contrast, scale)
// (10) visual design aesthetics are well-chosen, with intent