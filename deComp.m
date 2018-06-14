%Christian Lascsak
%a01363742


function [low,high] = deComp (signal, decLowP, decHighP, steps)
  low = signal; 
  k=1;
  for i = 1 : steps
    [low,high] = dwt (low, decLowP, decHighP);
    figure,subplot(6,2,k), plot(low),title("Approximation");
    k = k+1;
    subplot(6,2,k),plot(high),title("Details");
    k=k+1;
  end
end
