////Simple Glitch Art script
//todo: fazer fatias

PImage photo;
float randomNum;

String name = "IMG_5992";
String extension = ".jpg";

//número de riscos que vai fazer
int numLines = 10000;

boolean saved = false;

void setup() {
	photo = loadImage(name+extension);
	size(photo.width, photo.height);

	for (int i = 0; i < numLines; ++i) {
		glitch();
	}

	//int numero2 = 5;
}

void draw() {
	image(photo, 0, 0);

	//exporta a imagem (só uma vez)
	if (saved == false) {
		save(name+"Glitched"+extension);
		saved = true;
	}
}

//Functions
void glitch(){
	photo.loadPixels();
	float altura;
	float alargura;

	//comprimento do array pixels[], que contêm os pixeis da imagem
	float len = photo.width * photo.height;
	//altura e largura do risco
	//caso seja na horizontal
	if (photo.width > photo.height) {
		altura = random(10, 81);
		largura = 2;
	}
	
	//caso seja na vertical ou quadrado
	else {
		altura = random(10, 81);
		largura = 2;
	}

	//escolhe um pixel ao acaso, desde que se consiga desenhar o risco (haja espaço)
	//+ largura e - largura, para assegurar que quando as barras são muito largas
	//ele n escolhe um pixel demasiado próximo do fim da imagem
	randomNum = random(altura*photo.width+largura, len-largura);
	//converter para int
	int escolhido = int(randomNum);
	//armazenar a cor do pixel escolhido
	color cor = photo.pixels[escolhido];

	for (int b = 0; b < largura; ++b) {
		for (int h = 0; h < altura; ++h) {
			//o pixel acima é econtrado subtraindo o comprimento da imagem
			photo.pixels[(escolhido+b)-photo.width*h] = cor;
		}
	}

	photo.updatePixels();
}

void fatias(){
	photo.loadPixels();

	float altura = 8;
	//comprimento do array pixels[], que contêm os pixeis da imagem
	float len = photo.width * photo.height;

	//random linha
	//substituir todos os pixeis da linha na linha daí a 50 pixeis

	photo.updatePixels();
}
