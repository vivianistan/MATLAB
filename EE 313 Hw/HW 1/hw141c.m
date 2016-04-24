clear all
t = (-1:0.01:3);
unitstep = (t>=1)& (t<2);
quad = t.^2.*unitstep;
plot(t,quad)
xlabel('t'); ylabel('p(t) = (t^2)[u(t-5)-u(t-7)]'); 