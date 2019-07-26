Name
====

lua-resty-ddos - This library uses Cookie Validation to detect bots from real users.

Table of Contents
=================

* [Name](#name)
* [Status](#status)
* [Synopsis](#synopsis)
* [Methods](#methods)
    * [run](#run)
* [Installation](#installation)
* [Authors](#authors)

Status
======

This library is WIP. Please don't use in production!

Synopsis
========
```lua
    lua_package_path "/path/to/lua-resty-ddos/lib/?.lua;;";

    server {
        location / {
            rewrite_by_lua '
                local ddos = require "resty.ddos"
                ddos.run("some-key")
            ';
        }
    }
```

Methods
=======

[Back to TOC](#table-of-contents)

run
---
`syntax: ddos:run(key)`

Runs the module with the provided key to use in JWT.

[Back to TOC](#table-of-contents)

Installation
============

Run the following in the module directory:
```
    luarocks make
```

You need to configure
the [lua_package_path](https://github.com/chaoslawful/lua-nginx-module#lua_package_path) directive to
add the path of your `lua-resty-ddos` source tree to ngx_lua's Lua module search path, as in

```
    http {
        lua_package_path "/path/to/lua-resty-ddos/lib/?.lua;;";
        ...
    }
```


and then load the library in Lua:

```lua
    local ck = require "resty.ddos"
```

[Back to TOC](#table-of-contents)

Authors
=======

Amir Keshavarz <amirkekh@gmail.com>.

[Back to TOC](#table-of-contents)
