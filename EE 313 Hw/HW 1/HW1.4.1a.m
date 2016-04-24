%%
p = inline('(t>=5) & (t<=7)', 't');
t = (-7:1:7); plot(t, p(t));
xlabel('t'); ylabel('P(t) = u(t-5)-u(t-7)'); 
axis([-1 1 1.1]);
