# DATA VISUALIZATION IN R (ggplot2())

# Most popular Data Viz packages are

# 1. ggplo2
# 2. plotly
# 3. Lattice
# 4. RGL(3D Visuals)
# 5. Dygraphs
# 6. Patchwork
# 7. Highcharte
# 8. gganimate



# GGPLOT2 : AESTHETICS, GEOMS, FACETS, LABELS & ANNOTATIONS

# A. AESTHETICS :  Visual property of an object in your plot e.g size, shape color e.t.c

# B. GEOM       :  Geometric object used to represent data. Points for scatter plot,
#                  bars for bar chart or line to create line diagram

# C. FACETS     :  To display smaller groups or subset of your data e.g small multiples

# D. LABEL & ANNOTATIONS : Lets you customize your plot e.g Titles, subtitles, narratives,
#                          or highlight important aspects of your data


# Loading tidyverse & palmer pengiuns package

library(tidyverse)
library(palmerpenguins)

# NOTE : Data + geom_function + mapping = aesthetics = BASIC PLOTS CREATION IN R

# GEOM FUNCTIONS

#   1. geom_point
#   2. geom_bar
#   3. geom_line
#   4. geom_boxplot
#   5. geom_histogram
#   6. geom_ribbon

# Creating a basic SCATTER PLOT of flipper_length_mm & body_mass_g
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

# Creating a basic SCATTER PLOT of bill_length_mm & bill_depth_mm
ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm, y = bill_depth_mm))

# FOR HELP: ?function_name e.g ?geom_point
?geom_point

# 2. BASICS DATA VIZ TASKS USING GGLPOT2(goem, Facet and aesthetics)

hotel_bookings_df <- read_csv("Google Data Analytics Tasks/hotel_bookings.csv")

head(hotel_bookings_df)

skim_without_charts(hotel_bookings_df)

ggplot(data = hotel_bookings_df) +
  geom_point(mapping = aes(x = stays_in_week_nights , y = children))

ggplot(data = hotel_bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel))

ggplot(data = hotel_bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel, fill = deposit_type))

ggplot(data = hotel_bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel, fill = market_segment))

ggplot(data = hotel_bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type)

ggplot(data = hotel_bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

ggplot(data = hotel_bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

ggplot(data = hotel_bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(deposit_type~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

ggplot(data = hotel_bookings_df) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment))

ggplot(data = hotel_bookings_df) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment)) +
  facet_wrap(~market_segment)

# FILTER & GGPLOT2 VIZ

onlineta_city_hotels <- filter(hotel_bookings_df,
                               (hotel=="City Hotel" &   # &: For 2 filter conditions and
                                hotel_bookings_df$market_segment=="Online TA")) # $: To specify which
                                                                          # column in the data frame we are referencing
onlineta_city_hotels <- filter(hotel_bookings_df,
                               (hotel=="City Hotel" &   # &: For 2 filter conditions
                                market_segment=="Online TA"))


onlineta_city_hotels_v2 <- hotel_bookings_df %>%
  filter(hotel=="City Hotel") %>%               # This is another way of doing the above
  filter(market_segment=="Online TA")

ggplot(data = onlineta_city_hotels_v2) +        # Now create a data viz using your filtered data
  geom_point(mapping = aes(x = lead_time, y = children))

hotel_bookings_df %>%
  filter(hotel=="City Hotel") %>%
  filter(market_segment=="Online TA") %>%
  ggplot(         # Wait! You can combine the code into just one code chunk - NOT CORRECT
  geom_point(aes(x = lead_time, y = children)))



view(onlineta_city_hotels)

# 1.  GOEM_POINT : Scatterplot


# Ploting lead_time and Children

ggplot(data = hotel_bookings_df) +
  geom_point(mapping = aes(x = lead_time, y = children))

# Ploting stays_in_week_nights and children

ggplot(data = hotel_bookings_df) +
  geom_point(mapping = aes(x = stays_in_week_nights , y = children))

# Adding color aesthetic using species column

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color= species))

# Adding shape aesthetic using species column

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species))

# Adding shape and color aesthetic using species column

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species, color = species))

# Adding shape, color and size aesthetic using species column

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species, color = species, size = species))

# Adding alpha aesthetic using species column for dense variables

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, alpha = species))

# using color outside the aesthetics apply for other varaiables

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g), color = "purple")

# OTHER GEOM FUNCTIONS
#
  # 2.  GOEM_SMOOTH : Smooth line Trend

ggplot(data = penguins) +
  geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g), color = "purple")

 # Using different Line type for species category

ggplot(data = penguins) +
  geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g, linetype = species))

  # Combining GOEM_POINT and GOEM_SMOOTH

ggplot(data = penguins) +
  geom_smooth(method = "loess", mapping = aes(x = flipper_length_mm, y = body_mass_g), color = "purple") +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

# 3.  GOEM_JITTER : To deal with Over-plotting

ggplot(data = penguins) +
  geom_jitter(mapping = aes(x = flipper_length_mm, y = body_mass_g), color = "purple")

# 4.  GOEM_BAR : To plot categorical varaible for easy comparison

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))    # This highlights the outside end of the bar

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))     # This changes the actual color of the bars

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity)) # This creates a stacked bar chart with clarity as legends

# FACETS AND AESTHETICS

  # 1. facet_wrap : single variable
  # 2. facet_grid

# 1. Using facet_wrap

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  facet_wrap(~species)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color, fill = cut)) +
  facet_wrap(~cut)

# 1. Using facet_grid

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  facet_wrap(sex~species)

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  facet_wrap(~sex)

# ANNOTATIONS & SAVING PLOTS : ANNOTATE, LABELS AND GGSAVE FUNCTION

#  To Annotate means to add notes or narrative to your diagram for easier comprehension

#  Label function:Tiles, Subtitles and Caption
#  Annotate function: To highlight an important aspect of the plot inside the plot

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  labs(title="Palmer Penguins: Flipper Length vs Body Mass",
       subtitle="A subset of Palmer Penguins data",
       caption="Data collected by Kristen Gorman") +
  annotate("text", x=200, y=6000, label="The Gentoos are the Largest",
           fontface="bold", size=4.5, color = "black")

#  ggave or export option

ggsave("Three Penguin Species.png")


# TABLEAU - POWER BI - R

 # Tableau or Microsoft Power BI are enterprise level BI Tools for the BI Ecosystem
 # and are great Analytics tool for interactive and Live Dashboards and Reports whereas
 # R is more tilted towards in-depth data analyses, it's highly customizable and that
 # can lead to a great steep learning curve. All great tools for insights, action and impact.
