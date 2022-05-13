library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
baltimore <- NEI %>%
    filter(fips == "24510") %>%
    group_by(year) %>%
    summarise(Total_emissions = sum(Emissions))

png("plot2.png")

with(baltimore,
    barplot(height = Total_emissions/10^6,
        names.arg = year,
        xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions From Baltimore" ))

dev.off()