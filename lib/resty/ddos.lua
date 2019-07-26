local cjson = require "cjson"
local jwt = require "resty.jwt"
local ck = require "resty.cookie"

local function return_rf_cookie(cookie, key)

  -- Make JWT
  local jwt_token = jwt:sign(key,
  {
      header={typ="JWT", alg="HS256"},
      payload={remote_addr=ngx.var.remote_addr}
  })
  
  -- set cookie
  local ok, err = cookie:set({key = "Ref", value = jwt_token})
  if not ok then
      ngx.log(ngx.ERR, err)
      return
  end

  -- Return to the same page with the Ref cookie included
  return ngx.redirect(ngx.var.request_uri)

end


local ok, new_tab = pcall(require, "table.new")
if not ok then
    new_tab = function (narr, nrec) return {} end
end


local _M = new_tab(0, 155)
_M._VERSION = '0.1'


function _M.run(key)
  
  local cookie, err = ck:new()
  if not cookie then
    ngx.log(ngx.ERR, err)
    return
  end


  -- get Ref cookie
  local Ref_field, err = cookie:get("Ref")
  if not Ref_field then
    return return_rf_cookie(cookie, key)
  end

  -- Verify the Ref
  local jwt_obj = jwt:verify(key, Ref_field)

  if jwt_obj.verified ~= true or jwt_obj.payload.remote_addr ~= ngx.var.remote_addr then
    return return_rf_cookie(cookie, key)
  end


end

return _M
