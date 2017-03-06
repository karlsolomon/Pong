
float x = 25;
float xStop = 475;
float y = 25;
float xStart = x-1;
float yStart = y-1;
float yStop = 475;
float easing = 0.1;
float targetX = 400;
void setup() {size(500, 500);}


/*
1. Rewrite the ease-out function using the lerp
method
2. Create an ease-in function using the lerp method.
Note that you will need to track the total distance
between start and end position as well as the
current distance to the end position to do this
*/

//ease out = decelerate as you near target

//float lerp(start, stop, %between)
void draw() {
  easeOut();
}


void easeOut() {
  background(0);
  ellipse(x, y, 50, 50);
  x = lerp(x, xStop, easing);
  y = lerp(y, yStop, easing);
}

void easeIn() {
  if(x >= xStop || y >= yStop) return;
  background(0);
  ellipse(x,y,50,50);
  x += lerp(xStart, x, easing) - xStart;
  y += lerp(yStart, y, easing) - yStart;  
}