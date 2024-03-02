### Script to run Textile analysis for all recent DHS/MIS surveys

#textile_cty_list <- scan(text ="AOHR71 BJHR71 BFHR7A BUHR70 CDHR61 CGHR60 CIHR62 CMHR71 GAHR60 GHHR82 GMHR81 GNHR71 GYHR51 HTHR70 KEHR81 KHHR51 KMHR61 LBHR7A MDHR71 MLHR7H MMHR71 MWHR7Q MZHR7A NGHR7A NIHR61 NMHR61 PKHR71 PGHR70 RWHR7A SLHR7A SNHR8A STHR50  TDHR71 TGHR71 TLHR71 TZHR7Q UGHR7I VNHR52 ZMHR71 ZWHR71", what="")

# manually adjust this list to include the most recent DHS, MIS, or MICS survey.
library(beepr)

textile_cty_list <- list(
  # list(netfile="AOHR71_netfile.dta", country="Angola"),
  # list(netfile="BJHR71_netfile.dta", country="Benin"),
  # list(netfile="BFHR81_netfile.dta", country="Burkina Faso")
  # list(netfile="BFHR81_netfile.dta", country="Burkina Faso 2022"),
  # list(netfile="BFHR7A_netfile.dta", country="Burkina Faso 2018"),
  # list(netfile="BFHR70_netfile.dta", country="Burkina Faso 2014"),
  # list(netfile="BFHR62_netfile.dta", country="Burkina Faso 2010"),
  # list(netfile="BUHR70_netfile.dta", country="Burundi"),
  # list(netfile="DRC18_netfile.dta", country="DRC"),
  # list(netfile="CAR19_netfile.dta", country="Central African Republic"),
  # list(netfile="CON15_netfile.dta", country="Republic of Congo"),
  # list(netfile="CIHR81_netfile.dta", country="Cote d'Ivoire"),
  # list(netfile="RCI16_netfile.dta", country="Cote d'Ivoire"),
  # list(netfile="CMHR81_netfile.dta", country="Cameroon"),
  # list(netfile="CMHR71_netfile.dta", country="Cameroon"),
  list(netfile="GHHR82_netfile.dta", country="Ghana 2019"),
  list(netfile="GHHR8A_netfile.dta", country="Ghana 2022")
  # list(netfile="GMHR81_netfile.dta", country="Gambia"),
  # list(netfile="GNHR81_netfile.dta", country="Guinea"),
  # list(netfile="KEHR81_netfile.dta", country="Kenya"),
  # list(netfile="LBHR7A_netfile.dta", country="Liberia"),
  # list(netfile="MDG18_netfile.dta", country="Madagascar"),
  # list(netfile="MLHR7H_netfile.dta", country="Mali"),
  # list(netfile="MLHR81_netfile.dta", country="Mali"),
  # list(netfile="MLW19_netfile.dta", country="Malawi"),
  # list(netfile="MRHR71_netfile.dta", country="Mauritania"),
  # list(netfile="MZHR7A_netfile.dta", country="Mozambique"),
  # list(netfile="NGHR7A_netfile.dta", country="Nigeria"),
  # list(netfile="NGHR81_netfile.dta", country="Nigeria"),
  # list(netfile="RWHR81_netfile.dta", country="Rwanda"),
  # list(netfile="STP19_netfile.dta", country="Sao Tome & Principe"),
  # list(netfile="SNHR8A_netfile.dta", country="Senegal"),
  # list(netfile="SNHR8I_netfile.dta", country="Senegal")
  # list(netfile="TCH19_netfile.dta", country="Chad"),
  # list(netfile="TGHR71_netfile.dta", country="Togo"),
  # list(netfile="TZHR81_netfile.dta", country="Tanzania 2022")
  # list(netfile="TZHR7Q_netfile.dta", country="Tanzania 2017"),
  # list(netfile="UGHR7I_netfile.dta", country="Uganda"),
  # list(netfile="ZMHR71_netfile.dta", country="Zambia"),
  # list(netfile="ZIM19_netfile.dta", country="Zimbabwe")
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
    "07_Transl_Textile_Template.Rmd",
    output_file = paste0(
      "../TextileReports/files/",
      country,
      "_Textile_Report.html"
    ),
    params = list(netfile = netfile, country = country),
    envir = parent.frame()
  )
})

# install.packages("beepr")

beep(sound = 1)
