@isTest
public class CreateProductComponent_ControllerTest {
    @isTest static void testNameAllClassdata() {
        
        List<Product_Master_Sheet_Detail__mdt> pMasterValues = [select MasterLabel,Product_Family__c,id,Fields__c,Required_Fields__c from Product_Master_Sheet_Detail__mdt];
    
        List<Product2> prodList = new List<Product2>();
        Product2 prod = new Product2();
        prod.Name = '1162 PDT'; 
        prod.Family = 'Solenoid Valve - 2W';
        prod.Model_Number__c = '8234';
        prod.Product_Name__c = 'dines';
        prod.Series_Name__c = '1162';
        prod.Ambient_Temperature_Humidity__c = '11';
        prod.Model_Number_Text__c = '8234';
        prod.Damper_Size__c = 4;
        prod.Bore_Diameter__c = 5.10;
        prod.Manual_Override__c = 'jhg';
        prod.IsActive = true;
        insert prod; 
        prodList.add(prod);
        
        Product2 prod1 = new Product2();
        prod1.Name = '1162 PDT'; 
        prod.Family = 'Solenoid Valve - 2W';
        prod1.Model_Number__c = '8234';
        prod1.Product_Name__c = 'dines1';
        prod1.Series_Name__c = '1162';
        prod1.Ambient_Temperature_Humidity__c = '11';
        prod1.Model_Number_Text__c = '8234';
        prod1.Damper_Size__c = 5;
        prod1.Bore_Diameter__c = 5.10;
        prod1.Manual_Override__c = 'jhg';
        prod1.IsActive = true;
        insert prod1; 
        
        CreateProductComponent_Controller.productMatchPercentageWrapper wrpProdect = new CreateProductComponent_Controller.productMatchPercentageWrapper();
        wrpProdect.product = prod;
      
        
        List<String> fieldString = new List<String> {'Name'};
        List<String> fieldintString = new List<String> {'10'};
        List<String> fielddoubleString = new List<String> {'5.10'};
        List<String> fieldTextAreaString = new List<String> {'Testing'};
        List<String> fieldBOOLEANAreaString = new List<String> {'True'};
        
        CreateProductComponent_Controller.getRelatedFields('Name');
        CreateProductComponent_Controller.nameFormat('Name');
        CreateProductComponent_Controller.getProdctDetails();
        CreateProductComponent_Controller.getApiNameXlabel();
        CreateProductComponent_Controller.checkforDuplicateProduct('8234','1162','1162 PDT');
        CreateProductComponent_Controller.checkforDuplicateProduct('8234','1162','1162 PDT');
        CreateProductComponent_Controller.findMachingProduct(prod,'Solenoid Valve - 2W','1162',fieldString);
        CreateProductComponent_Controller.productMatchingAlgorithm(prod,prod,fieldString);
        CreateProductComponent_Controller.productMatchingAlgorithm(prod,prod,fieldintString);
        CreateProductComponent_Controller.productMatchingAlgorithm(prod,prod,fielddoubleString);
        CreateProductComponent_Controller.productMatchingAlgorithm(prod,prod,fieldTextAreaString);
        CreateProductComponent_Controller.productMatchingAlgorithm(prod,prod,fieldBOOLEANAreaString);
        CreateProductComponent_Controller.saveProductDetails(prod);
        CreateProductComponent_Controller.FieldApiNameList('pMasterRequiredField');
        CreateProductComponent_Controller.getCustomFields('Product2');
        
    }
}