# Radiative Conductance (mol/m^2/s) estimated as a function of ambient temperature. Formula from Campbell and Norman (1998). Assumes specific heat of air = 29.07 J/mol/K.
## Temperature = ambient temperature (degrees Celsius).

gr = function(Temperature){
  RadCon = 4 * 0.0000000567 * ((Temperature+273.15)^3)/29.07
  return(RadCon)
}
