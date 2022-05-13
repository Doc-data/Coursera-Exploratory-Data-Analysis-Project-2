library(dplyr)
library(ggplot2)

baltimore_type <- NEI %>% 
    filter(fips == "24510") %>%
    group_by(type, year) %>%
    summarize(total_emissions = sum(Emissions))

png("plot2.png")

ggplot(baltimore_type,
        aes(x= year, y = total_emissions, color = type)) +
        geom_line() +
        labs(x = "Year",
             y = "Total Emissions",
             title = "Total Emissions by Type in Baltimore")

dev.off()