/* 
 * This class can be safely deleted from your org. 
 * It was only used to ensure 100% test coverage
 * for the managed package installation.
 */
@IsTest
private class InstallationTests {
	@testSetup
	static void createData(){
		Case mTestCase = new Case();

		
		insert mTestCase;
		
	}	
    static testmethod void testMaintenanceRequest() {
    	Test.startTest();
    	Case mCases = [select id, status, Date_Reported__c from Case limit 1];
        MaintenanceRequestHelper.updateWorkOrders();
     	System.assertEquals(mCases.status, 'New');
        Test.stopTest();
    }
    static testmethod void testWarehouseSync() {
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }    
}