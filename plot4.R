# plot4.R
library(magrittr)
library(dplyr)
library(ggplot2)
gen_plot4 <- function() {
  has_coal <- grepl(pattern = "Coal", SCC$EI.Sector) # 利用 grepl() 函數判斷文字是否有出現 "Coal" 字串
  has_coal_scc <- SCC$SCC[has_coal] %>%
    as.character() # 利用 SCC 資料中的 SCC 變數來判斷
  plot_tbl <- NEI %>%
    filter(SCC %in% has_coal_scc) %>% # 將有 "Coal" 字串的 SCC 觀測值選出
    group_by(year) %>% # 依 year 變數分組
    summarise(ttl_emissions = sum(Emissions)) # 加總 Emissions 變數
  
  ggplot(plot_tbl, aes(x = year, y = ttl_emissions)) +
    geom_line() +
    geom_point() +
    xlab("Year") +
    ylab("Emissions") +
    ggtitle("The emissions from coal combustion-related in the US have decreased")
  ggsave("~/ExData_Plotting2/plot4.png")
}
gen_plot4()