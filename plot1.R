library(magrittr)

# get_data
get_data <- function() {
  #data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  dest_file <- "~/Downloads/NEI_data.zip"
  ex_dir <- "~/Downloads/NEI_data/"
  #download.file(data_url, destfile = dest_file) # 下載壓縮檔
  unzip(dest_file, exdir = ex_dir) # 解壓縮
  NEI <- paste0(ex_dir, "summarySCC_PM25.rds") %>%
    readRDS()
  SCC <- paste0(ex_dir, "Source_Classification_Code.rds") %>%
    readRDS()
  return(list(NEI = NEI, SCC = SCC))
}
data_list <- get_data()
NEI <- data_list$NEI
SCC <- data_list$SCC

# plot1.R
library(dplyr)
gen_plot1 <- function() {
  plot_tbl <- NEI %>%
    group_by(year) %>% # 依 year 變數分組
    summarise(ttl_emissions = sum(Emissions)) # 加總 Emissions 變數
  
  png(filename = "~/ExData_Plotting2/plot1.png")
  par(bg = NA)
  plot(plot_tbl$year, plot_tbl$ttl_emissions, type = "b", xlab = "Year", ylab = "Total Emissions", 
       main = "Total emissions from PM2.5 have decreased in the United States")
  dev.off()
}
gen_plot1()