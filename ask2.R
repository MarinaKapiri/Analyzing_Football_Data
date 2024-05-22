#Ã¡—…Õ¡  ¡–…—«, ¡≈Ã:16516

install.packages("RSQLite")
library(DBI)
library(dplyr)
library(ggplot2)


#¢ÛÍÁÛÁ2:

#1)
football<- DBI::dbConnect(RSQLite::SQLite(),"database.sqlite")




#2)
dbReadTable(football,"Country")
dbReadTable(football,"League")
dbReadTable(football,"Match")
dbReadTable(football,"Player")
dbReadTable(football,"Player_Attributes")
dbReadTable(football,"Team")
dbReadTable(football,"Team_Attributes")

str(dbReadTable(football,"Country"))
str(dbReadTable(football,"League"))
str(dbReadTable(football,"Match"))
str(dbReadTable(football,"Player"))
str(dbReadTable(football,"Player_Attributes"))
str(dbReadTable(football,"Team"))
str(dbReadTable(football,"Team_Attributes"))




#3)
country<-tbl(football,"Country")
league<-tbl(football,"League")
match<-tbl(football,"Match")
player<-tbl(football,"Player")
player_attributes<-tbl(football,"Player_Attributes")
team<-tbl(football,"Team")
team_attributes<-tbl(football,"Team_Attributes")

dim(country)
dim(league)
dim(match)
dim(player)
dim(player_attributes)
dim(team)
dim(team_attributes)




#4)
#4.1)
heightchoise<- player %>% filter( height>160,height<180) %>% select(player_name,height,weight) %>% arrange(-weight)
#4.2)
matchchoice<- match %>% filter(match_api_id==492480) %>% select(date,home_team_api_id,home_team_goal) 
#4.3)
teammatchcountry<-team %>% select(team_long_name,name) %>% left_join(country) 
#4.4)
matchchoice2<-match %>% filter(match_api_id==492480) %>% select(date,home_team_api_id,home_team_goal,away_team_api_id,away_team_goal)





#5)
#5.a)
Greatfoot<-player_attributes %>% group_by(preferred_foot) %>% summarize(rightfoot=sum(preferred_foot=right),leftfoot=sum(preferred_foot=left))
Greatfoot<-na.omit(Greatfoot)
#5.b)
ggplot(player_attributes,aes(preferred_foot))+geom_bar()





#6)
#6.a)
ggplot(player,aes(x=height,y=weight))+geom_jitter()
#6.b)
ggplot(player,aes(x=height,y=weight))+geom_jitter(alpha=0.3) 
