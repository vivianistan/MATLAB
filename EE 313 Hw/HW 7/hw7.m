%%
H = tf(1,1); 
K = 2; 
G = tf([0 0 K], conv([0 1 8], [0 1 8])); 
TFa = feedback(G, H); 

H = tf(1,1); 
K = 100; 
G = tf([0 0 K], conv([0 1 0], [0 1 8])); 
TFb = feedback(G,H); 

figure(1); 
clf; 
step(TFa, 'k-', TFb, 'k-.'); 
legend( '(a) K = 2', '(b) K = 100', 0); 