
--Start of Global Scope---------------------------------------------------------

-- Create and configure camera
local camera = Image.Provider.Camera.create()

local config = Image.Provider.Camera.V2DConfig.create()
config:setBurstLength(1) -- Single image
config:setShutterTime(700) -- us
config:setStartSource('DI1', 'ON_ACTIVE') -- Trigger

camera:setConfig(config)

-- Create viewer
local viewer = View.create()

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  camera:enable()
end
Script.register('Engine.OnStarted', main)

local function processImage(im, sensorData)
  viewer:clear()
  viewer:addImage(im)
  viewer:present()
  print(sensorData:toString())
end
camera:register('OnNewImage', processImage)

--End of Function and Event Scope--------------------------------------------------
