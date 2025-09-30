return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        -- Manual mode doesn't automatically change your root directory, so you have
        -- the option to manually do so using `:ProjectRoot` command.
        manual_mode = false,

        -- Methods of detecting the root directory
        -- **"lsp"** uses the native neovim lsp
        -- **"pattern"** uses vim-rooter like glob pattern matching. Here
        -- order matters: if one is not detected, the result is passed to the next.
        -- Default: { "lsp", "pattern" }, in this case, if the lsp method is not
        -- available, it will fall back to pattern matching.
        detection_methods = { "lsp", "pattern" },
        
        -- Custom project detection for ~/code folder
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = 'global',
        datapath = vim.fn.stdpath("data"),

        -- All the patterns used to detect root dir, when **"pattern"** method is
        -- used
        patterns = { 
          -- Version Control
          ".git",                    -- Git repositories
          "_darcs",                  -- Darcs repositories
          ".hg",                    -- Mercurial repositories
          ".bzr",                   -- Bazaar repositories
          ".svn",                   -- Subversion repositories
          
          -- Programming Languages
          "package.json",           -- Node.js projects
          "pyproject.toml",         -- Python projects
          "requirements.txt",       -- Python projects
          "setup.py",               -- Python projects
          "Cargo.toml",             -- Rust projects
          "composer.json",          -- PHP projects
          "go.mod",                 -- Go projects
          "pom.xml",               -- Java Maven projects
          "build.gradle",           -- Java Gradle projects
          "Gemfile",                -- Ruby projects
          "Podfile",                -- iOS projects
          "pubspec.yaml",           -- Flutter/Dart projects
          
          -- Build Systems
          "Makefile",               -- C/C++ projects
          "CMakeLists.txt",         -- CMake projects
          "meson.build",            -- Meson projects
          "configure.ac",           -- Autotools projects
          "configure.in",           -- Autotools projects
          
          -- Container & Infrastructure
          "Dockerfile",             -- Docker projects
          "docker-compose.yml",     -- Docker Compose projects
          "docker-compose.yaml",    -- Docker Compose projects
          "terraform.tf",           -- Terraform projects
          "main.tf",                -- Terraform projects
          "variables.tf",           -- Terraform projects
          "outputs.tf",             -- Terraform projects
          "provider.tf",            -- Terraform projects
          "ansible.cfg",            -- Ansible projects
          "playbook.yml",           -- Ansible projects
          "inventory.ini",          -- Ansible projects
          "Vagrantfile",            -- Vagrant projects
          
          -- Kubernetes & Cloud
          "k8s.yaml",               -- Kubernetes projects
          "k8s.yml",                -- Kubernetes projects
          "helm.yaml",              -- Helm projects
          "helm.yml",               -- Helm projects
          "skaffold.yaml",          -- Skaffold projects
          "skaffold.yml",           -- Skaffold projects
          "kustomization.yaml",     -- Kustomize projects
          "kustomization.yml",      -- Kustomize projects
          "argo.yaml",              -- Argo projects
          "argo.yml",               -- Argo projects
          "tekton.yaml",            -- Tekton projects
          "tekton.yml",             -- Tekton projects
          "pulumi.yaml",            -- Pulumi projects
          "pulumi.yml",             -- Pulumi projects
          "serverless.yml",         -- Serverless projects
          
          -- CI/CD
          "azure-pipelines.yml",    -- Azure DevOps projects
          "Jenkinsfile",            -- Jenkins projects
          "travis.yml",             -- Travis CI projects
          "circle.yml",             -- CircleCI projects
          "appveyor.yml",           -- AppVeyor projects
          "bitbucket-pipelines.yml", -- Bitbucket Pipelines projects
          "gitlab-ci.yml",          -- GitLab CI projects
          "cloudbuild.yaml",        -- Google Cloud Build projects
          "buildspec.yml",          -- AWS CodeBuild projects
          ".github",                -- GitHub projects
          "github/workflows",       -- GitHub Actions projects
          
          -- IDE & Workspace
          ".project",               -- Eclipse projects
          ".idea",                  -- IntelliJ projects
          "workspace.code-workspace", -- VS Code workspaces
          
          -- .NET
          "*.sln",                  -- .NET solutions
          "*.csproj",               -- .NET projects
          
          -- Frontend Frameworks
          "tsconfig.json",          -- TypeScript projects
          "angular.json",           -- Angular projects
          "vue.config.js",          -- Vue.js projects
          "next.config.js",         -- Next.js projects
          "nuxt.config.js",         -- Nuxt.js projects
          "svelte.config.js",       -- Svelte projects
          "vite.config.js",         -- Vite projects
          "webpack.config.js",      -- Webpack projects
          "rollup.config.js",       -- Rollup projects
          
          -- Testing
          "jest.config.js",         -- Jest projects
          "karma.conf.js",          -- Karma projects
          "protractor.conf.js",     -- Protractor projects
          "cypress.json",           -- Cypress projects
          "playwright.config.js",   -- Playwright projects
          
          -- CSS & Styling
          "tailwind.config.js",     -- Tailwind CSS projects
          "postcss.config.js",      -- PostCSS projects
          
          -- Code Quality
          "babel.config.js",        -- Babel projects
          "eslint.config.js",       -- ESLint projects
          "prettier.config.js",     -- Prettier projects
          "stylelint.config.js",    -- Stylelint projects
          "husky.config.js",        -- Husky projects
          "commitlint.config.js",   -- Commitlint projects
          "semantic-release.config.js", -- Semantic Release projects
          
          -- Automation
          "renovate.json",          -- Renovate projects
          "dependabot.yml",         -- Dependabot projects
        },

        -- Table of lsp clients to ignore by name
        -- eg: { "efm", ... }
        ignore_lsp = {},

        -- Don't calculate root dir on specific directories
        -- Ex: { "~/.cargo/*", ... }
        exclude_dirs = {},

        -- Show hidden files in telescope
        show_hidden = false,

        -- When set to false, you will get a message when project.nvim changes your
        -- directory.
        silent_chdir = true,

        -- What scope to change the directory, valid options are
        -- **"global"**, **"tab"**, **"win"**
        scope_chdir = 'global',

        -- Path where project.nvim will store the project history for use in
        -- telescope
        datapath = vim.fn.stdpath("data"),
      })

      -- Telescope integration
      require('telescope').load_extension('projects')
      
    end,
  },
}
