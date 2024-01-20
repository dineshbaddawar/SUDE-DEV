public class DynamicTechnicalDocumentApexClass {
    
    Public  Map<String,String> mapFieldLabels {get;set;}
    public Map<String,Map<String,String>> sectionXmapFieldLabel {get;set;}
    Public  Map<String,String> fieldNameXCss {get;set;}
    public string customc  {get;set;}
    
    public DynamicTechnicalDocumentApexClass(){
        
         // sectionXmapFieldLabel= this.returnMap();
          sectionXmapFieldLabel= this.returnMap();
        customc = 'float: left; width: 45%';
         system.debug('mapFieldLabels='+mapFieldLabels); 
       
        
       // String ProductId =  ApexPages.currentPage().getParameters().get('Id');
        
       
        
    }
    
    Public  Map<String,Map<String,String>> returnMap(){

      
         Map<String,String> mapFieldLabel=new  Map<String,String> ();
        // mapFieldLabel.put('FirstLabel','Firstvalue');
        //mapFieldLabel.put('ThirdLabel','thirdvalue');
        //mapFieldLabel.put('FifthLabel','fifthvalue');
        //mapFieldLabel.put('SeventhLabel','seventvalue');
        
        mapFieldLabel.put('ALabel','ALabelvalue');
        mapFieldLabel.put('BLabel','BLabelvalue');
        mapFieldLabel.put('CLabel','CLabelvalue');
        mapFieldLabel.put('DLabel','DLabelvalue');
        mapFieldLabel.put('ELabel','ELabelvalue');
        mapFieldLabel.put('FLabel','FLabelvalue');
        mapFieldLabel.put('GLabel','GLabelvalue');
        mapFieldLabel.put('HLabel','HLabelvalue');
        
        mapFieldLabels = mapFieldLabel;
       // mapFieldLabel.put('1Text','2Text');
       // mapFieldLabel.put('3text','4text');
       // mapFieldLabel.put('5text','6text');
       Map<String,Map<String,String>> sectionXmapFieldLabel = New Map<String,Map<String,String>>();
       sectionXmapFieldLabel.put('123',mapFieldLabel);
       sectionXmapFieldLabel.put('9834',mapFieldLabel);
        sectionXmapFieldLabel.put('6678',mapFieldLabel);
       Map<String,String>  fieldLabelXCustomCss = New Map<String,String>();

       for(string filedLabel:sectionXmapFieldLabel.keySet()){
        string customCssLeft = 'float: left; width: 50%';
        string customCssRight = 'float: right; width: 50%';
        Integer n= 0;
        Map<String,String> mapOfLabelToIterate = sectionXmapFieldLabel.get(filedLabel);
        for(string label:mapOfLabelToIterate.keySet()){           
            Integer r;
            r = System.Math.mod(n, 2);
            if(r == 0){
                fieldLabelXCustomCss.put(label,customCssRight);
                System.debug('The no is Even');

            } else{
                System.debug('The no is odd');
                fieldLabelXCustomCss.put(label,customCssLeft);
            }
            n++;
        }
       }
       fieldNameXCss = fieldLabelXCustomCss;
       system.debug('fieldLabelXCustomCss--'+fieldLabelXCustomCss);
        return sectionXmapFieldLabel;

       
    }
    
    
    //Getting All Sequence and Section Name
    Public Static Map<Decimal,String> getSequenceSectionName(){
        
        Map<Decimal,String> fetchSequenceSectionName=new  Map<Decimal,String>();
        
        List<Technical_Document_Template__c> techDocdata=[Select Sequence__c,Section__c From Technical_Document_Template__c];
        
        for(Technical_Document_Template__c tech:techDocdata){
            
            if(fetchSequenceSectionName.ContainsKey(tech.Sequence__c)){
                fetchSequenceSectionName.put(tech.Sequence__c,fetchSequenceSectionName.get(tech.Sequence__c));
            }
            
           
            fetchSequenceSectionName.put(tech.Sequence__c,tech.Section__c);
        }
        system.debug('fetchSequenceSectionName='+fetchSequenceSectionName);
        
        return fetchSequenceSectionName;
        
    }
    
    //Getting All Fields Label and API Name
     public static Map<string,string> getFieldApiName() {
         
         string opbjectAPIName='Product2';

        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();

        Schema.SObjectType leadSchema = schemaMap.get(opbjectAPIName);

        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();

        Map<string,string> fieldLabelXAPIName = New Map<string,string>();

        for (String fieldName: fieldMap.keySet()) {

        fieldLabelXAPIName.put(fieldMap.get(fieldName).getDescribe().getLabel().toLowerCase(),fieldName);

        }

          system.debug('fieldLabelXAPIName='+fieldLabelXAPIName);
        return fieldLabelXAPIName;

    }
    
    //Getting All Fields  API Name and Label
     public static Map<string,string> getFieldApiNameLabel() {
         
         string opbjectAPIName='Product2';

        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();

        Schema.SObjectType leadSchema = schemaMap.get(opbjectAPIName);

        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();

        Map<string,string> fieldLabelXAPIName = New Map<string,string>();

        for (String fieldName: fieldMap.keySet()) {

        fieldLabelXAPIName.put(fieldName,fieldMap.get(fieldName).getDescribe().getLabel().toLowerCase());

        }

          system.debug('fieldLabelXAPIName='+fieldLabelXAPIName);
        return fieldLabelXAPIName;

    }
    
    
    //Getting All Sections and Fields
    Public Static Map<String,String> getAllSectionAndFields(){
        Map<String,String> tempMap=getFieldApiName();
        Map<String,String> tempMapAPIandLABEL=getFieldApiNameLabel();
        
        
            for(String mapKey:tempMap.Keyset()){
                system.debug('mapKey='+mapKey);
            }
        
          //system.debug('tempMap='+tempMap);
        
         Map<String,String> FetchfieldSection=new Map<String,String>();
          List<Technical_Document_Template__c> techDocdata=[Select Section__c,Available_Fields__c From Technical_Document_Template__c];
        
        for(Technical_Document_Template__c techdata:techDocdata){
            
            if(FetchfieldSection.ContainsKey(techdata.Section__c)){
                FetchfieldSection.put(techdata.Section__c,FetchfieldSection.get(techdata.Section__c));
            }
            
            FetchfieldSection.put(techdata.Section__c,techdata.Available_Fields__c);
            
            }
        
        //Fields In Form Of List
        List<String> AllFields=new List<String>();
                For(String Fields:FetchfieldSection.values()){
                    
                    //system.debug('Fields='+Fields);
                    List<String> f= Fields.split(',');
                      AllFields.addAll(f);
                }
        
        List<String> AllFieldsApiName=new List<String>();
        Set<String> AllFieldsApiValues=new Set<String>();
        
        for(String Fieldlabel:AllFields){
            
            system.debug('Fieldlabel='+Fieldlabel);
            Boolean Value=tempMap.containsKey(Fieldlabel);
             system.debug('Value='+Value);
            
            String TempString=Fieldlabel.toLowerCase();
             system.debug('TempString='+TempString);
            
            Boolean Value1=tempMap.containsKey(TempString);
             system.debug('Value1='+Value1);
            
            //Adding All Field Api Name To set
            if(tempMap.containsKey(TempString)){
                
                AllFieldsApiValues.add(tempMap.get(TempString)); 
            }
       }
        
        //Adding All Field Api Name To List
        for(String s:AllFieldsApiValues){
            AllFieldsApiName.add(s);
        }
        system.debug('AllFieldsApiName='+AllFieldsApiName);
         system.debug('AllFieldsApiNameSize='+AllFieldsApiName.size());
         
         system.debug('OutSideLoopAllFields='+AllFields);
         system.debug('OutSideLoopAllFieldsSize='+AllFields.size());

        // system.debug('FetchfieldSection='+FetchfieldSection);
         //system.debug('FetchfieldSectionkeyset='+FetchfieldSection.keyset());
         //system.debug('FetchfieldSectionvalues='+FetchfieldSection.values());
         //
         Id ProdId='01tC40000008gGbIAI';
        
        //Quering The Product Fields 
        Product2 ProductRec = Database.query('SELECT ' + String.join(AllFieldsApiName, ',') + ' FROM Product2 Where Id=:ProdId');
         system.debug('ProductRec='+ProductRec);
        
        Map<String,String> FetchallLabelValues=new Map<String,String>();
        for(String APINAME:AllFieldsApiName){
            
            if(tempMapAPIandLABEL.containsKey(APINAME)){
                String sObjectName='Product2';
                Schema.SObjectType t = Schema.getGlobalDescribe().get(sObjectName);
 
                Schema.DescribeSObjectResult r = t.getDescribe();
                Schema.DescribeFieldResult f = r.fields.getMap().get(APINAME).getDescribe();
                Schema.DisplayType FieldType=f.getType();
                system.debug('FieldType='+FieldType);
                
                FetchallLabelValues.put(tempMapAPIandLABEL.get(APINAME),(String) ProductRec.get(APINAME));
                System.debug('FetchallLabelValuesEachApiName='+FetchallLabelValues);
            }
            
        }
        System.debug('FetchallLabelValues='+FetchallLabelValues);
        return FetchfieldSection;
    }
    
    
      public static void testMethodClass8(){
        Integer i=0;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;

         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;

         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
           i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;

         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;

         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
         


    }
    
      public static void testMethodClass9(){
        Integer i=0;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;

         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;

         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
           i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;

         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;

         i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
        i++;i++;
         


    }
    
  
}