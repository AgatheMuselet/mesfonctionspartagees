#' Importe mon jeu de donnees
#'
#' @param chemin specifier le chemin ou se trouve le fichier
#' @param colonnes detail des colonnes à importer(facultatif)
#' @param numeriques numéro de colonnes (facultatif)
#' @param sep separateur des colonnes par defaut ";"
#' @param dec decimales par defaut ","
#'
#' @return un jeu de donnees lisible en r
#' @export
#'
#' @examples ImportData("./data/output/montest_export.csv")
ImportData=function(chemin,colonnes=NULL,numeriques=NULL, sep=";",dec=",")
{
  #numeriques est le vecteur des numéros de colonnes (après passage par le filtre du parametre colonnes) pour lesquelles il faut vérifier le type numérique
  retour=read.table(chemin,header=TRUE,sep=sep,dec=dec)

  if (!is.null(colonnes))
    retour=retour[,colonnes]


  if (!is.null(numeriques))
    for (i in numeriques)
      if (class(retour[,i]) != "numeric" && class(retour[,i]) != "integer")
      {
        tryCatch(as.numeric(as.vector(retour[,i])),warning = function(w) {}) #Le tryCatch sert a faire taire le warning lors de la conversion. Le as.vector est là pour le cas où la donnée serait factor.
        stop(paste("Valeures non numériques ( et de classe",class(retour[,i]),") "))
      }

  return(retour)
}

