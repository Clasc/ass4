%%Christian Lascsak

function [retval] = edgeDetec1D ()
   [Lo_dec,Hi_dec] = getHaar();
   %Produce the signal
   signal = zeros(1,1024);
   signal(200:300) = 1;
   signal(600:700) = 1;
   %add the noise
   noise = randn(1,1024) * 0.2;
   signal = signal.+noise;
   
   gauss = generateGauss(5);
   figure, plot(signal),title("Original Signal with noise");
   [low,high] = deComp(signal, Lo_dec,Hi_dec,6);
   
end
