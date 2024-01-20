@isTest
public class CustomCloseAuraHelperTest {

    public static testmethod void testoppCustomClone(){
        
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
        
        Product2 prod = new Product2();
        prod.Name = 'test'; 
        prod.Product_Name__c = 'dines';
        prod.Series_Name__c = '1182';
        prod.Ambient_Temperature_Humidity__c = '11';
        prod.Model_Number__c ='asdfghj111';
        insert prod; 
        
        CustomCloseAuraHelper.oppCustomClone('opp1.Id');
    }
}