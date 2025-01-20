%%%%% geotimescale.m
%%%% plots the geological timescale
%%%% from GSA time scale v5.0
%%%% note: Cenozoic and Silurian plots Epochs instead of Ages
%%%% coded (laboriously) by Benjamin Mills 2022

%%%%% horizontal line points
toppoint_eons = 0 ;
botpoint_eons = -2 ;
toppoint_eras = -2 ;
botpoint_eras = -4 ;
toppoint_periods = -4 ;
botpoint_periods = -6 ;
toppoint_ages = -6 ;
botpoint_ages = -8 ;


%%%% Geological period timings
hadean_period_start = -4540 ;
hadean_period_end = -4000 ;
eoarchean_period_start = hadean_period_end ;
eoarchean_period_end = -3600 ;
paleoarchean_period_start = eoarchean_period_end ;
paleoarchean_period_end = -3200 ;
mesoarchean_period_start = paleoarchean_period_end ;
mesoarchean_period_end = -2800 ;
neoarchean_period_start = mesoarchean_period_end ;
neoarchean_period_end = -2500 ;
siderian_start = neoarchean_period_end ;
siderian_end = -2300 ;
rhyacian_start = siderian_end ;
rhyacian_end = -2050 ;
orosirian_start = rhyacian_end ;
orosirian_end = -1800 ;
statherian_start = orosirian_end ;
statherian_end = -1600 ;
calymmian_start = statherian_end ; 
calymmian_end = -1400 ;
ectasian_start = calymmian_end ;
ectasian_end = -1200 ;
stenian_start = ectasian_end ;
stenian_end = -1000 ;
tonian_start = stenian_end ;
tonian_end = -720 ;
cryogenian_start = tonian_end ;
cryogenian_end = -635 ;
ediacaran_start = cryogenian_end ;
ediacaran_end = -541 ;
cambrian_start = ediacaran_end ;
cambrian_end = -485.4 ;
ordovician_start = cambrian_end ;
ordovician_end = -443.8 ;
silurian_start = ordovician_end ;
silurian_end = -419.2 ;
devonian_start = silurian_end ;
devonian_end = -358.9 ;
carboniferous_start = devonian_end ;
carboniferous_end = -298.9 ;
permian_start = carboniferous_end ;
permian_end = -251.9 ;
triassic_start = permian_end ;
triassic_end = -201.3 ;
jurassic_start = triassic_end ;
jurassic_end = -145 ;
cretaceous_start = jurassic_end ;
cretaceous_end = -66 ;
paleogene_start = cretaceous_end ;
paleogene_end = -23.03 ;
neogene_start = paleogene_end ;
neogene_end = -2.58 ;
quaternary_start = neogene_end ;
quaternary_end = 0 ;

%%%% Geological periods colors
hadean_period_color = [ 234 69 101 ]/255 ;
eoarchean_period_color = [ 228 27 152 ]/255 ;
paleoarchean_period_color =  [ 244 102 186 ]/255 ;
mesoarchean_period_color = [ 246 128 189 ]/255 ;
neoarchean_period_color = [ 247 153 199 ]/255 ;
siderian_color = [ 242 80 137 ]/255 ;
rhyacian_color = [ 243 92 149 ]/255 ;
orosirian_color = [ 244 104 161 ]/255 ;
statherian_color = [ 245 116 175 ]/255 ;
calymmian_color = [ 250 190 128 ]/255 ;
ectasian_color = [ 251 202 142 ]/255 ;
stenian_color = [ 252 214 156 ]/255 ;
tonian_color =  [250 189 85]/255 ; 
cryogenian_color =  [251 201 97]/255 ;
ediacaran_color =  [252 213 122]/255 ;
cambrian_color =  [131 173 106]/255 ;
ordovician_color = [0 169 144]/255 ;
silurian_color =  [179 228 194]/255 ;
devonian_color = [202 149 71]/255 ;
carboniferous_color = [105 178 176]/255 ;
permian_color = [231 77 64]/255 ;
triassic_color = [138 62 164]/255 ;
jurassic_color = [51 189 233]/255 ;
cretaceous_color = [128 207 92]/255 ;
paleogene_color = [248 155 92]/255 ;
neogene_color = [253 221 4]/255 ;
quaternary_color = [255 248 128]/255 ;

