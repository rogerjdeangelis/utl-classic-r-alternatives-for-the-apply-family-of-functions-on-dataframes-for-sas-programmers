/* From utl-classic-r-alternatives-...-for-sas-programmers.sas
   The 2x2 matrix `have` the whole document operates on.
   Only change vs upstream: libname sd1 "d:/sd1" -> WORK so it runs anywhere. */
options validvarname=upcase;

data have;
 input x1 x2;
cards4;
1 2
3 4
;;;;
run;quit;

proc print data=have;
run;quit;
