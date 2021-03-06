% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getLS.R
\name{getLS}
\alias{getLS}
\title{Function to get the MCMC chain of the latent space
postions in the longitudinal network models after burnin and
thinning}
\usage{
getLS(object, burnin = 0, thin = 1)
}
\arguments{
\item{object}{fitted model object of class 'LLSM'}

\item{burnin}{numeric value to specify the number of draws that must be discarded as burnin}

\item{thin}{numeric value that is used to specify the step at which MCMC chain must be kept}
}
\description{
\code{getLLSM} returns the list of arrays of dimension n by d
by K, of the $K$ posterior chains of the latent space postions
in object of class 'LLSM' for longitudinal model fits
}
\details{
\code{getLLSM} returns the list of arrays of dimension n by d
by K, of the $K$ posterior chains of the latent space postions
in object of class 'LLSM' for longitudinal model fits. The
length of the list is equal to the number of time points in the data.
}