%%%% Ages/epochs timings
%%%% Cambrian
fortunian_start = -541 ; 
fortunian_end = -529 ;
age2_start = fortunian_end ;
age2_end = -521 ;
age3_start = age2_end ;
age3_end = -514 ;
age4_start = age3_end ;
age4_end = -509 ;
age5_start = age4_end ;
age5_end = -504.5 ;
drumian_start = age5_end ;
drumian_end = -500.5 ;
guzhangian_start = drumian_end ;
guzhangian_end = -497 ;
paibian_start = guzhangian_end ;
paibian_end = -494 ;
jiangshanian_start = paibian_end ;
jiangshanian_end = -489.5 ;
age10_start= jiangshanian_end ;
age10_end = -485.4 ;
%%%% Ordovician ;
tremadocian_start = age10_end ;
tremadocian_end = -477.7 ;
floian_start = tremadocian_end ;
floian_end = -470 ;
dapingian_start = floian_end ;
dapingian_end = -467.3 ;
darriwilian_start = dapingian_end ;
darriwilian_end = -458.4 ;
sandbian_start = darriwilian_end ;
sandbian_end = -453.0 ;
katian_start = sandbian_end ;
katian_end = -445.2 ;
hirnantian_start = katian_end ;
hirnantian_end = -443.8 ;
%%%% Silurian (Epochs not ages here)
llandovery_start = hirnantian_end ;
llandovery_end = -433.4 ;
wenlock_start = llandovery_end ;
wenlock_end = -427.4 ;
ludlow_start = wenlock_end ;
ludlow_end = -423 ;
pridoli_start = ludlow_end ;
pridoli_end = -419.2 ;
%%%% Devonian
lochkovian_start = pridoli_end ;
lochkovian_end = -410.8 ;
pragian_start = lochkovian_end ;
pragian_end = -407.6 ;
emsian_start = pragian_end ;
emsian_end = -393.3 ;
eifelian_start = emsian_end ;
eifelian_end = -387.7 ;
givetian_start = eifelian_end ;
givetian_end = -382.7 ;
frasnian_start = givetian_end ;
frasnian_end = -372.2 ;
famennian_start = frasnian_end ;
famennian_end = -358.9 ;
%%%% Carboniferous
tournaisian_start = famennian_end ;
tournaisian_end = -346.7 ;
visean_start = tournaisian_end ;
visean_end = -330.9 ;
serpukhovian_start = visean_end ;
serpukhovian_end = -323.2 ;
bashkirian_start = serpukhovian_end ;
bashkirian_end = -315.2 ;
moscovian_start = bashkirian_end ;
moscovian_end = -307.0 ;
kasimovian_start = moscovian_end ;
kasimovian_end = -303.7 ;
gzhelian_start = kasimovian_end ;
gzhelian_end = -298.9 ;
%%%% Permian
asselian_start = gzhelian_end ;
asselian_end = -295.0 ;
sakmarian_start = asselian_end ;
sakmarian_end = -290.1 ;
artinskian_start = sakmarian_end ;
artinskian_end = -283.5 ;
kungurian_start = artinskian_end ;
kungurian_end = -272.95 ;
roadian_start = kungurian_end ;
roadian_end = -268.8 ;
wordian_start = roadian_end ;
wordian_end = -265.1 ;
capitanian_start = wordian_end ;
capitanian_end = -259.1 ;
wuchiapingian_start = capitanian_end ;
wuchiapingian_end = -254.14 ;
changhsingian_start = wuchiapingian_end ;
changhsingian_end = -251.9 ;
%%%% triassic
induan_start = changhsingian_end ;
induan_end = -249.9 ;
olenekian_start = induan_end ;
olenekian_end = -246.7 ;
anisian_start = olenekian_end ;
anisian_end = -241.5 ;
ladinian_start = anisian_end ;
ladinian_end = -237 ;
carnian_start = ladinian_end ;
carnian_end = -227 ;
norian_start = carnian_end ;
norian_end = -208.5 ;
rhaetian_start = norian_end ;
rhaetian_end = -201.3 ;
%%%% jurassic
hettangian_start = rhaetian_end ;
hettangian_end = -199.3 ;
sinemurian_start = hettangian_end ;
sinemurian_end = -190.8 ;
pliensbachian_start = sinemurian_end ;
pliensbachian_end = -182.7 ;
toarcian_start = pliensbachian_end ;
toarcian_end = -174.1 ;
aalenian_start = toarcian_end ;
aalenian_end = -170.3 ; 
bajocian_start = aalenian_end ;
bajocian_end = -168.3 ;
bathonian_start = bajocian_end ;
bathonian_end = -166.1 ;
callovian_start = bathonian_end ;
callovian_end = -163.5 ;
oxfordian_start = callovian_end ;
oxfordian_end = -157.3 ;
kimmeridgian_start = oxfordian_end ;
kimmeridgian_end = -152.1 ;
tithonian_start = kimmeridgian_end ;
tithonian_end = -145 ;
%%%% Cretaceous
berriasian_start = tithonian_end ;
berriasian_end = -139.8 ;
valanginian_start = berriasian_end ;
valanginian_end = -132.9 ; 
hauterivian_start = valanginian_end ;
hauterivian_end = -129.4 ;
barremian_start = hauterivian_end ;
barremian_end = -125 ;
aptian_start = barremian_end ;
aptian_end = -113 ;
albian_start = aptian_end ;
albian_end = -100.5; 
cenomanian_start = albian_end ;
cenomanian_end = -93.9 ;
turonian_start = cenomanian_end ;
turonian_end = -89.8 ;
coniacian_start = turonian_end ; 
coniacian_end = -86.3 ; 
santonian_start = coniacian_end ;
santonian_end = -83.6 ;
campanian_start = santonian_end ;
campanian_end = -72.1;
maastrichtian_start = campanian_end ;
maastrichtian_end = -66 ;
%%%% Cenozoic (Epochs not ages here)
paleocene_start = maastrichtian_end ;
paleocene_end = -56 ;
eocene_start = paleocene_end ;
eocene_end = -33.9 ;
oligocene_start = eocene_end ;
oligocene_end = -23.03 ;
miocene_start = oligocene_end ;
miocene_end = -5.333 ;
pliocene_start = miocene_end ;
pliocene_end = -2.58 ;
pleistocene_start = pliocene_end ;
pleistocene_end = -0.012 ;
holocene_start = pleistocene_end ;
holocene_end = 0 ;

