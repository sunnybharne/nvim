local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- AWS Resource snippets
ls.add_snippets('terraform', {
  -- VPC
  s("vpc", {
    t({"resource \"aws_vpc\" \"main\" {",""}),
    t({"  cidr_block           = \"10.0.0.0/16\"",""}),
    t({"", "  enable_dns_hostnames = true"}),
    t({"", "  enable_dns_support   = true"}),
    t({"",""}),
    t({"", "  tags = {"}),
    t({"    Name        = \"${var.project_name}-${var.environment}-vpc\"",""}),
    t({"", "    Environment = var.environment"}),
    t({"", "    Project     = var.project_name"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Internet Gateway
  s("igw", {
    t({"resource \"aws_internet_gateway\" \"main\" {",""}),
    t({"", "  vpc_id = aws_vpc.main.id"}),
    t({"",""}),
    t({"", "  tags = {"}),
    t({"    Name        = \"${var.project_name}-${var.environment}-igw\"",""}),
    t({"", "    Environment = var.environment"}),
    t({"", "    Project     = var.project_name"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Subnet
  s("subnet", {
    t({"resource \"aws_subnet\" \"main\" {",""}),
    t({"", "  vpc_id                  = aws_vpc.main.id"}),
    t({"  cidr_block              = \"10.0.1.0/24\"",""}),
    t({"", "  availability_zone       = data.aws_availability_zones.available.names[0]"}),
    t({"", "  map_public_ip_on_launch = true"}),
    t({"",""}),
    t({"", "  tags = {"}),
    t({"    Name        = \"${var.project_name}-${var.environment}-subnet\"",""}),
    t({"", "    Environment = var.environment"}),
    t({"", "    Project     = var.project_name"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Route Table
  s("rt", {
    t({"resource \"aws_route_table\" \"main\" {",""}),
    t({"", "  vpc_id = aws_vpc.main.id"}),
    t({"",""}),
    t({"", "  route {"}),
    t({"    cidr_block = \"0.0.0.0/0\"",""}),
    t({"", "    gateway_id = aws_internet_gateway.main.id"}),
    t({"", "  }"}),
    t({"",""}),
    t({"", "  tags = {"}),
    t({"    Name        = \"${var.project_name}-${var.environment}-rt\"",""}),
    t({"", "    Environment = var.environment"}),
    t({"", "    Project     = var.project_name"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Security Group
  s("sg", {
    t({"resource \"aws_security_group\" \"main\" {",""}),
    t({"  name_prefix = \"${var.project_name}-${var.environment}-\"",""}),
    t({"", "  vpc_id      = aws_vpc.main.id"}),
    t({"",""}),
    t({"", "  ingress {"}),
    t({"", "    from_port   = 22"}),
    t({"", "    to_port     = 22"}),
    t({"    protocol    = \"tcp\"",""}),
    t({"    cidr_blocks = [\"0.0.0.0/0\"]",""}),
    t({"", "  }"}),
    t({"",""}),
    t({"", "  ingress {"}),
    t({"", "    from_port   = 80"}),
    t({"", "    to_port     = 80"}),
    t({"    protocol    = \"tcp\"",""}),
    t({"    cidr_blocks = [\"0.0.0.0/0\"]",""}),
    t({"", "  }"}),
    t({"",""}),
    t({"", "  egress {"}),
    t({"", "    from_port   = 0"}),
    t({"", "    to_port     = 0"}),
    t({"    protocol    = \"-1\"",""}),
    t({"    cidr_blocks = [\"0.0.0.0/0\"]",""}),
    t({"", "  }"}),
    t({"",""}),
    t({"", "  tags = {"}),
    t({"    Name        = \"${var.project_name}-${var.environment}-sg\"",""}),
    t({"", "    Environment = var.environment"}),
    t({"", "    Project     = var.project_name"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- EC2 Instance
  s("ec2", {
    t({"resource \"aws_instance\" \"main\" {",""}),
    t({"", "  ami                    = data.aws_ami.ubuntu.id"}),
    t({"  instance_type          = \"t3.micro\"",""}),
    t({"", "  subnet_id              = aws_subnet.main.id"}),
    t({"", "  vpc_security_group_ids = [aws_security_group.main.id]"}),
    t({"", "  key_name               = aws_key_pair.main.key_name"}),
    t({"",""}),
    t({"  user_data = base64encode(templatefile(\"${path.module}/user_data.sh\", {",""}),
    t({"", "    # Add variables here"}),
    t({"", "  }))"}),
    t({"",""}),
    t({"", "  tags = {"}),
    t({"    Name        = \"${var.project_name}-${var.environment}-ec2\"",""}),
    t({"", "    Environment = var.environment"}),
    t({"", "    Project     = var.project_name"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- S3 Bucket
  s("s3", {
    t({"resource \"aws_s3_bucket\" \"main\" {",""}),
    t({"  bucket = \"${var.project_name}-${var.environment}-bucket\"",""}),
    t({"",""}),
    t({"", "  tags = {"}),
    t({"    Name        = \"${var.project_name}-${var.environment}-bucket\"",""}),
    t({"", "    Environment = var.environment"}),
    t({"", "    Project     = var.project_name"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- RDS Instance
  s("rds", {
    t({"resource \"aws_db_instance\" \"main\" {",""}),
    t({"  identifier = \"${var.project_name}-${var.environment}-db\"",""}),
    t({"  engine     = \"mysql\"",""}),
    t({"  engine_version = \"8.0\"",""}),
    t({"  instance_class = \"db.t3.micro\"",""}),
    t({"", "  allocated_storage = 20"}),
    t({"  storage_type = \"gp2\"",""}),
    t({"", "  db_name  = var.db_name"}),
    t({"", "  username = var.db_username"}),
    t({"", "  password = var.db_password"}),
    t({"", "  vpc_security_group_ids = [aws_security_group.rds.id]"}),
    t({"", "  db_subnet_group_name   = aws_db_subnet_group.main.name"}),
    t({"", "  skip_final_snapshot = true"}),
    t({"",""}),
    t({"", "  tags = {"}),
    t({"    Name        = \"${var.project_name}-${var.environment}-db\"",""}),
    t({"", "    Environment = var.environment"}),
    t({"", "    Project     = var.project_name"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Lambda Function
  s("lambda", {
    t({"resource \"aws_lambda_function\" \"main\" {",""}),
    t({"  filename         = \"lambda_function.zip\"",""}),
    t({"  function_name    = \"${var.project_name}-${var.environment}-lambda\"",""}),
    t({"", "  role            = aws_iam_role.lambda_role.arn"}),
    t({"  handler         = \"index.handler\"",""}),
    t({"", "  source_code_hash = data.archive_file.lambda_zip.output_base64sha256"}),
    t({"  runtime         = \"python3.9\"",""}),
    t({"",""}),
    t({"", "  tags = {"}),
    t({"    Name        = \"${var.project_name}-${var.environment}-lambda\"",""}),
    t({"", "    Environment = var.environment"}),
    t({"", "    Project     = var.project_name"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- CloudFront Distribution
  s("cloudfront", {
    t({"resource \"aws_cloudfront_distribution\" \"main\" {",""}),
    t({"", "  origin {"}),
    t({"", "    domain_name = aws_s3_bucket.main.bucket_regional_domain_name"}),
    t({"    origin_id   = \"S3-${aws_s3_bucket.main.bucket}\"",""}),
    t({"",""}),
    t({"", "    s3_origin_config {"}),
    t({"", "      origin_access_identity = aws_cloudfront_origin_access_identity.main.cloudfront_access_identity_path"}),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"",""}),
    t({"", "  enabled             = true"}),
    t({"", "  is_ipv6_enabled     = true"}),
    t({"  default_root_object = \"index.html\"",""}),
    t({"",""}),
    t({"", "  default_cache_behavior {"}),
    t({"    allowed_methods        = [\"DELETE\", \"GET\", \"HEAD\", \"OPTIONS\", \"PATCH\", \"POST\", \"PUT\"]",""}),
    t({"    cached_methods         = [\"GET\", \"HEAD\"]",""}),
    t({"    target_origin_id       = \"S3-${aws_s3_bucket.main.bucket}\"",""}),
    t({"",""}),
    t({"", "    forwarded_values {"}),
    t({"", "      query_string = false"}),
    t({"", "      cookies {"}),
    t({"        forward = \"none\"",""}),
    t({"", "      }"}),
    t({"", "    }"}),
    t({"",""}),
    t({"    viewer_protocol_policy = \"redirect-to-https\"",""}),
    t({"", "    min_ttl                = 0"}),
    t({"", "    default_ttl            = 3600"}),
    t({"", "    max_ttl                = 86400"}),
    t({"", "  }"}),
    t({"",""}),
    t({"  price_class = \"PriceClass_100\"",""}),
    t({"",""}),
    t({"", "  restrictions {"}),
    t({"", "    geo_restriction {"}),
    t({"      restriction_type = \"whitelist\"",""}),
    t({"      locations        = [\"US\", \"CA\", \"GB\", \"DE\"]",""}),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"",""}),
    t({"", "  viewer_certificate {"}),
    t({"", "    cloudfront_default_certificate = true"}),
    t({"", "  }"}),
    t({"",""}),
    t({"", "  tags = {"}),
    t({"    Name        = \"${var.project_name}-${var.environment}-cloudfront\"",""}),
    t({"", "    Environment = var.environment"}),
    t({"", "    Project     = var.project_name"}),
    t({"", "  }"}),
    t({"", "}"})
  })
})
