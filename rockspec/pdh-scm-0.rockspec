package = "pdh"
version = "scm-0"
source = {
  url = "https://github.com/moteus/lua-pdh/archive/master.zip",
  dir = "lua-pdh-master",
}

description = {
  summary    = "Lua binding to Microsoft Performance Data Helper (PDH) library",
  homepage   = "https://github.com/moteus/lua-pdh",
  license    = "MIT/X11",
  maintainer = "Alexey Melnichuk",
}

supported_platforms = {
  "windows"
}

dependencies = {
  "lua >= 5.1, < 5.3",
}

-- WINXP
local WINVER = "0x0501"

build = {
  type = "builtin",
  copy_directories = {"examples"},
  modules = {
    [ "pdh.core"    ] = {
      sources = {
        'src/l52util.c', 'src/lpdh.c',
      };
      libraries = {'pdh', 'psapi', 'advapi32'};
      defines   = {"WINVER=" .. WINVER, "_WIN32_WINNT=" .. WINVER}
    };
    [ "pdh"         ] = "lua/pdh.lua";
    [ "pdh.psapi"   ] = "lua/pdh/psapi.lua";
  }
}