%%%% Ages/Epochs colors
%%%% Cambrian
fortunian_color = [154 189 133]/255 ; 
age2_color = [167 192 142]/255 ; 
age3_color = [166 202 145]/255 ; 
age4_color = [179 206 154]/255 ; 
age5_color = [179 216 157]/255 ; 
drumian_color = [179 216 157]/255 ; 
guzhangian_color = [204 224 178]/255 ; 
paibian_color = [204 235 181]/255 ; 
jiangshanian_color = [217 240 192]/255 ; 
age10_color = [230 244 204]/255 ; 
%%%% Ordovician ;
tremadocian_color = [51 185 153]/255 ;  
floian_color = [64 190 161]/255 ; 
dapingian_color = [102 202 166]/255 ; 
darriwilian_color = [115 207 175]/255 ; 
sandbian_color = [140 214 163]/255 ; 
katian_color = [153 218 173]/255 ; 
hirnantian_color = [166 223 183]/255 ; 
%%%% Silurian (Epochs not ages here)
llandovery_color = [153 220 194]/255 ; 
wenlock_color = [179 228 205]/255 ; 
ludlow_color = [191 233 216]/255 ; 
pridoli_color = [191 233 216]/255 ; 
%%%% Devonian
lochkovian_color = [227 185 99]/255 ; 
pragian_color = [227 196 112]/255 ; 
emsian_color = [228 207 124]/255 ; 
eifelian_color = [240 210 123]/255 ; 
givetian_color = [241 222 137]/255 ; 
frasnian_color = [241 235 176]/255 ; 
famennian_color = [241 236 200]/255 ; 
%%%% Carboniferous
tournaisian_color = [142 185 125]/255 ; 
visean_color = [167 191 122]/255 ; 
serpukhovian_color = [191 198 118]/255 ; 
bashkirian_color = [154 200 197]/255 ; 
moscovian_color = [179 207 197]/255 ; 
kasimovian_color =[191 211 207]/255 ; 
gzhelian_color = [203 214 207]/255 ; 
%%%% Permian
asselian_color = [223 107 98]/255 ; 
sakmarian_color = [223 118 108]/255 ; 
artinskian_color = [224 129 119]/255 ; 
kungurian_color = [224 140 130]/255 ; 
roadian_color = [246 131 117]/255 ; 
wordian_color = [247 142 128]/255 ; 
capitanian_color = [248 154 141]/255 ; 
wuchiapingian_color = [249 178 168]/255 ; 
changhsingian_color = [250 191 183]/255 ; 
%%%% triassic
induan_color = [168 80 174]/255 ; 
olenekian_color = [179 90 180]/255 ; 
anisian_color = [190 123 196]/255 ; 
ladinian_color = [201 136 202]/255 ; 
carnian_color = [202 159 213]/255 ; 
norian_color = [214 172 219]/255 ; 
rhaetian_color = [226 186 225]/255 ; 
%%%% jurassic
hettangian_color = [78 189 239]/255 ; 
sinemurian_color = [103 197 240]/255 ; 
pliensbachian_color = [128 205 242]/255 ; 
toarcian_color = [153 212 243]/255 ; 
aalenian_color = [153 222 238]/255 ; 
bajocian_color = [166 226 238]/255 ; 
bathonian_color = [179 230 239]/255 ; 
callovian_color = [191 234 239]/255 ; 
oxfordian_color = [191 234 251]/255 ; 
kimmeridgian_color = [204 239 252]/255 ; 
tithonian_color = [217 243 253]/255 ; 
%%%% Cretaceous
berriasian_color = [140 211 110]/255 ; 
valanginian_color = [153 216 119]/255 ; 
hauterivian_color = [166 220 128]/255 ; 
barremian_color = [179 225 137]/255 ; 
aptian_color = [191 229 147]/255 ; 
albian_color = [204 234 157]/255 ; 
cenomanian_color = [179 223 92]/255 ; 
turonian_color = [191 227 101]/255 ; 
coniacian_color = [204 232 110]/255 ; 
santonian_color = [217 236 120]/255 ; 
campanian_color = [230 241 131]/255 ; 
maastrichtian_color = [242 245 142]/255 ; 
%%%% Cenozoic (Epochs not ages here)
paleocene_color = [249 166 104]/255 ; 
eocene_color = [249 178 116]/255 ; 
oligocene_color = [252 214 156]/255 ; 
miocene_color = [255 242 0]/255 ; 
pliocene_color = [255 250 153]/255 ; 
pleistocene_color = [254 239 175]/255 ; 
holocene_color = [254 241 224]/255 ; 


