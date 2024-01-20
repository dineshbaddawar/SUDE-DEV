@isTest
public class AccountTriggerHandlerTest {
    @isTest static void testName1() {
        Account acc = new Account();
        acc.name = 'dinesh';
        acc.Country_of_Residences__c = 'India';
        acc.Ledger_Type__c = 'Sales Ledger';
        acc.BillingState = 'Karnataka';
        acc.Export__c = null;
        insert acc;
        
        Account acc1 = new Account();
        acc1.id = acc.Id;
        acc1.Name = 'test 1';
        acc1.Country_of_Residences__c = 'Nepal';
        acc1.Ledger_Type__c = 'Sales Ledger';
        acc1.BillingState = 'Pune';
       // acc1.Export__c = 'Direct Export';
        update acc1;
        
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'Test';
        opp1.CloseDate = system.today();
        opp1.StageName = 'Order Acknowledgement';
        opp1.AccountId = acc.Id;
        insert opp1;
        List<Quote> quoteList = new List<Quote>();
        Quote quo11 = new Quote();
        quo11.Name = 'Test data';
        quo11.OpportunityId = opp1.Id;
        quo11.Inquiry_Reference_Date__c = system.today();
        quo11.SGST__c = null;
        quoteList.add(quo11);
        insert quoteList;
    }
}