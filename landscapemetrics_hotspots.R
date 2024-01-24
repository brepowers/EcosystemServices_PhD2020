EA_hot = read.csv("hotspot_EA.csv")
PL_hot = read.csv("Hotspot_PL.csv")
PL_hotcold = read.csv("Hotcoldspot_PL.csv")
PL_cold = read.csv("coldspot_PL.csv")

library(ggplot2)
# https://www.r-bloggers.com/plot-some-variables-against-many-others-with-tidyr-and-ggplot2/


## EA Hot
ggplot(data = EA_hot, aes(x = Method, y = Value2, shape = factor(Method))) +
  geom_point (size = 3)+
  facet_wrap (~Scenario)+
  theme_bw()+
  ylab("EA")+
  
  theme(text = element_text(size = 18),
  axis.title.x=element_blank(),  axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(shape = "Method")
  


## PL Hot and cold

ggplot(data = PL_hotcold, aes(x = Method, y = Value1, shape = factor(Method), color = Hot_Cold)) +
  geom_point (size = 3)+
  
  facet_wrap (~Scenario)+
  theme_bw()+
  ylab("PL")+
  
  theme(text = element_text(size = 18),
        axis.title.x=element_blank(),  axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(shape = "Method")+
  scale_color_discrete(name = "Type" )+
  scale_color_manual (values = c("blue", "red"))

## PL Cold
ggplot(data = PL_cold, aes(x = Method, y = Value1, shape = factor(Method))) +
  geom_point (size = 3, color = "blue")+
  
  facet_wrap (~Scenario)+
  theme_bw()+
  ylab("PL")+
  
  theme(text = element_text(size = 18),
        axis.title.x=element_blank(),  axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(shape = "Method")
 
## PL hot
ggplot(data = PL_hot, aes(x = Method, y = Value1, shape = factor(Method))) +
  geom_point (size = 3, color = "red")+
  
  facet_wrap (~Scenario)+
  theme_bw()+
  ylab("PL")+
  
  theme(text = element_text(size = 18),
        axis.title.x=element_blank(),  axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(shape = "Method")
 