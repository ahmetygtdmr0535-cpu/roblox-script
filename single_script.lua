local H=game:GetService("HttpService")
local P=game:GetService("Players").LocalPlayer
local S=game:GetService("StarterGui")
local U="https://raw.githubusercontent.com/ahmetygtdmr0535-cpu/roblox-script/main/whitelist.json"
local O,D=pcall(function()return H:GetAsync(U)end)
if not O then return end
local W=H:JSONDecode(D)
local A=false
for _,I in pairs(W.users) do
    if I==P.UserId then A=true break end
end
if not A then
    S:SetCore("SendNotification",{Title="Access Denied",Text="Not whitelisted",Duration=4})
    return
end
S:SetCore("SendNotification",{Title="Loaded",Text="Script running",Duration=3})
