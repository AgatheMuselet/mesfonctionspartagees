setClass(
  Class = "ExportData", slots=list(monjdd = "character",
                                   filename = "character")
)


# Envoi mon output dans le repertoire export
setGeneric("export", function(self) { standardGeneric("export")})
#' Title
#'
#' @param self ExportData.une classe avec 2 attributs monjdd et filename
#'
#' @return un commentaire et un fichier au bon endroit
#' @export
#'
#' @examples
#' monjdd_ex<-data.frame(Pays = c("Allemagne", "Japon", "Norvege"),Capitale = c("Berlin", "Tokyo", "Oslo"));
#' monoutput<- new("ExportData", monjdd="monjdd_ex", filename="montest_exemple.csv");
#' export(monoutput)
setMethod("export",
          signature(self = "ExportData"),
          function(self) {
            monjdd_update=as.data.frame(eval(parse(text=self@monjdd)))
            print(monjdd_update)
            write.csv2(monjdd_update,paste("./data/output/", self@filename,sep=""),row.names = FALSE)
            print("Export des nouvelles données dans le dossier data.")

          }
)
