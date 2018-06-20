%%Christian Lascsak
%%a01363742

function [retval] = generateGauss(sigma)
  sigma = sigma ^ 2;
  index = (-25:1:25);  %range of gauss
  gauss = exp(-index.^ 2 / (2 * sigma));
  gauss = gauss./sum(gauss);
  retval = gauss;
end
