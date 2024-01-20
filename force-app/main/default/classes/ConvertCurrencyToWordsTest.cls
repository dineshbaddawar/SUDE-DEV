@isTest
public class ConvertCurrencyToWordsTest {

    @isTest static void testconvert_nn(){
        
        ConvertCurrencyToWords.convert_nn(19);
        ConvertCurrencyToWords.convert_nnn(18);
        ConvertCurrencyToWords.english_number(30);
        ConvertCurrencyToWords.english_number(101);
        ConvertCurrencyToWords.english_number(10001);
    }
}