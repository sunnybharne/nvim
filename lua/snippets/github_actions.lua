local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local is_github_workflow = require("snippets.utils").is_github_workflow

local function terraform_push_path(args)
  local directory = args[1][1]:gsub("^%./", ""):gsub("/+$", "")
  if directory == "." or directory == "" then
    return "**"
  end
  return directory .. "/**"
end

-- ============================================================================
-- GITHUB ACTIONS SNIPPETS (YAML)
-- ============================================================================

ls.add_snippets('yaml', {
  s({ trig = "trigger-lua", condition = is_github_workflow, show_condition = is_github_workflow }, fmta([[
    name: "<>"

    on:
      workflow_dispatch:
      push:
        branches: [main]
        paths:
          - "<>"

    jobs:
      terraform:
        runs-on: ubuntu-latest
        permissions:
          contents: read
          id-token: write
        env:
          ARM_USE_OIDC: "true"
          ARM_CLIENT_ID: ${{ secrets.AZURE_CLIENT_ID }}
          ARM_TENANT_ID: ${{ secrets.AZURE_TENANT_ID }}
          TF_VAR_subscription_id: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
          TF_TOKEN_app_terraform_io: ${{ secrets.TF_API_TOKEN }}
        defaults:
          run:
            working-directory: "<>"

        steps:
          - name: Check out the repository
            uses: actions/checkout@v7.0.1

          - name: Set up Terraform
            uses: hashicorp/setup-terraform@v4.0.1
            with:
              terraform_version: "<>"

          - name: Plan
            id: plan
            run: |
              terraform init -input=false
              terraform validate
              status=0
              terraform plan -input=false -detailed-exitcode -out=tfplan || status=$?
              case "$status" in
                2) echo "changes=true" >>>> "$GITHUB_OUTPUT" ;;
                *) exit "$status" ;;
              esac

          - name: Deploy
            if: steps.plan.outputs.changes == 'true'
            run: terraform apply -input=false tfplan
  ]], {
    i(1, "<workflow-name>"),
    ls.function_node(terraform_push_path, { 2 }),
    i(2, "<terraform-directory>"),
    i(3, "<terraform-version>"),
  })),

  -- Basic workflow
  s("workflow", {
    t({"", "name: Example Workflow"}),
    t({"",""}),
    t({"", "on:"}),
    t({"", "  push:"}),
    t({"", "    branches: [ main ]"}),
    t({"", "  pull_request:"}),
    t({"", "    branches: [ main ]"}),
    t({"",""}),
    t({"", "jobs:"}),
    t({"", "  build:"}),
    t({"", "    runs-on: ubuntu-latest"}),
    t({"",""}),
    t({"", "    steps:"}),
    t({"", "    - uses: actions/checkout@v4"}),
    t({"", "    - name: Run a one-line script"}),
    t({"", "      run: echo Hello, world!"})
  }),

  -- Workflow with multiple jobs
  s("workflow-multi", {
    t({"", "name: Multi-Job Workflow"}),
    t({"",""}),
    t({"", "on:"}),
    t({"", "  push:"}),
    t({"", "    branches: [ main ]"}),
    t({"",""}),
    t({"", "jobs:"}),
    t({"", "  test:"}),
    t({"", "    runs-on: ubuntu-latest"}),
    t({"", "    steps:"}),
    t({"", "    - uses: actions/checkout@v4"}),
    t({"", "    - name: Run tests"}),
    t({"", "      run: npm test"}),
    t({"",""}),
    t({"", "  build:"}),
    t({"", "    needs: test"}),
    t({"", "    runs-on: ubuntu-latest"}),
    t({"", "    steps:"}),
    t({"", "    - uses: actions/checkout@v4"}),
    t({"", "    - name: Build"}),
    t({"", "      run: npm run build"}),
    t({"",""}),
    t({"", "  deploy:"}),
    t({"", "    needs: build"}),
    t({"", "    runs-on: ubuntu-latest"}),
    t({"", "    if: github.ref == 'refs/heads/main'"}),
    t({"", "    steps:"}),
    t({"", "    - uses: actions/checkout@v4"}),
    t({"", "    - name: Deploy"}),
    t({"", "      run: echo Deploying..."})
  }),

  -- Scheduled workflow
  s("workflow-schedule", {
    t({"", "name: Scheduled Workflow"}),
    t({"",""}),
    t({"", "on:"}),
    t({"", "  schedule:"}),
    t({"", "    - cron: '0 0 * * *'  # Run daily at midnight"}),
    t({"",""}),
    t({"", "jobs:"}),
    t({"", "  scheduled-job:"}),
    t({"", "    runs-on: ubuntu-latest"}),
    t({"", "    steps:"}),
    t({"", "    - uses: actions/checkout@v4"}),
    t({"", "    - name: Run scheduled task"}),
    t({"", "      run: echo Running scheduled task"})
  }),

  -- Workflow with environment
  s("workflow-env", {
    t({"", "name: Environment Workflow"}),
    t({"",""}),
    t({"", "on:"}),
    t({"", "  push:"}),
    t({"", "    branches: [ main ]"}),
    t({"",""}),
    t({"", "jobs:"}),
    t({"", "  deploy:"}),
    t({"", "    runs-on: ubuntu-latest"}),
    t({"", "    environment: production"}),
    t({"", "    steps:"}),
    t({"", "    - uses: actions/checkout@v4"}),
    t({"", "    - name: Deploy to production"}),
    t({"", "      run: echo Deploying to production"})
  }),

  -- Workflow with matrix strategy
  s("workflow-matrix", {
    t({"", "name: Matrix Workflow"}),
    t({"",""}),
    t({"", "on:"}),
    t({"", "  push:"}),
    t({"", "    branches: [ main ]"}),
    t({"",""}),
    t({"", "jobs:"}),
    t({"", "  test:"}),
    t({"", "    runs-on: ubuntu-latest"}),
    t({"", "    strategy:"}),
    t({"", "      matrix:"}),
    t({"", "        node-version: [16, 18, 20]"}),
    t({"", "        os: [ubuntu-latest, windows-latest, macos-latest]"}),
    t({"", "    steps:"}),
    t({"", "    - uses: actions/checkout@v4"}),
    t({"", "    - name: Setup Node.js"}),
    t({"", "      uses: actions/setup-node@v4"}),
    t({"", "      with:"}),
    t({"", "        node-version: ${{ matrix.node-version }}"}),
    t({"", "    - name: Run tests"}),
    t({"", "      run: npm test"})
  })
})

