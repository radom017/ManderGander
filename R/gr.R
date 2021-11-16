# Radiative Conductance (mol/m^2/s) estimated as a function of ambient temperature. Formula from Campbell and Norman (1998).
## Temperature = ambient temperature (degrees Celsius).

gr = function(Temperature){
  RadCon = 4 * 0.0000000567 * ((Temperature+273.15)^4)/29.07 # specific heat of air in J/mol/K = 29.07
  print(RadCon)
}