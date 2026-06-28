# Students:
# Jana Abdurhman    444820821
# Lima Al Sheban    445803902
# Raghad Ahmed Ali  445803851
# Lama AbdulAziz Ali 445803974

install.packages("RSentiment") 
library("RSentiment") 
# Apply sentiment analysis on custom sentences

calculate_total_presence_sentiment(c(
  "This product is amazing", 
  "This is a bad service", 
  "This is the worst experience ever", 
  "The book is on the table"
))

calculate_sentiment(c(
  "This product is amazing", 
  "This is a bad service", 
  "This is the worst experience ever", 
  "The book is on the table"
))

calculate_score(c(
  "This product is amazing", 
  "This is a bad service", 
  "This is the worst experience ever", 
  "The book is on the table"
))

