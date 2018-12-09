########################################
##Código para corregir la lista de espeies con los códigos aduaneros incluyendo todas las especies de la nómina SERNAPESCA

##NOTE: the list created in this document will be modified manually in order to have one file with variants to species name.
##Species name in SERNAPESCA changed somewhere between 2013 to 2017 so in order to match all species names with scientific names, variation to common names will be added to this initial list. 

##Read the list we have up to now in order to now obtain the unique list

cod_aduana_sp <- read_excel(here("information/raw_databases/ADUANAS_CHILE/arancel_aduanero_nomenclatura/arancel_aduanero_2017/codigos_aduana_por_especie_2017.xlsx"), sheet = "Hoja1", range = "A1:G756") %>%
  mutate(item_sa_17 = gsub("[.]","",codigo_aduana))

sp_list <- unique(cod_aduana_sp[c("especie_SERNAPESCA", "nombre_cientifico_SERNAPESCA")])


##Save list. This list includes all the species in the "nomina sernapesca" and all species in the aduana documents.
write.csv(sp_list,  here("clean_databases/intermediate/sp_list.csv"), row.names=F)
