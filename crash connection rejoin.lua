getgenv().MaxPingAttempt = 4 -- maximum of attempt before rejoining
getgenv().RefreshPingRate = 3 -- every ... seconds (MINIMUM 1)

local ping = game:GetService('Stats').PerformanceStats.Ping -- ping service :p
local plr = game:GetService("Players").LocalPlayer
local old = ping:GetValue() -- the first value
local new = -100 -- new will be -100 as your ping wont be negative xd?
local attempt = 0 -- leave it
while true do
	new = ping:GetValue()
	--print(old, new)
	if old == new then
		if attempt >= getgenv().MaxPingAttempt then
		    warn("crash conection")
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr) -- rejoin server
		else
		   attempt += 1
		end
	end
	old = new -- refresh the values
	task.wait(getgenv().RefreshPingRate)
end
