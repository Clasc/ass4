%%Christian Lascsak

function [retval] = edgeDetec1D ()
   decLowP = [0.7071067812  0.7071067812];
   decHighP = [-0.7071067812 0.7071067812];
   
   %Produce the signal
   signal = zeros(1,1024);
   signal(200:300) = 1;
   signal(600:700) = 1;
   %add the noise
   noise = randn(1,1024) * 0.2;
   signal = signal.+noise;
   
   gauss = generateGauss(5);
   figure, plot(signal),title("Original Signal with noise");
   [low,high] = deComp(signal, decLowP,decHighP,6);
   
end
