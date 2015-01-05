
#library(xlsx)
# run once, takes a while
#df <- read.xlsx("653001_Final_Excel_121914.xlsx", 1, 
#                stringsAsFactors=F)
#save(df, file="653001_Final_Excel_121914_xlsx.Rdata")
load("653001_Final_Excel_121914_xlsx.Rdata")

df$qs1 <- as.character(df$qs1)
north_side_zips <- c("60645", "60626", "60631", "60646", "60659",
                     "60660", "60640", "60625", "60630", "60656",
                     "60634", "60641", "60618", "60613", "60657",
                     "60707", "60739", "60647", "60614", "60651",
                     "60622", "60661", "60610", "60654", "60611",
                     "60601", "60602", "60603", "60604", "60605", 
                     "60606", "60607", "60612", "60624", "60644")
south_side_zips <- c("60623", "60608", "60616", "60632", "60609",
                     "60653", "60615", "60638", "60629", "60636",
                     "60621", "60637", "60649", "60619", "60620",
                     "60652", "60617", "60628", "60643", "60655",
                     "60827", "60633")
df$side <- rep(NA, nrow(df))
df$side[df$qs1 %in% north_side_zips] <- "north"
df$side[df$qs1 %in% south_side_zips] <- "south"

# add attributes to data cols to give the survey question text
q_text <- c("q1", "Have you ever been a victim of food poisoning?",
            "q2_1", "During or after your illness, which of the following did you do? Select all that apply. | 1. Went to the emergency room",
            "q2_2", "During or after your illness, which of the following did you do? Select all that apply. | 2. Looked up my symptoms online",
            "q2_3", "During or after your illness, which of the following did you do? Select all that apply. | 3. Called / Visited a doctor",
            "q2_4", "During or after your illness, which of the following did you do? Select all that apply. | 4. Called 311",
            "q2_5", "During or after your illness, which of the following did you do? Select all that apply. | 5. Called the restaurant where the illness was contracted",
            "q2_6", "During or after your illness, which of the following did you do? Select all that apply. | 6. Contacted the health department",
            "q2_7", "During or after your illness, which of the following did you do? Select all that apply. | 7. Contacted a lawyer",
            "q2_8", "During or after your illness, which of the following did you do? Select all that apply. | 8. None of the above",
            "q3_1", "Who did you tell about your illness? Select all that apply. | 1. Family",
            "q3_2", "Who did you tell about your illness? Select all that apply. | 2. Coworkers",
            "q3_3", "Who did you tell about your illness? Select all that apply. | 3. Friends on a social networking site (Ask Q3a)",
            "q3_4", "Who did you tell about your illness? Select all that apply. | 4. Other: __",
            "q3_5", "Who did you tell about your illness? Select all that apply. | 5. None of the above",
            "q3_4_other", "Who did you tell about your illness? Select all that apply.",
            "q3a_1", "Which social networking sites did you use to tell about the food poisoning? Select all that apply. | 1. Facebook",
            "q3a_2", "Which social networking sites did you use to tell about the food poisoning? Select all that apply. | 2. Twitter",
            "q3a_3", "Which social networking sites did you use to tell about the food poisoning? Select all that apply. | 3. LinkedIn",
            "q3a_4", "Which social networking sites did you use to tell about the food poisoning? Select all that apply. | 4. Google+",
            "q3a_5", "Which social networking sites did you use to tell about the food poisoning? Select all that apply. | 5. Pinterest",
            "q3a_6", "Which social networking sites did you use to tell about the food poisoning? Select all that apply. | 6. Instagram",
            "q3a_7", "Which social networking sites did you use to tell about the food poisoning? Select all that apply. | 7. Myspace",
            "q3a_8", "Which social networking sites did you use to tell about the food poisoning? Select all that apply. | 8. Other________",
            "q3a_9", "Which social networking sites did you use to tell about the food poisoning? Select all that apply. | 9. None of the above",
            "q4", "Have you ever reported a case of food poisoning to the Chicago health department?",
            "q5", "Did you ever look up the results of your report?",
            "q6_1", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, what would you do? Select all that apply. | 1. Go to the emergency room",
            "q6_2", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, what would you do? Select all that apply. | 2. Look up my symptoms online",
            "q6_3", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, what would you do? Select all that apply. | 3. Call / Visit a doctor",
            "q6_4", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, what would you do? Select all that apply. | 4. Call 311",
            "q6_5", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, what would you do? Select all that apply. | 5. Call the restaurant where the illness was contracted",
            "q6_6", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, what would you do? Select all that apply. | 6. Contact the health department",
            "q6_7", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, what would you do? Select all that apply. | 7. Contact a lawyer",
            "q6_8", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, what would you do? Select all that apply. | 8. Would not do anything",
            "q7_1", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, who would you tell about your illness? Select all that apply. | 1. Family",
            "q7_2", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, who would you tell about your illness? Select all that apply. | 2. Coworkers",
            "q7_3", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, who would you tell about your illness? Select all that apply. | 3. Facebook friends",
            "q7_4", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, who would you tell about your illness? Select all that apply. | 4. Twitter followers",
            "q7_5", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, who would you tell about your illness? Select all that apply. | 5. Instagram followers",
            "q7_6", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, who would you tell about your illness? Select all that apply. | 6. Yelp!",
            "q7_7", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, who would you tell about your illness? Select all that apply. | 7. Other:___",
            "q7_8", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, who would you tell about your illness? Select all that apply. | 8. None of the above",
            "q7_7_other", "If you were to get food poisoning (insert the word “again” if Q1=1) from a restaurant in the future, who would you tell about your illness? Select all that apply.",
            "q8_1", "If you were to report a case of food poisoning to the Chicago health department, how confident are you that your report would be followed up on? (Scale 1 ‘Not at all confident’ to 10 ‘Extremely confident’)",
            "q9", 'To what extent do you agree or disagree with the following statement: “In the event that you or somebody in your family became ill after eating at a restaurant, it is your civic duty to report the illness to the authorities.”',
            "q10_1", "Suppose further that you received a reply to your tweet with a link that enabled you to report your illness to the health department. Which of the following would you need to see in order to report the illness to the health department? Select all that apply. | 1. Official health department / 311 website",
            "q10_2", "Suppose further that you received a reply to your tweet with a link that enabled you to report your illness to the health department. Which of the following would you need to see in order to report the illness to the health department? Select all that apply. | 2. Third party hosted website that is sanctioned by the health department",
            "q10_3", "Suppose further that you received a reply to your tweet with a link that enabled you to report your illness to the health department. Which of the following would you need to see in order to report the illness to the health department? Select all that apply. | 3. A robust privacy policy",
            "q10_4", "Suppose further that you received a reply to your tweet with a link that enabled you to report your illness to the health department. Which of the following would you need to see in order to report the illness to the health department? Select all that apply. | 4. Mobile friendly webpage / form",
            "q10_5", "Suppose further that you received a reply to your tweet with a link that enabled you to report your illness to the health department. Which of the following would you need to see in order to report the illness to the health department? Select all that apply. | 5. Assurance that the health department would follow up on my complaint",
            "q10_6", "Suppose further that you received a reply to your tweet with a link that enabled you to report your illness to the health department. Which of the following would you need to see in order to report the illness to the health department? Select all that apply. | 6. None, I would report it just because they asked me too",
            "q10_7", "Suppose further that you received a reply to your tweet with a link that enabled you to report your illness to the health department. Which of the following would you need to see in order to report the illness to the health department? Select all that apply. | 7. None, I would not be willing to report my illness to the health department")
q_text <- matrix(q_text, ncol=2, byrow=TRUE)
for(i in 1:nrow(q_text)){
  attr(df[,q_text[i,1]], "question_text") <- q_text[i,2]
}

save(df, file="653001_Final_Excel_121914_xlsx.Rdata")
