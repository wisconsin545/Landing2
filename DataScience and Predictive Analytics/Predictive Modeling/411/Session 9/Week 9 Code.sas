libname mydata56 "/courses/u_northwestern.edu1/i_829657/c_4884" access=readonly;

data week9;
 set mydata56.recid_week_9;
 l_durat=durat*1;
 l_cens=cens*1;
 l_marry=married*1;
 l_black=black*1;
 l_drugs=drugs*1;
 l_workprg=workprg*1;
 l_priors=priors*1;
 l_tserved=tserved*1;
 l_felon=felon*1;
 l_alcohol=alcohol*1;
 l_educ=educ*1;
 l_age=age*1;
run;
/*proc print data=week9;
run;
proc contents data=week9;
run;*/

/*  This is the code from Page 172 Output 11.1 is created*/
proc lifetest data=week9;
 time l_durat*l_cens(1);
run;
/*  This is the code to create Output 11.2 */
proc lifetest method=life data=week9;
 time l_durat*l_cens(1);
run;
/*  This is the code to create Figure 11.1 */
proc lifetest data=week9 plots=(s);
 time l_durat*l_cens(1);
run;
/*  This is the code to create Figure 11.2 */
/*  Note, as pointed out in the BB, Figure 11.3 is a repeat of the Hazard plot from Figure 11.2 */
proc lifetest method=life plots=(s h) data=week9;
 time l_durat*l_cens(1);
run;
/*  This is the code to create Output 11.3 */
proc lifetest method=life plots=(s) data=week9;
 time l_durat*l_cens(1);
 strata l_marry;
run;
/*  This is the code to create Output 11.4 */
/*  Change the distribution to create Outputs 11.5, 11.6, and 11.7 */
proc lifereg data=week9;
 model l_durat*l_cens(1)=/d=normal;
 probplot;
 inset;
run;
/*  This is the code to create Output 11.8 */
proc lifereg data=week9;
 model l_durat*l_cens(1)=l_black l_drugs l_workprg l_priors l_tserved l_felon l_alcohol
 l_marry l_educ l_age/d=lnormal;
run;
/*  This is the code to create Output 11.9 */
proc Phreg data=week9;
 model l_durat*l_cens(1)=l_black l_drugs l_workprg l_priors l_tserved l_felon l_alcohol
 l_marry l_educ l_age;
run;