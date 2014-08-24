# -----------------------------------------------------------------------------
# Oil & Gas Journal, World Oil (not original reference)
# -----------------------------------------------------------------------------
# http://en.wikipedia.org/w/index.php?title=Fossil_fuel&oldid=495147285 (May 30 2012)
# Years of production left in the ground with the most optimistic proved reserve estimates
# coal = 417
# oil = 43
# natgas = 167

# These are the proven energy reserves; real reserves may be up to a factor 4 larger (BP2010)
coal.zj = 19.8
oil.zj = 8.1
natgas.zj=8.1


# -----------------------------------------------------------------------------
# http://www.oiljobsource.com/oil-gas-industry-statistics.html
# It is estimated that there may be 57 ZJ of oil reserves on Earth 
# (although estimates vary from a low of 8 ZJ, consisting of currently proven and 
# recoverable reserves, to a maximum of 110 ZJ) consisting of available, 
# but not necessarily recoverable reserves, and including optimistic estimates 
# for unconventional sources such as tar sands and oil shale. Current consensus 
# among the 18 recognized estimates of supply profiles is that the 
# peak of extraction will occur in 2020 at the rate of 93-million barrels per day (mbd). 
# Current oil consumption is at the rate of 0.18 ZJ per year (31.1 billion barrels) or 85-mbd. 

# -----------------------------------------------------------------------------
# BP Statistical Review of World Energy 2014 Workbook
# -----------------------------------------------------------------------------
# http://www.bp.com/content/dam/bp/excel/Energy-Economics/statistical-review-2014/BP-Statistical_Review_of_world_energy_2014_workbook.xlsx

# Oil Proved Reserves in thousand million barrels 
# Total World: 1687.9
# Oil R/P ratio: 53.3 years (years to produce, constant production)
# Oil Sands 167.8 Canada
# Oil Sands 220.5 Venezuela
oil.proved = 1687.9 + 167.8 + 220.5
oil.optimistic = oil.proved * 1
oil.mostlikely =

# Natural Gas in Trillion cubic meters
# Total World: 185.7
# Natural Gas R/P ratio: 55.1 years (years to produce, constant production)
natgas.proved=185.7 # BP2014
natgas.optimistic = natgas.proved * 167/55.1
natgas.mostlikely =

# Coal Proved Reserves in Million tonnes
# Total World: 891531
# Coal R/P ratio: 113 years (years to produce, constant production)
coal.proved=891531 # BP2014
coal.optimistic = coal.proved * 417/113
coal.mostlikely =

# -----------------------------------------------------------------------------
#  Conversion
# -----------------------------------------------------------------------------
# from wiki http://en.wikipedia.org/wiki/Fossil_fuel#Reserves
# 997748 = 4,416 billion barrels (702.1 km3) of oil equivalent (coal)
# 178 = 1,161 billion barrels of oil equivalent (nat gas)


# http://www.worldenergy.org/wp-content/uploads/2013/09/Complete_WER_2013_Survey.pdf


# USGS 2000
# http://pubs.usgs.gov/dds/dds-060/ESpt4.html#Table
# http://energy.cr.usgs.gov/WEcont/world/woutsum.pdf
# Six thousand cubic feet of gas equals one barrel of oil equivalent. 
oil.total=3021
natgas.total=15401 # trillion cubic feet
natgas.total.bboe = 2567
oil.f95=334+192+66
oil.f50=607+612
oil.f05=1107+1031+104
oil.remaining.reserves=859
oil.cumulative.production=539
natgas.f95=2299+1049+393
natgas.f50=4333+3305
natgas.f05=8174+5543+698
natgas.remaining.reserves=4621+172
natgas.cumulative.production=898+854

