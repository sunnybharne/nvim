# Administrator
Full Training: https://learn.microsoft.com/en-us/training/career-paths/administrator?tabs-container=tab-beginner

## Describe cloud concepts/computing

### Basics
- **Cloud computing**: Delivery of computing services(vm, storage, db, networking, iot, ml, ai) over the internet.
- **Shared responsibility model**
    - **On premise**: Customer is responsible for everything.
    - **Iaas**: MS responsible for physical infrastructure , customer responsible for OS, apps, data, maintainance, security patches. (Azure VM)
       - best candidate for lift and shift migration.
       - Testing and development environments where you need to quickly spin up and down resources.
    - **PaaS**: MS responsible for physical infrastructure opertating system, patching , customer responsible for app, data.(Azure SQL, Azure App Service)
       - Best candidate for spinng and env without headaches of managing the underlying infrastructure and the patching needs that comes with it.
    - **SaaS**: MS responsible for application and opertating system and app , customer responcible for data.(Office 365, Dynamics 365)
- **cloud models**
    - **Public cloud** - Azure
    - **Private cloud** - on-prem cloud hosted on customer data center
    - **Hybrid Cloud** - Public + Private cloud
    - **Multi cloud** - Using multiple public clouds (Azure + AWS + GCP)
- **Consumption based model**
    - **capex**: Capital expenditure, upfront cost, buying the servers. 
    - **opex**: Operational expenditure, pay as you go, renting the servers. ie. cloud computing.

> [!Note]
> - Azure arc helps you manager the resources in public , private, hybrid cloud and on prem. Its like a superman managing all the resources you own.
> - You can keep using your vmware solution with azure, Azure has seemless integration with vmware

### Benefits of cloud computing
- **High availabality**: Uptime (availability) , uptime is garanteed by SLA depending on the service.
    | **Availability (%)** | **Downtime per Month**    |
    |----------------------|---------------------------|
    | 99.0%                | 7.2 hours                 |
    | 99.9%                | 43.2 minutes              |
    | 99.99%               | 4.32 minutes              |
    | 99.999%              | 25.9 seconds              |
    | 99.9999%             | 2.59 seconds              |
- **Scalability**: (ability to scale on demand), adding or removing resources as needed.
    - **Vertical scaling**: Adding more power to existing resources (CPU, RAM)
    - **Horizontal scaling**: Adding more resources (VMs, servers) to the pool. This is used when there is sudden spike in traffic.(also called as scaling out and scaling in) 
- **Elasticity**: Ability to scale resources up or down based on demand. This is done by using autoscaling.
- **Autoscaling**: Automatically scaling resources up or down based on demand.
- **Reliability**: The system can recover from failures, often by automatically switching to another region. Some apps or cloud services handle this failover without needing any manual action.
- **Predictability**: Helps you plan with confidence by making performance and costs more consistent.
    - **Performance**: Autoscaling, load balancing, and high availability ensure your app runs smoothly, even during traffic spikes.
    - **Cost**: You can monitor and forecast cloud spending using tools like TCO and the Pricing Calculator, helping you stay within budget.
- **Governance**: Use templates to enforce standards, update resources as rules change, and flag non-compliant ones automatically.
- **Security**: Choose the right service model based on control needs—IaaS for full control, or PaaS/SaaS for automatic updates and patches. Cloud providers also help protect against threats like DDoS attacks.
- **Manageability**: There are two manageability options available in Azure.
    - **Management of the cloud**: Deployment and manupulation of the resources in azure cloud.
    - **Management in cloud**: How you can manage your resources in the cloud. This is done by using Azure Portal, Azure CLI, Azure PowerShell, Azure SDKs, Azure REST APIs.


## Describe Azure architecture and services
## Describe Azure management and governance
