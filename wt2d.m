%Christian Lascsak
%01363742

function [Dec_img] = wt2d(img, Lo_D, Hi_D, nlevels)

  [rows, cols] = size(img);
  Dec_img = zeros(rows,cols);
    %iterate over rows and save the solution of dwt in new matrix
    for i = 1:rows;
      r = img(i,1:end);
      [Lo_rk,Hi_rk] = dwt (r, Lo_D, Hi_D);
      newRow = [Lo_rk,Hi_rk];
      Dec_img(i,1:end) = newRow(1:end);
    end
    
    %iterate over columns and save the solution of dwt in new matrix
    for i = 1:cols
      c = Dec_img(1:end, i);
      [Lo_ck,Hi_ck] = dwt (c, Lo_D, Hi_D);
      newCol = [Lo_ck,Hi_ck];
      Dec_img(1:end, i) = newCol(1:end);
    end
  %Lo_img is the upper left part of the image.
  Lo_img = Dec_img(1:floor(end/2),1:floor(end/2));
  nlevels = nlevels-1;
  
  if(nlevels > 0)
    %only replace the LL component of the image (upper left) and repeat this process nlevel times
    Dec_img(floor(1:end/2),floor(1:end/2)) = wt2d(Lo_img, Lo_D, Hi_D, nlevels);
  end
  
end