%%%% Eras timings
hadean_era_start = hadean_period_start ;
hadean_era_end = hadean_period_end ;
eoarchean_start = hadean_era_end ;
eoarchean_end = eoarchean_period_end ;
paleoarchean_start = paleoarchean_period_start ;
paleoarchean_end = paleoarchean_period_end ;
mesoarchean_start = mesoarchean_period_start ;
mesoarchean_end = mesoarchean_period_end ;
neoarchean_start = neoarchean_period_start ;
neoarchean_end = neoarchean_period_end ;
paleoproterozoic_start = neoarchean_end ;
paleoproterozoic_end = -1600 ;
mesoproterozoic_start = paleoproterozoic_end ;
mesoproterozoic_end = -1000 ;
neoproterozoic_start = mesoproterozoic_end  ;
neoproterozoic_end = -541 ;
paleozoic_start = neoproterozoic_end ;
paleozoic_end = permian_end ;
mesozoic_start = paleozoic_end ;
mesozoic_end = cretaceous_end ;
cenozoic_start = mesozoic_end ;
cenozoic_end = 0 ;

%%%% Eras colors
hadean_era_color = [ 225 47 82 ]/255 ; 
eoarchean_color = [ 217 5 141 ]/255 ; 
paleoarchean_color = [ 241 64 169 ]/255 ; 
mesoarchean_color = [ 244 103 178 ]/255 ; 
neoarchean_color = [ 247 153 199 ]/255 ; 
paleoproterozoic_color = [ 241 69 126 ]/255 ; 
mesoproterozoic_color = [ 249 178 105 ]/255 ; 
neoproterozoic_color = [ 250 178 74 ]/255 ; 
paleozoic_color = [ 154 199 156 ]/255 ; 
mesozoic_color = [ 102 205 226 ]/255 ; 
cenozoic_color = [ 242 238 4 ]/255 ; 

