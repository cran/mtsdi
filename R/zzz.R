# first and last
.First.lib <- function(lib, pkg)
{
require("utils",quietly=TRUE,warn.conflicts=FALSE)
require("stats",quietly=TRUE,warn.conflicts=FALSE)
require("gam",quietly=TRUE,warn.conflicts=FALSE)
require("splines",quietly=TRUE,warn.conflicts=FALSE)
ver <- packageDescription(pkg,fields="Version")
cat("This is 'mtsdi' library",ver,"\n",sep=" ")
#library.dynam("mtsdi",pkg,lib)
}


.Last.lib <- function(libpath)
{
#library.dynam.unload("mtsdi",libpath)
}

