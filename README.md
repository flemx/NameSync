# NameSync

This package installs 2 objects (Master__c and Detail__c) with a MasterDetail relationship.
Apex logix ensures the Master Name always contains a comma seperated composition of its underlying Detail Name values

The goal of this project is to showcase best practice for Object Oriented Programming and Design Patterns for Triggers.

### Install

1. Authorize with your org and provide it with an alias (OrgAlias):

```
sfdx force:auth:web:login -a "OrgAlias"
```

3. Push the app to your org:

```
sfdx force:source:deploy --sourcepath force-app/main/default -l RunSpecifiedTests -r DetailTriggerHandlerTest --json --loglevel fatal --targetusername "OrgAlias"
```

4. Assign the permission set:

```
sfdx force:user:permset:assign --permsetname NameSync --targetusername "OrgAlias"
```

5. Open the default org:

```
sfdx force:org:open --targetusername "OrgAlias"
```

6. To run the unit tests:

```
sfdx force:apex:test:run --classnames "DetailTriggerHandlerTest" --resultformat tap --codecoverage  --targetusername "OrgAlias"
```

