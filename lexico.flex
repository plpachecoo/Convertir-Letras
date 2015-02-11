/* RECLARACION DE IMPORTACIONES*/
package FlexCup1;

import java_cup.runtime.*; /*TRABAJAR EN TIEMPO REAL*/
import java.io.Reader;
      
%% 
   
/*DECLARACION DE OPCIONES*/
%class AnalizadorLexico
/*Act. el contador de lineas y utilizar con la variable yyline*/
%line  
/*Act. el contador de columnas*/   
%column  
/* Act. la compatibilidad con el cup, permite integrar el flex y cup*/    
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
%eof{
 System.exit(0);
%eof}
   
//Expresiones regulares
Salto = \r|\n|\r\n
Espacio     = {Salto} | [ \t\f ]
Lminuscula = [a-z]
Lmayuscula = [A-Z]


//Reglas lexica
%% 

   
<YYINITIAL> { 
   //estado inicial donde empieza el analisis
              //una vez que a reconocido un token regresa por el siguiente token

    ";"                {  System.out.print(" FINLINEA ");
                          return symbol(sym.FINLINEA, new String(yytext()),yyline,yycolumn); }
  
    {Lminuscula}+             {   System.out.print(" MINUSCULA "); 
                       return symbol(sym.MINUSCULA, new String(yytext()),yyline,yycolumn); }

    {Lmayuscula}+             {   System.out.print(" MAYUSCULA "); 
                       return symbol(sym.MAYUSCULA, new String(yytext()),yyline,yycolumn); }

    {Espacio}       { /* ignora el espacio */ } 

}


[^]                    { throw new Error("El caracter ingresado no es valido <"+yytext()+">"); }
    
