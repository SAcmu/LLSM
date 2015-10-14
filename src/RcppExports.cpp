// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// distMat
arma::mat distMat(int nn, int dd, arma::mat ZZ);
RcppExport SEXP LLSM_distMat(SEXP nnSEXP, SEXP ddSEXP, SEXP ZZSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< int >::type nn(nnSEXP);
    Rcpp::traits::input_parameter< int >::type dd(ddSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type ZZ(ZZSEXP);
    __result = Rcpp::wrap(distMat(nn, dd, ZZ));
    return __result;
END_RCPP
}
// FullLogLik
double FullLogLik(arma::mat YY, arma::mat ZZ, double intercept, int nn, int dd);
RcppExport SEXP LLSM_FullLogLik(SEXP YYSEXP, SEXP ZZSEXP, SEXP interceptSEXP, SEXP nnSEXP, SEXP ddSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< arma::mat >::type YY(YYSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type ZZ(ZZSEXP);
    Rcpp::traits::input_parameter< double >::type intercept(interceptSEXP);
    Rcpp::traits::input_parameter< int >::type nn(nnSEXP);
    Rcpp::traits::input_parameter< int >::type dd(ddSEXP);
    __result = Rcpp::wrap(FullLogLik(YY, ZZ, intercept, nn, dd));
    return __result;
END_RCPP
}
// likelihoodi
double likelihoodi(int ii, int dd, int nn, arma::mat Yt, arma::mat Zt, double intercept);
RcppExport SEXP LLSM_likelihoodi(SEXP iiSEXP, SEXP ddSEXP, SEXP nnSEXP, SEXP YtSEXP, SEXP ZtSEXP, SEXP interceptSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< int >::type ii(iiSEXP);
    Rcpp::traits::input_parameter< int >::type dd(ddSEXP);
    Rcpp::traits::input_parameter< int >::type nn(nnSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Yt(YtSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Zt(ZtSEXP);
    Rcpp::traits::input_parameter< double >::type intercept(interceptSEXP);
    __result = Rcpp::wrap(likelihoodi(ii, dd, nn, Yt, Zt, intercept));
    return __result;
END_RCPP
}
// varZero
arma::mat varZero(arma::mat Phi, int TT, int dd, arma::mat Zvar);
RcppExport SEXP LLSM_varZero(SEXP PhiSEXP, SEXP TTSEXP, SEXP ddSEXP, SEXP ZvarSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< arma::mat >::type Phi(PhiSEXP);
    Rcpp::traits::input_parameter< int >::type TT(TTSEXP);
    Rcpp::traits::input_parameter< int >::type dd(ddSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Zvar(ZvarSEXP);
    __result = Rcpp::wrap(varZero(Phi, TT, dd, Zvar));
    return __result;
END_RCPP
}
// logMVNkern
double logMVNkern(arma::vec Z, arma::vec mu, arma::mat Sigma);
RcppExport SEXP LLSM_logMVNkern(SEXP ZSEXP, SEXP muSEXP, SEXP SigmaSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< arma::vec >::type Z(ZSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type mu(muSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Sigma(SigmaSEXP);
    __result = Rcpp::wrap(logMVNkern(Z, mu, Sigma));
    return __result;
END_RCPP
}
// logdmvnorm
double logdmvnorm(arma::vec Z, arma::vec mu, arma::mat Sigma, int dd);
RcppExport SEXP LLSM_logdmvnorm(SEXP ZSEXP, SEXP muSEXP, SEXP SigmaSEXP, SEXP ddSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< arma::vec >::type Z(ZSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type mu(muSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Sigma(SigmaSEXP);
    Rcpp::traits::input_parameter< int >::type dd(ddSEXP);
    __result = Rcpp::wrap(logdmvnorm(Z, mu, Sigma, dd));
    return __result;
END_RCPP
}
// Zllik
double Zllik(List ZZ, int TT, int dd, arma::vec nn, arma::mat Phi, arma::mat ZVar, arma::vec gList, arma::vec posPrev);
RcppExport SEXP LLSM_Zllik(SEXP ZZSEXP, SEXP TTSEXP, SEXP ddSEXP, SEXP nnSEXP, SEXP PhiSEXP, SEXP ZVarSEXP, SEXP gListSEXP, SEXP posPrevSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< List >::type ZZ(ZZSEXP);
    Rcpp::traits::input_parameter< int >::type TT(TTSEXP);
    Rcpp::traits::input_parameter< int >::type dd(ddSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type nn(nnSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Phi(PhiSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type ZVar(ZVarSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type gList(gListSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type posPrev(posPrevSEXP);
    __result = Rcpp::wrap(Zllik(ZZ, TT, dd, nn, Phi, ZVar, gList, posPrev));
    return __result;
END_RCPP
}
// Zupdate1
List Zupdate1(arma::mat Yt, arma::mat Zt, arma::mat ZNext, int TT, double Intercept, int dd, int nn, arma::mat Phi, arma::mat var, arma::vec llikOld, arma::vec acct, arma::vec tunet, arma::vec gList, arma::vec posNext);
RcppExport SEXP LLSM_Zupdate1(SEXP YtSEXP, SEXP ZtSEXP, SEXP ZNextSEXP, SEXP TTSEXP, SEXP InterceptSEXP, SEXP ddSEXP, SEXP nnSEXP, SEXP PhiSEXP, SEXP varSEXP, SEXP llikOldSEXP, SEXP acctSEXP, SEXP tunetSEXP, SEXP gListSEXP, SEXP posNextSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< arma::mat >::type Yt(YtSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Zt(ZtSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type ZNext(ZNextSEXP);
    Rcpp::traits::input_parameter< int >::type TT(TTSEXP);
    Rcpp::traits::input_parameter< double >::type Intercept(InterceptSEXP);
    Rcpp::traits::input_parameter< int >::type dd(ddSEXP);
    Rcpp::traits::input_parameter< int >::type nn(nnSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Phi(PhiSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type var(varSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type llikOld(llikOldSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type acct(acctSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type tunet(tunetSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type gList(gListSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type posNext(posNextSEXP);
    __result = Rcpp::wrap(Zupdate1(Yt, Zt, ZNext, TT, Intercept, dd, nn, Phi, var, llikOld, acct, tunet, gList, posNext));
    return __result;
END_RCPP
}
// Zupdatet
List Zupdatet(arma::mat Yt, arma::mat Zt, arma::mat ZNext, arma::mat ZPrev, int TT, double Intercept, int dd, int nn, arma::mat Phi, arma::mat var, arma::vec llikOld, arma::vec acct, arma::vec tunet, arma::vec gList, arma::vec posPrev, arma::vec posNext);
RcppExport SEXP LLSM_Zupdatet(SEXP YtSEXP, SEXP ZtSEXP, SEXP ZNextSEXP, SEXP ZPrevSEXP, SEXP TTSEXP, SEXP InterceptSEXP, SEXP ddSEXP, SEXP nnSEXP, SEXP PhiSEXP, SEXP varSEXP, SEXP llikOldSEXP, SEXP acctSEXP, SEXP tunetSEXP, SEXP gListSEXP, SEXP posPrevSEXP, SEXP posNextSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< arma::mat >::type Yt(YtSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Zt(ZtSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type ZNext(ZNextSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type ZPrev(ZPrevSEXP);
    Rcpp::traits::input_parameter< int >::type TT(TTSEXP);
    Rcpp::traits::input_parameter< double >::type Intercept(InterceptSEXP);
    Rcpp::traits::input_parameter< int >::type dd(ddSEXP);
    Rcpp::traits::input_parameter< int >::type nn(nnSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Phi(PhiSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type var(varSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type llikOld(llikOldSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type acct(acctSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type tunet(tunetSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type gList(gListSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type posPrev(posPrevSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type posNext(posNextSEXP);
    __result = Rcpp::wrap(Zupdatet(Yt, Zt, ZNext, ZPrev, TT, Intercept, dd, nn, Phi, var, llikOld, acct, tunet, gList, posPrev, posNext));
    return __result;
END_RCPP
}
// ZupdateTT
List ZupdateTT(arma::mat Yt, arma::mat Zt, arma::mat ZPrev, int TT, double Intercept, int dd, int nn, arma::mat Phi, arma::mat var, arma::vec llikOld, arma::vec acct, arma::vec tunet, arma::vec gList, arma::vec posPrev);
RcppExport SEXP LLSM_ZupdateTT(SEXP YtSEXP, SEXP ZtSEXP, SEXP ZPrevSEXP, SEXP TTSEXP, SEXP InterceptSEXP, SEXP ddSEXP, SEXP nnSEXP, SEXP PhiSEXP, SEXP varSEXP, SEXP llikOldSEXP, SEXP acctSEXP, SEXP tunetSEXP, SEXP gListSEXP, SEXP posPrevSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< arma::mat >::type Yt(YtSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Zt(ZtSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type ZPrev(ZPrevSEXP);
    Rcpp::traits::input_parameter< int >::type TT(TTSEXP);
    Rcpp::traits::input_parameter< double >::type Intercept(InterceptSEXP);
    Rcpp::traits::input_parameter< int >::type dd(ddSEXP);
    Rcpp::traits::input_parameter< int >::type nn(nnSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Phi(PhiSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type var(varSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type llikOld(llikOldSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type acct(acctSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type tunet(tunetSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type gList(gListSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type posPrev(posPrevSEXP);
    __result = Rcpp::wrap(ZupdateTT(Yt, Zt, ZPrev, TT, Intercept, dd, nn, Phi, var, llikOld, acct, tunet, gList, posPrev));
    return __result;
END_RCPP
}
// ZupdateLSM
List ZupdateLSM(arma::mat Y, arma::mat Z, double Intercept, int dd, int nn, arma::mat var, arma::vec llikOld, arma::vec acc, arma::vec tune);
RcppExport SEXP LLSM_ZupdateLSM(SEXP YSEXP, SEXP ZSEXP, SEXP InterceptSEXP, SEXP ddSEXP, SEXP nnSEXP, SEXP varSEXP, SEXP llikOldSEXP, SEXP accSEXP, SEXP tuneSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< arma::mat >::type Y(YSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Z(ZSEXP);
    Rcpp::traits::input_parameter< double >::type Intercept(InterceptSEXP);
    Rcpp::traits::input_parameter< int >::type dd(ddSEXP);
    Rcpp::traits::input_parameter< int >::type nn(nnSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type var(varSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type llikOld(llikOldSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type acc(accSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type tune(tuneSEXP);
    __result = Rcpp::wrap(ZupdateLSM(Y, Z, Intercept, dd, nn, var, llikOld, acc, tune));
    return __result;
END_RCPP
}
// MCMCcppLSM
List MCMCcppLSM(arma::mat Y, arma::mat Z, double Intercept, int nn, int dd, int niter, double tuneInt, arma::vec tuneZ, int accInt, arma::vec accZ, double MuInt, double VarInt, arma::mat VarZ, double A, double B);
RcppExport SEXP LLSM_MCMCcppLSM(SEXP YSEXP, SEXP ZSEXP, SEXP InterceptSEXP, SEXP nnSEXP, SEXP ddSEXP, SEXP niterSEXP, SEXP tuneIntSEXP, SEXP tuneZSEXP, SEXP accIntSEXP, SEXP accZSEXP, SEXP MuIntSEXP, SEXP VarIntSEXP, SEXP VarZSEXP, SEXP ASEXP, SEXP BSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< arma::mat >::type Y(YSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Z(ZSEXP);
    Rcpp::traits::input_parameter< double >::type Intercept(InterceptSEXP);
    Rcpp::traits::input_parameter< int >::type nn(nnSEXP);
    Rcpp::traits::input_parameter< int >::type dd(ddSEXP);
    Rcpp::traits::input_parameter< int >::type niter(niterSEXP);
    Rcpp::traits::input_parameter< double >::type tuneInt(tuneIntSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type tuneZ(tuneZSEXP);
    Rcpp::traits::input_parameter< int >::type accInt(accIntSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type accZ(accZSEXP);
    Rcpp::traits::input_parameter< double >::type MuInt(MuIntSEXP);
    Rcpp::traits::input_parameter< double >::type VarInt(VarIntSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type VarZ(VarZSEXP);
    Rcpp::traits::input_parameter< double >::type A(ASEXP);
    Rcpp::traits::input_parameter< double >::type B(BSEXP);
    __result = Rcpp::wrap(MCMCcppLSM(Y, Z, Intercept, nn, dd, niter, tuneInt, tuneZ, accInt, accZ, MuInt, VarInt, VarZ, A, B));
    return __result;
END_RCPP
}
