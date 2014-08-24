# -----------------------------------------------------------------------------
# BP Statistical Review of World Energy 2014 Workbook
# -----------------------------------------------------------------------------
# http://www.bp.com/content/dam/bp/excel/Energy-Economics/statistical-review-2014/BP-Statistical_Review_of_world_energy_2014_workbook.xlsx

# Oil Proved Reserves in thousand million barrels 
# Total World: 1687.9
# Oil Sands 167.8 Canada
# Oil Sands 220.5 Venezuela
# Oil R/P ratio: 53.3 years (years to produce, constant production)
oil.proved = 1687.9 + 167.8 + 220.5

# Natural Gas in Trillion cubic meters
# Natural Gas R/P ratio: 55.1 years (years to produce, constant production)
natgas.proved=185.7 

# Coal Proved Reserves in Million tonnes
# Coal R/P ratio: 113 years (years to produce, constant production)
coal.proved=891531 


# U.S. Geological Survey 2012 World Assessment of Undiscovered Oil and Gas Resources

oil.oil.f95=    198750.73 # Oil in Oil Fields (MMBO) F95
oil.oil.f50=    478384.88 # Oil in Oil Fields (MMBO) F50
oil.oil.f05=   1208337.95 # Oil in Oil Fields (MMBO) F5
oil.oil.mean=   565297.33 # Oil in Oil Fields (MMBO) Mean
gas.oil.f95=    354256.87 # Gas in Oil Fields (BCFG) F95
gas.oil.f50=    915598.14 # Gas in Oil Fields (BCFG) F50
gas.oil.f05=   2543654.74 # Gas in Oil Fields (BCFG) F5
gas.oil.mean=  1119854.09 # Gas in Oil Fields (BCFG) Mean
ngl.oil.f95=     10293.85 # Natural Gas Liquids in Oil Fields (MMBNGL) F95
ngl.oil.f50=     27810.01 # Natural Gas Liquids in Oil Fields (MMBNGL) F50
ngl.oil.f05=     79899.62 # Natural Gas Liquids in Oil Fields (MMBNGL) F5
ngl.oil.mean=    34459.48 # Natural Gas Liquids in Oil Fields (MMBNGL) Mean
gas.gas.f95=   1595835.72 # Gas in Gas Fields (BCFG) F95
gas.gas.f50=   3777456.07 # Gas in Gas Fields (BCFG) F50
gas.gas.f05=   9680535.25 # Gas in Gas Fields (BCFG) F5
gas.gas.mean=  4485770.82 # Gas in Gas Fields (BCFG) Mean
ngl.gas.f95=     44699.44 # Liquids in Gas Fields (MMBL) F95
ngl.gas.f50=    110754.02 # Liquids in Gas Fields (MMBL) F50
ngl.gas.f05=    292104.44 # Liquids in Gas Fields (MMBL) F5
ngl.gas.mean=   132209.21 # Liquids in Gas Fields (MMBL) Mean
total.gas.mean=5605624.91 # Total Gas (BCFG) Mean
total.ngl.mean= 166668.69 # Total NGL (MMBNGL) Mean
total.boe.mean=1666236.84 # Total BOE (MMBOE) Mean

# aggregate
oil.f95= oil.oil.f95 + ngl.oil.f95 + ngl.gas.f95
oil.f50= oil.oil.f50 + ngl.oil.f50 + ngl.gas.f50
oil.f05= oil.oil.f05 + ngl.oil.f05 + ngl.gas.f05

gas.f95= gas.oil.f95 + gas.gas.f95
gas.f50= gas.oil.f50 + gas.gas.f50
gas.f05= gas.oil.f05 + gas.gas.f05

# derive
# the three sigma range allow for additional fuel sources ...
oil.undiscovered.sigma=(oil.f05-oil.f95)/3               #  442199.3
oil.undiscovered.mu=oil.f95+2*oil.undiscovered.sigma     # 1138143
oil.undiscovered.hi = oil.f95+4*oil.undiscovered.sigma   # 2022541

gas.undiscovered.sigma=(gas.f05-gas.f95)/3               #  3424699
gas.undiscovered.mu=gas.f95+2*gas.undiscovered.sigma     #  7087141
gas.undiscovered.hi = gas.f95+4*gas.undiscovered.sigma   # 12224190

# 1 TOE OIL  -> 3.07 TONNES CO2 
# 1 TOE GAS  -> 2.35 TONNES CO2 
# 1 TOE COAL -> 3.96 TONNES CO2 

# 1 BCMG GAS = 0.90 MTOE
# 1 BCMG GAS = 6.60 MBOE
# 1 TONNE COAL = 0.4 TOE

# 1 TOE = 7.33 BOE


# 1 CFG = 0.0283168 CMG
gas.f05 * 0.0283168 / 1000 # 346 TCMG
gas.undiscovered.mu * 0.0283168 / 1000 #  200 TCMG
gas.undiscovered.hi * 0.0283168 / 1000 #  346 TCMG


oil2013=31 # billion barrels
gas2013=3.3 # trillion cubic meters
coal2013=7896 # tonnes

# gigatonnes
co2oil=(oil2013/7.33)*3.07
co2gas=(gas2013*0.9)*2.35
co2coal=(coal2013/2.25)*3.96/1000


