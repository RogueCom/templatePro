
-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 1

-- display FPS stats on screen
DEBUG_FPS = true

-- dump memory info every 10 seconds
DEBUG_MEM = false

-- load deprecated API
LOAD_DEPRECATED_API = false

-- load shortcodes API
LOAD_SHORTCODES_API = true

-- screen orientation
CONFIG_SCREEN_ORIENTATION = "portrait"--"landscape"


-- design resolution
CONFIG_SCREEN_WIDTH  = 1280
CONFIG_SCREEN_HEIGHT = 720

-- auto scale mode
CONFIG_SCREEN_AUTOSCALE = "FILL_ALL"



CONFIG_SCREEN_AUTOSCALE_CALLBACK = function(w, h, model)
	local scale_h = h / CONFIG_SCREEN_HEIGHT
	local scale_w = w / CONFIG_SCREEN_WIDTH
	local scale = scale_h
	CONFIG_SCREEN_AUTOSCALE = "NO_BORDER"
	if scale_w > scale_h then
		scale = scale_h
		CONFIG_SCREEN_WIDTH = w / scale
	else
		scale = scale_w
		CONFIG_SCREEN_HEIGHT = h / scale
	end

    return w / CONFIG_SCREEN_WIDTH, h / CONFIG_SCREEN_HEIGHT
end
