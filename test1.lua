#!/usr/local/bin/lua
require("module")


-- ģ��
print(module.max_num)
module.func1()
module.func3()
-- module.func2()

-- Ԫ���Ԫ����

mytable = { foo = 3}
myMetatable = { __index}
mytable = setmetatable(mytable,myMetatable)

-- Эͬ
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



-- IO {"��ģʽ"��"��ȫģʽ"}


-- r  ֻ��

file = io.open("test.txt", "r")

io.input(file)

print(io.read())

io.close(file)


-- ׷��д��
file = io.open("test.txt", "a")

-- ����Ĭ������ļ�Ϊ test.lua
io.output(file)

-- ���ļ����һ����� Lua ע��
io.write("--  test.lua �ļ�ĩβע��")


-- �رմ򿪵��ļ�
io.close(file)

-- �ٴ�ֻ��    io.read("*a")  ��ʾ��ȡ�����ļ�

file = io.open("test.txt", "r")

io.input(file)

print(io.read("*a"))

io.close(file)


-- ��ȫģʽ
print("----��ȫģʽ----")

file = io.open("test.txt", "r")


print(file:read("*a"))

file:close()
