# Getting Started

Welcome to your new CAP project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`readme.md` | this getting started guide

## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start with your domain model, in a CDS file in `db/`

## Learn More

Learn more at <https://cap.cloud.sap>.
--------------------------------------------------------------------------------------------------------------
SAP CAP Travel Approval Application

Technologies:
- SAP CAP
- SAP HANA Cloud
- Fiori Elements
- SAP Build Process Automation
- SAP Build Actions
- Cloud Foundry
- OData V4

End-to-End Flow:

Fiori Create Travel
        ↓
CAP Service
        ↓
HANA Cloud
        ↓
Automatic BPA Workflow Start
        ↓
My Inbox
        ↓
Approve / Reject
        ↓
Update Travel Status
        ↓
Monitoring
        ↓
Database Validation