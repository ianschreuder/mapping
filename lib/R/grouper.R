#tmpArray = array(1:3, c(50,3))
#Example Usage:
# dfGrouped = group(mat_or_Table, numOfGroupsDesired)
group <- function(coord_array, num_groups) 
{

rowCount = length(coord_array)
matConvert = matrix(0, ncol=3, nrow=rowCount)
for(i in 1:rowCount)
{
  matConvert[i,]=unlist(coord_array[i])
}

 #mat_from_array = matrix(vects_data, ncol=3, nrow=8)
 dfLatLong = data.frame(matConvert)
  #Cluster analysis function is kmeans()
  clusters = kmeans(dfLatLong, center=num_groups, nstart=5, algorithm = c("Hartigan-Wong", "Lloyd", "Forgy", "MacQueen"))
# Available components:
#[1] "cluster"  "centers"  "withinss" "size" 
  
  df_Grouping = data.frame(cbind(dfLatLong, clusters$cluster)) 
  #vectGroups = df_Grouping[,4]
  colnames(df_Grouping)=c("id","lat", "long", "grouping")#not used ultimately, but maybe later
  #convert to matrix, and then array
  matNew = data.matrix(df_Grouping)
  array_Return = array(matNew, dim=c(rowCount,4))
  #what we are returning is the following:
  #[[1.0, 45.0, 100.0, 1.0], [2.0, 40.0, 100.0, 1.0], [3.0, 45.0, -100.0, 2.0], [4.0, 40.0, -100.0, 2.0], [5.0, -45.0, -100.0, 4.0], [6.0, -40.0, -100.0, 4.0], [7.0, -45.0, 100.0, 3.0], [8.0, -40.0, 100.0, 3.0]]

}