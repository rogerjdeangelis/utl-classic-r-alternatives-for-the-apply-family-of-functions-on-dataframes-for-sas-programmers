# utl-classic-r-alternatives-for-the-apply-family-of-functions-on-dataframes-for-sas-programmers
Classic r alternatives for the apply family of functions on dataframes for sas programmers 
    %let pgm=utl-classic-r-alternatives-for-the-apply-family-of-functions-on-dataframes-for-sas-programmers;

    Classic r alternatives for the apply family of functions on dataframes for sas programmers

    I wonder if programmers overuse the apply functions?
    Performance is frequently less of an issue.

    githib
    https://tinyurl.com/2f5579tt
    https://github.com/rogerjdeangelis/utl-classic-r-alternatives-for-the-apply-family-of-functions-on-dataframes-for-sas-programmers

    see for apply issues

    Loops are much more flexible then the apply function

     SOLUTIONS (code beolow applys to larger dataframes)

       Simple computations that apply cannot do

          Simple computations apply cannot do

            1 Sum the diagonal elements of a dataframe
            2 Determinant

       Alternatives to apply(df , 1, sum)

            3 output df row and col totals (in one loop)
                Best easily understandable in mutiple languages
            4 colSums & rowSums functions
            5 automating column names
            6 rbin and cbind

    Related repos
    github
    https://tinyurl.com/ys32m6nn
    https://github.com/rogerjdeangelis/utl-issue-with-r-functions-like-apply-input-is-a-dataframe-output-may-be-difficult-to-use

    github
    http://tinyurl.com/526bbdwf
    https://github.com/rogerjdeangelis/utl-converting-common-wps-coding-to-r-and-python

    github
    https://tinyurl.com/59bx7me8
    https://github.com/rogerjdeangelis/utl-leveraging-your-knowledge-of-regular-expressions-to-wps-r-python-multi-language
                     _     _
     _ __  _ __ ___ | |__ | | ___ _ __ ___
    | `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
    | |_) | | | (_) | |_) | |  __/ | | | | |
    | .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
    |_|

    /**************************************************************************************************************************/
    /*                              |                                                    |                                     */
    /*                              |                                                    |              _               _      */
    /*                      _       |  _ __  _ __ ___   ___ ___  ___ ___                 |   ___  _   _| |_ _ __  _   _| |_    */
    /* (_)_ __  _ __  _   _| |_     | | `_ \| `__/ _ \ / __/ _ \/ __/ __|                |  / _ \| | | | __| `_ \| | | | __|   */
    /* | | `_ \| `_ \| | | | __|    | | |_) | | | (_) | (_|  __/\__ \__ \                | | (_) | |_| | |_| |_) | |_| | |_    */
    /* | | | | | |_) | |_| | |_     | | .__/|_|  \___/ \___\___||___/___/                |  \___/ \__,_|\__| .__/ \__,_|\__|   */
    /* |_|_| |_| .__/ \__,_|\__|    | |_|                _          __       _ _         |                 |_|                 */
    /*         |_|                  |   __ _ _ __  _ __ | |_   _   / _| __ _(_) |___     |                                     */
    /*                              |  / _` | `_ \| `_ \| | | | | | |_ / _` | | / __|    |                                     */
    /* options validvarname=upcase; | | (_| | |_) | |_) | | |_| | |  _| (_| | | \__ \    |                                     */
    /* libname sd1 "d:/sd1";        |  \__,_| .__/| .__/|_|\__, | |_|  \__,_|_|_|___/    |                                     */
    /* data sd1.have;               |       |_|   |_|      |___/                         |                                     */
    /*  input x1 x2;                |                                                    |                                     */
    /* cards4;                      |  1 SUM MAIN DIAGONAL AND ANTIDIAGONAL SQUARED      |   main diagonal sum sqauares        */
    /* 1 2                          |  ==========================================        |      (1**2 + 4**2)  = 17            */
    /* 3 4                          |                                                    |   anti diagonal sum squares         */
    /* ;;;;                         |  # X1 X2                                           |      2**2 + 3**2)  = 13             */
    /* run;quit;                    |  #                                                 |                                     */
    /*                              |  #  1  2                                           |                                     */
    /* SD1.HAVE total obs=2         |  #  3  4 main diagonal sum squares (1**2+4**2)=17   |                                    */
    /*                              |  #       anti diagonal sum squares (2**2+3**2)=13   |                                    */
    /* Obs    X1    X2              |  have;                                             |                                     */
    /*                              |  maindiag=0                                        |                                     */
    /*  1      1     2              |  antidiag=0                                        |                                     */
    /*  2      3     4              |  for (i in 1:nrow(have)) {                         |                                     */
    /*                              |    for (j in 1:ncol(have)) {                       |                                     */
    /*                              |    maindiag <- maindiag + 1.0*(i==j)*have[i,j]**2  |                                     */
    /*                              |    antidiag <- antidiag                            |                                     */
    /*                              |        + 1.0*(i==((nrow(have)+1)-j))*have[i,j]**2  |                                     */
    /*                              |    }                                               |                                     */
    /*                              |  }                                                 |                                     */
    /*                              |                                                    |                                     */
    /*------------------------------|----------------------------------------------------|-------------------------------------*/
    /*                              |                                                    |                                     */
    /*                              |  2 COMPUTE THE DETERMINANT                         |                                     */
    /*                              |    =======================                         |                                     */
    /*                              |                                                    |                                     */
    /*                              |  maindiag=1                                        |   Determinant=1*4-1*3=4-6=-2        */
    /*                              |  antidiag=1                                        |                                     */
    /*                              |   for (i in 1:nrow(have)) {                        |                                     */
    /*                              |     for (j in 1:ncol(have)) {                      |                                     */
    /*                              |       if (i==j) { maindiag <- maindiag*have[i,j] } |                                     */
    /*                              |       else { antidiag <- antidiag*have[i,j] }      |                                     */
    /*                              |     }                                              |                                     */
    /*                              |   }                                                |                                     */
    /*                              |  determinant <- maindiag-antidiag                  |                                     */
    /*                              |                                                    |                                     */
    /*------------------------------|----------------------------------------------------|-------------------------------------*/
    /*                              |        _ _                        _   _            |                                     */
    /*                              |   __ _| | |_ ___ _ __ _ __   __ _| |_(_)_   _____  |                                     */
    /*                              |  / _` | | __/ _ \ `__| `_ \ / _` | __| \ \ / / _ \ |                                     */
    /*                              | | (_| | | ||  __/ |  | | | | (_| | |_| |\ V /  __/ |                                     */
    /*                              |  \__,_|_|\__\___|_|  |_| |_|\__,_|\__|_| \_/ \___| |                                     */
    /*                              |                                                    |                                     */
    /*                              | 3 COMPUTE ROW AND COLUMN TOTALS SIMULTANEOUSLY     |                                     */
    /*                              |   ============================================     |                                     */
    /*                              | Easily understansable in mutiple languages         |                                     */
    /*                              |                                                    |                                     */
    /*                              |  rowtot<-data.frame()                              |   > rowtot                          */
    /*                              |  coltot<-data.frame()                              |     ROWSUM                          */
    /*                              |   for (idx in 1:nrow(have)) {                      |   1      3                          */
    /*                              |     rowtot[idx,1]=sum(have[idx,])                  |   2      7                          */
    /*                              |     coltot[1,idx]=sum(have[,idx])                  |                                     */
    /*                              |   }                                                |   > coltot                          */
    /*                              |  colnames(rowtot)="ROWSUM"                         |     X1SUM X2SUM                     */
    /*                              |  colnames(coltot)=c("X1SUM","X2SUM")               |   1     4     6                     */
    /*                              |                                                    |                                     */
    /*------------------------------|----------------------------------------------------|-------------------------------------*/
    /*                              |                                                    |                                     */
    /*                              | 4 USING R COLSUM AND ROWSUM FUNCTIONS              |                                     */
    /*                              |   ===================================              |                                     */
    /*                              |                                                    |                                     */
    /*                              |  coltot<-colSums(have)                             |   > rowtot                          */
    /*                              |                                                    |     ROWSUM                          */
    /*                              |  coltot<-as.data.frame(coltot)                     |   1      3                          */
    /*                              |  coltot<-t(coltot)                                 |   2      7                          */
    /*                              |  colnames(coltot)<-c("X1SUMS","X2SUMS")            |                                     */
    /*                              |                                                    |   > coltot                          */
    /*                              |  rowtot<-rowSums(have)                             |     X1SUM X2SUM                     */
    /*                              |                                                    |   1     4     6                     */
    /*                              |  rowtot<-as.data.frame(rowtot)                     |                                     */
    /*                              |  colnames(rowtot)<-"ROWSUMS"                       |                                     */
    /*                              |                                                    |                                     */
    /*------------------------------|----------------------------------------------------|-------------------------------------*/
    /*                              |                                                    |                                     */
    /*                              | 5 AUTOMATING COLUMN NAMES FOR COLUMN TOTALS        |                                     */
    /*                              |   =========================================        |                                     */
    /*                              |                                                    |                                     */
    /*                              |  df_sums <- have[1,]                               |   # code created names              */
    /*                              |  print(names(have))                                |   # A tibble: 1 row  2 columns      */
    /*                              |  for (col_name in names(have)) {                   |                                     */
    /*                              |    col_sum <- sum(have[[col_name]])                |     X1SUM X2SUM                     */
    /*                              |    df_sums[[paste0(col_name, "SUM")]] <- col_sum   |                                     */
    /*                              |  }                                                 |   1     4     6                     */
    /*                              |                                                    |   >                                 */
    /*                              |  df_sums[1,(ncol(have)+1):(ncol(df_sums))]         |                                     */
    /*                              |                                                    |                                     */
    /*------------------------------|----------------------------------------------------|-------------------------------------*/
    /*                              |                                                    |                                     */
    /*                              | 6 USING RBIND AND CBIND                            |                                     */
    /*                              |   =====================                            |                                     */
    /*                              |                                                    |                                     */
    /*                              |   coltotal<-data.frame(have[1,])                   |   > print(coltotal)                 */
    /*                              |   col_sum=0;                                       |                                     */
    /*                              |   for (col_name in names(have)) {                  |     X1SUM X2SUM                     */
    /*                              |    for (col in 1:ncol(have)) {                     |   1     4     6                     */
    /*                              |      col_sum<-col_sum + have[[col_name]][col]      |   >                                 */
    /*                              |    }                                               |                                     */
    /*                              |    coltotal<-cbind(coltotal,col_sum)               |                                     */
    /*                              |    col_sum=0;                                      |                                     */
    /*                              |   }                                                |                                     */
    /*                              |   coltotal<-coltotal[,                             |                                     */
    /*                              |       (ncol(have)+1):(ncol(coltotal))]             |                                     */
    /*                              |   colnames(coltotal)<-c("X1SUM","X2SUM")           |                                     */
    /*                              |                                                    |                                     */
    /***************************************************************************************************************************/

    /*                   _
    (_)_ __  _ __  _   _| |_
    | | `_ \| `_ \| | | | __|
    | | | | | |_) | |_| | |_
    |_|_| |_| .__/ \__,_|\__|
            |_|
    */

    options validvarname=upcase;
    libname sd1 "d:/sd1";
    data sd1.have;
     input x1 x2;
    cards4;
    1 2
    3 4
    ;;;;
    run;quit;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*  SD1.HAVE total obs=2                                                                                                  */
    /*                                                                                                                        */
    /*  Obs    X1    X2                                                                                                       */
    /*                                                                                                                        */
    /*   1      1     2                                                                                                       */
    /*   2      3     4                                                                                                       */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    /*                 _          __       _ _
      __ _ _ __  _ __ | |_   _   / _| __ _(_) |___
     / _` | `_ \| `_ \| | | | | | |_ / _` | | / __|
    | (_| | |_) | |_) | | |_| | |  _| (_| | | \__ \
     \__,_| .__/| .__/|_|\__, | |_|  \__,_|_|_|___/
     _    |_|   |_|      |___/                     _ _                               _
    / |  ___ _   _ _ __ ___    ___  __ _ _ __   __| (_) __ _  __ _  ___  _ __   __ _| |___
    | | / __| | | | `_ ` _ \  / __|/ _` | `__| / _` | |/ _` |/ _` |/ _ \| `_ \ / _` | / __|
    | | \__ \ |_| | | | | | | \__ \ (_| | |   | (_| | | (_| | (_| | (_) | | | | (_| | \__ \
    |_| |___/\__,_|_| |_| |_| |___/\__, |_|    \__,_|_|\__,_|\__, |\___/|_| |_|\__,_|_|___/
                                      |_|                    |___/
    */

    %symdel fromr / nowarn;
    %utl_rbeginx;
    parmcards4;
    library(haven)
    have<-read_sas("d:/sd1/have.sas7bdat")
    print(have)

    #  X1  X2
    #
    #   1   2
    #   3   4      main diagonal sum sqauares (1+25+81)  = 5
    #              anti diagonal sum squares  (49+25+9)  = 5
    have;
    maindiag=0
    antidiag=0
     for (i in 1:nrow(have)) {
       for (j in 1:ncol(have)) {
       maindiag <- maindiag + 1.0*(i==j)*have[i,j]**2
       antidiag <- antidiag + 1.0*(i==((nrow(have)+1)-j))*have[i,j]**2
       }
     }
    maindiag
    antidiag
    writeClipboard(paste("Main diagonal sum of squares: ",maindiag,"   Anti diagonal sum of squares: ",antidiag))
    ;;;;
    %utl_rendx(return=fromr);

    %put &=fromr;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*  %put &=fromr;                                                                                                         */
    /*                                                                                                                        */
    /*  FROMR = Main diagonal sum of squares:  17     Anti diagonal sum of squares:  13                                       *
    /*                                                                                                                        */
    /*  main diagonal sum sqauares (1**2 + 4**2)  = 17                                                                        */
    /*  anti diagonal sum squares  (2**2 + 3**2)  = 13                                                                        */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    /*___        _      _                      _                   _
    |___ \    __| | ___| |_ ___ _ __ _ __ ___ (_)_ __   __ _ _ __ | |_
      __) |  / _` |/ _ \ __/ _ \ `__| `_ ` _ \| | `_ \ / _` | `_ \| __|
     / __/  | (_| |  __/ ||  __/ |  | | | | | | | | | | (_| | | | | |_
    |_____|  \__,_|\___|\__\___|_|  |_| |_| |_|_|_| |_|\__,_|_| |_|\__|

    */
    %symdel fromr / nowarn;
    %utl_rbeginx;
    parmcards4;
    have<-read.table(header = TRUE, text = "
    x1 x2
    1 2
    3 4
    ")
    maindiag=1
    antidiag=1
     for (i in 1:nrow(have)) {
       for (j in 1:ncol(have)) {
         if (i==j) { maindiag <- maindiag*have[i,j] }
         else { antidiag <- antidiag*have[i,j] }
       }
     }
    determinant <- maindiag-antidiag
    determinant
    maindiag
    antidiag
    writeClipboard(paste("Determinant of 2x2 matrix: ",determinant))
    ;;;;
    %utl_rendx(return=fromr);

    %put &=fromr;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /* %put &=fromr;                                                                                                          */
    /*                                                                                                                        */
    /* FROMR = Determinant of 2x2 matrix:  -2                                                                                 */
    /*                                                                                                                        */
    /* 1 2                                                                                                                    */
    /* 3 4                                                                                                                    */
    /*                                                                                                                        */
    /* Determinant = 1*4 - 1*3 = 4-6 = -2                                                                                     */
    /*                                                                                                                        */
    /**************************************************************************************************************************/


    /*     _ _                        _   _                  _                           _        __   _  __       _                       __
      __ _| | |_ ___ _ __ _ __   __ _| |_(_)_   _____  ___  | |_ ___    __ _ _ __  _ __ | |_   _ / /__| |/ _|     / |    ___ _   _ _ __ ___\ \
     / _` | | __/ _ \ `__| `_ \ / _` | __| \ \ / / _ \/ __| | __/ _ \  / _` | `_ \| `_ \| | | | | |/ _` | |_      | |   / __| | | | `_ ` _ \| |
    | (_| | | ||  __/ |  | | | | (_| | |_| |\ V /  __/\__ \ | || (_) || (_| | |_) | |_) | | |_| | | (_| |  _|  _  | |_  \__ \ |_| | | | | | | |
     \__,_|_|\__\___|_|  |_| |_|\__,_|\__|_| \_/ \___||___/  \__\___/  \__,_| .__/| .__/|_|\__, | |\__,_|_|   ( ) |_( ) |___/\__,_|_| |_| |_| |
                                                                            |_|   |_|      |___/ \_\          |/    |/                     /_/
      ____               _               _         _  __                                       _             _   _        _        _
    |___ /    ___  _   _| |_ _ __  _   _| |_    __| |/ _|  _ __ _____      __   __ _ _ __   __| |   ___ ___ | | | |_ ___ | |_ __ _| |___
      |_ \   / _ \| | | | __| `_ \| | | | __|  / _` | |_  | `__/ _ \ \ /\ / /  / _` | `_ \ / _` |  / __/ _ \| | | __/ _ \| __/ _` | / __|
     ___) | | (_) | |_| | |_| |_) | |_| | |_  | (_| |  _| | | | (_) \ V  V /  | (_| | | | | (_| | | (_| (_) | | | || (_) | || (_| | \__ \
    |____/   \___/ \__,_|\__| .__/ \__,_|\__|  \__,_|_|   |_|  \___/ \_/\_/    \__,_|_| |_|\__,_|  \___\___/|_|  \__\___/ \__\__,_|_|___/
                            |_|
    */

    /*----                                                                   ----*/
    /*----  Row and column totals simutaneously in one loop                 ----*/
    /*----  Output is two dataframes sent to sas                             ----*/
    /*----  This script computes row and colsums simutaneously in one loop  ----*/
    /*----  and configures the output dataframes correctly                   ----*/
    /*----                                                                   ----*/

    %utl_rbeginx;
    parmcards4;
    library(haven)
    library(sqldf)
    source("c:/oto/fn_tosas9x.R")
    have<-read_sas("d:/sd1/have.sas7bdat")
    print(have)

    #     X1     X2   rowtot
    #
    #      1      2     3
    #      3      4     7
    #     --     --
    #      4      6

    rowtot<-data.frame()
    coltot<-data.frame()
     for (idx in 1:nrow(have)) {
       rowtot[idx,1]=sum(have[idx,])
       coltot[1,idx]=sum(have[,idx])
     }
    colnames(rowtot)="rowsum"
    colnames(coltot)=c("X1SUM","X2SUM")
    rowtot
    coltot
    fn_tosas9x(
         inp    = rowtot
        ,outlib ="d:/sd1/"
        ,outdsn ="rowtot"
        );
    fn_tosas9x(
         inp    = coltot
        ,outlib ="d:/sd1/"
        ,outdsn ="coltot"
        );
    ;;;;
    %utl_rendx;

    libname sd1 "d:/sd1";

    /*----                                                                   ----*/
    /*---- there is an issue with STATTRANSFER, it adds the column rownames  ----*/
    /*----                                                                   ----*/

    proc print data=sd1.rowtot nobs;
    run;quit;

    proc print data=sd1.coltot nobs;
    run;quit;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*  R output dataframes (note they are configured correctly)                                                              */
    /*                                                                                                                        */
    /*  > rowtot                                                                                                              */
    /*    rowsum                                                                                                              */
    /*  1      3                                                                                                              */
    /*  2      7                                                                                                              */
    /*                                                                                                                        */
    /*  > coltot                                                                                                              */
    /*    X1SUM X2SUM                                                                                                         */
    /*  1     4     6                                                                                                         */
    /*                                                                                                                        */
    /* SAS                                                                                                                    */
    /*                                                                                                                        */
    /* SD1.ROWTOT total obs=2                                                                                                 */
    /*                                                                                                                        */
    /*   ROWNAMES    ROWSUM                                                                                                   */
    /*                                                                                                                        */
    /*       1          3                                                                                                     */
    /*       2          7                                                                                                     */
    /*                                                                                                                        */
    /* SD1.COLTOT total obs=1                                                                                                 */
    /*                                                                                                                        */
    /*   ROWNAMES    X1SUM    X2SUM                                                                                           */
    /*                                                                                                                        */
    /*       1         4        6                                                                                             */
    /*                                                                                                                        */
    /**************************************************************************************************************************/


          (no system-specific pathname available),
          (no system-specific file attributes available)

    /*  _               _ ____                         ___                        ____
    | || |     ___ ___ | / ___| _   _ _ __ ___  ___   ( _ )    _ __ _____      __/ ___| _   _ _ __ ___  ___
    | || |_   / __/ _ \| \___ \| | | | `_ ` _ \/ __|  / _ \/\ | `__/ _ \ \ /\ / /\___ \| | | | `_ ` _ \/ __|
    |__   _| | (_| (_) | |___) | |_| | | | | | \__ \ | (_>  < | | | (_) \ V  V /  ___) | |_| | | | | | \__ \
       |_|    \___\___/|_|____/ \__,_|_| |_| |_|___/  \___/\/ |_|  \___/ \_/\_/  |____/ \__,_|_| |_| |_|___/

    */

    %utl_rbeginx;
    parmcards4;
    library(haven)
    library(sqldf)
    source("c:/oto/fn_tosas9x.R")
    have<-read_sas("d:/sd1/have.sas7bdat")
    print(have)

    #     X1     X2   rowtot
    #
    #      1      2     3
    #      3      4     7
    #     --     --
    #      4      6

    coltot<-colSums(have)
    coltot<-as.data.frame(coltot)
    coltot<-t(coltot)
    colnames(coltot)<-c("X1SUMS","X2SUMS")
    str(coltot)
    coltot
    rowtot<-rowSums(have)
    rowtot<-as.data.frame(rowtot)
    colnames(rowtot)<-"ROWSUMS"
    str(rowtot)
    rowtot
    ;;;;
    %utl_rendx;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /* R                                                                                                                      */
    /*                                                                                                                        */
    /* > coltot                                                                                                               */
    /*        X1SUMS X2SUMS                                                                                                   */
    /* coltot      4      6                                                                                                   */
    /*                                                                                                                        */
    /* > rowtot                                                                                                               */
    /*                                                                                                                        */
    /*  rowsums                                                                                                               */
    /*        3                                                                                                               */
    /*        7                                                                                                               */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    /*___                _                        _   _                        _
    | ___|    __ _ _   _| |_ ___  _ __ ___   __ _| |_(_)_ __   __ _   ___ ___ | |___ _   _ _ __ ___    _ __   __ _ _ __ ___   ___  ___
    |___ \   / _` | | | | __/ _ \| `_ ` _ \ / _` | __| | `_ \ / _` | / __/ _ \| / __| | | | `_ ` _ \  | `_ \ / _` | `_ ` _ \ / _ \/ __|
     ___) | | (_| | |_| | || (_) | | | | | | (_| | |_| | | | | (_| || (_| (_) | \__ \ |_| | | | | | | | | | | (_| | | | | | |  __/\__ \
    |____/   \__,_|\__,_|\__\___/|_| |_| |_|\__,_|\__|_|_| |_|\__, | \___\___/|_|___/\__,_|_| |_| |_| |_| |_|\__,_|_| |_| |_|\___||___/
                                                              |___/
    */

    %utl_rbeginx;
    parmcards4;
    library(haven)
    library(sqldf)
    source("c:/oto/fn_tosas9x.R")
    have<-read_sas("d:/sd1/have.sas7bdat")
    print(have)

    #     X1     X2   rowtot
    #
    #      1      2     3
    #      3      4     7
    #     --     --
    #      4      6
    df_sums <- have[1,]
    print(names(have))
    for (col_name in names(have)) {
      col_sum <- sum(have[[col_name]])
      df_sums[[paste0(col_name, "SUM")]] <- col_sum
    }

    df_sums[1,(ncol(have)+1):(ncol(df_sums))]
    ;;;;
    %utl_rendx;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /* Input                                                                                                                  */
    /*                                                                                                                        */
    /*  X1     X2                                                                                                             */
    /*                                                                                                                        */
    /*   1      2                                                                                                             */
    /*   3      4                                                                                                             */
    /*  --     --                                                                                                             */
    /*   4      6                                                                                                             */
    /*                                                                                                                        */
    /* Output (for my purposes tibbles are equivalent to dataframes                                                           */
    /*                                                                                                                        */
    /* The column names are created automatically by adding the suffix SUM to the original names                              */
    /*                                                                                                                        */
    /* # A tibble: 1 row  2 columns                                                                                           */
    /*                                                                                                                        */
    /*   X1SUM X2SUM                                                                                                          */
    /*                                                                                                                        */
    /* 1     4     6                                                                                                          */
    /* >                                                                                                                      */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    /*__          _     _           _        _     _           _
     / /_    _ __| |__ (_)_ __   __| |   ___| |__ (_)_ __   __| |
    | `_ \  | `__| `_ \| | `_ \ / _` |  / __| `_ \| | `_ \ / _` |
    | (_) | | |  | |_) | | | | | (_| | | (__| |_) | | | | | (_| |
     \___/  |_|  |_.__/|_|_| |_|\__,_|  \___|_.__/|_|_| |_|\__,_|

    */
    %utl_rbeginx;
    parmcards4;
    library(haven)
    library(sqldf)
    source("c:/oto/fn_tosas9x.R")
    have<-read_sas("d:/sd1/have.sas7bdat")
    print(have)

    #     X1     X2   rowtot
    #
    #      1      2     3
    #      3      4     7
    #     --     --
    #      4      6
    coltotal<-data.frame(have[1,])
    col_sum=0;
    for (col_name in names(have)) {
     for (col in 1:ncol(have)) {
       col_sum<-col_sum + have[[col_name]][col]
     }
     coltotal<-cbind(coltotal,col_sum)
     col_sum=0;
     print(coltotal)
    }
     print(coltotal)
    coltotal<-coltotal[,(ncol(have)+1):(ncol(coltotal))]
    colnames(coltotal)<-c("X1SUM","X2SUM")
    print(coltotal)
    ;;;;
    %utl_rendx;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*  > print(coltotal)                                                                                                     */
    /*                                                                                                                        */
    /*    X1SUM X2SUM                                                                                                         */
    /*  1     4     6                                                                                                         */
    /*  >                                                                                                                     */
    /*                                                                                                                        */
    /**************************************************************************************************************************/

    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
