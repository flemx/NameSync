/*******************************************************************************************
* @Name         TestDataFactory 
* @Author       Damien Fleminks
* @Date         14-04-2021
* @Description  Test Class to provide the test classes with data
*******************************************************************************************/
@isTest
public class TestDataFactory {

    /**
     * @description Create x amount of Master__c without children
     * @param  numMasters number of Master__c to create
     * @return List<Master__c>
     */ 
    public static List<Master__c> createMasters(Integer numMasters){
        List<Master__c> masters = new List<Master__c>(); 
        for(Integer i=0;i<numMasters;i++) {
            Master__c m = new Master__c(Name='new master' + i);
            masters.add(m);
        }
        return masters;
    }

    /**
     * @description Create x amound of Detail records per Master
     * @param  numDetails number of Detail records per Master
     * @param  masters List of Masters to add Detail records to
     * @return List<Detail__c>
     */
    public static List<Detail__c> insertDetails(Integer numDetails, List<Master__c> masters){
        List<Detail__c> details = new List<Detail__c>(); 
        for(Master__c master: masters){
            for(Integer i = 0; i < numDetails; i++) {
                Detail__c m = new Detail__c(
                    Name = 'detail' + i,
                    Master__c = master.Id
                    );
                details.add(m);
            }
        }
        return details;
    }

    /**
     * @description Update a list of details and return the updated list
     * @param  oldDetails List of details to update
     * @return updated list of new records
     */ 
    public static List<Detail__c> updateDetails(List<Detail__c> oldDetails){
        List<Detail__c> newDetails = new List<Detail__c>(); 
        for(Integer i = 0; i < oldDetails.size(); i++) {
            Detail__c m = new Detail__c(
                Name = 'updated-detail' + i,
                Id = oldDetails.get(i).Id
                );
            newDetails.add(m);
        }
        return newDetails;
    }

    /**
     * @description Delete only the first Detail child record of every Master 
     * @param  masters List of Masters with child Details__r
     * @return return list of deleted records
     */ 
    public static List<Detail__c> deleteFirstDetails(List<Master__c> masters){
        List<Detail__c> deletedDetails = new List<Detail__c>();
        for(Master__c master: masters){
            if(!master.Details__r.isEmpty()){
                deletedDetails.add(master.Details__r.get(0));
            }
        }
        return deletedDetails;
    }
        
}

