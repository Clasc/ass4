%Christian Lascsak

function [retval] = edgeDetec1D (threshold)
   [Lo_dec,Hi_dec] = getHaar();
   %Produce the signal
   signal = zeros(1,1024);
   signal(200:300) = 1;
   signal(600:700) = 1;
   %add the noise
   noise = randn(1,1024) * 0.2;
   gauss = generateGauss(5);
   signal = conv(signal, gauss, 'same');
   signal = signal.+noise;
   
   
   figure, plot(signal),title("Original Signal with noise");
   [low,high] = deComp(signal, Lo_dec,Hi_dec,6, threshold);
   
end
