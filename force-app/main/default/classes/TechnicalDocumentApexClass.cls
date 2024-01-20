public class TechnicalDocumentApexClass {
    // Not Using This 
    Public Product2 ProductRec{get;set;}
    Public Opportunity OppRec{get;set;}
    Public OpportunityLineItem OppLineItemRec{get;set;}
    Public Company_Information__mdt CompanyInfo{get;set;}
    Public CompanyAdditionalInfo__mdt CompanyAddInfo{get;set;}
    Public Tech_Additional_Information__c TechAddInfo{get;set;}
    public String userPhone {get;set;}
    Public Date CurrentDate{get;set;}
    Public Boolean CheckTechaddInfo{get;set;}
    
    Public TechnicalDocumentApexClass(ApexPages.StandardController ctrl){
        
        String ProductId =  ApexPages.currentPage().getParameters().get('Id');
        system.debug('ProductId='+ProductId);
        
        OpportunityLineItem OppLRec=[Select Id,Product2.Name,Product2.Type__c,Product2.Family,Product2Id,OpportunityId From OpportunityLineItem Where Id=:ProductId];
        
        ProductRec=[Select Id,Name,Actuator_Seat__c,Actuator_Motor__c,Actuator_Inbuilt_With__c,Actuator_Mechanism__c,Actuator_Signal_Pressure__c,Inlet_Pressure__c,Outlet_Pressure__c,
                    Actuator_Body_Material__c,Actuator_Operating_Time__c,Position_Transmitter__c,Positioner_Details__c,Positioner__c,Calculated_Cv__c,Bonnet__c,
                    ProductCode,Model_Number__c,Type__c,Characteristic__c,Flowing_Media__c,Working_Pressure__c,Orifice_Size__c,Orifice_Size_Unit__c,Gland_Packing__c,Plug_Material__c,
                    Seating_Material__c,Body_Material__c,Fitted_With__c,Type_Of_Construction__c,Power_Fails_To__c,Flow_Rate__c,Differential_Pressure__c,
                    Supply_Voltage__c,Supply_Voltage_Unit__c,Working_Temperature__c,Stem_Material__c,End_Connection__c,Ball_Material__c,Leakage_Class__c,Manual_Override__c,
                    Valve_Type__c,Valve_Size__c,Valve_Size_in_mm__c,Valve_Size_Unit__c,Other_Notes__c,Ambient_Temperature_Humidity__c,Altitude__c,External_Wiring__c,Permissible_Vibration__c,
                    Working_Area__c,Corrosion_Category__c,SpecialNotesActuatorDetail__c,SpecialNotesvalveTechDetails__c,Operation_Time__c,Valve_Action__c,Type_Of_Actuator__c,Potentiometer_Pot__c  From Product2 where Id =:OppLRec.Product2Id];
        System.debug('ProductRec ::'+ProductRec.Valve_Size_in_mm__c + ' ID :: '+ProductRec.Id);
        
        if(ProductRec.Ambient_Temperature_Humidity__c!=null){
            
            String ProductAmbientTemperatureHumidity=ProductRec.Ambient_Temperature_Humidity__c;
            if(ProductAmbientTemperatureHumidity.contains('-')){
                ProductAmbientTemperatureHumidity =ProductAmbientTemperatureHumidity.replace('-','- ');
                system.debug('ProductAmbientTemperatureHumidityc:: = ' + ProductAmbientTemperatureHumidity); 
                ProductRec.Ambient_Temperature_Humidity__c=ProductAmbientTemperatureHumidity;
                system.debug('ProductCode  Ambient:: = ' + ProductRec.Ambient_Temperature_Humidity__c); 
            } 
        }   
        
        if(ProductRec.Model_Number__c!=null){
            
            String ProductModel=ProductRec.Model_Number__c;
            if(ProductModel.contains('-')){
                ProductModel =ProductModel.replace('-','- ');
                system.debug('ProductModel:: = ' + ProductModel); 
                ProductRec.Model_Number__c=ProductModel;
                system.debug('ProductModel= ' + ProductRec.Model_Number__c); 
            }
        } 
        CurrentDate=system.today();
        userPhone = [SELECT Phone FROM User WHERE Id =: UserInfo.getUserId()].Phone;  
        
        OppLineItemRec=[Select Id,Product2Id,OpportunityId,Opportunity.Valve_Type__c,Opportunity.TechAdditionalInfo__c,Opportunity.TotalOpportunityQuantity,Opportunity.Other_Information__c,Opportunity.Name,Opportunity.Account.Name,Opportunity.SyncedQuote.Name,Opportunity.SyncedQuote.QuoteNumber,Product2.Type__c From OpportunityLineItem Where Id=:ProductId];
        
        CompanyInfo=[Select CMP1__c,CMP2__c,CMP3__c,CMP_Phone__c,CMP_Website__c From Company_Information__mdt];
        system.debug('CompanyInfo='+CompanyInfo);
        system.debug('CompanyInfo='+CompanyInfo.CMP1__c);
        
        system.debug('OppLineItemRec.OpportunityId= '+OppLineItemRec.OpportunityId);
        system.debug('OppLineItemRec= '+OppLineItemRec);
        
        CompanyAddInfo=[Select Cmp_info_1__c,Cmp_info_2__c,Cmp_info_3__c,Cmp_info_4__c,Cmp_info_5__c,Cmp_info_6__c,Cmp_info_7__c,Cmp_info_8__c,Cmp_info_9__c,Cmp_info_10__c,Cmp_info_11__c,Cmp_info_12__c,Cmp_info_13__c  From CompanyAdditionalInfo__mdt];
        
        CheckTechaddInfo=OppLineItemRec.Opportunity.TechAdditionalInfo__c;
        system.debug('CheckTechaddInfo--'+CheckTechaddInfo);
        TechAddInfo=[Select Actuator_Details__c,Connection_Details__c,Gear_Details__c,Mechanical_Details__c,Motor_Details__c,Permissible_Details__c,Phase_Details__c,Position_Details__c,Speed_Details__c,
                     Standards_Ref_Details__c,Switches_Details__c,Torque_Details__c,Tripping_Details__c From Tech_Additional_Information__c where Opportunity__c=:OppLineItemRec.OpportunityId];  
        
    }
    
}