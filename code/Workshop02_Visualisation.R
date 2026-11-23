# ============================================================
# MB5370 - Techniques in Marine Science 1
# WORKSHOP 2: DATA VISUALISATION WITH GGPLOT2
# ============================================================

# The goal of this workshop is to learn how to make graphs in R
# using ggplot2 and understand the "grammar of graphics".
#
# Basic idea:
# DATA + what variables we want to show + HOW we want to show them


# ============================================================
# 1. LOAD THE TIDYVERSE
# ============================================================

# The tidyverse is a collection of R packages for working with data.
# ggplot2 (the package we use to make graphs) is part of the tidyverse.

library(tidyverse)


# ============================================================
# 2. LOOK AT THE MPG DATASET
# ============================================================

# mpg is a dataset already built into ggplot2.
# We don't need to import anything.
#
# Important variables:
# displ = engine size in litres
# hwy   = highway fuel efficiency in miles per gallon
# class = type/class of vehicle
# drv   = drivetrain
# cyl   = number of cylinders

mpg

# Opens the help page if we want information about the dataset:
?mpg


# ============================================================
# 3. OUR FIRST GGPLOT
# ============================================================

# We want to ask:
# Is engine size related to fuel efficiency?
#
# x = engine size (displ)
# y = highway fuel efficiency (hwy)
#
# geom_point() tells R to represent each observation as a point.
# Therefore, this creates a SCATTERPLOT.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))


# INTERPRETATION:
# There is a negative relationship.
# As engine size increases, highway fuel efficiency tends to decrease.


# ============================================================
# 4. THE BASIC GGPLOT TEMPLATE
# ============================================================

# Most ggplots follow this general structure:
#
# ggplot(data = <DATA>) +
#   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
#
# DATA = what dataset are we using?
# GEOM = how should observations be displayed?
# aes() = which variables control visual properties?


# This creates ONLY the plotting area:
ggplot()

# Adding the dataset lets ggplot know what data are available,
# but we still haven't told it what variables to display.
ggplot(data = mpg)


# ============================================================
# 5. AESTHETICS - aes()
# ============================================================

# AESTHETICS are visual properties.
#
# Examples:
# x
# y
# colour
# size
# shape
# alpha (transparency)
#
# We can map these properties to VARIABLES in our dataset.


# ------------------------------------------------------------
# COLOUR
# ------------------------------------------------------------

# Here colour represents the variable "class".
# Different vehicle classes receive different colours.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))


# ------------------------------------------------------------
# SIZE
# ------------------------------------------------------------

# Here point size represents vehicle class.
# R warns us because class is categorical/discrete,
# while size works better for continuous variables.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))


# ------------------------------------------------------------
# ALPHA / TRANSPARENCY
# ------------------------------------------------------------

# Alpha controls transparency.
# Here transparency is mapped to vehicle class.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))


# ------------------------------------------------------------
# SHAPE
# ------------------------------------------------------------

# Different vehicle classes receive different point shapes.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))


# ============================================================
# 6. MAPPING VS SETTING AN AESTHETIC
# ============================================================

# THIS IS IMPORTANT.
#
# INSIDE aes():
# A visual property represents information from a VARIABLE.
#
# OUTSIDE aes():
# We manually make everything look the same.


# MAPPING:
# Colour tells us something about vehicle class.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))


# SETTING:
# Every point is blue.
# Blue does NOT represent another variable.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")


# Another example:
# Give all points the same transparency.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), alpha = 0.3)


# ============================================================
# 7. MAPPING A LOGICAL CONDITION
# ============================================================

# We can even map an aesthetic to a TRUE/FALSE condition.
#
# displ < 5 asks:
# "Is this car's engine smaller than 5 litres?"
#
# R separates TRUE and FALSE into different colours.

ggplot(data = mpg) +
  geom_point(mapping = aes(
    x = displ,
    y = hwy,
    colour = displ < 5
  ))


