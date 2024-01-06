import processing.svg.*;

int tileSize = 40;
int strokeWeight = 2;
int maxRand = 7;

void setup() {
  size(400, 400);
  noLoop();
}

void draw() {
  beginRecord(SVG, "tiles.svg");
  
  for (int x = 0; x < width; x += tileSize) {
    for (int y = 0; y < height; y += tileSize) {
      int type = int(random(maxRand));
      drawTile(x, y, tileSize, type);
    }
  }
  
  endRecord();
}


void drawTile(int x, int y, int size, int type) {
  stroke(0);
  strokeWeight(strokeWeight);
  noFill();

  switch (type) {
    
    case 0: // Horizonal line
      line(x, y, x + size, y);
      break;
    
    case 1: // Vertical line
      line(x, y, x, y + size);
      break;
    
    case 2: // Cross
      line(x, y, x + size, y + size);
      line(x, y + size, x + size, y);
      break;

    case 3: // 1/4 Circle
      arc(x + size, y, size * 2, size * 2, HALF_PI, PI);
      break;

    case 4: // 1/4 Circle with Y offset
      arc(x + size, y + size, size * 2, size * 2, HALF_PI, PI);
      break;
    
    case 5: // 3/4 Circle variation 1
      int radius = size / 2;
      arc(x + radius, y + radius, size * 2, size * 2, 0, PI + HALF_PI);
      break;
    
    case 6: // 3/4 Circle variation 2
      arc(x, y + size, size * 2, size * 2, 0, PI + HALF_PI);
      break;
    
    case 7: // Slightly diagional line
      int offset = int(random(3)) + 2;
      line(x, y + offset * 2, x + size, y);
      break;

  }
}
