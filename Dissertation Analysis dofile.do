* Dissertation Statistical Analysis

*Summary statistics
asdoc sum

*first hypothesis
xtreg change announcement energy lrev lempl netinc leverage roa sanctions stateowned, re robust

*2nd hypothesis
gen eannouncement = energy*announcement
asdoc xtreg change announcement lrev lempl netinc leverage roa sanctions stateowned if energy==1, re robust
asdoc xtreg change announcement lrev lempl netinc leverage roa sanctions stateowned if energy==0, re robust
asdoc xtreg change announcement energy lrev lempl netinc leverage roa sanctions stateowned eannouncement, re robust

*3rd hypothesis
reg change announcement energy lrev lempl netinc leverage roa sanctions stateowned eannouncement if us==1
est store us1est 
reg change announcement energy lrev lempl netinc leverage roa sanctions stateowned eannouncement if cn==1
est store cn1est
reg change announcement energy lrev lempl netinc leverage roa sanctions stateowned eannouncement if hk==1
est store hk1est
suest us1est cn1est hk1est
test [us1est_mean = cn1est_mean]: eannouncement
asdoc test [us1est_mean = cn1est_mean = hk1est_mean]: eannouncement

*4th hypothesis
gen rannouncement = renew*announcement
xtreg change announcement lrev lempl netinc leverage roa sanctions stateowned renew rannouncement if energy==1, re robust

xtreg change i.period energy lrev lempl netinc leverage roa sanctions stateowned if energy==0, re robust
xtreg change i.period energy lrev lempl netinc leverage roa sanctions stateowned if energy==1, re robust

*Possible robustness tests
*Hausman fixed v random
xtreg change announcement energy lrev lempl netinc leverage roa sanctions stateowned, fe 
est store fixed
xtreg change announcement energy lrev lempl netinc leverage roa sanctions stateowned, re 
est store random
hausman fixed random

xtreg change announcement, fe 
est store fixed
xtreg change announcement, re 
est store random
hausman fixed random

xtreg change announcement energy lrev lempl netinc leverage roa sanctions stateowned, fe 
est store fixed
xtreg change announcement energy lrev lempl netinc leverage roa sanctions stateowned, re 
est store random
hausman fixed random

*Breusch-Pagan LM
xtreg change announcement, re
xttest0
xtreg change energy, re
xttest0
xtreg change eannouncement, re
xttest0

*Test for serial correlation
xtserial change announcement
xtserial change energy
xtserial change eannouncement



