/*******************************************************************************************
* @Name         TriggerHandler 
* @Author       Damien Fleminks
* @Date         14-04-2021
* @Description  This interface contains all methods for trigger events used for all object trigger handlers
*******************************************************************************************/
public  interface TriggerHandler {

    /**
     * @description afterInsert description
     */
    void afterInsert();

    /**
     * @description a Handle after update logic 
     */
    void afterUpdate();

    /**
     * @description a Handle after delete logic 
     */
    void afterDelete();  

}
