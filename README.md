# msds-6306-cs1 - DUE Jan 7th 2019

MSDS 6306 Case Study 1 

## Team Members
* Lavonnia Newman
* Joseph Caguioa
* Jeff Washburn

# Introduction
Cheun Chugs & Cheers (CCAC) is an American hospitality company. Founded in 2008 in Reno, NV, by eponymous owner Jacquelyn Cheun, CCAC owns and operates several popular bars along the East Coast. The brand's main selling point is its wide selection of high-quality beers local to the states the establishments are present in.

CCAC announced its intention to open a new US bar, The Meta Scientist, targeting the same college students and young professionals constituting the same millennial demographic as its current bars. CCAC plans to source from its partner distributor, CNW Brewery, which has a portfolio currently spanning 2,410 beers from 558 breweries across 384 cities.

# Problem
In keeping with its brand, CCAC wants The Meta Scientist to provide a diverse assortment of local, great-tasting beers. Therefore, the host state needs to have a wide selection of beers and styles with varying alcoholic content. To assist with this decision, CCAC has hired SMBrew Consulting to analyze CNW Brewery's brewery and beer holdings. The portfolio is held in two data sets:

* Breweries: A table of the 558 breweries and their city and state locations.
* Beers: A table of the 2,410 US craft beers those breweries make, with details including alcohol content (as alcohol by volume, or ABV), bitterness (in International Bitterness Units, or IBU), and style.

CCAC outlined several questions of interest about the data. These are used as a starting point in our overall analysis toward choosing a state for The Meta Scientist.

# Conclusion
After analyzing the data, SMBrew Consulting found the following details for the breweries and beers data sets:

* Some beers have missing values for ABV, IBU, and/or Style. These are taken into account when studying correlation or aggregating data by state.
* ABV and IBU have a moderate positive correlation. As one increases, the other also tends to increase.
* By state, ABV has a median range of [0.040, 0625]. IBU has a median range of [19, 61].
* The state with the highest ABV is Colorado, while the highest IBU belongs to Oregon. The lowest of both comes from California.
* Colorado (47), California (39), and Michigan (32) are the states with the most breweries.

Alongside answering the questions of interest, SMBrew Consulting drilled down further to figure out which states offered the most beers and styles. These were used in conjunction with ABV and IBU data to choose six candidates.

# Recommendation
SMBrew Consulting recommends that Cheun Chugs & Cheers opens The Meta Scientist in one of the following states: California, Colorado, Indiana, Massachusetts, Michigan, or Texas. Colorado is notable for having the most breweries, beers, and styles, and the most alcoholic beer, while California comes second in breweries and beers and offers the least alcoholic and least bitter beers. Download and knit Analysis.Rmd for an in-depth explanation of the reasoning.