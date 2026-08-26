local M = {}

local cache = {}

local function trimmed(value)
  if not value or value == "" then
    return nil
  end

  value = vim.trim(value)
  if value == "" then
    return nil
  end

  return value
end

local function env(name)
  return trimmed(os.getenv(name))
end

function M.azure_key_vault_secret(vault_name, secret_name)
  local cache_key = vault_name .. "/" .. secret_name
  if cache[cache_key] then
    return cache[cache_key]
  end

  if vim.fn.executable("az") ~= 1 then
    return nil, "Azure CLI is not installed or not on PATH"
  end

  local output = vim.fn.system({
    "az",
    "--only-show-errors",
    "keyvault",
    "secret",
    "show",
    "--vault-name",
    vault_name,
    "--name",
    secret_name,
    "--query",
    "value",
    "--output",
    "tsv",
  })

  if vim.v.shell_error ~= 0 then
    return nil, "unable to read secret from Azure Key Vault"
  end

  local value = trimmed(output)
  if not value then
    return nil, "Azure Key Vault returned an empty secret"
  end

  cache[cache_key] = value
  return value
end

function M.github_token()
  return env("GITHUB_TOKEN")
    or env("GH_TOKEN")
    or M.azure_key_vault_secret("kv-platform-swc-001", "github-token")
end

return M
