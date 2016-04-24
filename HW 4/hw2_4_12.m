%% 2.4.12 (input)
t = (-5:0.01:5);
unitstep = (t<0); 
x = exp(t); 
input = (exp(t)).*(unitstep); 
plot(t,input);
xlabel('t'); ylabel('e^t'); 


%% 2.4.12 (output)
y = exp(-t); 
unit2 = (t>0); 
output = (y).*(unit2); 
plot(t,output); 
xlabel('t'); ylabel('e^(-t)');

%% 2.4.16
t = (-5:0.01:5); 
g = (t>0)-(t>5);
x = (t>0).*(t<6).*sin(t*2*pi);
dt = 0.1;  
c = dt*conv2(x,g); 
plot(t,g);
xlabel('t'); ylabel('output'); 

%%
j = 1-cos(t); 
plot(t,j); 

%%
plot(t,c); 

