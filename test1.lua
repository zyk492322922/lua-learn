#!/usr/local/bin/lua
require("module")


-- 模块
print(module.max_num)
module.func1()
module.func3()
-- module.func2()

-- 元表和元方法

mytable = { foo = 3}
myMetatable = { __index}
mytable = setmetatable(mytable,myMetatable)

-- 协同
co = coroutine.create(
	function(i)
		print(i)
	end
)

coroutine.resume(co,1)
print(coroutine.status(co))

print("----------")

co = coroutine.wrap(
	function(i)
		print(i)
	end
)

co(2)

print("----------")


co2 = coroutine.create(
	function()
		for i=1,10 do
			print(i)
			if i==3 then
				print(coroutine.status(co2))
				print(coroutine.running())
			end
			coroutine.yield()
		end
	end
)

coroutine.resume(co2)
coroutine.resume(co2)
coroutine.resume(co2)

print(coroutine.status(co2))
print(coroutine.running())

print("----------")



-- IO {"简单模式"，"安全模式"}


-- r  只读

file = io.open("test.txt", "r")

io.input(file)

print(io.read())

io.close(file)


-- 追加写入
file = io.open("test.txt", "a")

-- 设置默认输出文件为 test.lua
io.output(file)

-- 在文件最后一行添加 Lua 注释
io.write("--  test.lua 文件末尾注释")


-- 关闭打开的文件
io.close(file)

-- 再次只读    io.read("*a")  表示读取整个文件

file = io.open("test.txt", "r")

io.input(file)

print(io.read("*a"))

io.close(file)


-- 安全模式
print("----安全模式----")

file = io.open("test.txt", "r")


print(file:read("*a"))

file:close()
