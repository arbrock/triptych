# triptych
This is a script to generate reverse mileages to waypoints for road trips. I tend not to get along with GPS apps and generally have a pretty good idea what is involved in the trip I'm taking, so what I really need is a gentle reminder of what roads I'm turning on and how far it is to them.

This script supports comments in the input file, prefixed with `#`, and a keyword `RESET`, which inserts a horizontal bar and resets the cumulative mileage. I use this to resynchronize the mileage at e.g. a planned overnight stop. Otherwise, the format is `N L:R` where `N` is an integer mileage, `L` is the road you're turning off of on the outbound leg, and `R` is the road you're turning onto on the outbound leg.

[cannonball.txt](/examples/cannonball.txt) has a portion of the Cannonball Run documented in the proper format. The output looks like:
```
0       Red Ball Garage 802
2       Lincoln Tunnel  800
5       NJ-495  NJ-3    797
19      NJ-3    I-80    783
73      NJ      PA      729
384     PA      OH      418
620     OH      IN      182
772     IN      IL      30
802     Joliet          0
==============================
0       Joliet          1050
133     IL      IA      917
438     IA      NE      612
790     I-80    I-76    260
793     NE      CO      257
977     I-76    I-70    73
1050    Copper Mountain 0
==============================
0       Copper Mountain 197
197     CO-UT           0
```
