/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FlexCup1;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;
import java_cup.runtime.Symbol;

/**
 *
 * @author prisi_000
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args){
        main m=new main();
        System.out.println("asas    "+m.generarEspacio(" "));
        
        String minus=" ";
        System.out.println("m"+minus.toLowerCase()+"m");
        String mayu="hola";
        System.out.println(mayu.toUpperCase());
        
    }

    public String convertirMayusculas(String cadena){
        System.out.println("MAYUSCULAS: "+cadena.toUpperCase());
        return cadena;
    }
    public String convertirMinusculas(String cadena){
        System.out.println("MINUSCULAS: "+cadena.toLowerCase());
        return cadena;
    }
    
    public String generarEspacio(String cadena){
        System.out.println("Espacio: "+cadena);
        return cadena;
    }
    
    
    
    public String convertirLetra(String cadena) {
        int i = 0;
        char caracter;
        do {
            caracter = (char) cadena.charAt(i);
            if (caracter >= 'a' && caracter <= 'z') {
                caracter -= 32;
                i++;
                System.out.println(caracter);
            } else if (caracter >= 'A' && caracter <= 'Z') {
                caracter += 32;
                i++;
                System.out.println(caracter);
            }
        } while (cadena != null);
        return caracter+"";
    }
}
