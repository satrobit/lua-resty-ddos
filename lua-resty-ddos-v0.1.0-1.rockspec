package = "lua-resty-ddos"
version = "v0.1.0-1"

source = {
  url = "git://github.com/satrobit/lua-resty-ddos.git"
}

description = {
  summary = "A sample module to ddos mitigation in OpenResty",
  homepage = "https://github.com/satrobit/lua-resty-ddos",
  license = "MIT",
  maintainer = "amirkekh@gmail.com"
}

dependencies = {
  "lua >= 5.1",
  "lua-resty-jwt >= 0.2.0-0",
  "lua-resty-cookie >= 0.1.0-1"
}

build = {
    type = "builtin",
    modules = {
        ["resty.ddos"] = "lib/resty/ddos.lua"
    }
}
