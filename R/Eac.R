# Emissivity of clear atmosphere as a function of temperature (Ta) in degrees Celsius. Emissivity is unitless. Note that estimating emissivity for a clear sky is to simplify calculations; there is no reason to think that most environments are without cloud cover. Formula comes from Swinbank (1963).
## Temperature = ambient temperature (degrees Celsius).

Eac = function(Temperature){
  EmCA = 0.0000092*(Temperature + 273.15)^2
  return(EmCA)
}