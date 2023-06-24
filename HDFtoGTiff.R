#*******************************************#
# HDF to GeoTiff conversion
#
# created by: Dr. Usman Mazhar
#             usmanmazhargeo@outlook.com
#*******************************************#


library(gdalUtils)
library(raster)

#Setting up your working directory
setwd("D:/test/")

# Run the following file once to get summary about your raster
gdalinfo("MOD11C3.A2018001.006.2018032091151.hdf")
# Run the following files once if you want to get a list of existing spatial data sets (sds)
sds = get_subdatasets("MOD11C3.A2018001.006.2018032091151.hdf")
sds

# start of main program. These lines will fetch all the hdf files in your working directory
myfiles = dir(pattern = ".hdf")
myfiles
ln = length(myfiles)

# Setting up the output file names. 
outname = paste0("LST_", substr(myfiles, 9,15), ".tif") 
outname 

# Loop to extract same sds from multiple hdf files in your working directory. 
for (i in 1:ln){
  sds = get_subdatasets(myfiles[i])
  gdal_translate(sds[3], dst_dataset = outname[i])
  
}
print("End Processing")
Sys.time()