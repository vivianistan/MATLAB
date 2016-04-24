%%
t_c = -6:0.1:20;
t=-3:0.1:10
h_t=heaviside(t-1)-heaviside(t-7); 
x_t1=5.*(heaviside(t+1)-heaviside(t-1)); 

dt = t(2) - t(1);
c_x_h = dt*conv(x_t1,h_t); 
plot(t,h_t); 

%%
plot(t_c,c_x_h)