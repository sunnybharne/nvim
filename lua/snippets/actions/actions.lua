local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node


ls.add_snippets('all', {
  s("trigger", {
    t({
      "# Triggers",
      "on: # The events that trigger the workflow",
      "  push: # Trigger the workflow on push events",
      "    branches:", 
      "      - main # Only trigger on pushes to the main branch",
      "      - feature/* # Trigger on pushes to any feature branch",
      "    branches-ignore:",
      "      - feature/experimental # Ignore pushes to the experimental feature branch",
      "    paths:",
      "      - 'src/**' # Only trigger on pushes to files in the src directory",
      "      - '!src/experimental/**' # Ignore pushes to files in the experimental directory",
      "    paths-ignore:",
      "      - 'src/experimental/**' # Ignore pushes to files in the experimental directory",
      "  pull_request: # Trigger the workflow on pull request events",
      "    branches:",
      "      - main # Only trigger on pull requests to the main branch",
      "  label: # Trigger the workflow on label events",
      "    types:",
      "      - created # Only trigger on label creation events",
      "      - deleted # Only trigger on label deletion events",
      "      - updated # Only trigger on label update events",
      "  issue_comment: # Trigger the workflow on issue comment events",
      "    types:",
      "      - created # Only trigger on issue comment creation events"
    })
  })
})
