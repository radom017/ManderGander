# Longwave flux from ground (J/(s*m^2)). Assumes that surface emissivity is equal 0.96 (Spotila et al. 1992).
## Temperature = ambient temperature (degrees Celsius).

Lg= function(Temperature){
  Lfg = 0.96 * 0.0000000567 * (Temperature+273.15)^4
  return(Lfg)
}