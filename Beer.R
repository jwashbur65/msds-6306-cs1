#install.packages("psych")
library(knitr)
library(ggplot2)
library(dplyr)
library(plyr)
library(psych)


# Create new working copies.
beers_raw <- read.csv("C://users/vonnia/lavonnian/Analysis/Beers.csv", header=TRUE, sep=",")
breweries_raw <- read.csv("C://users/vonnia/lavonnian/Analysis/breweries.csv", header=TRUE, sep=",")

# Create new working copies.
beers_clean <- data.frame(beers_raw)
breweries_clean <- data.frame(breweries_raw)

# Change column name of brewery ID to match for merging.
names(beers_clean)[names(beers_clean) == "Brewery_id"] <- "Brewery_ID"
names(beers_clean)[names(beers_clean) == "Name"] <- "Beer_Name"
names(breweries_clean)[names(breweries_clean) == "Brew_ID"] <- "Brewery_ID"
names(breweries_clean)[names(breweries_clean) == "Name"] <- "Brewery_Name"

# Change data types of Names to character. Style, City, and State stay factors.
beers_clean$Beer_Name <- as.character(beers_clean$Beer_Name)
breweries_clean$Brewery_Name <- as.character(breweries_clean$Brewery_Name)


# How many breweries are there per state? Uses count() from plyr.
breweries_count_state <- count(breweries_clean, "State")
names(breweries_count_state)[names(breweries_count_state) == "freq"] <- c("Num_Breweries")

# Bar graph visualization.
bps_bars <- breweries_count_state %>% ggplot(aes(x = reorder(State, Num_Breweries), y = Num_Breweries)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  ggtitle("Number of Breweries Per State") +
  xlab("State") +
  ylab("Number of Breweries") +
  theme(plot.title = element_text(hjust = 0.5),
        axis.ticks = element_blank()
  )
bps_bars


## 2. Merge beer data with breweries data. 
#Print first 6 observations and last 6 observations to check merged file.

merged_beers <- merge(beers_clean, breweries_clean, by = c("Brewery_ID", "Brewery_ID"), all = TRUE)
merged_beers <- merged_beers[c("Beer_Name", "Beer_ID", "ABV", 
                               "IBU", "Style", "Ounces",
                               "Brewery_Name", "Brewery_ID", "City", "State")]

kable(head(merged_beers, 6), format="markdown")
kable(tail(merged_beers, 6), format="markdown")

## 3. Report number of NAs in each column.
# Report the number of NAs in each column.
num_nas <- colSums(is.na(merged_beers))
num_nas



## 4. Compute median alcohol content and international bitterness unit for each state. 
#Plot a bar chart to compare.

#Calculating the median and ignoring NA
abv_state_median<-aggregate(merged_beers$ABV, list(merged_beers$State), median, na.rm=TRUE)
ibu_state_median<-aggregate(merged_beers$IBU, list(merged_beers$State), median, na.rm=TRUE)

names(abv_state_median)<-c("State", "Median ABV")
names(ibu_state_median)<-c("State", "Median IBU")
### 4.1 ABV Median
#Output the results
kable(abv_state_median, format="markdown")
### 4.2 IBU Median
kable(ibu_state_median, format="markdown")



# Another comment here to test things.

## 5. Which state has maximum ABV beer? Most bitter beer in IBU? 
#(Consider bar chart again, with top [5/10] in each category. However, highlight the number 1.)
abv_max <- max(merged_beers$ABV, na.rm=TRUE)
ibu_max <- max(merged_beers$IBU, na.rm=TRUE)
abv_max
ibu_max

#Convert State from Factor to Character
merged_beers$State <- as.character(merged_beers$State)

#Determine the highest ABV in each State (return by State)
abv.agg <- aggregate(ABV ~ State, merged_beers, max)

#Now Sort the states by ABV descending
sorted_abv_agg<-abv.agg %>% arrange(desc(ABV))
first_ten_abv<-head(sorted_abv_agg, 10)
first_ten_abv

#Determine the highest IBU in each State (return by State)
ibu.agg <- aggregate(IBU ~ State, merged_beers, max)

#Now Sort the states by IBU descending
sorted_ibu_agg<-ibu.agg %>% arrange(desc(IBU))
head(sorted_ibu_agg, 10)


#Now let's graph ABV (top 10)
abv_beers <- first_ten_abv %>% ggplot(aes(x= reorder(State, desc(ABV)), y = ABV)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  ggtitle("States by ABV") +
  xlab("State") +
  ylab("ABV") +
  theme(plot.title = element_text(hjust = 0.5), axis.ticks = element_blank()) + 
  theme(axis.text.x = element_text(angle = -90))
abv_beers

