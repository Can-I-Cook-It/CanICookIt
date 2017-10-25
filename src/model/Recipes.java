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
        addRecipes(recipe);
    }

    public void addRecipes(String recipe){
        String[] r = recipe.split("###");

        for(int i = 0; i < r.length; i++){
            addRecipe(r[i]);
        }
    }

    public String toString(){
        String out = "";
        int c = 1;
        for(String[] str : recipes){
            out += String.format("%d -> %s%s%s\n--------NEXT-RECIPE--------\n", c, str[0], str[1], str[2]);
            c++;
        }
        return out;
    }

    public void addRecipe(String recipe){
        String[] ing = new String[2];
        String[] r = recipe.split("---");

        ing[0] = String.format("%d", id);
        ing[1] = r[1];

        ingredients.add(ing);
        recipes.add(r);
        id++;

    }

    public ArrayList<String> search(String[] ingToSearch){
        ArrayList<String> ids = new ArrayList<>();
        for(int i = 0; i < ingredients.size(); i++) {
            int ingInCommon = 0;
            String[] ings = ingredients.get(i);
            for (int j = 0; j < ingToSearch.length; j++) {
                if (!ings[1].contains(ingToSearch[j])){
                    break;
                }else{
                    ingInCommon++;
                }
            }
            if(ingInCommon > ingToSearch.length - 2){
                ids.add(ings[0]);
            }
        }
        return ids;
    }

    public ArrayList<String[]> getRecipes(ArrayList<String> recipesIds) {
        ArrayList<String[]> recipes = new ArrayList<>();
        for(String str : recipesIds){
            recipes.add(this.recipes.get(Integer.parseInt(str)));
        }
        return recipes;
    }

    public String toString(ArrayList<String[]> recipes){
        String out = "";
        int c = 1;
        for(String[] str : recipes){
            out += String.format("%d -> %s%s%s\n--------NEXT-RECIPE--------\n", c, str[0], str[1], str[2]);
            c++;
        }
        return out;
    }
}
