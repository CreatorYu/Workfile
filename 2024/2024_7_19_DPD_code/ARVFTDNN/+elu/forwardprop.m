function da = forwardprop(dn,n,a,param)
%POSLIN.FORWARDPROP Forward propagate derivatives from input to output.

% Copyright 2012-2015 The MathWorks, Inc.

  da = bsxfun(@times,dn,1*(n>=0)+(n<0).*(exp(n)));
end
