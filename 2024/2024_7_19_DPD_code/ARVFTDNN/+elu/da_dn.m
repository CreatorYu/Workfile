function d = da_dn(n,a,param)
%POSLIN.DA_DN Derivative of outputs with respect to inputs

% Copyright 2012-2015 The MathWorks, Inc.

  d = 1*(n>=0)+(n<0).*(exp(n));
end
