#!/usr/local/bin/lua


module = {}

module.max_num = "15"

function module.func1()
	print("this is public function")
end

local function func2()
	print("this is local function")
end

function module.func3()
	func2()
end

return module
