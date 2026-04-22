local player = game.Players.LocalPlayer

local function getChar()
	return player.Character or player.CharacterAdded:Wait()
end

local function getHumanoid()
	return getChar():WaitForChild("Humanoid")
end

local function getRoot()
	return getChar():WaitForChild("HumanoidRootPart")
end

local TOLERANCE = 10

local function bate(pos, spawn)
	return math.abs(pos.X - spawn.X) <= TOLERANCE
	   and math.abs(pos.Z - spawn.Z) <= TOLERANCE
end

local function andar(lista)
	local humanoid = getHumanoid()
	local root = getRoot()

	for i = 2, #lista do
		local p = lista[i]
		local destino = Vector3.new(p.X, root.Position.Y, p.Z)
		humanoid:MoveTo(destino)
		humanoid.MoveToFinished:Wait()
	end
end

-- HOSPITAL
local hospital_pos1 = {
	Vector3.new(426.03,0,-3980.61),
	Vector3.new(432.33,0,-3984.76),
	Vector3.new(441.16,0,-3993.37),
	Vector3.new(430.49,0,-4012.54),
	Vector3.new(428.81,0,-4038.22),
}

local hospital_pos2 = {
	Vector3.new(427.66,0,-4037.81),
	Vector3.new(430.95,0,-4027.87),
	Vector3.new(434.53,0,-4011.54),
	Vector3.new(439.31,0,-3997.67),
	Vector3.new(440.82,0,-3986.39),
	Vector3.new(428.97,0,-3979.97),
	Vector3.new(426.43,0,-3980.02),
}

-- FABRICA
local fabrica_pos1 = {
	Vector3.new(402.52,0,-3990.98),
	Vector3.new(409.24,0,-3998.21),
	Vector3.new(417.51,0,-4001.60),
	Vector3.new(421.32,0,-3998.31),
	Vector3.new(425.79,0,-3998.99),
	Vector3.new(431.36,0,-4000.01),
	Vector3.new(432.28,0,-4008.12),
	Vector3.new(433.46,0,-4013.88),
	Vector3.new(433.44,0,-4021.57),
	Vector3.new(433.31,0,-4029.60),
	Vector3.new(436.00,0,-4035.23),
	Vector3.new(442.61,0,-4038.80),
	Vector3.new(448.97,0,-4038.41),
	Vector3.new(456.90,0,-4039.13),
	Vector3.new(460.98,0,-4045.14),
	Vector3.new(459.80,0,-4054.73),
	Vector3.new(467.51,0,-4061.29),
}

local fabrica_pos2 = {
	Vector3.new(467.30,0,-4061.00),
	Vector3.new(465.84,0,-4056.69),
	Vector3.new(462.19,0,-4050.10),
	Vector3.new(461.75,0,-4041.90),
	Vector3.new(462.62,0,-4033.44),
	Vector3.new(463.48,0,-4019.91),
	Vector3.new(465.64,0,-4008.30),
	Vector3.new(466.66,0,-4000.10),
	Vector3.new(467.65,0,-3992.16),
	Vector3.new(464.53,0,-3986.31),
	Vector3.new(458.15,0,-3983.41),
	Vector3.new(448.00,0,-3984.57),
	Vector3.new(433.37,0,-3985.48),
	Vector3.new(414.89,0,-3989.31),
	Vector3.new(402.73,0,-3990.98),
}

-- CASA
local casa_pos1 = {
	Vector3.new(434.94,0,-3956.39),
	Vector3.new(437.71,0,-3955.98),
	Vector3.new(443.71,0,-3954.67),
	Vector3.new(450.38,0,-3960.72),
	Vector3.new(457.99,0,-3970.18),
	Vector3.new(461.36,0,-4003.11),
	Vector3.new(460.82,0,-4020.81),
	Vector3.new(460.87,0,-4033.87),
	Vector3.new(454.86,0,-4036.93),
	Vector3.new(445.48,0,-4037.21),
	Vector3.new(441.12,0,-4039.23),
}

local casa_pos2 = {
	Vector3.new(440.94,0,-4038.39),
	Vector3.new(446.31,0,-4037.45),
	Vector3.new(456.38,0,-4035.34),
	Vector3.new(460.68,0,-4025.73),
	Vector3.new(461.42,0,-4008.68),
	Vector3.new(459.48,0,-3989.35),
	Vector3.new(453.92,0,-3969.20),
	Vector3.new(450.25,0,-3960.84),
	Vector3.new(444.27,0,-3956.95),
	Vector3.new(439.86,0,-3953.85),
	Vector3.new(435.18,0,-3956.64),
}

task.wait(1)

local pos = getRoot().Position

if bate(pos, hospital_pos1[1]) then
	print("hospital_pos1")
	andar(hospital_pos1)

elseif bate(pos, hospital_pos2[1]) then
	print("hospital_pos2")
	andar(hospital_pos2)

elseif bate(pos, fabrica_pos1[1]) then
	print("fabrica_pos1")
	andar(fabrica_pos1)

elseif bate(pos, fabrica_pos2[1]) then
	print("fabrica_pos2")
	andar(fabrica_pos2)

elseif bate(pos, casa_pos1[1]) then
	print("casa_pos1")
	andar(casa_pos1)

elseif bate(pos, casa_pos2[1]) then
	print("casa_pos2")
	andar(casa_pos2)

else
	print("nenhuma rota bateu")
	print("X:", pos.X, "Z:", pos.Z)
end
