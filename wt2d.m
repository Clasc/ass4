%Christian Lascsak
%01363742

function [Dec_img] = wt2d(img, Lo_D, Hi_D, nlevels)
  edges = getEdges(img, Lo_D, Hi_D, 0.0024);
  lev = num2str(nlevels);
  subplot(3,3,nlevels),imshow(edges,[]), title(['Edges Lena, Scale at Level (inverted): ' lev ]) ;
  Dec_img = decomposeImage(img, Lo_D, Hi_D);
  %Lo_img is the upper left part of the image.
  Lo_img = Dec_img(1:floor(end/2),1:floor(end/2));
  nlevels = nlevels-1;
  
  if(nlevels > 0)
    %only replace the LL component of the image (upper left) and repeat this process nlevel times
    Dec_img(floor(1:end/2),floor(1:end/2)) = wt2d(Lo_img, Lo_D, Hi_D, nlevels);
  end
  
end