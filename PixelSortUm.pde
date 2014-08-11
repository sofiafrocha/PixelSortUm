////Simple Glitch Art script
//todo: fazer fatias

PImage photo;
float randomNum;

String name = "IMG_5992";
String extension = ".jpg";

//Number of lines
int numLines = 10000;

boolean saved = false;

void setup() {
	photo = loadImage(name+extension);
	size(photo.width, photo.height);

	for (int i = 0; i < numLines; ++i) {
		glitch();
	}
}

void draw() {
	image(photo, 0, 0);

	//Exports the image (once)
	if (saved == false) {
		println("Saving");
		save(name+"Glitched"+extension);
		saved = true;
	}
}

//Functions
void glitch(){

	photo.loadPixels();
	float lineHeight;
	float lineWidth;

	//Length of the array pixels[], that contais the images' pixels
	float len = photo.width * photo.height;

	//Height of the line
	lineHeight = random(photo.height/100, photo.height/13);
	//Width of the line
	lineWidth = 2;

	//Picks a random pixel, as long as it can be drawn
	//Since it picks a pixel and draws the line upwards,
	//So it must pick a pixel at least the lines' heigth from the top of the image
	//(That is what the "lineHeight*photo.width" is there for)
	//"len-lineWidth" is there so it won't try to draw in a pixel out of the array, because of the lines' width
	randomNum = random(lineHeight*photo.width, len-lineWidth);

	//Convert to int
	int startingPixel = int(randomNum);

	//Store the pixel's color (that will be used for the line)
	color cor = photo.pixels[startingPixel];

	for (int b = 0; b < lineWidth; ++b) {
		for (int h = 0; h < lineHeight; ++h) {
			photo.pixels[(startingPixel+b)-photo.width*h] = cor;
			//The pixel above is found by subtracting the images' width
		}
	}

	photo.updatePixels();
}

//TODO
void fatias(){
	photo.loadPixels();

	float altura = 8;
	//comprimento do array pixels[], que contêm os pixeis da imagem
	float len = photo.width * photo.height;

	//random linha
	//substituir todos os pixeis da linha na linha daí a 50 pixeis

	photo.updatePixels();
}
