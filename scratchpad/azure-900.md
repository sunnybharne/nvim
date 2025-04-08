# Az 900

## Describe cloud concepts

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
- **Consumption based model**
    - **capex**: Capital expenditure, upfront cost, buying the servers. 
    -q**opex**: Operational expenditure, pay as you go, renting the servers. ie. cloud computing.
- **cloud types**
    - **Public cloud** - Azure
    - **Private cloud** - on-prem cloud hosted on customer data center
    - **Hybrid Cloud** - Public + Private cloud
    - **Multi cloud** - Using multiple public clouds (Azure + AWS + GCP)
> [!Note]
> - Azure arc helps you manager the resources in public , private, hybrid cloud and on prem. Its like a superman managing all the resources you own.
> - You can keep using your vmware solution with azure, Azure has seemless integration with vmware

### Benefits of cloud computing
- **High availabality**: Uptime (availability) , uptime is garanteed by SLA depending on the service.
- **Scalability**: (ability to scale on demand), adding or removing resources as needed.
    - **Vertical scaling**: Adding more power to existing resources (CPU, RAM)
    - **Horizontal scaling**: Adding more resources (VMs, servers) to the pool. This is used when there is sudden spike in traffic.(also called as scaling out and scaling in) 
> [!Note]
> - Scaling can be done manually or automatically.
> - Automatically scaling resources up or down based on demand is called Autoscaling, this phenomenon is called elasticity.
- **Reliability**: Ability of the system to recover from failures. In case of catastrophic failure, the system would automatically failover to another region.
- **Predictability**: Predict and forecast the performance and behavior of the system. This is done by using Azure Monitor, Azure Advisor, Azure Security Center, Azure Policy, Azure Blueprints.
> [!Note]
> - Performance predictability can be achieved by autoscaling, load balancing, and high availability.
> - Cost predictability can be achieved by using Azure Cost Management, Azure Budgets, Azure Advisor.
- **Security and Governance**: Azure supports governance and compliance which helps you to manage your resources and policies and help you to meet the compliance requirements.
- **Manageability**: There are two manageability options available in Azure.
    - **Management of the cloud**: Deployment and manupulation of the resources in azure cloud.
    - **Management in cloud**: How you can manage your resources in the cloud. This is done by using Azure Portal, Azure CLI, Azure PowerShell, Azure SDKs, Azure REST APIs.

## Describe azure architecture and services

-----

## Regions and Zones
    - Soveregin Region --->> Used by Governments
    - Region A ------------------------------Region Pair-----------------------------Region B
    |
    - ( Availability zones A |  Availability zones B )
    |
    - Data center A | Data center B

## Priceing calculator
    - This gives you a basic rought estimate for using the service on the cloud.
    - Capex - Buying the servers
    - Opex - Renting the servers

## Cloud concepts
    1. High availability -> Up time , no downtime is 100% availability(Not possible)
    2. Scalability -> Design to add/ remove extra servers (Vertical scaling, horizontal scaling)
    3. Elasticity -> Automating scalaility
    4. Reliability -> Ability to system to recover from failures 
        - Autoscaling 
        - Avoid single point of failure 
        - Backups
        - Multi Region deployments
        - Health probes and self healing
    5. Predictibility -> Predict and forcast and control performance and behavior of the system (Autoscaling)
        - Microsoft security Respons center
        - Always on DDos
        - Azure policies and blueprints
        - Azure Entra ID
        - RBAC
        - update management
        - Encryption by default
        - Firewalls
    6. Governance -> Monitoring and policies 
        - policies
        - auditing and reporting
        - Industry standards
        - management groups 
        - custom roles
        - soft deletes
        - cloud adoption framework
    7. Managability -> 
        - Portal
        - CLI
        - Api's
    8. Serverless
        - Functions
        - Container Apps
        - Kubernetes
        - SQL database
    9. Cosmos DB

## Types of service
    - Zonal services --> Will be deployed in one az and not redundant
    - Zone redundant services --> These services are zone redundant and can tolearate outages
    - Always available services --> By defaul zone redundant (Azure Entra ID, Azure portal, Azure front door)

## IMP point 
    - NSG can be attached to subnet
    - NSG can be attached to Vertual machines network interface
    - NSG cant be attached to the Vnet
