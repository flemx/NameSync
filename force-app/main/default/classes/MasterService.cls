/*******************************************************************************************
* @Name         MasterService 
* @Author       Damien Fleminks
* @Date         14-04-2021
* @Description  Service class to handle mutations to the Master__c object
*******************************************************************************************/
public with sharing class MasterService {

    /**
     * @description  From a list of Detail__c records update the Master__c parent name with return value of formatName()
     * @param  details newDetails description
     */
    public static void updateMasterNames(List<Detail__c> details){
        if(!details.isEmpty()){
            List<Master__c> masters = new List<Master__c>();
            Set<String> masterIds = new Set<String>();
            for(Detail__c d: details){
                masterIds.add(d.Master__c);
            }
            for(Master__c master: [SELECT (SELECT Name from Details__r) from Master__c WHERE Id in :masterIds]){
                Master__c newMaster = new Master__c();
                newMaster.Id = master.Id;
                newMaster.Name = formatName(master.Details__r);
                masters.add(newMaster);
            }
            update masters;
        }
        else{
            system.debug('No changes to update');
        }   
    }

    /**
     * @description Compare Detail__c records from after update trigger and filter records with changed Name
     * @param  newDetails List of updated Detail_c records
     * @param  oldDetails Map of Detail_c records before updated
     * @return List<Detail__c>
     */ 
    public static List<Detail__c> filterNameUpdates(List<Detail__c> newDetails, Map<Id, Detail__c> oldDetails) {
        List<Detail__c> filteredDetails = new List<Detail__c>();
        for(Detail__c detail: newDetails){
            Detail__c oldDetail = oldDetails.get(detail.Id);
            if(detail.Name != oldDetail.Name){
                filteredDetails.add(detail);
            }
        }
        return filteredDetails;
    }

    /**
     * @description from a list of Detail__c records return a String of all Detail__c.Name comma seperated
     * @param  details List of 
     * @return  String of formatted name
     */
    private static String formatName(List<Detail__c> details){
        List<String> nameList = new List<String>();
        for(Detail__c detail: details){
            nameList.add(detail.Name);
        }
        return String.join(nameList, ', ');
    }


}
