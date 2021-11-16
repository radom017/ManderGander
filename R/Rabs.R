# Radiative absorbed (J/(s*m^2)) by animal calculated as a function of ambient temperature in degrees Celsius. Formula comes from Norman and Campbell (1998). Assumes absorptivity of thermal waveband = 0.96 (Spotila et al. 1992). Assumes half of radiation absorbed from environment comes from air and the other half comes from the ground (Buckley 2008).
## Temperature = ambient temperature (degrees Celsius).

Rabs = function(Temperature){
  Rabs_val = 0.96 * (0.5*La(Temperature)+0.5*Lg(Temperature))
  return(Rabs_val)
}
