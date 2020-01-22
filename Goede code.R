


country_codes <- unique(as.character(trend_names$country_code, incomparables = FALSE)) #list of country codes

label <- paste("results", c(country_codes), sep="_") #labels for the resulting lists (one for each country)

b <- 1 # for the indexing of the country specific lists

for (a in 1:length(country_codes)) { #for each country
  
  for (i in 1:length(as.list(trend_names[,"country_code"]))) { #cycle through entire list of options
    
    if ( as.character(country_codes[a]) == as.character(trend_names[i,"country_code"])) {
      result[[b]] <- list(gtrends(keyword = c(trend_names[i,"trend_name"],trend_names[i,"trend_name_local"]), 
                                  geo = c(as.character(trend_names[i,"country_code"]),as.character(trend_names[i,"country_code"])), 
                                  time = "all",
                                  category = 71,
      ))
      b <- b + 1
    }
    
  }
  assign(label[a],result) #assign to country specfic list 
  b <- 1  #reset to one
}

