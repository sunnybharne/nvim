local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- CDKTF AWS Resources - consistent keywords with Terraform and Bicep
ls.add_snippets('typescript', {
  -- S3 Bucket
  s("aws-s3", {
    t({"new S3Bucket(this, \"example-bucket\", {",""}),
    t({"  bucket: \"example-bucket-name\"",""}),
    t({"", "});"})
  }),

  -- EC2 Instance
  s("aws-ec2", {
    t({"new Instance(this, \"example-instance\", {",""}),
    t({"  ami: \"ami-0c02fb55956c7d316\"",""}),
    t({"  instanceType: \"t3.micro\"",""}),
    t({"",""}),
    t({"", "  tags: {"}),
    t({"    Name: \"example-instance\"",""}),
    t({"", "  }"}),
    t({"", "});"})
  }),

  -- VPC
  s("aws-vpc", {
    t({"new Vpc(this, \"example-vpc\", {",""}),
    t({"  cidr: \"10.0.0.0/16\"",""}),
    t({"", "  enableDnsHostnames: true"}),
    t({"", "  enableDnsSupport: true"}),
    t({"",""}),
    t({"", "  tags: {"}),
    t({"    Name: \"example-vpc\"",""}),
    t({"", "  }"}),
    t({"", "});"})
  }),

  -- Subnet
  s("aws-subnet", {
    t({"new Subnet(this, \"example-subnet\", {",""}),
    t({"", "  vpcId: vpc.id"}),
    t({"  cidrBlock: \"10.0.1.0/24\"",""}),
    t({"  availabilityZone: \"us-east-1a\"",""}),
    t({"",""}),
    t({"", "  tags: {"}),
    t({"    Name: \"example-subnet\"",""}),
    t({"", "  }"}),
    t({"", "});"})
  }),

  -- Security Group
  s("aws-sg", {
    t({"new SecurityGroup(this, \"example-sg\", {",""}),
    t({"", "  vpcId: vpc.id"}),
    t({"  name: \"example-security-group\"",""}),
    t({"  description: \"Example security group\"",""}),
    t({"",""}),
    t({"", "  ingress: ["}),
    t({"", "    {"}),
    t({"", "      fromPort: 80"}),
    t({"", "      toPort: 80"}),
    t({"      protocol: \"tcp\"",""}),
    t({"      cidrBlocks: [\"0.0.0.0/0\"]",""}),
    t({"", "    }"}),
    t({"", "  ]"}),
    t({"",""}),
    t({"", "  egress: ["}),
    t({"", "    {"}),
    t({"", "      fromPort: 0"}),
    t({"", "      toPort: 0"}),
    t({"      protocol: \"-1\"",""}),
    t({"      cidrBlocks: [\"0.0.0.0/0\"]",""}),
    t({"", "    }"}),
    t({"", "  ]"}),
    t({"", "});"})
  }),

  -- RDS Instance
  s("aws-rds", {
    t({"new DbInstance(this, \"example-rds\", {",""}),
    t({"  engine: \"mysql\"",""}),
    t({"  engineVersion: \"8.0\"",""}),
    t({"  instanceClass: \"db.t3.micro\"",""}),
    t({"", "  allocatedStorage: 20"}),
    t({"  storageType: \"gp2\"",""}),
    t({"",""}),
    t({"  dbName: \"example\"",""}),
    t({"  username: \"admin\"",""}),
    t({"  password: \"password123\"",""}),
    t({"",""}),
    t({"", "  vpcSecurityGroupIds: [securityGroup.id]"}),
    t({"", "  dbSubnetGroupName: subnetGroup.name"}),
    t({"", "});"})
  }),

  -- Lambda Function
  s("aws-lambda", {
    t({"new LambdaFunction(this, \"example-lambda\", {",""}),
    t({"  functionName: \"example-function\"",""}),
    t({"  runtime: \"nodejs18.x\"",""}),
    t({"  handler: \"index.handler\"",""}),
    t({"  code: new InlineCode(\"exports.handler = async (event) => { return 'Hello World'; };\")",""}),
    t({"",""}),
    t({"", "  role: lambdaRole.arn"}),
    t({"", "});"})
  }),

  -- CloudFront Distribution
  s("aws-cloudfront", {
    t({"new CloudfrontDistribution(this, \"example-distribution\", {",""}),
    t({"", "  origin: {"}),
    t({"    domainName: \"example.com\"",""}),
    t({"    originId: \"example-origin\"",""}),
    t({"", "  }"}),
    t({"",""}),
    t({"", "  defaultCacheBehavior: {"}),
    t({"    targetOriginId: \"example-origin\"",""}),
    t({"    viewerProtocolPolicy: \"redirect-to-https\"",""}),
    t({"", "  }"}),
    t({"",""}),
    t({"", "  enabled: true"}),
    t({"  defaultRootObject: \"index.html\"",""}),
    t({"", "});"})
  }),

  -- Data Sources
  s("data-aws-ami", {
    t({"const ami = new DataAwsAmi(this, \"example-ami\", {",""}),
    t({"", "  mostRecent: true"}),
    t({"  owners: [\"amazon\"]",""}),
    t({"",""}),
    t({"", "  filter: ["}),
    t({"", "    {"}),
    t({"      name: \"name\"",""}),
    t({"      values: [\"amzn2-ami-hvm-*-x86_64-gp2\"]",""}),
    t({"", "    }"}),
    t({"", "  ]"}),
    t({"", "});"})
  })
})
