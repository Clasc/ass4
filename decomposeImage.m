%Christian Lascsak
%01363742

function [Dec_img] = decomposeImage (img, Lo_D, Hi_D)
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
    
end
