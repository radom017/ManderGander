# Calculate air pressure in kPa as a function of elevation (in meters). Note that air pressure changes with weather, so this is a handy, but crude, approximate.
## Elev = elevation (m)

Pre = function(Elev){
  pressure = 101.3*(1-2.25577*0.00001*(Elev))^5.25588
  return(pressure)
}