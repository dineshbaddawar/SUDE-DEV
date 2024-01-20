public withOut sharing class DynamicTechnicalDocument_Helper {
  
    public static Map<string,string> getFieldApiName(string opbjectAPIName) {

        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(opbjectAPIName);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        Map<string,string> APINameXfieldLabel = New Map<string,string>();
        for (String fieldName: fieldMap.keySet()) {
            APINameXfieldLabel.put(fieldName,fieldMap.get(fieldName).getDescribe().getLabel().toLowerCase());
        }
        return APINameXfieldLabel;
    }

    

}