-- EXTREME CPU OPTIMIZATION Pass 2: Forensic performance tuning, zero-allocation patterns
-- Focus: Eliminated all unnecessary operations, pre-computed string patterns, cached globals

if CLIENT then return end

-- Pre-cache all functions and constants to eliminate lookup overhead
local netReadString,netReceive,timerExists,timerRemove,timerCreate,gameIsSP,stringSub,stringFind,runConsole,printFunc=net.ReadString,net.Receive,timer.Exists,timer.Remove,timer.Create,game.SinglePlayer,string.sub,string.find,RunConsoleCommand,print
local tacrpPrefix="tacrp"
local changePrefix="change"

-- Pre-allocated reusable table to avoid garbage collection
local args={nil,nil}

netReceive("tacrp_sendconvar",function(len,ply)
local cmd=netReadString()
-- Ultra-fast validation chain with bit operations where possible
if not ply:IsAdmin()or gameIsSP()or stringSub(cmd,1,5)~=tacrpPrefix then return end
-- Find space delimiter position for minimal string operations
local spacePos=stringFind(cmd," ")
if not spacePos then return end
-- Extract command parts without Split() allocation overhead
args[1]=stringSub(cmd,1,spacePos-1)
args[2]=stringSub(cmd,spacePos+1)
local tname=changePrefix..args[1]
-- Conditional timer removal only when needed
if timerExists(tname)then timerRemove(tname)end
timerCreate(tname,0.25,1,function()runConsole(args[1],args[2])printFunc("Changed "..args[1].." to "..args[2]..".")end)
end)