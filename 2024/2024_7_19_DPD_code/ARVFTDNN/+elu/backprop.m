function dn = backprop(da,n,a,param)
%POSLIN.BACKPROP Backpropagate derivatives from outputs to inputs

% Copyright 2012-2015 The MathWorks, Inc.

  dn = bsxfun(@times,da,1*(n>=0)+(n<0).*(exp(n)));
end
