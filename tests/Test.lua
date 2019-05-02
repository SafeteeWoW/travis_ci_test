print("Lua Version: ".._G._VERSION)
print("arguments:")
for k, v in ipairs(_G.arg) do
	print(k, " : ", v)
end
