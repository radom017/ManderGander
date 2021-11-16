# Slope of mole fraction (unitless) as a function of temperature and elevation.
## Ta = temperature (degrees Celsius).
## Tempearture = ambient temperature (degrees Celsius), Elev = elevation (m).

slope_mf = function(Temperature,Elev){
  slope = 17.502*240.97*es(Temperature)/((240.97*Temperature)^2)/Pre(Elev) # C^-1
  return(slope)
}