local Players=game:GetService("Players")
local HttpService=game:GetService("HttpService")
local LocalPlayer=Players.LocalPlayer

local requestFunc=request or http_request or (syn and syn.request)
if not requestFunc then return end

local whitelistResponse=requestFunc({
    Url="https://raw.githubusercontent.com/ahmetygtdmr0535-cpu/roblox-script/main/whitelist.json",
    Method="GET"
})

if not whitelistResponse or not whitelistResponse.Body then return end

local whitelistData
pcall(function()
    whitelistData=HttpService:JSONDecode(whitelistResponse.Body)
end)

if type(whitelistData)~="table" then return end
if type(whitelistData.users)~="table" then return end

local allowed=false
for _,uid in ipairs(whitelistData.users) do
    if tonumber(uid)==LocalPlayer.UserId then
        allowed=true
        break
    end
end

if not allowed then return end

local mainResponse=requestFunc({
    Url="https://raw.githubusercontent.com/ahmetygtdmr0535-cpu/roblox-script/main/menu.lua",
    Method="GET"
})

if not mainResponse or not mainResponse.Body then return end

local runFunc
pcall(function()
    runFunc=loadstring(mainResponse.Body)
end)

if type(runFunc)=="function" then
    runFunc()
end
