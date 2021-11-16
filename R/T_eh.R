# Humid operative temperature (degrees Celsius) as a function of ambient temperature (degrees Celsius), elevation (meters), and relative humidity (expressed as a decimal). As currently written, the apparent psychrometer constant is assumed to be equal to psychrometer constant, which we treat as a single value (0.00666 degrees Celsius^-1).
## Temperature = ambient temperature (degrees Celsius), Elev = elevation (m), RelativeHumidity = relative humidity (expressed as decimal), WS = wind speed (m/s), BodyLength = length of salamander (m).

T_eh <- function(Temperature, Elev, RelativeHumidity, WS, BodyLength){
  HumOp = Temperature + (0.00666/(slope_mf(Temperature,Elev)+ 0.00666) * ((Rabs(Temperature) - 0.96 * 0.0000000567*((Temperature+273.15)^4))/(29.07 *(gr(Temperature)+gha(WS,BodyLength))) - VPD(Temperature,RelativeHumidity)/(0.00666*Pre(Elev))))
  return(HumOp)
}

### Questions for Amy:
# Why does this spit out three values??