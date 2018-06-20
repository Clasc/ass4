%Christian Lascsak 
%01363742

function [edges] = getEdges (img, Lo_D, Hi_D)
  
  dec_Img = decomposeImage(img, Lo_D, Hi_D);
  HH1 = dec_Img(floor(end/2) : end, floor(end/2) : end); 
  LL = dec_Img(1 : floor(end/2), 1 : floor(end/2));
  HH2 = LL(floor(end/2) : end, floor(end/2) : end);
  downSampled = HH1(1:2:end,1:2:end);
  edges = downSampled.*HH2;
end
