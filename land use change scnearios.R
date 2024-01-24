##########################################
#import land use area and change for scenarios
library(cowplot)
library(scales)
library(ggplot2)
library(RColorBrewer)
library(viridis)

####
lu1 = read.csv("LU_area.csv")  # land use scenarios and area (ha)
luch = read.csv("LU_pchange.csv")  # land use change (%)

lu1$Scenario = factor(lu1$Scenario, levels = c("Current", "B", "C", "D", "E1", "E2"))

luplot = ggplot(lu1, aes(x = Scenario, y= Area, fill= Land.Use)) +
              geom_bar(stat = "identity", position = "dodge", width = 1) +
  ylab("Area (ha)")+
   theme_classic()+
   scale_fill_manual(values = cbp2)+
  # scale_fill_brewer(palette = "Dark2")+
  theme(legend.position = "none") 
    
   #guides(fill=guide_legend("Land-use/Land cover"))
luplot
########
#LU CHANNGE
luch$Scenario = factor(luch$Scenario, levels = c( "B", "C", "D", "E1", "E2"))

luchplot = ggplot(luch, aes(x = Scenario, y= Change, fill= Land.Use)) +
  geom_bar(stat = "identity", position = "dodge", width = 1) +
  ylab("Change (%)")+
   theme_classic()+
   scale_fill_manual(values = cbp2)+
  #scale_fill_brewer(palette = "Dark2")+
  #theme(legend.position = "none") # remove legend
 

  guides(fill=guide_legend("Land-use/Land cover"))
 luchplot
 
  
#color scale
scale_color_manual(values = cbp2)
   cbp1 <- c("#E69F00","#009E73", "#F0E442", "#CC79A7", "#0072B2", "#D55E00")
   cbp2 <- c("#48D1CC","#4B0082","#B22222","#808080","#228B22","#D2691E")
   ##plot sidebysid
   plot_grid(luplot, luchplot,labels = "AUTO")
   
   
   
   
  ######################## Chapter 6 ######################
   #land cover scenarios
   ######################
   
   lcs = read.csv("scenario_lc.csv")
   lcs$Scenario = factor(lcs$Scenario, levels = c( "Current", "PE", "FE", "MP", "AR", "FS","EF"))
   
   #PLOT
   ggplot(lcs, aes(x = Scenario, y= Percent, fill = Landcover)) +
     geom_bar(stat = "identity", position = "dodge") +
     
     ylab("% Total land cover")+
     guides(fill=guide_legend("Land cover (LC)" ))+
   
     scale_fill_manual(values = cbp1, labels =c("Mixed non-native shrubland", "Gorse/broom", "Manuka/kanuka",
                                   "Woody native", "Woody mixed", "Pasture", "Cropland"))+
     theme(legend.background = element_blank(),
           legend.box.background = element_rect(color = "black"))
     
   #Plot End
   
   ##### Land cover scenarios from experts
   
   lcse = read.csv("scenario_lc_ex.csv")
     
     #PLOT
     ggplot(lcse, aes(x = Scenario, y= Percent, fill = Landcover)) +
     geom_bar(stat = "identity", position = "dodge") +
     
     ylab("% Total land cover")+
     guides(fill=guide_legend("Land cover (LC)"))+
     
     scale_fill_manual(values = cbp1, labels =c("Mixed non-native shrubland", "Gorse/broom", "Manuka/kanuka",
                                                "Woody native", "Woody mixed", "Pasture", "Cropland"))+
       theme(legend.background = element_blank(),
             legend.box.background = element_rect(color = "black"))
     
     #plot end
     