%%%% Eons timings
hadean_start = -4540 ;
hadean_end = -4000 ;
archean_start = hadean_end  ;
archean_end = -2500 ;
proterozoic_start = archean_end ;
proterozoic_end = -541 ;
phanerozoic_start = proterozoic_end;
phanerozoic_end = 0 ;

%%%% Eons colors ;
hadean_color = [ 218 36 72 ]/255 ; 
archean_color = [ 237 13 146 ]/255 ; 
proterozoic_color = [ 240 58 116 ]/255 ; 
phanerozoic_color = [ 154 217 221 ]/255 ; 

%%% plot Eons
patch([hadean_start hadean_end hadean_end hadean_start],[botpoint_eons botpoint_eons toppoint_eons toppoint_eons],hadean_color) ;
hold on
patch([archean_start archean_end archean_end archean_start],[botpoint_eons botpoint_eons toppoint_eons toppoint_eons],archean_color) ;
patch([proterozoic_start proterozoic_end proterozoic_end proterozoic_start],[botpoint_eons botpoint_eons toppoint_eons toppoint_eons],proterozoic_color) ;
patch([phanerozoic_start phanerozoic_end phanerozoic_end phanerozoic_start],[botpoint_eons botpoint_eons toppoint_eons toppoint_eons],phanerozoic_color) ;

