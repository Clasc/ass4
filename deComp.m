%Christian Lascsak
%a01363742


function [low,high] = deComp (signal, decLowP, decHighP, steps,threshold)
  oldLow = signal; 
  k=1;
  figure;
  for i = 1 : steps
    low = oldLow;
    [oldLow,oldHigh] = dwt (low, decLowP, decHighP);
    %make the next scale for scalemultiplication
    [low,high] = dwt (oldLow, decLowP, decHighP);
    edges = zeros(size(oldHigh));
    %sample up the high component of the next step, so it can be multiplied
    upSampled = zeros(size(oldHigh));
    upSampled(1:2:end) = high;
    upSampled(2:2:end) = high;
    
    edges = oldHigh.*upSampled;
    edges(edges < threshold)  = 0;
    
    subplot(6,3,k), plot(oldLow),title("Approximation");
    k = k+1;
    subplot(6,3,k), plot(oldHigh),title("Details");
    k=k+1;
    subplot(6,3,k), plot(edges),title("Edges");
    k=k+1;
  end
end
