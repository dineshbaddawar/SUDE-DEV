@isTest
public class TestUtility {
    @isTest static void testNameAllClass() {
        
      
        CreateProductComponent_Controller.getRelatedFields('Name');
        CreateProductComponent_Controller.nameFormat('Name');
        Account acc1 = new Account();
        acc1.Name = 'test 1';
        acc1.Country_of_Residences__c = 'India';
        acc1.Ledger_Type__c = 'Sales Ledger';
        acc1.BillingState = 'Pune';
        acc1.Export__c = null;
        insert acc1;
        
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'Test';
        opp1.CloseDate = system.today();
        opp1.StageName = 'Order Acknowledgement';
        opp1.AccountId = acc1.Id;
        insert opp1;
        CustomCloseAuraHelper.oppCustomClone(opp1.id);
        
        Quote quo11 = new Quote();
        quo11.Name = 'Test data';
        quo11.OpportunityId = opp1.Id;
        quo11.Inquiry_Reference_Date__c = system.today();
        quo11.SGST__c = null;
        insert quo11;
        
         Attachment attach=new Attachment();   	
    	attach.Name='Unit Test Attachment';
    	Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
    	attach.body=bodyBlob;
        attach.parentId=quo11.id;
        insert attach;
        
        
        Product2 prod = new Product2();
        prod.Name = 'test'; 
        prod.Product_Name__c = 'dines';
        prod.Series_Name__c = '1182';
        prod.Ambient_Temperature_Humidity__c = '11';
        prod.Model_Number__c ='asdfghj111';
        insert prod; 
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = pricebookId, Product2Id = prod.Id, UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        
        OpportunityLineItem oppline = new OpportunityLineItem();
        oppline.OpportunityId = opp1.id;
        oppline.UnitPrice = 22;
        oppline.Quantity = 22;
        oppline.PricebookEntryId = standardPrice.id;
        insert oppline;
        
        CompanyDetails__c comp = new CompanyDetails__c();
        comp.Name = 'test';
        insert comp;
        AccountDetails__c bank = new AccountDetails__c();
        bank.Name = 'test';
        insert bank;
        Addition_Information__c add = new Addition_Information__c();
        add.Name = 'test';
        insert add;
        
        ApexPages.StandardController sc = new ApexPages.StandardController(quo11);
        PageReference pageRef = Page.SUDEBangaloreQuotePDF;
        pageRef.getParameters().put('Id', quo11.Id);
        Test.setCurrentPage(pageRef);
        DisplayQuoteDetailController pdf    = new DisplayQuoteDetailController(sc);
      //  DisplayQuoteDetailController.testMethodClass4();
      //  DisplayQuoteDetailController.testMethodClass5();
     //   Documentmergecomponent_Controller.testMethodClass6();
     //   DynamicProductComponent.testMethodClass7();
      //  DynamicTechnicalDocument_Helper.getFieldApiName('Account');
     //   DynamicTechnicalDocumentApexClass.testMethodClass8();
      //  DynamicTechnicalDocumentApexClass.testMethodClass9();
        
         Tech_Additional_Information__c tech = new Tech_Additional_Information__c();
        tech.Opportunity__c = opp1.Id;
        insert tech;
        ApexPages.StandardController sc1 = new ApexPages.StandardController(oppline);
        PageReference pageRef1 = Page.TechnicalMapVfPage;
        pageRef1.getParameters().put('Id', oppline.Id);
        Test.setCurrentPage(pageRef1);
        MapTechnicalDocumentApexClass pdf1    = new MapTechnicalDocumentApexClass(sc1);
        NumberToText.convert(202);
        NumberToText.generateText(202);
        NumberToText.generateTextForTwoDigits(202);
        SudeBLRSheetAuraController.insertQuotesAttachement(quo11.id);
        SudeBLRSheetAuraController.getQuoteIdFormOpportunity(quo11.OpportunityId);
        SudeBLRSheetAuraController.insertQuoteFromOpportunity(quo11.OpportunityId);
        
       
        /*
        ApexPages.StandardController sc2 = new ApexPages.StandardController(oppline);
        PageReference pageRef2 = Page.SUDECommercialInvoicePDF;
        pageRef2.getParameters().put('Id', opp1.Id);
        Test.setCurrentPage(pageRef2);
        SUDECommercialInvoicePDFController pdf2    = new SUDECommercialInvoicePDFController(sc2);
        */
    }
}