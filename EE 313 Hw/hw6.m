% HW 9

%%
%6.1-1 part E
t = (-3:0.01:3); 
unitstep = (t>=0) & (t<3); 
plot(t, unitstep);
xlabel('t'); ylabel('p(t) = u(t-5)-u(t-7)');

