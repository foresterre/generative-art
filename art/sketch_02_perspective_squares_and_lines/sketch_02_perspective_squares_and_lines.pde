int tileSize = 40;
float probability = 0.45;

void setup() {
  size(800, 800);
  background(255);
  noLoop();
}

void draw() {
  for (int x = 0; x < width; x += tileSize) {
    for (int y = 0; y < height; y += tileSize) {
      drawTile(x, y);
    }
  }
}

void drawTile(int x, int y) {
  float choice = random(1);
  
  if (choice < probability) {
    drawSquare(x, y);
  } else {
    drawDiagonal(x, y);
  }
}

void drawSquare(int x, int y) {
  rect(x, y, tileSize, tileSize);
}

void drawDiagonal(int x, int y) {
  line(x, y + tileSize, x + tileSize, y);
}
