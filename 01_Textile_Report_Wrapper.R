### Script to run Textile analysis for all recent DHS/MIS surveys

#textile_cty_list <- scan(text ="AOHR71 BJHR71 BFHR7A BUHR70 CDHR61 CGHR60 CIHR62 CMHR71 GAHR60 GHHR82 GMHR81 GNHR71 GYHR51 HTHR70 KEHR81 KHHR51 KMHR61 LBHR7A MDHR71 MLHR7H MMHR71 MWHR7Q MZHR7A NGHR7A NIHR61 NMHR61 PKHR71 PGHR70 RWHR7A SLHR7A SNHR8A STHR50  TDHR71 TGHR71 TLHR71 TZHR7Q UGHR7I VNHR52 ZMHR71 ZWHR71", what="")
textile_cty_list <- list(
  list(netfile="AOHR71_netfile.dta", country="Angola"),
  list(netfile="CMHR71_netfile.dta", country="Cameroon"),
  list(netfile="GHHR82_netfile.dta", country="Ghana")
)

# textile_cty_list <- paste0(textile_cty_list,"_netfile.dta")

# render_one <- function(netfile) {
#   # assuming output is PDF
#   rmarkdown::render(
#     "05_Textile_Results_Template.Rmd",
#     output_file = paste0(netfile,".pdf"),
#     params = list(netfile = netfile),
#     envir = parent.frame()
#   )
# }

# render_one(netfile = "CDHR61") # this doesn't work but the loop does!

# for (netfile in textile_cty_list) {
#   rmarkdown::render(
#     "05_Textile_Results_Template.Rmd",
#     output_file = paste0("doc/",netfile, ".pdf"),
#     params = list(netfile = netfile, country=country),
#     envir = parent.frame())
# }

purrr::walk(textile_cty_list, function(file_info) {
  netfile <- file_info$netfile
  country <- file_info$country
  rmarkdown::render(
    "05_Textile_Results_Template.Rmd",
    output_file = paste0("doc/",country, "_Textile_Report.pdf"),
    params = list(netfile = netfile, country=country),
    envir = parent.frame())
})
