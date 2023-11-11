-- Alle Verkoop plekken voor witwas
deliverData = { 
    {coords = vector3(548.3853, -206.4108, 53.93999)},
    {coords = vector3(738.6583, 133.7987, 80.64788)},
    {coords = vector3(179.2563, 306.6374, 104.961)},
    {coords = vector3(-563.5433, 302.7623, 82.7619)},
    {coords = vector3(-113.22, -2674.28, 5.01)},
	{coords = vector3(-172.94, -1030.92, 26.37)},
	{coords = vector3(-1107.04, -2044.38, 12.39)},
	{coords = vector3(64.98, 6305.85, 30.34)},
	{coords = vector3(-174.12, -1348.14, 30.30)},
	{coords = vector3(694.02, -956.97, 22.93)},
	{coords = vector3(976.51, -2369.64, 29.63)},
	{coords = vector3(99.04, 54.40, 72.52)},
	{coords = vector3(835.09, -1402.26, 25.14)},
	{coords = vector3(453.42, -555.31, 27.60)},
	{coords = vector3(974.89, 11.14, 80.14)},
	{coords = vector3(-606.11, -1031.19, 20.89)},
	{coords = vector3(-1242.21, 380.41, 74.45)},
	{coords = vector3(-28.06, 4.71, 70.27)},
	{coords = vector3(-1281.69, 301.91, 64.07)},
	{coords = vector3(-1213.05, 339.33, 70.01)},
	{coords = vector3(-913.31, 586.04, 100.03)},
	{coords = vector3(-942.55, 591.61, 100.10)},
	{coords = vector3(255.19, 378.00, 104.53)},
	{coords = vector3(743.49, 135.49, 79.51)},
	{coords = vector3(680.68, 73.65, 82.39)},
	{coords = vector3(-769.06, 5592.39, 32.55)},
	{coords = vector3(-681.99, 5798.74, 16.43)},
	{coords = vector3(2638.44, 4248.59, 43.91)},
	{coords = vector3(2467.63, 4080.78, 37.16)},
	{coords = vector3(1923.92, 3732.60, 31.87)},
	{coords = vector3(1435.18, 3641.10, 33.95)},
	{coords = vector3(913.77, 3659.27, 31.66)},
	{coords = vector3(24.31, 3656.01, 38.88)},
	{coords = vector3(1697.08, 3297.43, 40.15)},
	{coords = vector3(2359.51, 3132.33, 47.21)},
	{coords = vector3(1048.17, -1816.51, 36.31)},
	{coords = vector3(-38.42, -1253.92, 28.37)},
	{coords = vector3(-78.38, -1200.24, 26.73)},
	{coords = vector3(-994.81, 143.92, 59.67)},
	{coords = vector3(-953.37, 186.99, 65.69)},
	{coords = vector3(-567.45, 169.58, 65.85)},
	{coords = vector3(-869.10, 319.31, 82.98)},
	{coords = vector3(-676.59, 903.89, 229.68)},
	{coords = vector3(-8.30, 6598.31, 30.57)},
	{coords = vector3(2028.13, 4976.20, 40.19)},
	{coords = vector3(-43.32, 1882.26, 194.96)},
	{coords = vector3(807.59, 2181.12, 51.36)},
}

vehicleSpawnLocation = vector3(992.726, -210.7783, 70.5775)

markers = {
    [1] = {
        coords = vector3(984.1021, -206.1991, 71.0677),
        trigger = "cn-witwas:client:openMenu",
        ingeklokt = false ,
        text = "menu te openen"
    },
    [2] = {
        coords = vector3(982.937, -211.4414, 70.8067),
        trigger = "cn-witwas:client:spawnVehicle",
        ingeklokt = true ,
        text = "voertuig te spawnen"
    },
    [3] = {
        coords = vector3(989.0289, -204.2807, 71.0361),
        trigger = "cn-witwas:client:despawnVehicle",
        ingeklokt = true ,
        text = "voertuig op te bergen"
    }
}
