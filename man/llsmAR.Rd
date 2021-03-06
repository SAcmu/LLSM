% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/llsmAR.R
\name{llsmAR}
\alias{llsmAR}
\title{Run Latent Space Model 
	on Longitudinal Network Data
with AR evolution on Latent Space}
\usage{
llsmAR(Y, initialVals = NULL, priors = NULL, tune = NULL, tuneIn = TRUE,
  dd, niter, prTransformed = TRUE)
}
\arguments{
\item{Y}{list of sociomatrices for longitudinal network data}

\item{initialVals}{List of initialization
use default if NULL}

\item{priors}{List of prior specification}

\item{tune}{List of tuning parameters}

\item{tuneIn}{Logical to indicate if tuning is required}

\item{dd}{Dimension of the latent space positions}

\item{niter}{Number of iterations for MCMC run}

\item{prTransformed}{Logical to indicate if procrustes transformation
is to be done during sampling of latent positions}
}
\description{
\code{llsmAR} runs and tunes MCMC sampler
on the network data
}

