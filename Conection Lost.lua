local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))() -- notification library
local ping = game:GetService('Stats').PerformanceStats.Ping -- ping service :p
local plr = game:GetService("Players").LocalPlayer
local old = ping:GetValue() -- the first value
local new = -100 -- new will be -100 as your ping wont be negative xd?
local attempt = 0 -- leave it
while true do
	new = ping:GetValue()
	--print(old, new)
	if old == new then -- check if the last is still the same
		if attempt >= getgenv().MaxPingAttempt then -- when you have more than the max attemp it does the code
		    warn("crash conection")
            NotificationLibrary:SendNotification("Warning", "You Lost Connection!", 2) -- send a notification
		else
		   attempt += 1 -- adding up a number
		end
	end
	old = new -- refresh the values
	task.wait(getgenv().RefreshPingRate)
end
