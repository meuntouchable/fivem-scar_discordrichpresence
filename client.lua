--//-----------------------------------------\\
--|| [SCAR] Discord Richpresence
--|| meuntouchable#5555 (655378313514057759)
--\\-----------------------------------------//

local PlayerVehicleModelText="";

CreateThread(function()
	
    while true do
		
		Wait(1200);
		
		local PlayerVehicle=GetVehiclePedIsIn(GetPlayerPed(-1),false);
		local PlayerVehicleModel=GetEntityModel(PlayerVehicle);
		local playerCount=#GetActivePlayers();
		local LocationName=GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(GetPlayerPed(-1)))));
		
		if(PlayerVehicle and PlayerVehicle~=nil and PlayerVehicle~=0)then
			if(not PlayerVehicleModel or PlayerVehicleModel==nil or PlayerVehicleModel=="CARNOTFOUND")then
				PlayerVehicleModelText="On foot";
			else
				PlayerVehicleModelText="Vehicle: '"..GetDisplayNameFromVehicleModel(PlayerVehicleModel).."' at "..LocationName;
			end
		else
			PlayerVehicleModelText="On foot at '"..LocationName.."'";
		end
		
		
		Wait(1200);
		
		
		SetDiscordAppId(ScarDiscordRichpresence.Settings.DiscordAppID);
		SetRichPresence(PlayerVehicleModelText);
		
		SetDiscordRichPresenceAsset("logo");
		SetDiscordRichPresenceAssetText((ScarDiscordRichpresence.Settings.LogoHoverText):format((GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))),GetPlayerName(PlayerId())));
	
		SetDiscordRichPresenceAssetSmall("logo");
		SetDiscordRichPresenceAssetSmallText(PlayerVehicleModelText);
		
		if(ScarDiscordRichpresence.Settings.Buttons[0].Enabled and ScarDiscordRichpresence.Settings.Buttons[0].Enabled==true)then
			SetDiscordRichPresenceAction(0,((ScarDiscordRichpresence.Settings.Buttons[0].Text):format(playerCount)),ScarDiscordRichpresence.Settings.Buttons[0].URL);
		end
		
		if(ScarDiscordRichpresence.Settings.Buttons[1].Enabled and ScarDiscordRichpresence.Settings.Buttons[1].Enabled==true)then
			SetDiscordRichPresenceAction(1,ScarDiscordRichpresence.Settings.Buttons[1].Text,ScarDiscordRichpresence.Settings.Buttons[1].URL);
		end
    end
end)