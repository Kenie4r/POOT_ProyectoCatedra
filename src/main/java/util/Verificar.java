package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Verificar {
    public static Boolean regexInput(String regex, String text){
        //Variables
        Pattern pattern = Pattern.compile(regex);
        Matcher mat = pattern.matcher(text);

        return mat.find();
    }
}
