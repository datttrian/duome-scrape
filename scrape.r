library(rvest)
library(tidyverse)
units = read_html("https://forum.duome.eu/viewtopic.php?p=57747-searchable-word-overview-for-french-path-204-units-4883-words#p57747") %>%
    html_nodes(xpath = '//div[@class="content"]/h1/a[2]') %>%
    html_attr('href')

df = units[2] %>% 
    read_html() %>% 
    html_nodes(xpath='//*[@id="post_content60754"]/div[1]/table') %>% 
    html_table() %>% 
    write.csv()

df