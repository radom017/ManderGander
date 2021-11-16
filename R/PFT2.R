# Calculate potential foraging time (hours) following Feder (1983), but with the potential for passive rehydration during surface actvity.
## This assumes that salamanders are surface active until a threshold amount of water is lost to evaporation, at which point they return underground. This threshold amount of water lost is the water time limit (WTL; grams), which is a fraction multiplied by the organism's mass. The water time limit should be empirically determined (e.g., Londos and Feder 1984). Note that this may calculate extremely high values that could be longer than the time frame that salamanders could be realistically active. This is the calculation used by Gifford and Kozak (2012) and Lyons and Kozak (2020) except that there are no absolute upper or lower temperature limits to when a salamander is active and salamanders can absorb water during surface activity.
## ## Temperature = ambient temperature (degrees Celsius), Elev = elevation (m), RelativeHumidity = relative humidity (expressed as decimal), R = resistance to water loss (s/cm), mass = body mass (g), WTL = water time limit (decimal), WS = wind speed (m/s), BodyLength = length of body (m), Type = either 'T_eh', 'T_e', or 'T_a' (see function 'rho' for explanation), rehy = rate of rehydration (g/h).

PFT2=function(Temperature,Elev,RelativeHumidity,R,WTL,mass,WS,BodyLength,Type,rehy){
  SA=9.62 * (mass^0.614)
  CWL=rho(Temperature,Elev,RelativeHumidity,WS,BodyLength,Type)/R/1000*3600 # g/(cm^2*hr); /1000 converts mg to g; *3600 converts /s to /hr
  Loss=CWL*SA
  if(rehy > Loss){
    PFT2_activity<-WTL/0.00001
  } else {
    PFT2_activity<-WTL*mass/(Loss-rehy)  }
  return(PFT2_activity)
}

### Questions for Amy:
# This spits out multiple values (changes with 'Type'). This relates to function 'T_e' or T_eh'...so I need to solve those functions first.