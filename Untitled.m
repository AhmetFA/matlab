ws=2*pi*16000;
x1 = SinSample(1,1000*2*pi,pi/6,0.002,ws);
x2 = SinSample(1,1000*2*pi,0,0.002,ws);

X1 = fftshift(abs(fft(x1)));
f1 =linspace(-ws/2,ws/2,length(X1));
plot(f1,X1), title Magnitude

X2 = fftshift(abs(fft(x2)));
f2 =linspace(-ws/2,ws/2,length(X2));
plot(f1,X1), title Magnitude
%%
ws=2*pi*4000;
x3 = SinSample(1,1000*2*pi,0,0.01,ws);
x4 = SinSample(1,5000*2*pi,0,0.01,ws);

X3 = fftshift(abs(fft(x3)));
f3 =linspace(-ws/2,ws/2,length(X3));
plot(f3,X3), title Magnitude

X4 = (abs(fft(x4)));
f4 =linspace(-ws/2,ws/2,length(X4));
plot(f4,X4), title Magnitude
%%
ws=2*pi*16000;
x5 = SinSample(1,1000*2*pi,0,0.0010,ws);
x6 = SinSample(1,1000*2*pi,0,0.0015,ws);
x7 = SinSample(1,1000*2*pi,0,0.0020,ws);

X5 = fftshift(abs(fft(x5)));
f5 =linspace(-ws/2,ws/2,length(X5));
plot(f5,X5), title Magnitude

X6 = fftshift(abs(fft(x6)));
f6 =linspace(-ws/2,ws/2,length(X6));
plot(f6,X6), title Magnitude


X7 = fftshift(abs(fft(x7)));
f7 =linspace(-ws/2,ws/2,length(X7));
plot(f7,X7), title Magnitude
%%
x8 = SinSample(3,2*pi*5000,pi/6,0.002,2*pi*16000);
x8 = x1 + x8;

X8 = fftshift(abs(fft(x8)));
f8 =linspace(-ws/2,ws/2,length(X8));
plot(f8,X8), title Magnitude

xm = x1.* x8;

Xm = fftshift(abs(fft(xm)));
fm =linspace(-ws/2,ws/2,length(Xm));
plot(fm,Xm), title Magnitude

%%
x9 = x5;%place to x9
x9(1) = [];%delete first one

x0 = [x5,x5(1)];%add first also to end
x0(1) = [];%delete first

ws=2*pi*16000;

X9 =fftshift(abs(fft(x9)));
f9 =linspace(-ws/2,ws/2,length(X9));
stem(f9,X9), title Magnitude

X0 = fftshift(abs(fft(x0)));
f0 =linspace(-ws/2,ws/2,length(X0));
plot(f0,X0), title Magnitude
%%
[audio,Fs] = audioread('sound1.wav');
% to take first 512
sound = audio(1: 512);
stem(sound);
Sound = fftshift(abs(fft(sound)));
fsound = linspace(-Fs*pi,Fs*pi,length(Sound));%converted freq to angular speed
plot(fsound,Sound);
%%
n = (1:1:255);
x10 = sinc(0.2*(n-128));

x11=  sinc(0.8*(n-128));

xdown1 = x10(1:2:end);
Xdown1 = fftshift(abs(fft(xdown1)));
plot(Xdown1), title Downsampled;

xinterp1 = interp(xdown1,2);
Xinterp1 = fftshift(abs(fft(xinterp1)));
plot(Xinterp1),title Interpolated;
plot(Xdown1), title Downsampled;


xdown2 = x11(1:2:end);
Xdown2 = fftshift(abs(fft(xdown2)));
plot(Xdown2), title Downsampled;

xinterp2 = interp(xdown2,2);
Xinterp2 = fftshift(abs(fft(xinterp2)));
stem(Xinterp2),title Interpolated;
stem(Xdown2), title Downsampled;

