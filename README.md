## Visualization-and-Exploring-data-in-R

**1.	Gathered Data from FiveThirtyEight, a data journalism site devoted to politics, sports, science, economics, and culture, on all gun deaths in the United States from 2012-2014.**

**2.	Generated a data frame that summarizes the number of gun deaths per month and printed the data frame as a formatted kable() table.**

   **R Function:** df %>%
   group_by(month)%>%
   summarise(total = n())%>%
   kable(col.names=c("Month","Number of deaths"), caption = "Number of deaths per month")

   ![image](https://user-images.githubusercontent.com/15854238/147426590-017845a5-7b39-4c6b-b64e-f0f9699d221d.png)


**3.	Generated a bar chart with labels on the x-axis. That is, each month labeled as “Jan”, “Feb”, “Mar” etc.**

   **R Function:** barplot(deaths,col ="Red",col.axis="Black",main ="Gun Deaths per month",xlab="Months",ylab="Number of Deaths",names.arg =           c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))
 
   ![image](https://user-images.githubusercontent.com/15854238/147426599-c799db91-b1bb-4b0d-820d-26d61208557f.png)


**4.	Generated a bar chart that identifies the number of gun deaths associated with each type of intent cause of death. The bars are sorted from highest to lowest values.**

   **R Function:** newdata <- df1[order(-intent1),]
   barplot(newdata,col="Red",col.axis="black",main= "Gun deaths grouped by Intent" , ylab="Number of deaths",xlab = "Intent", names.arg=c("Suicide","Homicide","Accidental","Undetermined"))

 
   ![image](https://user-images.githubusercontent.com/15854238/147426603-2adcf270-2d62-4d66-b9bf-26828a6b01cd.png)


**5.	Generated a boxplot visualizing the age of gun death victims, by sex and printed the average age of female gun death victims.**

   **R Function:** sex_age=data.frame(gun_deaths$sex,gun_deaths$age)
   summary(sex_age) #We got average age of both male and female as 44
   sex_age[is.na(sex_age)] <- 44
   boxplot(col=terrain.colors(3),main="Age of gun death victims by sex",sex_age$gun_deaths.age~sex_age$gun_deaths.sex,data = sex_age, xlab = "Sex", ylab = "Number of deaths")
   df3 <- aggregate (x= sex_age$gun_deaths.age, 
   by = list(sex_age$gun_deaths.sex), FUN = mean)
   colnames(df3) = c ("Sex","Average age")

   ![image](https://user-images.githubusercontent.com/15854238/147426613-28324b79-442f-4fe7-b51b-1d674b74ee8c.png)

 
**6.	White males with at least a high school education killed by guns in 2012**

   **R Function:** sub_guns3 <- count(sub_guns2) %>%
   kable(col.names = c("Total deaths"), caption="White males with at least a high school      education killed by guns in 2012")
   print(sub_guns3)
 
   ![image](https://user-images.githubusercontent.com/15854238/147426624-dbfaac8d-a7e2-43b8-b952-a31ca074a851.png)

**7.	Season of the year having the most gun deaths**

   **R Function:** season_deaths= cut (gun_deaths$month, breaks = 4,labels = c("Winter","Spring","Summer","Fall"))
 
   ![image](https://user-images.githubusercontent.com/15854238/147426629-2678bd44-a8a4-4b83-ab1d-12833dfb5eec.png)

   ![image](https://user-images.githubusercontent.com/15854238/147426634-73a61f28-b964-49b7-bf8c-2752ddce9135.png)

**8.	Suicide/Homicide Deaths by race**

   **R Function:** white_deaths2<-filter (white_deaths, race=="White"|race=="Black"|race=="Hispanic", intent=="Suicide"|intent=="Homicide")

   ![image](https://user-images.githubusercontent.com/15854238/147426640-af4638ee-b13a-4db2-92e2-d5ac804edc43.png)

**9.	Relationship between police involvement and other variables.**

   Police involved gun deaths are generally homicide cases. As shown in the below graph, deaths without police involvement are significantly higher, the cases are spread    across various categories like Suicide being the highest and homicide coming in second. 

**R Function:** library("RColorBrewer")

  ![image](https://user-images.githubusercontent.com/15854238/147426668-d82ee360-f65f-40b6-9449-351fc6b05ac5.png)

 
**R Libraries: **
•	Knitr: to implement piping functions %>%
•	Dplyr: For select, filter, mutate, cut functions.
•	Tidyverse: For R packages like dplyr
•	RColorBrewer: for colors used in visualization 

