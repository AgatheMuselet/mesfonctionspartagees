Ville<-c("Pékin","New Delhi","Tokyo","Moscou","Jakarta","Lima","Séoul","Londres","Le Caire","Mexico")
Habitants<-c("21540000","16787983","13953972","12507000","10639000","10628470","9985652","9721000","9540000","209944")
monjdd_test<-data.frame(Ville,Habitants)
monoutput<- new("ExportData", monjdd="monjdd_test", filename="montest_export.csv")
export(monoutput)
test_that("export is ok", {
  expect_length(".data/output/montest_export.csv", 1)
})
