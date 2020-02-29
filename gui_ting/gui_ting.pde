Knap tilfoej1 = new Knap(100, 80, 150, 50);
Knap fjern1 = new Knap(100, 150, 150, 50);
Knap tilfoej2 = new Knap(400, 80, 150, 50);
Knap fjern2 = new Knap(400, 150, 150, 50);
int konto1 = 0;
int konto2 = 0;
PImage glad;
PImage sur; 



void setup() {
  frameRate(7);
  // størrelsen 
  size(600, 600);
  glad = loadImage("smiley1.png"); 
  sur = loadImage("smiley2.png"); 
  

}

void draw() {
  // clearer efter hver gang 
  clear();
  background(255, 179, 102);


  //Tegner tilfoej1 knappen
  tilfoej1.lavknap();
  tilfoej1.setTekst("Tilføj 100 kr");

  //Tegner fjern1 knappen
  fjern1.lavknap();
  fjern1.setTekst("Fjern 100 kr");


  //Tegner tilfoej2 knappen
  tilfoej2.lavknap();
  tilfoej2.setTekst("Tilføj 100 kr");

  //Tegner fjern2 knappen
  fjern2.lavknap();
  fjern2.setTekst("Fjern 100 kr");

    // Kassen og teksten til konto1
  fill(102, 255, 153); 
  rect(140, 320, 80, 50, 7);
  fill(0);
  text("Konto 1", 150, 310 );
  text(konto1 + " Kr", 150, 320 + 25);
  
  //Kassen og teksten til konto2
  fill(102, 255, 153);  
  rect(390, 320, 80, 50, 7);
  fill(0);
  textSize(16);
  text(konto2 + " Kr", 400, 320 + 25);
  text("Konto 2", 400, 310 );


  //Laver funktionen til tilfoej1
  if (tilfoej1.knapTrykket) {
    konto1 += 100;
    println("Konto 1: " + konto1);
    tilfoej1.knapTrykket = false;
     image(glad, 100, 300);
  }
  //Laver funktionen til fjern1
  if (fjern1.knapTrykket) {
    konto1 -= 100;
    println("Konto 1: " + konto1);
    fjern1.knapTrykket = false;
     image(sur, 150, 300);
  }

  // Laver funktionen til tilfoej2
  if (tilfoej2.knapTrykket) {
    konto2 += 100;
    println("Konto 2: " + konto2);
    tilfoej2.knapTrykket = false;
     image(glad, 100, 300);
  }

  // Laver funktionen til fjern2
  if (fjern2.knapTrykket) {
    konto2 -= 100;
    println("Konto 2: " + konto2);
    fjern2.knapTrykket = false;
     image(sur, 150, 300);
  }

}
//Ser om knappen bliver klikket på
void mousePressed() {
  tilfoej2.klik();
  tilfoej1.klik();

  fjern1.klik();
  fjern2.klik();


}

//Klassen til knappen
class Knap {

  //Variabler 
  boolean knapTrykket = false; // definerer om knappen er trykket på 
  float posX; 
  float posY; 

  float sizeX, sizeY;//størrelsen af knap

  Knap(int a, int b, int c, int d ) {
    posX = a;
    posY = b;
    sizeX = c;
    sizeY = d;
  }
  
  //ser om der bliver trykket på knappen
  void klik() {
    if (mouseX > posX && mouseX < posX + sizeX && mouseY > posY && mouseY < posY + sizeY) {
      knapTrykket = true;
      println("trykket");
    } else {
      knapTrykket = false;
    }
  }
 
  //tilføjer tekst
  void setTekst(String tekst) {
    fill(0);
    text(tekst, posX +(sizeX/8), posY + (sizeY/2));
  }
  
  //laver selve knappen
  void lavknap() {
    float farve1 = random(0,255);
    float farve2 = random(0,255);
    float farve3 = random(0,255);
    
    fill(farve1, farve2, farve3);
    rect(posX, posY, sizeX, sizeY);
  }
}
