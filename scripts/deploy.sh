#!/bin/sh

# CREATE SCRATCH ORG
echo "--- Creating your scratch org. Please wait..."
sfdx force:org:create adminEmail="sam.wadhwani@pwc.com " \
--definitionfile config/project-scratch-def.json \
--setalias fsc-demo \
--durationdays 30 \
--setdefaultusername

# INSTALL PACKAGES
## sfdx force:package:installed:list

## FSC Managed Package: http://industries.force.com/financialservicescloud
#echo "--- Installing the FSC Managed package. Please wait..."
#sfdx force:package:install --package 04t1E000000y9lo --noprompt --wait=30

## FSC Unmanaged Package: http://industries.force.com/financialservicescloudextension
#echo "--- Installing the FSC Unmanaged package. Please wait..."
#sfdx force:package:install --package 04t1E000001Iql5 --noprompt --wait=30

## Einstein Analytics (Wave) for FSC Managed Package: http://industries.force.com/financialservicescloudwave

# ASSIGN PERMISSIONS
## FSC Permission Sets: sfdx force:data:soql:query -t -q "SELECT Name, Description FROM PermissionSet"
#echo "--- Assigning profiles and permission sets. Please wait..."
#sfdx force:user:permset:assign -n InsuranceAccess
#sfdx force:user:permset:assign -n LendingAssistant
#sfdx force:user:permset:assign -n Advisor
#sfdx force:user:permset:assign -n FinancialServicesCloudStandard

# DEPLOY SOURCE
echo "--- Deploying the source to the scratch org. Please wait..."
sfdx force:source:push

sfdx force:org:open -u fsc-demo