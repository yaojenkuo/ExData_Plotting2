# plot3.R
library(magrittr)
library(dplyr)
library(ggplot2)
gen_plot3 <- function() {
  plot_tbl <- NEI %>%
    filter(fips == "24510") %>% # 將 fips == “24510” 的觀測值選出
    group_by(year, type) %>% # 依 year 與 type 兩個變數分組
    summarise(ttl_emissions = sum(Emissions)) # 加總 Emissions 變數
  
  ggplot(plot_tbl, aes(x = year, y = ttl_emissions, colour = type)) +
    geom_line() +
    geom_point() +
    xlab("Year") +
    ylab("Emissions") +
    ggtitle("Only POINT type has increased in the Baltimore City from 1999 to 2008")
  ggsave("~/ExData_Plotting2/plot3.png")
}
gen_plot3()