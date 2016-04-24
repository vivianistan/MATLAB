%%
x = inline( ['mod(t,3).*(mod(t,3) < A) +', '0.*(mod(t,3) >=A)'], 't', 'A' );
t = linspace(-3,3,1000);

sum = zeros(50,length(t));
sum(1,:) = 1/6;

for n = 1:49,
    f = @(t) t.*exp(-1*1i*n*2*pi*t/3); 
    D_n = (1/3).*integral(f,0,1);  
    sum(1+n,:) = real(D_n*exp(1i*n*2*pi*t/3) + conj(D_n)*exp(-1i*n*2*pi*t/3));
end
x1 = cumsum(sum);
 
figure
plot(t, x1(t,1), 'r');
hold on
plot(t, x1(10,:), 'b'); % n = 10
plot(t, x1(50,:), 'g'); % n = 50
axis([-3, 3, 0, 3]);
grid on
xlabel('t'); ylabel ('x(t)');
legend( 'Original', 'Fourier n = 10','Fourier n = 50');

amplitude = zeros(1, 10);
phase = zeros(1, 10);
for n = 0:10,
    f = @(t) t.*exp(-1*1i*n*2*pi*t/3);
    X_n = (1/3).*integral(f1,0,1);
    amplitude(n+1) = abs(X_n);
    phase(n+1) = angle(X_n);
end
 
n = 0:10;

figure
stem(n,amplitude);
xlabel('n'); ylabel ('Amplitude Xn');
 
figure
stem(n,phase);
xlabel('n'); ylabel('Phase of Xn');
