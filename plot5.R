# plot5.R
library(magrittr)
library(dplyr)
library(ggplot2)
gen_plot5 <- function() {
  has_mobile <- grepl(pattern = "Mobile", SCC$EI.Sector) # 利用 grepl() 函數判斷文字是否有出現 "Coal" 字串
  has_mobile_scc <- SCC$SCC[has_mobile] %>%
    as.character() # 利用 SCC 資料中的 SCC 變數來判斷
  plot_tbl <- NEI %>%
    filter(SCC %in% has_mobile_scc) %>% # 將有 "Mobile" 字串的 SCC 觀測值選出
    filter(fips == "24510") %>% # 將 fips == “24510” 的觀測值選出
    group_by(year) %>% # 依 year 變數分組
    summarise(ttl_emissions = sum(Emissions)) # 加總 Emissions 變數
  
  ggplot(plot_tbl, aes(x = year, y = ttl_emissions)) +
    geom_line() +
    geom_point() +
    xlab("Year") +
    ylab("Emissions") +
    ggtitle("Emissions from motor vehicle sources in the Baltimore City have decreased")
  ggsave("~/ExData_Plotting2/plot5.png")
}
gen_plot5()