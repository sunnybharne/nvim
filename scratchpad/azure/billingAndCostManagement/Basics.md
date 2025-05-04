# Cost Management and Billing Basics

> [!NOTE]
> - Cost Management Doc: https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/
> - Billing Doc: https://learn.microsoft.com/en-us/azure/cost-management-billing/manage/
> - Training: https://learn.microsoft.com/en-us/training/paths/control-spending-manage-bills/?source=recommendations
> - Training: https://learn.microsoft.com/en-us/training/modules/manage-costs-partner-cost-management/?source=recommendations
> - Whats new in finops: https://azure.microsoft.com/en-us/blog/tag/finops/
> - To be continued cost managemnet... https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/enable-preview-features-cost-management-labs
> - To be continued billing... https://learn.microsoft.com/en-us/azure/cost-management-billing/understand/review-individual-bill

## MS Commerce System data pipeline
![data pipeline](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/media/overview-cost-management/commerce-pipeline.svg#lightbox)
- Credits are applied like a gift card just before monthly invoicing; unused until then.

## Bill Review

### Individual Agreement
- Invoice is created at the end of the billing cycle

### EA Agreement
- Invoice is generated when:
    - Service overage (exceeding the organizational/prepayments/monetary commitments credits)
    - Use of services not covered by the enterprise agreement
    - Marketplace charges

> [!NOTE]
> Invoice can be found in cost management and billing > billing > invoices
> Specific subscription scope > billing > invoices

# Dont know where this will go yet
- Billing Account 
  - Billing scope (This is just selecting the billing account)
  - Billing profile (More segrigation into different departments)

Continue from here: https://learn.microsoft.com/en-us/azure/cost-management-billing/understand/review-enterprise-agreement-bill#review-invoiced-charges     















#### Subscription > Billing
    - cost analysis
    - invoices > bill
    - invoices > invoice

#### external service charges
    - This are the charges from the auzre marketplace

#### How are resources billed 
    - Resources has one or more meter.Meters are used to track the usage of the resource over time.

#### vm meters example:
    - Compute Hours, IP Address Hours, Data Transfer In, Data Transfer Out, Standard Managed Disk, Standard Managed Disk Operations, Standard IO-Disk, Standard IO-Block Blob Read, Standard IO-Block Blob Write, Standard IO-Block Blob Delete

continue from here
https://learn.microsoft.com/en-us/azure/cost-management-billing/understand/review-enterprise-agreement-bill
