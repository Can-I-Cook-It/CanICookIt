package model;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class Recipes {
    ArrayList<String[]> recipes;
    ArrayList<String[]> ingredients;
    int id;

    public Recipes(String fileName){
        recipes = new ArrayList<>();
        ingredients = new ArrayList<>();
        id = 0;

        String recipe = new String();

        File file = new File(getClass().getResource(fileName).getFile());
        Scanner input = null;
        try {
            input = new Scanner(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        while(input.hasNextLine()){
            recipe += input.nextLine() + "\n";
        }
        addRecipe(recipe);
    }

    public void addRecipe(String recipe){
        String[] arr = new String[2];
        String ingredients;
        String[] r = recipe.split("---");

        ingredients = r[1];
        arr[0] = String.format("%d", id);
        arr[1] = ingredients;

        this.ingredients.add(arr);
        recipes.add(r);
        id++;
    }

    public String toString(){
        String out = "";
        for(String[] str : recipes){
            out += String.format("%s%s%s", str[0], str[1], str[2]);
        }
        return out;
    }


}
