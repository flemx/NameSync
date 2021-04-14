
/*******************************************************************************************
* @Name         DetailTriggetHandlerTest 
* @Author       Damien Fleminks
* @Date         14-04-2021
* @Description  Test the trigger events Handled by the DetailTriggetHandler
*******************************************************************************************/
@isTest
private class DetailTriggetHandlerTest {

    @testSetup static void setup() {
        insert TestDataFactory.createMasters(1);      
    }

    @isTest static void testDetailInsert(){
        List<Master__c> masters =  [SELECT Id FROM Master__c];
        Master__c oldMaster = [SELECT Id, Name FROM Master__c WHERE Name = 'new master0'];
        List<Detail__c> details = TestDataFactory.insertDetails(3, masters);
        Test.startTest();
        insert details;
        Test.stopTest();
        Master__c newMaster = [SELECT Id, Name FROM Master__c WHERE Id = :oldMaster.Id];
        System.assert(newMaster.Name == 'detail0, detail1, detail2');
    }


    @isTest static void testDetailUpdate(){
        List<Master__c> masters =  [SELECT Id FROM Master__c];
        Master__c oldMaster = [SELECT Id, Name FROM Master__c WHERE Name = 'new master0'];
        List<Detail__c> details = TestDataFactory.insertDetails(3, masters);
        List<Detail__c> updatedDetails = new List<Detail__c>();
        Test.startTest();
        insert details;
        updatedDetails = TestDataFactory.updateDetails(details);
        update updatedDetails;
        Test.stopTest();
        Master__c newMaster = [SELECT Id, Name FROM Master__c WHERE Id = :oldMaster.Id];
        System.assert(newMaster.Name == 'updated-detail0, updated-detail1, updated-detail2');
    }

    @isTest static void testDetailDelete(){
        List<Master__c> masters =  [SELECT Id FROM Master__c];
        Master__c oldMaster = [SELECT Id, Name FROM Master__c WHERE Name = 'new master0'];
        List<Detail__c> details = TestDataFactory.insertDetails(3, masters);
        List<Detail__c> deleteddDetails = new List<Detail__c>();
        Test.startTest();
        insert details;
        masters = [SELECT Id, (SELECT Id FROM Details__r) FROM Master__c];
        deleteddDetails = TestDataFactory.deleteFirstDetails(masters);
        delete deleteddDetails;
        Test.stopTest();
        Master__c newMaster = [SELECT Id, Name FROM Master__c WHERE Id = :oldMaster.Id];
        System.assert(newMaster.Name == 'detail1, detail2');
    }

}
