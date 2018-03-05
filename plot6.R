# plot6.R
library(magrittr)
library(dplyr)
library(ggplot2)
gen_plot6 <- function() {
  has_mobile <- grepl(pattern = "Mobile", SCC$EI.Sector) # 利用 grepl() 函數判斷文字是否有出現 "Coal" 字串
  has_mobile_scc <- SCC$SCC[has_mobile] %>%
    as.character() # 利用 SCC 資料中的 SCC 變數來判斷
  plot_tbl <- NEI %>%
    filter(SCC %in% has_mobile_scc) %>% # 將有 "Mobile" 字串的 SCC 觀測值選出
    filter(fips %in% c("24510", "06037")) %>% # 將 fips %in% c("24510", "06037") 的觀測值選出
    group_by(year, fips) %>% # 依 year 與 fips 兩個變數分組
    summarise(ttl_emissions = sum(Emissions)) # 加總 Emissions 變數
  
  ggplot(plot_tbl, aes(x = year, y = ttl_emissions, colour = fips)) +
    geom_line() +
    geom_point() +
    xlab("Year") +
    ylab("Emissions") +
    ggtitle("Emissions from motor vehicle sources in Los Angeles have increased")
  ggsave("~/ExData_Plotting2/plot6.png")
}
gen_plot6()