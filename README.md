# metareport

 The only function/purpose of this package is automatic report generation from Metalab results.
 
 The main function metareport provides an interface to take data table (and meta_table as optional)in and render rmd template into report. 
 
 This package is designed for opencpu usage, but still can run as standalone version see examples below
 
 This package is now under active development for Metalab HGM version only. 
 

# Install and run


metareport heavily relies on rmetalab

```
devtools::install_github("northomics/rmetalab") 
devtools::install_github("northomics/metareport")

```

After everything installed, you should be able to run the followings. 
Check the working directory for the reports just generated.


```
# for summary report
metareport(type = "summary",
           data_file = system.file("extdata/HGM/final_summary.tsv", package = "metareport"),
           meta_file = system.file("extdata/HGM/meta_info.tsv", package = "metareport"),
           output_dir =  getwd(), 
           output_file = "report_summary.html")


# for  peptide
metareport(type = "peptide",
           data_file = system.file("extdata/HGM/final_peptides.tsv",package = "metareport"),
           meta_file = system.file("extdata/HGM/meta_info.tsv", package = "metareport"),
           output_dir =  getwd(), 
           output_file = "report_peptide.html")
           
   
# for protein
metareport(type = "protein",
           data_file = system.file("extdata/HGM/final_proteins.tsv",package = "metareport"),
           meta_file = system.file("extdata/HGM/meta_info.tsv", package = "metareport"),
           output_dir =  getwd(), 
           output_file = "report_protein.html")        


# for taxon
metareport(type = "taxon",
           data_file = system.file("extdata/HGM/Taxa.tsv", package = "metareport"),
           meta_file = system.file("extdata/HGM/meta_info.tsv", package = "metareport"),
           output_dir =  getwd(), 
           output_file = "report_taxon.html")

# for function
metareport(type = "function",
           data_file = system.file("extdata/HGM/functions_report.tsv", package = "metareport"),
           meta_file = system.file("extdata/HGM/meta_info.tsv", package = "metareport"),
           output_dir =  getwd(), 
           output_file = "report_function.html")


```



There is only one function {metareport} to include all options.
The main input files are data_table (summary, peptide, protein, taxon or function)
There are internal rmarkdown template files in \inst\rmd by default. Users can also specify their own templates by url

# Setup opencpu server

In order to use this function from openCPU server, users need to have an opencpu server setup first (check the [opencpu website](https://www.opencpu.org/download.html) for the installation). 

You need to write down the api url, like http://ipv4-address/ocpu/library/rmdocpu/R/sub-function-name

It would be better to have one or even more opencpu server as backup. 


Once you know the principle how to upload (post) your data table, and download the report file (curl), you will be able to adapt this in to java, python, javascripit in html.





# change log


v 0.2.4 20220413 bug fix, 
  * function module, for voronoi plots, categories with 0 needs to be removed, otherwise the whole plot is going to be black, and the following figures will not show
  * input parameter type: external_message: !r NULL (was ! NULL)
  * proteingroup module, wrong output of number of proteins, and deleted the item for reversed and contaminant. 

V 0.2.3 (20220311) bug fix for error_message

V 0.2.0 (20220301) completely re-write the code for all 5 templates, using sub-doc and functions to deal with meta to make better usage of the code. This version also does not rely on external templates, etc. from github, gitlab. All resources are locally stored. A lot of reused coding blocks are packed into functions, into another acompany package, rmetalab. All these efforts are made to make the template consise and expandable.  
This version is first destined to be compatible with the new HGM version, and will be applied to other versions as well. 

V 0.0.9 (20220215) file organization, built test 

V 0.0.8 (20211019) add a unified function function with parameters to evoke all reports, old function still kept

V 0.0.7, using rio::import to read tsv/csv file (internally using fread). This will generalize the file input. e.g. the function.csv is a csv file, while all others files are tsv.
uisng rio:import also helps to avoid some unexpected (e.g. semi quot in csv file) causing incomplete reading. 

V 0.0.6 add support for pdf format report generation (for some slow computers, openning a large html file (with a lot of figures and table will be slow))



# package needed, not listed and required in the r package, which very likely stops installation

  GSVA,
  limma,
  kableExtra,
  rmetalab,
  dendextend
  rhandsontable
  
  

