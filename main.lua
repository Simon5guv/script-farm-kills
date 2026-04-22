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

local mapas = {

	hospital = {
		pos1 = {
			Vector3.new(426.03,39.36,-3980.61),
			Vector3.new(432.33,39.36,-3984.76),
			Vector3.new(441.16,39.36,-3993.37),
			Vector3.new(430.49,39.36,-4012.54),
			Vector3.new(428.81,39.36,-4038.22),
		},
		pos2 = {
			Vector3.new(427.66,39.36,-4037.81),
			Vector3.new(430.95,39.36,-4027.87),
			Vector3.new(434.53,39.36,-4011.54),
			Vector3.new(440.82,39.36,-3986.39),
			Vector3.new(426.43,39.36,-3980.02),
		}
	},

	-- 🔥 FABRICA ATUALIZADA
	fabrica = {
		pos1 = {
			Vector3.new(402.30, 48.23, -3990.80),
			Vector3.new(466.80, 46.38, -3984.70),
			Vector3.new(455.07, 48.88, -4054.34),
			Vector3.new(466.63, 46.38, -4060.61),
		},
		pos2 = {
			Vector3.new(467.30, 46.38, -4061.00),
			Vector3.new(461.81, 48.98, -4040.72),
			Vector3.new(466.97, 46.38, -3987.72),
			Vector3.new(402.75, 48.23, -3990.71),
		}
	},

	casa = {
		pos1 = {
			Vector3.new(434.94,51.09,-3956.39),
			Vector3.new(450.38,51.09,-3960.72),
			Vector3.new(457.99,54.29,-3970.18),
			Vector3.new(460.87,54.29,-4033.87),
			Vector3.new(441.12,51.89,-4039.23),
		},
		pos2 = {
			Vector3.new(440.94,51.89,-4038.39),
			Vector3.new(456.38,54.29,-4035.34),
			Vector3.new(461.42,54.29,-4008.68),
			Vector3.new(453.92,54.29,-3969.20),
			Vector3.new(435.18,51.09,-3956.64),
		}
	},

	nsoficee = {
		pos1 = {
			Vector3.new(441.71,52.16,-4020.30),
			Vector3.new(435.26,52.16,-4018.94),
			Vector3.new(431.25,52.16,-4010.74),
			Vector3.new(430.44,52.16,-3960.05),
			Vector3.new(440.41,52.16,-3947.91),
		},
		pos2 = {
			Vector3.new(440.92,52.16,-3948.50),
			Vector3.new(431.70,52.16,-3956.77),
			Vector3.new(430.02,52.16,-3988.08),
			Vector3.new(433.77,52.16,-4019.63),
			Vector3.new(442.42,52.16,-4019.54),
		}
	},

	mansao = {
		pos1 = {
			Vector3.new(384.11,45.81,-4006.40),
			Vector3.new(394.75,45.81,-4022.75),
			Vector3.new(424.02,45.80,-4023.10),
			Vector3.new(450.89,45.81,-4020.03),
			Vector3.new(453.29,45.81,-4006.65),
		},
		pos2 = {
			Vector3.new(452.91,45.81,-4006.40),
			Vector3.new(453.13,45.81,-4018.90),
			Vector3.new(414.24,45.80,-4021.74),
			Vector3.new(396.00,45.81,-4022.96),
			Vector3.new(383.90,45.81,-4006.80),
		}
	},

}

task.wait(1)

local pos = getRoot().Position

for nome, mapa in pairs(mapas) do
	if bate(pos, mapa.pos1[1]) then
		print("Mapa:", nome, "pos1")
		andar(mapa.pos1)
		break

	elseif bate(pos, mapa.pos2[1]) then
		print("Mapa:", nome, "pos2")
		andar(mapa.pos2)
		break
	end
end
