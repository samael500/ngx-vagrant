-- Check request method
if ngx.req.get_method() ~= "GET" then
    ngx.status = ngx.HTTP_NOT_ALLOWED
    ngx.header["Content-Type"] = "text/plain; charset=utf-8"
    ngx.say("Method not allowed")
    return
end


-- Get location path
local box_root = ngx.var.box_prefix .. ngx.var.box_name .. '/'
local box_path = box_root .. '*.box'
local posix = require "posix"
local glob = posix.glob(box_path)

if not glob then
    ngx.status = ngx.HTTP_NOT_FOUND
    ngx.header["Content-Type"] = "text/plain; charset=utf-8"
    ngx.say("Box not found")
    return
end

-- Form box response
local vagrant = {
    name = ngx.var.box_name,
    description = string.format("Boxes for %s proj", ngx.var.box_name),
    versions = {}
}

local version = {
    version = "1.0",
    providers = {}
}


for i, box in pairs(glob) do
    local box_provider, box_version = string.match(box, box_root .. '(%a+)-(.+).box')
    local provider = {
        name = box_provider, -- virtualbox or docker
        url = "http://boxes.wbtech.pro/arendohod/1.0.box",
        checksum_type = "sha1",
        checksum = ""
    }
    local flag = false;
    for version in vagrant["versions"] do
        if versions["version"] == box_version then
            ngx.log(ngx.ERR, version)
            table.insert(
                version["providers"], provider
            )
            flag = true;
        end
    end
    if not flag then
        table.insert(
            vagrant["versions"], {
                versions = box_version,
                providers = {
                    provider
                }
            }
        )
    end

end

-- Discover the boxes

-- ngx.header["Content-Type"] = "application/json; charset=utf-8"
ngx.header["Content-Type"] = "text/plain;charset=utf-8"
local json = require("json")
ngx.say(json.encode(vagrant))
