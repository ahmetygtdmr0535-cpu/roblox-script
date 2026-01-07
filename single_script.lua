local H=game:GetService("HttpService")
local P=game:GetService("Players").LocalPlayer
local S=game:GetService("StarterGui")

local WL_URL="https://raw.githubusercontent.com/ahmetygtdmr0535-cpu/roblox-script/main/whitelist.json"

local ok,data=pcall(function()
    return H:GetAsync(WL_URL)
end)

if not ok then
    S:SetCore("SendNotification",{Title="Error",Text="Whitelist fetch failed",Duration=5})
    return
end

local wl=H:JSONDecode(data)
if not wl or not wl.users then return end

for _,id in ipairs(wl.users) do
    if tonumber(id)==P.UserId then
        S:SetCore("SendNotification",{Title="Success",Text="Whitelisted",Duration=5})
        return
    end
end

S:SetCore("SendNotification",{Title="Denied",Text="Not whitelisted",Duration=5})
