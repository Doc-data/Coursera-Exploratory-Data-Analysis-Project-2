library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
by_year <- NEI %>%
    group_by(year) %>%
    summarise(Total_emissions = sum(Emissions))

png("plot1.png")
barplot(height = by_year$Total_emissions/10^6,
                 names.arg = by_year$year,
                 xlab="Year",
                 ylab="PM2.5 Emissions (10^6 Tons)",
                 main="Total PM2.5 Emissions From All US Sources" )
dev.off()