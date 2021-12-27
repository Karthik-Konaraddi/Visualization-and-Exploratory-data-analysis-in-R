#Reading data into R
library(knitr) 
library(dplyr)
gun_deaths=read.csv("C:/Users/kkonar2/OneDrive - University of Illinois at Chicago/Documents/R Projects/Data Mining/Assignment 1/gun_deaths.csv")
df=data.frame(gun_deaths)
df %>%
  group_by(month)%>%
  summarise(total = n())%>%
  kable(col.names=c("Month","Number of deaths"), caption = "Number of deaths per month")

#Generated a data frame that summarizes the number of gun deaths per month and printed the data frame as a formatted kable() table.
deaths=table(gun_deaths$month)

#Generated a bar chart with labels on the x-axis. That is, each month labeled as "Jan", "Feb", "Mar" etc.
barplot(deaths,col ="Red",col.axis="Black",main ="Gun Deaths per month",xlab="Months",ylab="Number of Deaths",names.arg = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))

#Generated a bar chart that identifies the number of gun deaths associated with each type of intent cause of death. The bars are sorted from highest to lowest values.intent=table(gun_deaths$intent)
intent1=as.numeric(intent)
df1 <- data.frame(intent1)
newdata <- df1[order(-intent1),]
barplot(newdata,col="Red",col.axis="black",main= "Gun deaths grouped by Intent" , ylab="Number of deaths",xlab = "Intent", names.arg=c("Suicide","Homicide","Accidental","Undetermined"))

#Generated a boxplot visualizing the age of gun death victims, by sex and printed the average age of female gun death victims.
sex_age=data.frame(gun_deaths$sex,gun_deaths$age)
summary(sex_age) #We got average age of both male and female as 44
sex_age[is.na(sex_age)] <- 44
boxplot(col=terrain.colors(3),main="Age of gun death victims by sex",sex_age$gun_deaths.age~sex_age$gun_deaths.sex,data = sex_age, xlab = "Sex", ylab = "Number of deaths")
df3 <- aggregate(x= sex_age$gun_deaths.age, 
                 by = list(sex_age$gun_deaths.sex),      
                 FUN = mean)
colnames(df3) = c("Sex","Average age")
print(df3)

#White males with at least a high school education killed by guns in 2012
library(tidyverse)
sub_guns<-select(gun_deaths, year, sex, race, education)
sub_guns2<-filter(sub_guns, year=="2012", sex=="M", race=="White", education=="HS/GED" | education=="BA+" | education=="Some college")
sub_guns3 <- count(sub_guns2)%>%
  kable(col.names = c("Total deaths"), caption="White males with at least a high school education killed by guns in 2012")
print(sub_guns3)

#Season of the year having the most gun deaths
season_deaths= cut(gun_deaths$month, breaks = 4,labels = c("Winter","Spring","Summer","Fall"))
plot(season_deaths,col=c("steelblue4","springgreen4","red","sienna"),xlab="Seasons of the year",ylab="Number of Deaths",main="Gun deaths by Season")
summary(season_deaths)

#Suicide/Homicide Deaths by race
white_deaths<-select(gun_deaths, intent, race)
white_deaths2<-filter(white_deaths, race=="White"|race=="Black"|race=="Hispanic", intent=="Suicide"|intent=="Homicide")
w_deaths=table(white_deaths2$intent,white_deaths2$race)
barplot(w_deaths,xlim=c(0,5),col=terrain.colors(3), legend= TRUE, xlab="Race",ylab="Number of deaths", main="Suicide/Homicide deaths by race")

#Relationship between police involvement and other variables.
library("RColorBrewer")
police1<-select(gun_deaths, intent, police)
police3<-table(police1$intent, police1$police)
barplot(police3,ylim=c(0,75000),xlim=c(0,4),xlab="Police",ylab="Number of deaths",legend=TRUE,col=brewer.pal(n=4, name="RdBu"), names.arg = c("Not Involved","Involved"))
