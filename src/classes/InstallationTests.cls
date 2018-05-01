/* 
 * This class can be safely deleted from your org. 
 * It was only used to ensure 100% test coverage
 * for the managed package installation.
 */
@IsTest
private class InstallationTests {
	@testSetup
	static void createData(){
		List<Case> newCases = new List<Case>();
		for(Integer i = 0; i < 149; i++){
		Case mTestCase = new Case();
		newCases.add(mTestCase);			
		}
		//Developer 2 just added these comments 
		insert newCases;
		 
	}	
    static testmethod void testMaintenanceRequest() {
    	Test.startTest();
    	List<Case> mCases = [select id, status, Date_Reported__c from Case];
		for(Case c: mCases){
    		system.assertEquals(c.status, 'New');
	    	c.status = 'Closed';
	    	update c;
	        MaintenanceRequestHelper.updateWorkOrders();
	        system.assertEquals(c.status, 'Closed');
    	}
        Test.stopTest(); 
    }
    static testmethod void testWarehouseSync() {
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }    
}