# ============================================================
# 8. FACETS - MAKING MULTIPLE PANELS
# ============================================================

# Facets split one graph into several smaller graphs.
# This is useful when we want to compare groups.


# ------------------------------------------------------------
# facet_wrap()
# ------------------------------------------------------------

# Make a separate panel for every vehicle class.
# nrow = 2 arranges those panels into two rows.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)


# ------------------------------------------------------------
# facet_grid()
# ------------------------------------------------------------

# facet_grid() can split the graph using TWO variables.
#
# Rows = drv
# Columns = cyl

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)


# If we only want columns, use "." for the rows.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)


# ============================================================
# 9. GEOMS
# ============================================================

# A GEOM determines how the data are visually represented.
#
# Examples:
# geom_point()     = points/scatterplot
# geom_smooth()    = fitted/smoothed line
# geom_line()      = line
# geom_boxplot()   = boxplot
# geom_histogram() = histogram
# geom_bar()       = bar chart


# Our original scatterplot:

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))


# Now display the relationship using a smooth line:

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))


# ============================================================
# 10. GROUPING SMOOTH LINES
# ============================================================

# drv describes drivetrain.
#
# Mapping linetype to drv produces different line styles
# for the different drivetrain categories.

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(
      x = displ,
      y = hwy,
      linetype = drv
    )
  )


# We can instead GROUP the data by drv.
# This produces separate smooths for each drivetrain.

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(
      x = displ,
      y = hwy,
      group = drv
    )
  )


# Or make each drivetrain's line a different colour.

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(
      x = displ,
      y = hwy,
      colour = drv
    ),
    show.legend = FALSE
  )


# ============================================================
# 11. MULTIPLE GEOMS ON ONE GRAPH
# ============================================================

# This is one of the really useful features of ggplot.
#
# We can show the raw observations AND a smooth relationship
# on the SAME graph.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))


# But notice we wrote:
#
# x = displ, y = hwy
#
# TWICE.
#
# That's unnecessary and gives us more opportunities to make
# mistakes.


# ============================================================
# 12. GLOBAL MAPPINGS
# ============================================================

# Instead, put mappings that ALL layers use inside ggplot().
#
# Both geom_point() and geom_smooth() inherit these mappings.

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy)
) +
  geom_point() +
  geom_smooth()


# This is cleaner and easier to edit.


# ============================================================
# 13. LAYER-SPECIFIC AESTHETICS
# ============================================================

# We can still give ONE layer an extra aesthetic.
#
# Here:
# BOTH layers use x = displ and y = hwy
# ONLY the points are coloured by class.

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy)
) +
  geom_point(mapping = aes(colour = class)) +
  geom_smooth()


# ============================================================
# 14. USING DIFFERENT DATA IN A LAYER
# ============================================================

# filter() selects observations meeting a condition.
#
# Here the points show ALL vehicles,
# but the smooth line is calculated only for subcompact cars.

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy)
) +
  geom_point(mapping = aes(colour = class)) +
  geom_smooth(
    data = filter(mpg, class == "subcompact"),
    se = FALSE
  )


# ============================================================
# 15. THE DIAMONDS DATASET
# ============================================================

# Now the workbook switches to another built-in dataset:
# diamonds.
#
# It contains information about approximately 54,000 diamonds.

diamonds


# ============================================================
# 16. BAR CHARTS AND STATISTICAL TRANSFORMATIONS
# ============================================================

# geom_bar() automatically COUNTS observations.
#
# Here R counts how many diamonds belong to each cut category.

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))


# stat_count() can produce the same result.

ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))


# WHY?
#
# Some geoms display raw values.
# Others calculate something before plotting.
#
# That calculation is called a STATISTICAL TRANSFORMATION
# (or "stat").


# ============================================================
# 17. OVERRIDING THE DEFAULT STAT
# ============================================================

# First, create a small example dataset.
# tribble() is simply a convenient way to manually create a table.

