%Christian Lascsak 
%01363742

function [edges] = getEdges (img, Lo_D, Hi_D, threshold)
  
  dec_Img = decomposeImage(img, Lo_D, Hi_D);
 
  LL = dec_Img(1 : floor(end/2), 1 : floor(end/2));
  LH1 = dec_Img(end/2+1:end, 1 : end/2);
  HL1 = dec_Img(1:end/2, end/2+1:end);
  LH2 = LL(end/2+1:end, 1 : end/2);
  HL2 = LL(1:end/2, end/2+1:end);
  LH1 = LH1(1:2:end,1:2:end);
  HL1 = HL1(1:2:end,1:2:end);
  
  edges = sqrt((LH1.*LH2).^2 + (HL1.*HL2).^2);
  edges(edges < threshold)  = 0;
  
end
