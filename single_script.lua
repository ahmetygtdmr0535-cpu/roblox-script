local P=game:GetService("Players").LocalPlayer
local H=game:GetService("HttpService")

local req = request or http_request or (syn and syn.request)
if not req then return end

local r = req({
    Url = "https://raw.githubusercontent.com/ahmetygtdmr0535-cpu/roblox-script/main/whitelist.json",
    Method = "GET"
})

if not r or not r.Body then return end

local wl = H:JSONDecode(r.Body)
if not wl or not wl.users then return end

for _,id in ipairs(wl.users) do
    if tonumber(id)==P.UserId then
        return
    end
end

return
