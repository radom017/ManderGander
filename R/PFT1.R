# Calculate potential foraging time (hours) following Feder (1983).
## This assumes that salamanders are surface active until a threshold amount of water is lost to evaporation, at which point they return underground. This threshold amount of water lost is the water time limit (WTL; grams), which is a fraction multiplied by the organism's mass. The water time limit should be empirically determined (e.g., Londos and Feder 1984). Note that this may calculate extremely high values that could be longer than the time frame that salamanders could be realistically active. This is the calculation used by Gifford and Kozak (2012) and Lyons and Kozak (2020) except that there are no absolute upper or lower temperature limits to when a salamander is active. Estimates salamander surface area using formula of Whitford and Hutchinson (1967).
## Temperature = ambient temperature (degrees Celsius), Elev = elevation (m), RelativeHumidity = relative humidity (expressed as decimal), R = resistance to water loss (s/cm), mass = body mass (g), WTL = water time limit (decimal), WS = wind speed (m/s), BodyLength = length of body (m), Type = either 'T_eh', 'T_e', or 'T_a' (see function 'rho' for explanation).

PFT1=function(Temperature,Elev,RelativeHumidity,R,mass,WTL,WS,BodyLength,Type){
  SA=9.62 * (mass^0.614)
  CWL=rho(Temperature,Elev,RelativeHumidity,WS,BodyLength,Type)/R/1000*3600 # g/(cm^2*hr); /1000 converts mg to g; *3600 converts /s to /hr
  PFT1_activity<-WTL*mass/(CWL*SA)
  PFT1_activity = ifelse(PFT1_activity == Inf, 9, PFT1_activity)
  PFT1_activity = if(PFT1_activity > 9){
    PFT1_activity = 9
  } else {
    PFT1_activity=PFT1_activity
  }
  return(PFT1_activity)
}
