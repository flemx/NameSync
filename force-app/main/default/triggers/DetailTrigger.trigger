/*******************************************************************************************
* @Name         DetailTrigger 
* @Author       Damien Fleminks
* @Date         14-04-2021
* @Description  Trigger for Detail__c, instantiate DetailTriggerHandler to handle all trigger events
*******************************************************************************************/
trigger DetailTrigger on Detail__c (after insert, after update, after delete) {

    DetailTriggerHandler triggerHandler = new DetailTriggerHandler(Trigger.new, Trigger.old, Trigger.oldMap);
    if (Trigger.isAfter) {
        if (Trigger.isInsert) triggerHandler.afterInsert();
        if (Trigger.isUpdate) triggerHandler.afterUpdate();
        if (Trigger.isDelete) triggerHandler.afterDelete();
    }
}

