
# for testing on Mac
sysinf <- Sys.info()

if ( sysinf['sysname'] == 'Darwin' ) {
   Sys.setenv(RSTUDIO_PANDOC="/Applications/RStudio.app/Contents/MacOS/pandoc")
}

# setup a few things, if needed

source("libraries.R")

#run render

rmarkdown::render("index.Rmd") # intro to it all
rmarkdown::render("part1.Rmd") # Reproducibility - why bother
rmarkdown::render("part2a.Rmd") # What you can do: structure and README
rmarkdown::render("part2b.Rmd") # What you can do: structure and README

rmarkdown::render("part3.Rmd") # What you will do in the summer school
rmarkdown::render("part4.Rmd") # Command line/ Git/ Markdown
rmarkdown::render("part5.Rmd")  # Data citations
rmarkdown::render("part6.Rmd")  # Report
rmarkdown::render("part7.Rmd")  # Test case
rmarkdown::render("part8.Rmd")  # Resources
