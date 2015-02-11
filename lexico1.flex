/* RECLARACION DE IMPORTACIONES*/
package FlexCup1;

import java_cup.runtime.*; /* trabaja en tiempo real*/
import java.io.Reader;     /* permite realizar la lectura entrante*/
      
%% 
   
/*DECLARACION DE OPCIONES*/
/*la siguiente línea permite asignar el nombre a la case de java generada
 automaticamente, en nuestro ejemplo sería AnalizadorLexico.java */
%class AnalizadorLexico
/*Activa el contador de lineas y utilizar con la variable yyline*/
%line  
/*Activa el contador de columnas*/   
%column  
/* Activa la compatibilidad con el archivo cup, permite integrar el flex y cup*/    
%cup 
   

%{
    /*Son metodos generados para mostrar el simbolo, que numero de entero 
      le vamos a pasar java_cup.Symbol, %,{[, aquellos simbolos que no tienen un valor*/
    private Symbol symbol(int type, int yyline, int yycolumn) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /*que numero entero vamos a pasar java_cup.Symbol, aquellos simbolos q
    si tienen valor (String, Integer)*/
    private Symbol symbol(int type, Object value, int linea, int columna) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

// para que cuando llegue al final del archivo de entrada se cierre 
   
//EXPRESIONES REGULARES
/*nos sirve para la ignoracion en caso de tener un carro o salto de linea*/
Salto = \r|\n|\r\n   
/*ahora ignoramos adicionalmente un tabulador y hoja nueva o con los 
  caracteres especiales que tiene en salto*/           
Espacio     = {Salto} | [\t\f]
/*es para permitir espacion entre palabras y que las tome encuenta como String*/
EspacioAcept = [ ]
/*es para activar el abecedario minúsculo*/
Lminuscula = [a-z]
/*es para activar el abecedario mayúsculo*/
Lmayuscula = [A-Z] 


//Reglas lexica
%%  
<YYINITIAL> { 
   //estado inicial donde empieza el analisis
  //una vez que a reconocido un token regresa por el siguiente token

    ";"                { 
                          return symbol(sym.FINLINEA, new String(yytext()),yyline,yycolumn); }
  
    {Lminuscula}       {    
                       return symbol(sym.MINUSCULA, new String(yytext()),yyline,yycolumn); }

    {Lmayuscula}       {    
                       return symbol(sym.MAYUSCULA, new String(yytext()),yyline,yycolumn); }

    {EspacioAcept}     {    
                       return symbol(sym.ESPACIO, new String(yytext()),yyline,yycolumn); }

    {Espacio}          {/* ignora el espacio */} 

}

. {System.err.println("El caracter ingresado no es valido :<"+yytext()+">"+" Linea "+(yyline+1)+" Columna "+(yycolumn+1));}
    
