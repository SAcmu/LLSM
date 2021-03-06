#' @title Function to run MCMC sampler for the LLSM-RW model
#'
#' @description
#' \code{llsmRW} runs MCMC sampler for the LLSM-RW model.
#'
#' @details
#' \code{llsmRW} runs MCMC sampler for the LLSM-RW model and returns samples from the posteriors chains of the parameters,
#' the posterior likelihood at the accpeted parameters, a list of acceptance rates from the metropolis hastings sampling, 
#' and a list of the tuning values if \code{tuneIn} is set to TRUE
#'
#' @param Y A list of sociomatrix for observed networks
#' @param initialVals A list of values for initializing the chain for \code{intercept} and \code{ZZ}. Default is set to NULL, 
#' when random initialization is used. 
#' @param priors A list of parameters for prior distribution specified as \code{MuBeta}, \code{VarBeta}, \code{VarZ}, 
#' \code{A} and \code{B}
#' If set to NULL, default priors is used
#' @param tune A list of tuning parameters. If set to NULL, default values are used.
#' @param tuneIn Logical option to specify whether to auto tune the chain or not. Default is \code{TRUE}
#' @param dd Dimension of the latent space
#' @param niter Number of MCMC iterations to run
#'
#' @aliases llsmRWCov
#' @export

llsmRW = function(Y,initialVals = NULL, priors = NULL, tune = NULL, 
                      tuneIn = TRUE, dd, niter)
{
    nn = sapply(1:length(Y),function(x) nrow(Y[[x]]))
    TT = length(Y) #number of time steps
    YY = Y
    gList = getIndicesYY(Y,TT,nn)$gg
    ##Procrustean transformation of latent positions
    C = lapply(1:TT,function(tt){
	 diag(nn[tt]) - (1/nn[tt]) * array(1, dim = c(nn[tt],nn[tt]))})
    Z0 = lapply(1:TT,function(tt){
        g = graph.adjacency(Y[[tt]]);
        ss = shortest.paths(g);
        ss[ss > 4] = 4;
        Z0 = cmdscale(ss,k = dd);
	dimnames(Z0)[[1]] = dimnames(YY[[tt]])[[1]];
        return(Z0)})	
    Z00 = lapply(1:TT,function(tt)C[[tt]]%*%Z0[[tt]])
    #Priors
    if(is.null(priors)){
        MuInt= 0 
        VarInt = 1000
        VarZ = diag(10,dd)
        A = 10
        B = 10    
    }else{
        if(class(priors) != 'list')(stop("priors must be of class list, if not NULL"))
        MuInt = priors$MuBeta
        VarInt = priors$VarBeta
        VarZ = priors$VarZ
	A = priors$A
	B = priors$B
    }
    print(VarInt)	
    ##starting values
    if(is.null(initialVals)){
     #   Z0 = list()
     #   for(i in 1:TT){  
            # ZZ = t(replicate(nn[i],rnorm(dd,0,1)))
     #       ZZ = array(NA,dim=c(nn[i],dd))    
     #       Z0[[i]] = ZZ    	 
     #   }
        Intercept0  = rnorm(1, 0,1)
        print("Starting Values Set")
    }else{
        if(class(initialVals)!= 'list')(stop("initialVals must be of class list, if not NULL"))
        Z0 = initialVals$ZZ
        intercept0 = initialVals$intercept
    }
    ###tuning parameters#####
    if(is.null(tune)){
        a.number = 5
        tuneInt = 1
        tuneZ =  lapply(1:TT, function(x) rep(1.2,nn[x]))          
    } else{
        if(class(tune) != 'list')(stop("tune must be of class list, if not NULL"))
        a.number = 1
        tuneInt = tune$tuneInt
        tuneZ = tune$tuneZ
    }
    accZ = lapply(1:TT,function(x)rep(0,nn[x]))
    accInt = 0   
    ###tuning the Sampler####
    do.again = 1
    tuneX = 1
    if(tuneIn == TRUE){
        while(do.again ==1){
            print('Tuning the Sampler')
            for(counter in 1:a.number ){
                
                rslt = MCMCsampleRW(niter = 200,Y=YY,Z=Z0,Intercept=Intercept0,
                                    TT=TT,dd=dd,nn=nn,MuInt=MuInt,VarInt=VarInt,
                                    VarZ=VarZ,accZ=accZ,accInt=accInt,
                                    tuneZ=tuneZ,tuneInt=tuneInt,A=A,B=B,gList=gList)
                tuneZ = lapply(1:TT,function(x)adjust.my.tune(tuneZ[[x]], rslt$acc$accZ[[x]], 2))
                tuneInt = adjust.my.tune(tuneInt,rslt$acc$accInt, 1)
                print(paste('TuneDone = ',tuneX))
                tuneX = tuneX+1
            }
            extreme = lapply(1:TT,function(x)which.suck(rslt$acc$Z[[x]],2))
            do.again = max(sapply(extreme, length)) > 5
        }
        print("Tuning is finished")  
    }
    rslt = MCMCsampleRW(niter = niter,Y=YY,Z=Z0,Intercept=Intercept0,
                        TT=TT,dd=dd,nn=nn,MuInt=MuInt,VarInt=VarInt,
                        VarZ=VarZ,accZ=accZ,accInt=accInt,
                        tuneZ=tuneZ,tuneInt=tuneInt,A=A,B=B,gList=gList)  
    ##Procrustean transformation of latent positions
#    C = lapply(1:TT,function(tt){
#	 (diag(nn[tt]) - (1/nn[tt]) * array(1, dim = c(nn[tt],nn[tt])))  ##Centering matrix
#	})

#    Z00 = lapply(1:TT,function(tt){
#        g = graph.adjacency(Y[[tt]]);
#        ss = shortest.paths(g);
#        ss[ss > 4] = 4;
#        Z0 = cmdscale(ss,k = dd);
#        return(C[[tt]]%*%Z0)})

#   g = graph.adjacency(Y[[1]])  #using MDS of dis-similarity matrix of observed network at time 1
#    ss = shortest.paths(g)
#    ss[ss > 4] = 4
#    Z0 = cmdscale(ss,k = 2)
#    Z00 = C %*% Z0 ##target matrix    

    Ztransformed = lapply(1:niter, function(ii) {lapply(1:TT,
                                   function(tt){z= rslt$draws$Z[[ii]][[tt]];
                                        	 z = C[[tt]]%*%z;
                                                 pr = t(Z00[[tt]])%*% z;
                                                ssZ = svd(pr)
                                                tx = ssZ$v%*%t(ssZ$u)
                                                zfinal = z%*%tx
                                                return(zfinal)})})    
    rslt$draws$ZZ = Ztransformed
    rslt$call = match.call()
    rslt$tune = list(tuneZ = tuneZ, tuneInt = tuneInt)
    class(rslt) = 'LLSMRW'
    rslt       
}

