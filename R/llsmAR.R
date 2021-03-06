#' @title Run Latent Space Model 
#' 	on Longitudinal Network Data
#'	with AR evolution on Latent Space	
#'
#' @description
#' \code{llsmAR} runs and tunes MCMC sampler
#' on the network data
#'
#' @param Y list of sociomatrices for longitudinal network data
#' @param initialVals List of initialization
#' 		use default if NULL
#' @param priors List of prior specification 
#' @param tune List of tuning parameters
#' @param tuneIn Logical to indicate if tuning is required
#' @param dd Dimension of the latent space positions
#' @param niter Number of iterations for MCMC run
#' @param prTransformed Logical to indicate if procrustes transformation
#' 		is to be done during sampling of latent positions
#' @export
llsmAR =
function(Y,initialVals = NULL,
                          priors = NULL, tune = NULL, 
                          tuneIn = TRUE, dd, niter,
                          prTransformed = TRUE)
{
    nn = sapply(1:length(Y),function(x) nrow(Y[[x]]))
    TT = length(Y) #number of time steps
 #   YY = Y
    ##In case there is missingness in YY
    YYIndices = getIndicesYY(Y,TT,nn)
    gList = YYIndices$gg
    posPrev = YYIndices$posPrev
    posNext = YYIndices$posNext	
    #Priors
    if(is.null(priors)){
        MuInt= 0 
        VarInt = 1000
        VarZ = diag(1,dd)
        VarPhi = 100
        MuPhi = 0
     #   dof = 4
     #   Psi = diag(1,dd)
     A = 10
     B = 150
    }else{
        if(class(priors) != 'list')(
            stop("priors must be of class list, if not NULL"))
        MuInt = priors$MuBeta
        VarInt = priors$VarBeta
        MuPhi = priors$MuPhi
        VarPhi = priors$VarPhi
        VarZ = priors$VarZ
        A = priors$A
        B = priors$B
    }
    ##starting values
    if(is.null(initialVals)){
        Z0 = list()
        for(i in 1:TT){  
            # ZZ = t(replicate(nn[i],rnorm(dd,0,1)))
            ZZ = array(NA,dim=c(nn[i],dd))	
            Z0[[i]] = ZZ		 
        }
        Intercept0  = 0
        Phi0 = diag(runif(dd,-1,1),dd)
        print("Starting Values Set")
    }else{
        if(class(initialVals)!= 'list')(
            stop("initialVals must be of class list,if not NULL"))
        Z0 = initialVals$Z0
        Intercept0 = initialVals$Intercept0
        Phi0 = initialVals$Phi0
    }
    #using MDS of dis-similarity matrix of observed network at time tt
    Z0 = lapply(1:TT,function(tt){
        g = graph.adjacency(Y[[tt]]);
        ss = shortest.paths(g);
        ss[ss > 4] = 4;
        Z0tt = cmdscale(ss,k = dd);
	dimnames(Z0tt)[[1]] = dimnames(Y[[tt]])[[1]];
        return(Z0tt)})
    #     ##Centering matrix
    C = lapply(1:TT,function(tt)(diag(nn[tt])-(1/nn[tt])*array(1, dim = c(nn[tt],nn[tt])))) 
    #     ##projection matrix
    Z00 = lapply(1:TT,function(tt)C[[tt]] %*% Z0[[tt]]) 
    ###tuning parameters#####
    if(is.null(tune)){
        a.number = 5
        tuneInt = 1
    #    tunePhi = rep(1,dd*dd)
        tuneZ =  lapply(1:TT, function(x) rep(1.2,nn[x]))          
    } else{
        if(class(tune) != 'list')(
            stop("tune must be of class list, if not NULL"))
        a.number = 5
        tuneInt = tune$tuneInt
        tuneZ = tune$tuneZ
     #   tunePhi = tune$tunePhi
    }    
    accZ = lapply(1:TT,function(x)rep(0,nn[x]))
    accInt = 0
  #  accPhi = rep(0,dd*dd)   
      accPhi = 0
    accSigma = rep(0,dd)
    ###tuning the Sampler####
    do.again = 1
    tuneX = 1
    if(tuneIn == TRUE){
        while(do.again ==1){
            print('Tuning the Sampler')
            for(counter in 1:a.number ){
                rslt = MCMCsampleAR(niter = 500,
                                  Y=Y,Z=Z0,Z00=Z00,C=C,
                                  Intercept=Intercept0,
                                  Phi=Phi0,dd=dd,
                                  TT=TT,nn =nn,
                                  MuInt=MuInt,
                                  VarInt=VarInt,
                                  MuPhi=MuPhi,
                                  VarPhi=VarPhi,
                                  VarZ=VarZ,
                                  dof=A,Psi=B,
                                  accZ=accZ,
                                  accInt=accInt,
                                  accPhi=accPhi,
                                  accSigma = accSigma,
                                  tuneZ=tuneZ,
                                  tuneInt=tuneInt,
                                 
                                  prTransformed=prTransformed,
                                  gList=gList,
				  posPrev= posPrev,posNext=posNext)  
                
                tuneZ = lapply(1:TT,function(x){
                    adjust.my.tune(tuneZ[[x]], 
                                   rslt$acc$accZ[[x]], 2)})
             #   tuneInt = adjust.my.tune(tuneInt,
            #                             rslt$acc$accInt, 1)
             #   tunePhi = adjust.my.tune(tunePhi,
            #                             rslt$acc$accPhi,1)
                print(paste('TuneDone = ',tuneX))
                tuneX = tuneX+1
            }
            extreme = lapply(1:TT,function(x){
                which.suck(rslt$acc$Z[[x]],2)})
            do.again = max(sapply(extreme, length)) > 5
        }
        print("Tuning is finished")  
    }
    rslt = MCMCsampleAR(niter=niter,
                      Y=Y,Z=Z0,Z00=Z00,C=C,
                      Intercept=Intercept0,
                      Phi=Phi0,
                      dd=dd,TT=TT,nn=nn,
                      MuInt=MuInt,
                      VarInt=VarInt,
                      MuPhi=MuPhi,
                      VarPhi=VarPhi,
                      VarZ=VarZ,
                      dof=A,Psi=B,
                      accZ=accZ,
                      accSigma = accSigma,
                      accInt=accInt,
                      accPhi=accPhi,                      
                      tuneZ=tuneZ,
                      tuneInt=tuneInt,
                   
                      prTransformed=prTransformed,
                      gList=gList,posPrev=posPrev,posNext=posNext)
    ##Procrustean transformation of latent positions if prTransformed == FALSE within MCMC
    if(prTransformed == FALSE){
        Ztransformed = lapply(1:(niter), function(ii){
            lapply(1:TT,function(tt){
                z=rslt$draws$Z[[ii]][[tt]];
                z = C[[tt]]%*%z;
                pr = t(Z00[[tt]])%*% z;
                ssZ = svd(pr)
                tx = ssZ$v%*%t(ssZ$u)
                zfinal = z%*%tx
                return(zfinal)})})
        rslt$draws$ZZ = Ztransformed
    }  else(rslt$draws$ZZ = rslt$draws$Z)  
    rslt$call = match.call()
    rslt$tune = list(tuneZ=tuneZ,
                     tuneInt=tuneInt)
    class(rslt) = 'LLSM'
    rslt       
}
 
