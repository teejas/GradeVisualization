library(ggplot2)

data <- read.csv("dspgrades.csv", header=T, sep=",")
df <- data.frame(data)
cum_gpa <- df$Cumulative.GPA
term_gpa <- df$Term.GPA
names <- df$Name
term_hrs <- df$Term.hours
living_in <- df$Living.in

norm_cum <- (cum_gpa - mean(cum_gpa)) / sd(cum_gpa)
norm_term <- (term_gpa - mean(term_gpa)) / sd(term_gpa)
norm_hrs <- (term_hrs - mean(term_hrs)) / sd(term_hrs)

plot(term_hrs, cum_gpa, main="Plot of Cumulative GPA per term hours", ylab="Cumulative GPA", xlab="Term hours")
plot(term_hrs, term_gpa, main="Plot of term grades per term hours", ylab="Term GPA", xlab="Term hours")

boxplot(cum_gpa~living_in, data=df, main="Cumulative GPA Data", xlab="Living In", ylab="Cumulative GPA")
boxplot(term_gpa~living_in, data=df, main="Term GPA Data", xlab="Living In", ylab="Term GPA")

mean_cum <- mean(cum_gpa)
mean_term <- mean(term_gpa)
attach(data)
sorteddata <- data[order(cum_gpa), ]
detach(data)

print(sorteddata)
paste("Mean cumulative GPA: ", mean_cum)
paste("Mean term GPA: ", mean_term)
paste("Std Dev cum GPA: ", sd(cum_gpa))
paste("Std Dev term GPA: ", sd(term_gpa))

