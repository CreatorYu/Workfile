function a = apply(n,param)
%POSLIN.APPLY transfer function to inputs

% Copyright 2012-2015 The MathWorks, Inc.

%   a = max(0,n);
%   a(isnan(n)) = nan;
a = n.*(n>=0)+(n<0).*(exp(n)-1);
end
