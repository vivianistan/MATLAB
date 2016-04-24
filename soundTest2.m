%%
ii = 1:16000;
t = ii/8000;

ss = sin(0.5*2*pi*440*t); 
pA = audioplayer(ss, 8000); 
play(pA); 

ss2 = sin(2*pi*440*t)
