# Calculate vapor density gradient (g/cm^2). This is the difference between the saturated water vapor density at tissue temp and the product of relative humidity and saturated water vapor density at ambient temperature.
## If using the humid operative temperature of an organism, this function requires the ambient temperature (degrees Celsius),  elevation (meters), the relative humidity (expressed as a decimal), wind speed (m/s), and body length (m).
## Temperature = ambient temperature (degrees Celsius), Elev = elevation (m), RelativeHumidity = relative humidity (expressed as decimal), WS = wind speed (m/s), BodyLength = length of body (m), Type = how body temperature is calculated:
### 'Type' can be "T_eh" (humid operative temperature), "T_e" (operative temperature), or "T_a" (ambient temperature if organism is a perfect themal conformer).

rho=function(Ta,Elev,RelativeHumidity,WS,BodyLength,Type){ # Temperature in Celsius
  Temp=ifelse(Type=="T_eh", T_eh(Ta,Elev,RelativeHumidity,WS,BodyLength),
         ifelse(Type=="T_e", T_e(Ta,WS,BodyLength),
                ifelse(Type=="Ta", Ta, stop('Type must conform to humid operative temperature (T_eh), operative temperature (T_e), or ambient temperature (Ta)'))))
  SVDa = Pre(Elev)*18.01528/(0.0083145*(Ta+273.15)*1000)
  SVDs = Pre(Elev)*18.01528/(0.0083145*(Temp+273.15)*1000) # saturated vapor density at skin temperature; dividing by 1000 converts g/m^3 to mg/cm^3
  VPG=SVDs-(RelativeHumidity*SVDa) # measured in mg/cm^3
  return(VPG)
}

### Questions for Amy:
# This spits out multiple values (changes with 'Type'). This relates to function 'T_e' or T_eh'...so I need to solve those functions first.