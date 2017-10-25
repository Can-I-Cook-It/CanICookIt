package com.canicookit;

import model.Recipes;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
	// write your code here
        Recipes book = new Recipes("receitas.txt");

        //System.out.println(book.toString());

        Scanner input = new Scanner(System.in);
        System.out.print("Input the number of ingredients to search for recipes (MINIMUM: 1): ");
        int n = input.nextInt();

        String[] ingToSearch = new String[n];
        input = new Scanner(System.in);

        for(int i = 0; i < n; i++){
            System.out.print("Ingredient " +  i + ": ");
            ingToSearch[i] = input.nextLine();
        }

        ArrayList<String> matchingRecipesIds = book.search(ingToSearch);
        ArrayList<String[]> recipes = book.getRecipes(matchingRecipesIds);

        System.out.println(book.toString(recipes));
        System.out.println("NEW BRANCH - testing");


    }




}
