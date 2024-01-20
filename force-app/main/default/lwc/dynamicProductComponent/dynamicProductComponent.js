import { LightningElement,track,api,wire } from 'lwc';
import QueryAllMetadataSeries from '@salesforce/apex/DynamicProductComponent.QueryAllMetadataSeries';
import QueryAllMetadata from '@salesforce/apex/DynamicProductComponent.QueryAllMetadata';
export default class DynamicProductComponent extends LightningElement {

    @track SeriesList=[];
    @track metadataResponse=[];
    @track Seriesvalue;

    @wire(QueryAllMetadataSeries)
    wiredseriesResponse({data,error}){
        debugger;
        if(data){
            console.log('Series data',data);
            let arr=[];
            for(let i=0;i<data.length;i++){
                arr.push({label:data[i],value:data[i]})
            }
            this.SeriesList=arr;
            console.log('this.SeriesList',this.SeriesList);
         }else{
           console.log('error',error);  
         }
    }

    get Series(){
        return this.SeriesList;
    }
    

    @wire(QueryAllMetadata)
    wiredMetaDataResponse({data,error}){
        if(data){
            console.log('Meta data',data);
            for (var key in data) {
                this.metadataResponse.push({ key: key, value:data[key] });
            }
            console.log('key', this.metadataResponse);  
         }else{
           console.log('error',error);  
         }
    }

    @track MetaList=[];
    handleChange(event){
        debugger;
        let MetadataList=[];
          let Seriesvalue=event.detail.value;
          this.Seriesvalue=parseInt(Seriesvalue);
          MetadataList=this.metadataResponse.find(item=>item.key==Seriesvalue).value;
          this.MetaList=MetadataList;
          console.log('MetadataList', MetadataList);
          console.log('MetaList', this.MetaList);
    }
        
    
     
}