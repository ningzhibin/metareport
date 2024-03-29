% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metareport.R
\name{metareport}
\alias{metareport}
\title{wrapper function of rmarkdown::render}
\usage{
metareport(
  type = "summary",
  data_file,
  meta_file = NULL,
  template_version = "stable",
  output_format = "html_document",
  output_dir = NULL,
  output_file = "output.html"
)
}
\arguments{
\item{type}{string, type of the result to generate the report on, one of summary, peptide,protein,taxon, function}

\item{data_file}{string, file name/path of the summary.txt from maxquant result txt folder, mandatory}

\item{meta_file}{string, file name/path of the meta file, optional, a tsv file, generated by MetaLab, 1st columns as sample name, 2nd column as experiment name, 3rd column and after as grouping information.}

\item{template_version}{string, can be "stable","develop",or the actual url (usually gist, github, gitlab, but can be anywhere as long as http accessible) for the template file. Default as "stable", will use the local template on server or local test environment in the installed package folder. "develop" is reserved for development test. The templates from the package development path of metareport/inst/rmd, while working dir is metareport/inst. Otherwise, it will try to download the template file from the url. Failed to retrieve from the url, it will use the stable version on the server instead, and passing a message to the output.html.}

\item{output_format}{sstring, ee output_format in render, default as html, which has interactivity with plotly support}

\item{output_dir}{string, see output_dir in render, default value as NULL, the working directory}

\item{output_file}{string, the name of the output file, default for html document is output.html}
}
\value{
no direct return value, but write an output.html to the temp session on the opencpu server
}
\description{
This metareport function provides a way of generating the report on an R server with provided templates, and return the report from a browser or using API. It works as well on the user end as a stand-alone mode.
}
\examples{


}
\seealso{
\code{\link{render}}
}
