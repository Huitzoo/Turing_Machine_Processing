import controlP5.*;
 
ControlP5 cp5;
String cadena;
String cadena_p = "";
int x = 240;
int stoptime;
int i;
int j;
int k = 0;
int bandera = 0;
Textlabel valida, estado,estado1, valida1,mensaje,c1, c2,c3,c4;
int y = 240;
int x1 = 0;
void setup(){  
  frameRate(30);
  size(600,600);
  PFont font = createFont("arial", 20); 
  cp5 = new ControlP5(this);
  cp5.addTextfield("Cadena")
    .setPosition(160, 70)
      .setSize(200, 30)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0));
            
  cp5.addBang("Submit")
    .setPosition(380, 70)
      .setSize(80, 40)
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER); 
        
  /*Label para mostrar las tags */
  mensaje =  cp5.addTextlabel("mensaje","Maquina de Turing: Palindromo",160,40).setFont(font);
  c1 =  cp5.addTextlabel("c1","Cinta1: ",50,240).setFont(font);
  c2 =  cp5.addTextlabel("c2","Cinta2:",50,270).setFont(font);
  estado =  cp5.addTextlabel("estado","Estado: ",50,300).setFont(font); 
  valida =  cp5.addTextlabel("valida","Final: ",50,330).setFont(font);
  
  /*Label para mostrar cadenas*/
  c3 =  cp5.addTextlabel("c3","",230,170).setFont(font);
  
  /*Label para mostrar estado y valides*/
  estado1 =  cp5.addTextlabel("estado1","",180,300).setFont(font); 
  valida1 =  cp5.addTextlabel("valida1","",180,330).setFont(font);
  textFont(font);
}

void Submit() {
  int e = 0;
  cadena = cp5.get(Textfield.class,"Cadena").getText();
  i = cadena.length()-1;   
  j = 0;
  x1 = 225 + 15*cadena.length();
  /*if ((e=validar())== 1){
    stoptime=millis()+1000;
    while(stoptime>millis()){}
    exit();  
  }*/
}

void draw(){
  background(0);
  paint();
  stoptime=millis()+1000;
  while(stoptime>millis()){}
}

public void cintas(){
    text(cadena.charAt(i),x,260);
    text(cadena.charAt(j),x1,290);
    x = x+15;  
    x1 = x1-15;
    if (bandera == 1 ){
      estado1.setText("Invirtiendo");
    }
    if (bandera == 2){
    }
    if (bandera == 3){
       valida1.setText("No valida");    
       estado1.setText("Test");
    }
    if (bandera == 4){
      valida1.setText("Valida");  
      estado1.setText("Test");  
    }
}

public void paint(){
  if (cadena != null){ 
    c3.setText(cadena);
    k = 1;
    if (bandera == 3) {
       exit();
    }
    if(j!=cadena.length()&&bandera!=3){  
      bandera = 2;
      print(" i: ",i," j: ",j);
      checar();
      i--;
      j++;
    }
    else{
       stoptime=millis()+4000;
       while(stoptime>millis()){}
       exit();  
    }
  }
}

public void checar(){
  bandera = 2;
  if (cadena.charAt(i) == cadena.charAt(j)){
    bandera = 4;
    fill(63,243,0);
    cintas();
  }else{
    bandera = 3;
    fill(255,22,13);
    cintas();
  }
}


/*public int validar(){
  int e = 0;
  for (int i = 0;i<cadena.length();i++){
    if(cadena.charAt(i)!='1' || cadena.charAt(i)!='0'){
      estado1.setText("No es el alfabeto");
      e = 1;  
    }
  }
  return e;
}*/