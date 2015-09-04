MCMCsampleRW = function(niter,Y,Z,Intercept,TT,dd,nn,MuInt,VarInt,VarZ,Psi,
                      dof,accZ,accInt,tuneZ,tuneInt,A,B)
{
    #using MDS of dis-similarity matrix of observed network at time tt
    Z = lapply(1:TT,function(tt){
        g = graph.adjacency(Y[[tt]]);
        ss = shortest.paths(g);
        ss[ss > 4] = 4;
        Z0 = cmdscale(ss,k = dd);
        return(Z0)})
    ##Centering matrix
    C = (diag(nn[1]) - (1/nn[1]) * array(1, dim = c(nn[1],nn[1]))) 
    ##projection matrix
    Z00 = C %*% Z[[1]] 
    ZFinal = list()
    InterceptFinal = rep(NA,niter)
    Likelihood = rep(NA,niter)
    ZVarFinal = list()    
    llikOld = array(NA,dim=c(nn[1],TT))
    for(iter in 1:niter){
        #update Z
        for(i in 1:nn[1]){
            llikOld[i,] = sapply(1:TT,function(x) likelihoodi(i,Y[[x]],Z[[x]],Intercept))
        }
        Zupdt = ZupdateRW(Y=Y,Z=Z,TT=TT,Intercept=Intercept,dd=dd,
                        var=VarZ,llikOld=llikOld,acc=accZ,tune=tuneZ)
        Z = Zupdt$Z
        accZ = Zupdt$acc
        llikAll = sum(sapply(1:TT,function(x) likelihood(Y[[x]],Z[[x]],Intercept)))
        Intupdt = InterceptupdateRW(Intercept=Intercept,llikAll=llikAll,
                              MuBeta=MuInt,VarBeta=VarInt,tune=tuneInt,acc=accInt,Y=Y,Z=Z,TT=TT)
        Intercept = Intupdt$Intercept
        accInt = Intupdt$acc
        llikAll = Intupdt$llikAll
        VarZ = SigmaUpdatelsm(A=A,B=B,Z=Z[[1]],nn=nn,dd=dd)
        #STORE UPDATES
        InterceptFinal[iter] = Intercept
        ZFinal[[iter]] = Z
        Likelihood[iter] = llikAll
        ZVarFinal[[iter]] = VarZ	
        print(iter)
    }
    draws = list(Z=ZFinal,Intercept=InterceptFinal,Likelihood =Likelihood ,VarZ =ZVarFinal )
    accZ = lapply(1:TT,function(x)accZ[[x]]/niter)
    accInt = accInt/niter
    acc = list(accZ=accZ,accInt=accInt)
    return(list(draws=draws,acc=acc))
}
