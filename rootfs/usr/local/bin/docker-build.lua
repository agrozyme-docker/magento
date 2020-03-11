#!/usr/bin/lua
local core = require("docker-core")

local function main()
  local bin = "/usr/local/bin"
  core.run("%s/composer clear-cache", bin)
end

main()
