# Boundary layer heat conductance (mol/m^2/s). Formula from Campbell and Norman (1998).
## WS = wind speed (m/s), BodyLength = length of body (m).

gha<-function(WS, BodyLength){
  blhc = 1.4 * 0.135 * (WS/BodyLength)^0.5
  return(blhc)
}
