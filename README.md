# Github Action: Create OpsGenie Alert

This Github action can be used to send an alert to OpsGenie using the OpsGenie API V2

#### Required Parameters

* ALIAS
         
  User defined identifier for the alert (used to de-duplicate alerts)

* MESSAGE       

  The content of the alert

* PRIORITY      

  The priority level of the alert (one of: P1, P2, P3, P4, P5)
  
* API_KEY

  The OpsGenie API key (this will need to be pre-configured via the OpsGenie website)