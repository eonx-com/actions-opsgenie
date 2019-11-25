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
  
  
#### Example Usage

The following example shows how the action can be used in a Github workflow file.

```yaml
name: OpsGenie Alert Example

on:
  push:
    branches:
      - master

jobs:
  deploy-production-started:
    name: Send OpsGenie Alert
    runs-on: ubuntu-latest
    steps:
      - name: Generate Alert
        uses: eonx-labs/action-opsgenie-alert@master
        with:
          ALIAS: 'devops-pingdom-production'
          MESSAGE: 'Deployment of Rewards PHP to production started'
          PRIORITY: 'P5'
          API_KEY: ${{ secrets.OPSGENIE_API_KEY }}
```