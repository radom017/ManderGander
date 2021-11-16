# Longwave fluxes from air (J/(s*m^2))
## Temperature = ambient temperature (degrees Celsius).

La=function(Temperature){
  Lfa = Eac(Temperature) * 0.0000000567 * (Temperature+273.15)^4
  return(Lfa)
}