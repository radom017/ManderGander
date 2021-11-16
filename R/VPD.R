# Calculate the vapor pressure deficit given the ambient temperature (Ta) in degrees Celsius and the relative humidity (RH) expressed as decimal.
## Temperature = ambient temperature (degrees Celsius), RelativeHumidity = relative humidity (expressed as decimal).

VPD=function(Temperature, RelativeHumidity){
    VPsat = 0.6113 * 2.72^(17.2694*Temperature/(Temperature+237.3))
    VPair = VPsat*RelativeHumidity
    D=VPsat-VPair
    return(D)
}