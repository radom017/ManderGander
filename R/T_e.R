# Calculate operative temperature (degrees Celsius). Unlike the humid operative temperature (T_eh), this function does not consider evaporative cooling.
## Temperature = ambient temprature (degrees Celsius), WS = wind speed (m/s), BodyLength = length of salamander (m).

T_e <- function(Temperature,WS,BodyLength){
  T_op = Temperature + (Rabs(Temperature) - 0.96 * 0.0000000567*((Temperature+273.15)^4))/(29.07 *(gr(Temperature)+gha(WS,BodyLength)))
}
