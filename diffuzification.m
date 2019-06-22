clc
clear all
close all

x = -10:0.1:10;
mf1 = trapmf(x,[-10 -8 -2 2]);
mf2 = trapmf(x,[-5 -3 2 4]);
mf3 = trapmf(x,[2 3 8 9]);
mf1 = max(0.5*mf2,max(0.9*mf1,0.1*mf3));

figure('Tag','defuzz');
plot(x,mf1,'LineWidth',3);
h_gca = gca;
h_gca.YTick = [0 .5 1] ;
ylim([-1 1]);

% Centroid
% Centroid defuzzification returns the center of area under the curve.
% If you think of the area as a plate of equal density, the centroid is the point along the x axis about which this shape would balance.
x1 = defuzz(x,mf1,'centroid'); % #ok<*NOPTS>
h1 = line([x1 x1],[-0.2 1.2],'Color','r'); 
t1 = text(x1,-0.2,' Centroid','FontWeight','bold');


% Bisector
% The bisector is the vertical line that will divide the region into two sub-regions of equal area. 
% It is sometimes, but not always coincident with the centroid line.
x2 =  defuzz(x,mf1,'bisector');
gray = 0.7*[1 1 1];
h1.Color = gray;
t1.Color = gray;
h2 = line([x2 x2],[-0.4 1.2],'Color','k'); 
t2 = text(x2,-0.4,' Bisector','FontWeight','bold');


% Middle, Smallest, and Largest of Maximum
% MOM, SOM, and LOM stand for Middle, Smallest, and Largest of Maximum, respectively. 
% These three methods key off the maximum value assumed by the aggregate membership function. In this example,
% because there is a plateau at the maximum value, they are distinct. 
% If the aggregate membership function has a unique maximum, then MOM, SOM, and LOM all take on the same value.
x3 = defuzz(x,mf1,'mom')
x3 = -5
x4 = defuzz(x,mf1,'som')
x4 = -2
x5 = defuzz(x,mf1,'lom')
x5 = -8

h3 = line([x3 x3],[-0.7 1.2],'Color','g'); 
t3 = text(x3,-0.7,' MOM','FontWeight','bold');
h4 = line([x4 x4],[-0.8 1.2],'Color','c'); 
t4 = text(x4,-0.8,' LOM','FontWeight','bold');
h5 = line([x5 x5],[-0.6 1.2],'Color','b'); 
t5 = text(x5,-0.6,' SOM','FontWeight','bold');

