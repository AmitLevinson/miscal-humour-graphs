library(ggplot2)
library(xkcd)
library(extrafont)

dat <- data.frame(day=c(1:30),
                  number=c(seq(1, 80, length.out = 3), seq(100, 200, length.out = 6), seq(200,250,length.out = 7),seq(260,360, length.out = 14)))

xrange <- range(dat$day)
yrange <- range(dat$number)


ggplot(dat, aes(x = day, y = number))+
  geom_smooth(method = "loess", fill = "transparent")+
  scale_x_continuous(breaks = c(1,30))+
  xkcdaxis(xrange = xrange, yrange = yrange)+
  coord_cartesian(clip= "off")+
  labs(title = "Jewish Holiday Season",
       caption = "Visualiztion: Amit Levinson",
       x = "Days into September",
       # y = "What day is it?",
       # x = NULL,
       y = NULL
       )+
  annotate("text", x = 3, y = yrange[2]-20, label = "What day is it?", family = "xkcd", size = 10)+
  # annotate("text", x = 28, y = 5, label = "Days in september", family = "xkcd", size = 12)+
  theme(
    text = element_text(family = "xkcd"),
    axis.text.y = element_blank(),
    axis.text.x = element_text(vjust = 2, size = 14),
    axis.ticks = element_blank(),
    axis.title.x = element_text(hjust = 1, size = 22),
    axis.title.y = element_text(size = 22),
    plot.caption = element_text(size = 12, hjust = 0, vjust = 3, color = "gray35"),
    plot.title = element_text(hjust = 0.5, size = 36, face= "bold"),
    plot.margin = margin(6,8,6,8,"pt")
  )

ggsave("holiday-plot.png", width = 6, height = 4)
