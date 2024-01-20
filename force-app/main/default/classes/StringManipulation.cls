public class StringManipulation {
    public static String replaceLastTwoHyphens(String inputString) {
        if (String.isNotBlank(inputString)) {
            return inputString;
        }
        
         System.debug('Input string == >'+inputString);
        // Find the last two hyphen positions in the string
        Integer lastHyphenIndex = inputString.lastIndexOf('-');
        System.debug('lastHyphenIndex === >'+lastHyphenIndex);
        Integer secondLastHyphenIndex = inputString.lastIndexOf('-', lastHyphenIndex - 1);
        System.debug('secondLastHyphenIndex === >'+secondLastHyphenIndex);
        if (secondLastHyphenIndex >= 0 && lastHyphenIndex >= 0) {
            // Replace the last two hyphens with '- ' (hyphen and space)
            String modifiedString = inputString.substring(0, secondLastHyphenIndex) + '- ' +
                inputString.substring(lastHyphenIndex + 1);
            return modifiedString;
        }
        
        // Return the original string if there are not enough hyphens
        System.debug('Result string == >'+inputString);
        return inputString;
    }
}