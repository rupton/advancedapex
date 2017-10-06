/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */ 
@isTest
private class ProfileVisibility {

	@testSetup
	static void createTestData(){
		List<Account>testAccounts = new List<Account>();
		for(Integer i = 0; i < 200; i++){
			Account a = new Account();
			a.name = 'TestAccount' + i;
			testAccounts.add(a);
		}
		insert testAccounts;
		
	}
		static User createUser(String name, String profile, String role){
		Profile p = [SELECT Id from Profile where Name = :profile];
		UserRole r = [SELECT Id from UserRole where Name = :role];
		User mUser = new User();
		mUser.alias = 'ruser';
    	mUser.email=name +'@force.com.partial1';
    	mUser.userName= name +'@force.com.partial1';
    	mUser.lastName = name.subString(0,4); //'Ruser';
    	mUser.profileId = p.id;
    	mUser.UserRoleId = r.Id;
    	mUser.LanguageLocaleKey='en_US';
		mUser.LocaleSidKey='en_US';
		mUser.TimeZoneSidKey = 'America/Los_Angeles';
		mUser.EmailEncodingKey='UTF-8';
		return mUser;
	}
    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        String me = UserInfo.getUserId();
        Test.startTest();
        	List<Account>testAccounts = [select id,ownerid from account];
        	Integer accountSize = testAccounts.size();
        	System.assertEquals(accountSize, 200);
        Test.stopTest();
    }
}