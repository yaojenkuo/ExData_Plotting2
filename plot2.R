# plot2.R
library(magrittr)
library(dplyr)
gen_plot2 <- function() {
  plot_tbl <- NEI %>%
    filter(fips == "24510") %>% # 將 fips == “24510” 的觀測值選出
    group_by(year) %>% # 依 year 變數分組
    summarise(ttl_emissions = sum(Emissions)) # 加總 Emissions 變數
  
  png(filename = "~/ExData_Plotting2/plot2.png")
  par(bg = NA)
  plot(plot_tbl$year, plot_tbl$ttl_emissions, type = "b", xlab = "Year", ylab = "Total Emissions", 
       main = "Total emissions from PM2.5 have decreased in the Baltimore City")
  dev.off()
}
gen_plot2()