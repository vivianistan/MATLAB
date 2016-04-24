%%
t = (-1:0.01:10); 
unitstep = (t>=5) & (t<7); 
plot(t, unitstep);
xlabel('t'); ylabel('p(t) = u(t-5)-u(t-7)'); 
