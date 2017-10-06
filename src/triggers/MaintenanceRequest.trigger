trigger MaintenanceRequest on Case (before update, after update) {
    // call MaintenanceRequestHelper.updateWorkOrders  
    for(Case c: Trigger.new){
    	System.debug(LoggingLevel.DEBUG, 'c.status');
    }
}