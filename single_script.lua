local P=game:GetService("Players").LocalPlayer

local WL_URL="https://raw.githubusercontent.com/ahmetygtdmr0535-cpu/roblox-script/main/whitelist.json"

local ok,data=pcall(function()
    return game:HttpGet(WL_URL)
end)

if not ok then return end

local wl=game:GetService("HttpService"):JSONDecode(data)
if not wl or not wl.users then return end

for _,id in ipairs(wl.users) do
    if tonumber(id)==P.UserId then
        return
    end
end

return
