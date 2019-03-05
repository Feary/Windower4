--Place you can overwrite specific functions and settings with your preferences.
--Extra user functions to change how gearswap functions across jobs.

--Time Related Settings (Currently trying to automatically generate offset.)
--Set time_test to true to see and test time settings, change offset to change the settings, requires a capacity ring with uses,
--You want the cap ring offset to be 899 or 900 the MOMENT after using your Capacity ring. 36001
time_offset = -36007
time_test = false
framerate = 30

--If this is set to true it will prevent you from casting shadows when you have more up than that spell would generate.
conserveshadows = false

--Display related settings.
state.DisplayMode = M(true, 'Display Mode') --Set this to false if you don't want to display modes at the bottom of your screen.
--Uncomment the settings below and change the numbers if you want to move the display to a custom location.
displayx = 480
displayy = 750

include('g15.lua')