# Calculate potential foraging time (hours) while incorporating the 'avoidance' behavior used by Riddell et al. (2018). The avoidance behavior means that salamanders will not become surface active (where they are assumed to be consuming prey) if the surface conditions would put them in an energetic deficit compared to fasting underground. In exploratory analyses, the conditions under which salamanders use an 'avoidance' behavior resemble the absolute limits to surface activity imposed by Gifford and Kozak (2012) and Lyons and Kozak (2020). By 'absolute limits', we refer to temperature ranges under which salamanders are assumed to never forage, which was based on field observations by Feder et al. (1982). This function becomes much more complicated than PFT1 or PFT2 because it requires estimates of salamander metabolic rates and energetic assimilation from food. Before running this function, the researcher must create their own functions: one called 'EnergyAssimilation' (kJ/g/h; measure of energetic assimilation as a function of temperature) and a second called 'ActiveMR' (Joules/hour; active metabolic rate as a function of temperature). This also requires a value for the resting metabolic rate while underground ('RestingMRu'; Joules/hour). Ideally this would be estimated from an estimate of soil temperature and the resting metabolic rate, but I just assumed a constant soil temperature when I built this for my own data.
##

PFT3=function(Temperature,Elev,RelativeHumidity,R,mass,WTL,WS,BodyLength,Type,CTmax,Topt,max_energy,RMR_I,RMR_T_s,RMR_M_s,soil_temp){
  time = PFT1(Temperature,Elev,RelativeHumidity,R,mass,WTL,WS,BodyLength,Type) # This and the next couple lines are essential for removing infinite values of time.
  time = ifelse(time > 9, 9, time)
  RestingMR=function(Temperature,mass){RMR=0.001*5*4.184*10^(RMR_T_s*Temperature + (RMR_M_s*log10(mass))-RMR_I)
  return(RMR)}
  EnergyAssimilation=function(Temperature,mass){EA=0.107*0.9460786*(((CTmax-Temperature)/(CTmax-Topt))*(Temperature/Topt)^(Topt/(CTmax-Topt)))*mass/24
  return(EA)}
  eat=EnergyAssimilation(Temperature,mass)*time
  exercise=1.375*RestingMR(Temperature,mass)*time
  above = ifelse((eat - exercise) > RestingMR(soil_temp), 1, 0)
  PFT3_activity<-above*time
  #PFT3_activity = ifelse(is.na(PFT3_activity) == TRUE, 9, PFT3_activity)
  return(PFT3_activity)
}

### Questions for Amy:
# The error tells me that 'mass' is missing, but I don't see where. Feeling very stumped on this one.