%%% plot Eras
patch([hadean_era_start hadean_era_end hadean_era_end hadean_era_start],[botpoint_eras botpoint_eras toppoint_eras toppoint_eras],hadean_era_color) ;
patch([eoarchean_start eoarchean_end eoarchean_end eoarchean_start],[botpoint_eras botpoint_eras toppoint_eras toppoint_eras],eoarchean_color) ;
patch([paleoarchean_start paleoarchean_end paleoarchean_end paleoarchean_start],[botpoint_eras botpoint_eras toppoint_eras toppoint_eras],paleoarchean_color) ;
patch([mesoarchean_start mesoarchean_end mesoarchean_end mesoarchean_start],[botpoint_eras botpoint_eras toppoint_eras toppoint_eras],mesoarchean_color) ;
patch([neoarchean_start neoarchean_end neoarchean_end neoarchean_start],[botpoint_eras botpoint_eras toppoint_eras toppoint_eras],neoarchean_color) ;
patch([paleoproterozoic_start paleoproterozoic_end paleoproterozoic_end paleoproterozoic_start],[botpoint_eras botpoint_eras toppoint_eras toppoint_eras],paleoproterozoic_color) ;
patch([mesoproterozoic_start mesoproterozoic_end mesoproterozoic_end mesoproterozoic_start],[botpoint_eras botpoint_eras toppoint_eras toppoint_eras],mesoproterozoic_color) ;
patch([neoproterozoic_start neoproterozoic_end neoproterozoic_end neoproterozoic_start],[botpoint_eras botpoint_eras toppoint_eras toppoint_eras],neoproterozoic_color) ;
patch([paleozoic_start paleozoic_end paleozoic_end paleozoic_start],[botpoint_eras botpoint_eras toppoint_eras toppoint_eras],paleozoic_color) ;
patch([mesozoic_start mesozoic_end mesozoic_end mesozoic_start],[botpoint_eras botpoint_eras toppoint_eras toppoint_eras],mesozoic_color) ;
patch([cenozoic_start cenozoic_end cenozoic_end cenozoic_start],[botpoint_eras botpoint_eras toppoint_eras toppoint_eras],cenozoic_color) ;


%%% plot periods
patch([hadean_period_start hadean_period_end hadean_period_end hadean_period_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],hadean_period_color) ;
patch([eoarchean_period_start eoarchean_period_end eoarchean_period_end eoarchean_period_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],eoarchean_period_color) ;
patch([paleoarchean_period_start paleoarchean_period_end paleoarchean_period_end paleoarchean_period_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],paleoarchean_period_color) ;
patch([mesoarchean_period_start mesoarchean_period_end mesoarchean_period_end mesoarchean_period_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],mesoarchean_period_color) ;
patch([neoarchean_period_start neoarchean_period_end neoarchean_period_end neoarchean_period_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],neoarchean_period_color) ;
patch([siderian_start siderian_end siderian_end siderian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],siderian_color) ;
patch([rhyacian_start rhyacian_end rhyacian_end rhyacian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],rhyacian_color) ;
patch([orosirian_start orosirian_end orosirian_end orosirian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],orosirian_color) ;
patch([statherian_start statherian_end statherian_end statherian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],statherian_color) ;
patch([calymmian_start calymmian_end calymmian_end calymmian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],calymmian_color) ;
patch([ectasian_start ectasian_end ectasian_end ectasian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],ectasian_color) ;
patch([stenian_start stenian_end stenian_end stenian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],stenian_color) ;
patch([tonian_start tonian_end tonian_end tonian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],tonian_color) ;
patch([cryogenian_start cryogenian_end cryogenian_end cryogenian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],cryogenian_color) ;
patch([ediacaran_start ediacaran_end ediacaran_end ediacaran_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],ediacaran_color) ;
patch([cambrian_start cambrian_end cambrian_end cambrian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],cambrian_color) ;
patch([ordovician_start ordovician_end ordovician_end ordovician_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],ordovician_color) ;
patch([silurian_start silurian_end silurian_end silurian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],silurian_color) ;
patch([devonian_start devonian_end devonian_end devonian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],devonian_color) ;
patch([carboniferous_start carboniferous_end carboniferous_end carboniferous_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],carboniferous_color) ;
patch([permian_start permian_end permian_end permian_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],permian_color) ;
patch([triassic_start triassic_end triassic_end triassic_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],triassic_color) ;
patch([jurassic_start jurassic_end jurassic_end jurassic_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],jurassic_color) ;
patch([cretaceous_start cretaceous_end cretaceous_end cretaceous_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],cretaceous_color) ;
patch([paleogene_start paleogene_end paleogene_end paleogene_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],paleogene_color) ;
patch([neogene_start neogene_end neogene_end neogene_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],neogene_color) ;
patch([quaternary_start quaternary_end quaternary_end quaternary_start],[botpoint_periods botpoint_periods toppoint_periods toppoint_periods],quaternary_color) ;

