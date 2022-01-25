# triptych
This is a script to generate reverse mileages to waypoints for road trips. I tend not to get along with GPS apps and generally have a pretty good idea what is involved in the trip I'm taking, so what I really need is a gentle reminder of what roads I'm turning on and how far it is to them.

This script supports comments in the input file, prefixed with {{#}}, and a keyword {{RESET}}, which inserts a horizontal bar and resets the cumulative mileage. I use this to resynchronize the mileage at e.g. a planned overnight stop. Otherwise, the format is {{N L:R}} where {{N}} is an integer mileage, {{L}} is the road you're turning off of on the outbound leg, and {{R}} is the road you're turning onto on the outbound leg.

A proper example is forthcoming.
