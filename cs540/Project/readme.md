# Project Idea

This is a follow-up to a recent project my team worked on, see [paper](https://github.com/Mathnstein/Machine_Learning/blob/master/cs540/Project/predictive-policing-vancouver.pdf). 

The dataset we used is publicly available and weekly updated by the Vancouver Police Department [which can be found here](vhttp://data.vancouver.ca/datacatalogue/crime-data.htm). It is roughly 30MB in size and contains information on the type of crime (i.e theft, breaking and entering, etc.), time (i.e year, day, hour and minute) and the coordinate of crime (i.e X and Y). This dataset goes as far back as 2003 and has a total of over 500,000 entries. From a simple exploratory search seen below, we consider the histogram of frequencies across the various time scales. The following conclusions are made;

Across years, we notice here that there is a spike in almost all types of crime for 2008 and following that a steady decrease in most until another rise in 2013. We do not know the reason for the peak in 2008. Surprisingly neither the Vancouver Olympic Games 2010 nor the Vancouver Stanley Cup riots from 2011 had a significant effect on the number of crimes committed in the year.

![alt_text][typeVyear]


Across months, all types of crime seem to be near constant for each month.

![alt_text][typeVmonth]


Across days, we have that day 31 doesn't happen for ever month so it is noticeably lower in count. Small spikes seem to occur near the middle of the month, but everything is rather uniform. 

![alt_text][typeVday]


Across hours, we find the most interesting behavior. All types seems to behavior rather erratically with the general trend that crime seems to happen either early morning or late at night.

![alt_text][typeVhour]


We trained around 1000 Hidden Markov Models to try to be able to predict both the location and amount of crime throughout Vancouver, some of our better results are found below.

Month Prediction            |  Month Reality
:-------------------------:|:-------------------------:
![alt_text][predictmonth]  |  ![alt_text][realitymonth]



[typeVyear]:https://github.com/Mathnstein/Machine_Learning/blob/master/cs540/Project/Statistics/type_vs_year.png
[typeVmonth]:https://github.com/Mathnstein/Machine_Learning/blob/master/cs540/Project/Statistics/type_vs_month.png
[typeVday]:https://github.com/Mathnstein/Machine_Learning/blob/master/cs540/Project/Statistics/type_vs_day.png
[typeVhour]:https://github.com/Mathnstein/Machine_Learning/blob/master/cs540/Project/Statistics/type_vs_hour.png

[predictmonth]:https://github.com/Mathnstein/Machine_Learning/blob/master/cs540/Project/Latex/Images/predict.png
[realitymonth]:https://github.com/Mathnstein/Machine_Learning/blob/master/cs540/Project/Latex/Images/real.png
