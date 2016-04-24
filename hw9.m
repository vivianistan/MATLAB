% HW 9

%%
%6.1-1 part E

%signal
f = @(x) [x.*(0<=x & x<1) + (x+3).*(-3<=x & x<=-2)]; 
x = linspace(-4, 4); 


axis([-4 4 -1 2])
xlabel('t'); ylabel('');
grid

n = 1:10; a_n(1) = 1/6; a_n(n+1) = (3./((2.*(pi.^2)*(n.^2)))).*(cos(2.*pi.*n./3)+(2*pi*n/3).*(sin(2*pi*n/3))-1); 
b_n(1) = 0; b_n(n+1) = 0.504*8*n./(1+16*n.^2); 
c_n(1) = a_n(1); c_n(n+1) = (3./((2.*(pi.^2)*(n.^2)))).*(sqrt(2+4.386*(n.^2)-2*cos(2*pi*n/3)-4.188*sin(2*pi*n/3))); 
theta_n(1) = 0; theta_n(n+1) = atan((2.09.*n.*cos(2.09.*n)-sin(2.09*n))./(cos(2.09*n)+2.09.*sin(2.09.*n)-1)); 
n = [0,n]; 
clf; %subplot(2,2,1); stem(n,a_n, 'k'); ylabel('a_n'); xlabel('n'); 
%subplot(2,2,2); stem(n,b_n, 'k'); ylabel('b_n'); xlabel('n'); 
%subplot(2,2,1); 
figure(1)
hold on
plot (x, f(x))
%%stem(n,c_n); ylabel('c_n'); xlabel('n'); 
hold off
%%failure
syms x k L n
evalin(symengine, 'assume(k, Type::Integer)');
a = @(f,x,k,L)int(f*cos(k*pi*x/L)/L,x,-L,L); 
b = @(f,x,k,L) int(f*sin(k*pi*x/L)/L,x,-L,L);

fs = @(f,x,n,L) a(f,x,0,L)/2 + ... 
        symsum(a(f,x,k,L)*cos(k*pi*x/L) + b(f,x,k,L)*sin(k*pi*x/L),k,1,n); 
    
ezplot(fs(f,x,2,1),-1,1)
hold on
ezplot(f,-1,1)
hold off
%%
syms n t pi 
an = (1/pi)*(int(-cos(n*t), -pi,0) + int(cos(n*t),0,pi))
%an = 0
bn = (1/pi)*(int(-sin(n*t),-pi,0)+int(sin(n*t),0,pi)); 
pretty(bn)
%%
bn = subs(bn,'(-1)^n','cos(pi*n)'); 
pretty(bn)
%%
FourierSum = (4/pi)*sin(t); 
for k = 3:2:25
        FourierSum = FourierSum+subs((4/pi)*sin(n*t)/n,k,n); 
end
FourierSum
ezplot(FourierSum, 3.1416*[-2 4])

%%

n = 1:10; a_n(1) = 1/6; a_n(n+1) = (3./((2.*(pi.^2)*(n.^2)))).*(cos(2.*pi.*n./3)+(2*pi*n/3).*(sin(2*pi*n/3))-1); 
b_n(1) = 0; b_n(n+1) = 0.504*8*n./(1+16*n.^2); 
c_n(1) = a_n(1); c_n(n+1) = (3./((2.*(pi.^2)*(n.^2)))).*(sqrt(2+4.386*(n.^2)-2*cos(2*pi*n/3)-4.188*sin(2*pi*n/3))); 
theta_n(1) = 0; theta_n(n+1) = atan((2.09.*n.*cos(2.09.*n)-sin(2.09*n))./(cos(2.09*n)+2.09.*sin(2.09.*n)-1)); 
n = [0,n]; 
clf; %subplot(2,2,1); stem(n,a_n, 'k'); ylabel('a_n'); xlabel('n'); 
%subplot(2,2,2); stem(n,b_n, 'k'); ylabel('b_n'); xlabel('n'); 
subplot(2,2,1); stem(n,c_n, 'k'); ylabel('c_n'); xlabel('n'); 
subplot(2,2,2); stem(n,theta_n, 'k'); ylabel('\theta n [rad]'); xlabel('n'); 