# Calculate saturation vapor pressure (kPa) as a function of the ambient temperature using Teten's formula.
## Temperature = ambient temperature (degrees Celsius).

es=function(Temperature){
  svp = 0.6113 * 2.72^(17.2694*Temperature/(Temperature+237.3))
  return(svp)
}