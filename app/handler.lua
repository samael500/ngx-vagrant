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


-- Discover the boxes
for i, box in pairs(glob) do
    local box_provider, box_version = string.match(box, box_root .. '(%a+)-(.+).box')
    -- get hash of file
    local sha1sum = assert(io.popen('sha1sum ' .. box .. ' | cut -d " " -f1'))
    local checksum = string.gsub(assert(sha1sum:read('*a')), "\n", "")
    sha1sum:close()
    -- make provider row
    local provider = {
        name = box_provider, -- virtualbox or docker
        url = string.format(ngx.var.box_url, ngx.var.box_name, box_provider, box_version),
        checksum_type = "sha1",
        checksum = checksum
    }
    -- create or update version
    local flag = false;
    for key, row in pairs(vagrant["versions"]) do
        if row["version"] == box_version then
            -- Upgrade current version
            table.insert(
                vagrant["versions"][key]["providers"], provider
            )
            flag = true;
        end
    end
    if not flag then
        -- Create new version
        table.insert(
            vagrant["versions"], {
                version = box_version,
                providers = {
                    provider
                }
            }
        )
    end

end


-- Return response
ngx.header["Content-Type"] = "application/json; charset=utf-8"
local json = require("json")
ngx.say(json.encode(vagrant))
