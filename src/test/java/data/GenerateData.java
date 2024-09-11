package data;

public class GenerateData {
    public static String getEmail() {
        int random = (int)(Math.random() * 1000);
        return "jawid" + random + "@gmail.com";
    }
}
