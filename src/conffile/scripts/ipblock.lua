#!/usr/bin/lua
--[[ To get all env vars
henv = io.popen("env")
env = {}
for line in henv:lines() do
	if line:sub(1,3) == "LT_" then
		__, __, key, value = string.find(line,"(%a+)%s*=%s*(.*)");
		env[key]=value;
	end
end
henv:close()
]]
if os.getenv("LT_ip") then
	block = os.execute("iptables -I INPUT -s "..os.getenv("LT_ip").." -j DROP")
	if block == 0 then
		print ("IP: "..os.getenv("LT_ip").." was DROPED whitout time")
	end
end
	