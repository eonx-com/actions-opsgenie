# Github Actions: OpsGenie

This Github action can be used to generate alert to OpsGenie by generating a CURL request to the OpsGenie API.

#### Required Parameters

* ALIAS
         
  User defined identifier for the alert (this is used by OpsGenie to de-duplicate alerts)

* MESSAGE       

  The content of the alert message

* PRIORITY      

  The priority level of the alert (one of the pre-defined OpsGenie levels: P1, P2, P3, P4, P5)
  
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
        uses: eonx-com/actions-opsgenie@v1.1
        with:
          ALIAS: 'devops-pingdom-production'
          MESSAGE: 'Deployment of Rewards PHP to production started'
          PRIORITY: 'P5'
          API_KEY: ${{ secrets.OPSGENIE_API_KEY }}
```