demo <- tribble(
  ~cut,        ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good", 12082,
  "Premium",   13791,
  "Ideal",     21551
)

demo


# Here we ALREADY have the frequency values.
# We don't want geom_bar() to count rows.
#
# stat = "identity" means:
# "Use the actual y values I gave you."

ggplot(data = demo) +
  geom_bar(
    mapping = aes(x = cut, y = freq),
    stat = "identity"
  )


# ============================================================
# 18. STAT_SUMMARY()
# ============================================================

# stat_summary() calculates summaries of the data.
#
# Here:
# minimum = bottom
# maximum = top
# median  = central value

ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )


# ============================================================
# 19. COLOUR VS FILL IN BAR CHARTS
# ============================================================

# colour changes the OUTLINE of bars.

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, colour = cut))


# fill changes the INSIDE of bars.

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))


# We can fill according to ANOTHER variable.
# This automatically creates stacked bars.

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))


# ============================================================
# 20. POSITION ADJUSTMENTS
# ============================================================

# Position controls what ggplot does when graphical objects
# would otherwise overlap.


# ------------------------------------------------------------
# IDENTITY
# ------------------------------------------------------------

# Places observations at their actual positions.
# Transparency helps us see overlapping bars.

ggplot(
  data = diamonds,
  mapping = aes(x = cut, fill = clarity)
) +
  geom_bar(
    alpha = 1/5,
    position = "identity"
  )


# ------------------------------------------------------------
# FILL
# ------------------------------------------------------------

# position = "fill" makes every bar the same total height.
#
# This is useful for comparing PROPORTIONS rather than counts.

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "fill"
  )


# ------------------------------------------------------------
# DODGE
# ------------------------------------------------------------

# position = "dodge" puts groups BESIDE each other
# instead of stacking them.

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "dodge"
  )


# ------------------------------------------------------------
# JITTER
# ------------------------------------------------------------

# Jitter moves overlapping points slightly apart.
# This makes it easier to see observations that would otherwise
# be plotted directly on top of one another.

ggplot(data = mpg) +
  geom_point(
    mapping = aes(x = displ, y = hwy),
    position = "jitter"
  )


# ============================================================
# 21. FINAL GGPLOT TEMPLATE
# ============================================================

# By the end of Workshop 2, our original template has expanded.
#
# DON'T RUN THIS SECTION because <DATA>, <STAT>, etc. are
# placeholders rather than actual R objects.
#
# ggplot(data = <DATA>) +
#   <GEOM_FUNCTION>(
#     mapping = aes(<MAPPINGS>),
#     stat = <STAT>,
#     position = <POSITION>
#   ) +
#   <FACET_FUNCTION>


# ============================================================
# WORKSHOP 2 - THE BIG PICTURE
# ============================================================

# When making a ggplot, think:
#
# 1. DATA
#    What dataset am I plotting?
#
# 2. AESTHETICS
#    What variables do I want to show?
#    x, y, colour, fill, shape, size, etc.
#
# 3. GEOM
#    HOW should those data be represented?
#    Points? Bars? Lines? Boxplots?
#
# 4. STAT
#    Does R need to calculate something before plotting?
#
# 5. POSITION
#    What should happen when observations overlap?
#
# 6. FACET
#    Do I want separate panels for different groups?


# ============================================================
# MOST IMPORTANT THING TO REMEMBER
# ============================================================

# Basic ggplot:
#
# ggplot(data = my_data) +
#   geom_something(mapping = aes(x = x_variable,
#                                y = y_variable))
#
#
# Multiple layers:
#
# ggplot(data = my_data,
#        mapping = aes(x = x_variable, y = y_variable)) +
#   geom_point() +
#   geom_smooth()
#
#
# INSIDE aes() = map an appearance to DATA
# OUTSIDE aes() = manually SET an appearance
#
# Example:
#
# aes(colour = species)  -> colour represents species
# colour = "blue"        -> everything is blue