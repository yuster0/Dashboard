library(tidyverse)
seq(-4,4,by=.012)%>% 
  expand.grid(x=.,y=.)%>% 
  ggplot(aes(x=(1-abs(x)-sin(y^2)),y=(1+y-cos(x^2))))+
  geom_point(alpha=.03,shape=20,size=0)+
  theme_void()+ 
  coord_polar()

