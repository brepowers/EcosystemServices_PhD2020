##rasterPCA funciton in RStoolbox
carbonseq = raster("cseqc02_r1.tif")
habitat = raster("habitat_10001.tif")
sed.ret = raster("sedretained1.tif")
wateryield = raster("wateryield1.tif")
cleanwater = raster("N_service_method1.tif")
N = raster("N_leach1.tif")
###Food and Fiber
meat = raster("meatkg1.tif")
milk = raster ("milksolid1.tif")
wood = raster("wood1.tif")
wool = raster("wool1.tif")

###Scale Rasters
carbscaled = (carbonseq/maxValue(carbonseq))*100
habitatscaled = (habitat/maxValue(habitat)) *100
sedretscaled = (sed.ret/maxValue(sed.ret)) *100
wateryieldscaled = (wateryield/maxValue(wateryield)) *100

cleanwaterscaled = (cleanwater/maxValue(cleanwater)) *100
meatscaled = (meat/maxValue(meat)) *100
milkscaled = (milk/maxValue(milk)) *100
woodscaled = (wood/maxValue(wood)) * 100
woolscaled = (wool/maxValue(wool)) *100

RS_scaled = stack(woolscaled, woodscaled, milkscaled, cleanwaterscaled, carbscaled, habitatscaled, sedretscaled, wateryieldscaled, meatscaled)

####Create RasterStack
ES = stack(carbonseq, habitat, sed.ret, wateryield, cleanwater, meat, milk, wood,wool, bands = NULL)
###
#pca raster libraries
library(RStoolbox)

pca2 = rasterPCA(ES, nSamples = NULL, nComp = nlayers(ES), spca = FALSE, maskCheck = TRUE)

summary(pca2$model)



##simplified
pca_ES = rasterPCA(ES)
pca_ES
