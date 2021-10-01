library(ggplot2)
library(xkcd)
library(showtext)

font_add("xkcd", "xkcd.ttf")
showtext_auto()

dat <- data.frame(day=c(1:30),
                  number=c(seq(1, 30, length.out = 5), seq(30, 100, length.out = 6), seq(300,450,length.out = 7),seq(450,560, length.out = 12)))


xrange <- range(dat$day)
yrange <- range(dat$number)


ggplot(dat, aes(x = day, y = number))+
  geom_smooth(method = "loess", fill = "transparent", color = "black")+
  scale_x_continuous(breaks = c(1,30))+
  xkcdaxis(xrange = xrange, yrange = yrange)+
  labs(title = "Jewish Holiday Season",
       caption = paste0("Visulaiziton: Amit Levinson"),
       x = "Days into September",
       y = NULL
       )+
  annotate("text", x = 3.5, y = yrange[2], label = "What day is it?", family = "xkcd", size = 17)+
  theme(
    axis.text.y = element_blank(),
    axis.text.x = element_text(vjust = 2, size = 20),
    axis.ticks = element_blank(),
    axis.title.x = element_text(hjust = 1, size = 45),
    plot.caption = element_text(size = 25, hjust = 0, vjust = 3, color = "gray35"),
    plot.title = element_text(hjust = 0.5, size = 65, face= "bold"),
    plot.margin = margin(6,8,6,8,"mm"),
    plot.background = element_rect(fill = "white", color = NA)
  )

ggsave("holiday-plot.png", width = 8, height = 5)

