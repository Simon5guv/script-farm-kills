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

	for i = 2, #lista do
		humanoid:MoveTo(lista[i])
		humanoid.MoveToFinished:Wait()
	end
end

-- ========================
-- HOSPITAL
-- ========================
local hospital_pos1 = {
	Vector3.new(426.03, 39.36, -3980.61),
	Vector3.new(432.33, 39.36, -3984.76),
	Vector3.new(441.16, 39.36, -3993.37),
	Vector3.new(430.49, 39.36, -4012.54),
	Vector3.new(428.81, 39.36, -4038.22),
}

local hospital_pos2 = {
	Vector3.new(427.66, 39.36, -4037.81),
	Vector3.new(430.95, 39.36, -4027.87),
	Vector3.new(434.53, 39.36, -4011.54),
	Vector3.new(439.31, 39.36, -3997.67),
	Vector3.new(440.82, 39.36, -3986.39),
	Vector3.new(428.97, 39.36, -3979.97),
	Vector3.new(426.43, 39.36, -3980.02),
}

-- ========================
-- FABRICA
-- ========================
local fabrica_pos1 = {
	Vector3.new(402.52, 48.23, -3990.98),
	Vector3.new(409.24, 48.23, -3998.21),
	Vector3.new(417.51, 48.27, -4001.60),
	Vector3.new(421.32, 48.86, -3998.31),
	Vector3.new(425.79, 48.88, -3998.99),
	Vector3.new(431.36, 48.98, -4000.01),
	Vector3.new(432.28, 48.98, -4008.12),
	Vector3.new(433.46, 48.98, -4013.88),
	Vector3.new(433.44, 48.98, -4021.57),
	Vector3.new(433.31, 48.98, -4029.60),
	Vector3.new(436.00, 48.98, -4035.23),
	Vector3.new(442.61, 48.98, -4038.80),
	Vector3.new(448.97, 48.98, -4038.41),
	Vector3.new(456.90, 48.98, -4039.13),
	Vector3.new(460.98, 48.88, -4045.14),
	Vector3.new(459.80, 48.88, -4054.73),
	Vector3.new(467.51, 46.38, -4061.29),
}

local fabrica_pos2 = {
	Vector3.new(467.30, 46.38, -4061.00),
	Vector3.new(465.84, 52.75, -4056.69),
	Vector3.new(462.19, 48.72, -4050.10),
	Vector3.new(461.75, 48.90, -4041.90),
	Vector3.new(462.62, 48.98, -4033.44),
	Vector3.new(463.48, 46.38, -4019.91),
	Vector3.new(465.64, 46.38, -4008.30),
	Vector3.new(466.66, 46.38, -4000.10),
	Vector3.new(467.65, 46.37, -3992.16),
	Vector3.new(464.53, 46.38, -3986.31),
	Vector3.new(458.15, 46.38, -3983.41),
	Vector3.new(448.00, 46.38, -3984.57),
	Vector3.new(433.37, 46.38, -3985.48),
	Vector3.new(414.89, 46.38, -3989.31),
	Vector3.new(402.73, 48.23, -3990.98),
}

-- ========================
-- CASA
-- ========================
local casa_pos1 = {
	Vector3.new(434.94, 51.09, -3956.39),
	Vector3.new(437.71, 51.09, -3955.98),
	Vector3.new(443.71, 51.09, -3954.67),
	Vector3.new(450.38, 51.09, -3960.72),
	Vector3.new(457.99, 54.29, -3970.18),
	Vector3.new(461.36, 54.29, -4003.11),
	Vector3.new(460.82, 54.29, -4020.81),
	Vector3.new(460.87, 54.29, -4033.87),
	Vector3.new(454.86, 54.29, -4036.93),
	Vector3.new(445.48, 51.89, -4037.21),
	Vector3.new(441.12, 51.89, -4039.23),
}

local casa_pos2 = {
	Vector3.new(440.94, 51.89, -4038.39),
	Vector3.new(446.31, 51.89, -4037.45),
	Vector3.new(456.38, 54.29, -4035.34),
	Vector3.new(460.68, 54.29, -4025.73),
	Vector3.new(461.42, 54.29, -4008.68),
	Vector3.new(459.48, 54.29, -3989.35),
	Vector3.new(453.92, 54.29, -3969.20),
	Vector3.new(450.25, 51.09, -3960.84),
	Vector3.new(444.27, 51.09, -3956.95),
	Vector3.new(439.86, 51.09, -3953.85),
	Vector3.new(435.18, 51.09, -3956.64),
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
	print("Pos:", pos)
end
