***log begin
br
sum
sum, detail 
rename Year Yil
rename Transport_services_exp Transport_xizmatlar_eksporti
rename Computer_services_exp Kompyuter_xizmatlar_eksporti
rename Manufactures_exp Ishlab_chiqarish_eksporti
rename Food_exp Oziq_ovqat_eksporti
sum
sum, detail 
label variable Yil "Tatqiqot yillari"
label variable Transport_xizmatlar_eksporti "Transport xizmatlari (tijorat xizmatlar eksportining %)"
label variable Kompyuter_xizmatlar_eksporti "Kompyuter, aloqa va boshqa xizmatlar (tijorat xizmatlar eksportining %)"
label variable Ishlab_chiqarish_eksporti "Ishlab chiqarish eksporti (mahsulot eksportining %)"
label variable Oziq_ovqat_eksporti "Oziq-ovqat eksporti (tovar eksportining %)"
sum
sum, detail 
desc
asdoc sum
tsset Yil
tsline Transport_xizmatlar_eksporti Kompyuter_xizmatlar_eksporti Ishlab_chiqarish_eksporti Oziq_ovqat_eksporti
tsline Transport_xizmatlar_eksporti , name(g1, replace)
tsline Kompyuter_xizmatlar_eksporti , name(g2, replace)
graph combine g1 g2
tsline Ishlab_chiqarish_eksporti , name(g1, replace)
tsline Oziq_ovqat_eksporti , name(g2, replace)
graph combine g1 g2
twoway(scatter Transport_xizmatlar_eksporti Yil )(lfit Transport_xizmatlar_eksporti Yil )
twoway(scatter Kompyuter_xizmatlar_eksporti Yil )(lfit Kompyuter_xizmatlar_eksporti Yil )
twoway(scatter Ishlab_chiqarish_eksporti Yil )(lfit Ishlab_chiqarish_eksporti Yil )
twoway(scatter Oziq_ovqat_eksporti Yil )(lfit Oziq_ovqat_eksporti Yil )
histogram Transport_xizmatlar_eksporti ,kdensity norm
histogram Kompyuter_xizmatlar_eksporti ,kdensity norm
histogram Ishlab_chiqarish_eksporti ,kdensity norm
histogram Oziq_ovqat_eksporti ,kdensity norm
histogram Transport_xizmatlar_eksporti ,frequency norm  name(g1, replace)
histogram Kompyuter_xizmatlar_eksporti ,frequency norm  name(g2, replace)
histogram Ishlab_chiqarish_eksporti ,frequency norm  name(g3, replace)
histogram Oziq_ovqat_eksporti ,frequency norm  name(g4, replace)
graph combine g1 g2 g3 g4
graph box Transport_xizmatlar_eksporti, name(g1, replace)
graph box Kompyuter_xizmatlar_eksporti , name(g2, replace)
graph box Ishlab_chiqarish_eksporti, name(g3, replace)
graph box Oziq_ovqat_eksporti , name(g4, replace)
graph combine g1 g2 g3 g4
pwcorr Yil Transport_xizmatlar_eksporti Kompyuter_xizmatlar_eksporti Ishlab_chiqarish_eksporti Oziq_ovqat_eksporti , star(0.05) sig
asdoc reg Yil Transport_xizmatlar_eksporti Kompyuter_xizmatlar_eksporti Ishlab_chiqarish_eksporti Oziq_ovqat_eksporti
asdoc reg Yil Transport_xizmatlar_eksporti Kompyuter_xizmatlar_eksporti Ishlab_chiqarish_eksporti Oziq_ovqat_eksporti , robust


predict yhat,xb
predict ehat, resid
histogram yhat,kdensity norm
histogram ehat ,kdensity norm
swilk  yhat ehat
asdoc swilk  yhat ehat