%%% plot ages/epochs
patch([fortunian_start fortunian_end fortunian_end fortunian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],fortunian_color) ;
patch([age2_start age2_end age2_end age2_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],age2_color) ;
patch([age3_start age3_end age3_end age3_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],age3_color) ;
patch([age4_start age4_end age4_end age4_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],age4_color) ;
patch([age5_start age5_end age5_end age5_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],age5_color) ;
patch([drumian_start drumian_end drumian_end drumian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],drumian_color) ;
patch([guzhangian_start guzhangian_end guzhangian_end guzhangian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],guzhangian_color) ;
patch([paibian_start paibian_end paibian_end paibian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],paibian_color) ;
patch([jiangshanian_start jiangshanian_end jiangshanian_end jiangshanian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],jiangshanian_color) ;
patch([age10_start age10_end age10_end age10_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],age10_color) ;
patch([tremadocian_start tremadocian_end tremadocian_end tremadocian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],tremadocian_color) ;
patch([floian_start floian_end floian_end floian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],floian_color) ;
patch([dapingian_start dapingian_end dapingian_end dapingian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],dapingian_color) ;
patch([darriwilian_start darriwilian_end darriwilian_end darriwilian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],darriwilian_color) ;
patch([sandbian_start sandbian_end sandbian_end sandbian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],sandbian_color) ;
patch([katian_start katian_end katian_end katian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],katian_color) ;
patch([hirnantian_start hirnantian_end hirnantian_end hirnantian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],hirnantian_color) ;
patch([llandovery_start llandovery_end llandovery_end llandovery_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],llandovery_color) ;
patch([wenlock_start wenlock_end wenlock_end wenlock_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],wenlock_color) ;
patch([ludlow_start ludlow_end ludlow_end ludlow_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],ludlow_color) ;
patch([pridoli_start pridoli_end pridoli_end pridoli_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],pridoli_color) ;
patch([lochkovian_start lochkovian_end lochkovian_end lochkovian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],lochkovian_color) ;
patch([pragian_start pragian_end pragian_end pragian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],pragian_color) ;
patch([emsian_start emsian_end emsian_end emsian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],emsian_color) ;
patch([eifelian_start eifelian_end eifelian_end eifelian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],eifelian_color) ;
patch([givetian_start givetian_end givetian_end givetian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],givetian_color) ;
patch([frasnian_start frasnian_end frasnian_end frasnian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],frasnian_color) ;
patch([famennian_start famennian_end famennian_end famennian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],famennian_color) ;
patch([tournaisian_start tournaisian_end tournaisian_end tournaisian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],tournaisian_color) ;
patch([visean_start visean_end visean_end visean_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],visean_color) ;
patch([serpukhovian_start serpukhovian_end serpukhovian_end serpukhovian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],serpukhovian_color) ;
patch([bashkirian_start bashkirian_end bashkirian_end bashkirian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],bashkirian_color) ;
patch([moscovian_start moscovian_end moscovian_end moscovian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],moscovian_color) ;
patch([kasimovian_start kasimovian_end kasimovian_end kasimovian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],kasimovian_color) ;
patch([gzhelian_start gzhelian_end gzhelian_end gzhelian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],gzhelian_color) ;
patch([asselian_start asselian_end asselian_end asselian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],asselian_color) ;
patch([sakmarian_start sakmarian_end sakmarian_end sakmarian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],sakmarian_color) ;
patch([artinskian_start artinskian_end artinskian_end artinskian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],artinskian_color) ;
patch([kungurian_start kungurian_end kungurian_end kungurian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],kungurian_color) ;
patch([roadian_start roadian_end roadian_end roadian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],roadian_color) ;
patch([wordian_start wordian_end wordian_end wordian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],wordian_color) ;
patch([capitanian_start capitanian_end capitanian_end capitanian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],capitanian_color) ;
patch([wuchiapingian_start wuchiapingian_end wuchiapingian_end wuchiapingian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],wuchiapingian_color) ;
patch([changhsingian_start changhsingian_end changhsingian_end changhsingian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],changhsingian_color) ;
patch([induan_start induan_end induan_end induan_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],induan_color) ;
patch([olenekian_start olenekian_end olenekian_end olenekian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],olenekian_color) ;
patch([anisian_start anisian_end anisian_end anisian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],anisian_color) ;
patch([ladinian_start ladinian_end ladinian_end ladinian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],ladinian_color) ;
patch([carnian_start carnian_end carnian_end carnian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],carnian_color) ;
patch([norian_start norian_end norian_end norian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],norian_color) ;
patch([rhaetian_start rhaetian_end rhaetian_end rhaetian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],rhaetian_color) ;
patch([hettangian_start hettangian_end hettangian_end hettangian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],hettangian_color) ;
patch([sinemurian_start sinemurian_end sinemurian_end sinemurian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],sinemurian_color) ;
patch([pliensbachian_start pliensbachian_end pliensbachian_end pliensbachian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],pliensbachian_color) ;
patch([toarcian_start toarcian_end toarcian_end toarcian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],toarcian_color) ;
patch([aalenian_start aalenian_end aalenian_end aalenian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],aalenian_color) ;
patch([bajocian_start bajocian_end bajocian_end bajocian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],bajocian_color) ;
patch([bathonian_start bathonian_end bathonian_end bathonian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],bathonian_color) ;
patch([callovian_start callovian_end callovian_end callovian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],callovian_color) ;
patch([oxfordian_start oxfordian_end oxfordian_end oxfordian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],oxfordian_color) ;
patch([kimmeridgian_start kimmeridgian_end kimmeridgian_end kimmeridgian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],kimmeridgian_color) ;
patch([tithonian_start tithonian_end tithonian_end tithonian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],tithonian_color) ;
patch([berriasian_start berriasian_end berriasian_end berriasian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],berriasian_color) ;
patch([valanginian_start valanginian_end valanginian_end valanginian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],valanginian_color) ;
patch([hauterivian_start hauterivian_end hauterivian_end hauterivian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],hauterivian_color) ;
patch([barremian_start barremian_end barremian_end barremian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],barremian_color) ;
patch([aptian_start aptian_end aptian_end aptian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],aptian_color) ;
patch([albian_start albian_end albian_end albian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],albian_color) ;
patch([cenomanian_start cenomanian_end cenomanian_end cenomanian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],cenomanian_color) ;
patch([turonian_start turonian_end turonian_end turonian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],turonian_color) ;
patch([coniacian_start coniacian_end coniacian_end coniacian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],coniacian_color) ;
patch([santonian_start santonian_end santonian_end santonian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],santonian_color) ;
patch([campanian_start campanian_end campanian_end campanian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],campanian_color) ;
patch([maastrichtian_start maastrichtian_end maastrichtian_end maastrichtian_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],maastrichtian_color) ;
patch([paleocene_start paleocene_end paleocene_end paleocene_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],paleocene_color) ;
patch([eocene_start eocene_end eocene_end eocene_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],eocene_color) ;
patch([oligocene_start oligocene_end oligocene_end oligocene_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],oligocene_color) ;
patch([miocene_start miocene_end miocene_end miocene_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],miocene_color) ;
patch([pliocene_start pliocene_end pliocene_end pliocene_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],pliocene_color) ;
patch([pleistocene_start pleistocene_end pleistocene_end pleistocene_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],pleistocene_color) ;
patch([holocene_start holocene_end holocene_end holocene_start],[botpoint_ages botpoint_ages toppoint_ages toppoint_ages],holocene_color) ;














