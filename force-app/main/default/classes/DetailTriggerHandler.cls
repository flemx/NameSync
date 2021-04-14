/*******************************************************************************************
* @Name         DetailTriggerHandler 
* @Author       Damien Fleminks
* @Date         14-04-2021
* @Description  Trigger Handler for the  Detail__c object trigger, contains all trigger event methods
*******************************************************************************************/
public with sharing class DetailTriggerHandler implements triggerHandler{

    final List<Detail__c> newDetails;
    final List<Detail__c> oldDetails;
    final Map<Id, Detail__c> oldDetailsMap;
    
    /**
     * @description DetailTriggerHandler constructor
     * @param  newDetails List of Trigger.new 
     * @param  oldDetails Map of Trigger.oldmap 
     */ 
    public DetailTriggerHandler(List<Detail__c> newDetails, List<Detail__c> oldDetails,  Map<Id, Detail__c> oldDetailsMap ) {
        this.newDetails = newDetails;
        this.oldDetails = oldDetails;
        this.oldDetailsMap = oldDetailsMap;
    }

    /**
     * @description directly update all Master__c names from newly inserted Detail__c records
     */ 
    public void afterInsert()
    {
        MasterService.updateMasterNames(newDetails);
    }

    /**
     * @description validate if Detail__c.Name was changed and filter out those that haven't
     */ 
    public void afterUpdate()
    {
        MasterService.updateMasterNames(
            MasterService.filterNameUpdates(newDetails,oldDetailsMap)
        );
    }

     /**
     * @description directly update all Master__c names from deleted Detail__c records
     */ 
    public void afterDelete()
    {
        MasterService.updateMasterNames(oldDetails);
    }


}
