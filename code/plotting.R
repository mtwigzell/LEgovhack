# make pretty

abs_flat$desc_level <- case_when(abs_flat$desc == "Australia" ~ "Total",
                                grepl("males",abs_flat$desc,T) ~ "Gender",
                                grepl("Aged",abs_flat$desc,T) ~ "Age",
                                T ~ "State/Territory")

abs_flat1 <- abs_flat[abs_flat$desc_level == "Gender",]
STP1 <- ggplot(abs_flat1,aes(x=industry, y = jobs_COVID)) +
  geom_bar(aes(fill = industry),stat="identity") +
  facet_grid(desc ~.)


grepocc <- unique(IVI_sai_1[IVI_sai_1$Level == 2,c("ANZSCO_CODE","Title")])
grepocc$gr <- paste0("^",grepocc$ANZSCO_CODE)

IVI_plot <- IVI_sai_1 %>% filter(Level == 3,
                                 date > as.Date("2018-01-01"),
                                 State == "AUST",
                                 grepl("^4",ANZSCO_CODE))

ggplot(IVI_plot,aes(x = date, y = value)) + 
  geom_line(aes(colour = Title),stat="identity") 