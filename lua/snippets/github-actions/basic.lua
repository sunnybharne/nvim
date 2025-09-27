local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- GitHub Actions basic snippets
ls.add_snippets('yaml', {
  -- Basic workflow
  s("workflow", {
    t({"name: Example Workflow",""}),
    t({"",""}),
    t({"on:",""}),
    t({"  push:",""}),
    t({"    branches: [ main ]",""}),
    t({"  pull_request:",""}),
    t({"    branches: [ main ]",""}),
    t({"",""}),
    t({"jobs:",""}),
    t({"  build:",""}),
    t({"    runs-on: ubuntu-latest",""}),
    t({"",""}),
    t({"    steps:",""}),
    t({"    - uses: actions/checkout@v4",""}),
    t({"    - name: Run a one-line script",""}),
    t({"      run: echo Hello, world!",""})
  }),

  -- Workflow with multiple jobs
  s("workflow-multi", {
    t({"name: Multi-Job Workflow",""}),
    t({"",""}),
    t({"on:",""}),
    t({"  push:",""}),
    t({"    branches: [ main ]",""}),
    t({"",""}),
    t({"jobs:",""}),
    t({"  test:",""}),
    t({"    runs-on: ubuntu-latest",""}),
    t({"    steps:",""}),
    t({"    - uses: actions/checkout@v4",""}),
    t({"    - name: Run tests",""}),
    t({"      run: npm test",""}),
    t({"",""}),
    t({"  build:",""}),
    t({"    needs: test",""}),
    t({"    runs-on: ubuntu-latest",""}),
    t({"    steps:",""}),
    t({"    - uses: actions/checkout@v4",""}),
    t({"    - name: Build",""}),
    t({"      run: npm run build",""}),
    t({"",""}),
    t({"  deploy:",""}),
    t({"    needs: build",""}),
    t({"    runs-on: ubuntu-latest",""}),
    t({"    if: github.ref == 'refs/heads/main'",""}),
    t({"    steps:",""}),
    t({"    - uses: actions/checkout@v4",""}),
    t({"    - name: Deploy",""}),
    t({"      run: echo Deploying...",""})
  }),

  -- Scheduled workflow
  s("workflow-schedule", {
    t({"name: Scheduled Workflow",""}),
    t({"",""}),
    t({"on:",""}),
    t({"  schedule:",""}),
    t({"    - cron: '0 0 * * *'  # Run daily at midnight",""}),
    t({"",""}),
    t({"jobs:",""}),
    t({"  scheduled-job:",""}),
    t({"    runs-on: ubuntu-latest",""}),
    t({"    steps:",""}),
    t({"    - uses: actions/checkout@v4",""}),
    t({"    - name: Run scheduled task",""}),
    t({"      run: echo Running scheduled task",""})
  }),

  -- Workflow with environment
  s("workflow-env", {
    t({"name: Environment Workflow",""}),
    t({"",""}),
    t({"on:",""}),
    t({"  push:",""}),
    t({"    branches: [ main ]",""}),
    t({"",""}),
    t({"jobs:",""}),
    t({"  deploy:",""}),
    t({"    runs-on: ubuntu-latest",""}),
    t({"    environment: production",""}),
    t({"    steps:",""}),
    t({"    - uses: actions/checkout@v4",""}),
    t({"    - name: Deploy to production",""}),
    t({"      run: echo Deploying to production",""})
  }),

  -- Workflow with matrix strategy
  s("workflow-matrix", {
    t({"name: Matrix Workflow",""}),
    t({"",""}),
    t({"on:",""}),
    t({"  push:",""}),
    t({"    branches: [ main ]",""}),
    t({"",""}),
    t({"jobs:",""}),
    t({"  test:",""}),
    t({"    runs-on: ubuntu-latest",""}),
    t({"    strategy:",""}),
    t({"      matrix:",""}),
    t({"        node-version: [16, 18, 20]",""}),
    t({"        os: [ubuntu-latest, windows-latest, macos-latest]",""}),
    t({"    steps:",""}),
    t({"    - uses: actions/checkout@v4",""}),
    t({"    - name: Setup Node.js",""}),
    t({"      uses: actions/setup-node@v4",""}),
    t({"      with:",""}),
    t({"        node-version: ${{ matrix.node-version }}",""}),
    t({"    - name: Run tests",""}),
    t({"      run: npm test",""})
  })
})
