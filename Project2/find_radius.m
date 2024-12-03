function [radius]=find_radius(A, n, t, w, method)
    I=eye(n);
    D = diag(diag(A));
    D1 = inv(D);
    CL = -tril(A,-1);
    L = D1*CL;
    if(method == 0)                 %ESOR
        B = (inv(I-w*L))*D1*A;
    else                            %PSD
        CU = -tril(A,1);
        U = D1*CU;
        k = inv(I-w*L);
        m = inv(I-w*U);
        B = m*k*D1*A;
    end
    G = I-t*B;
    x = eig(G);
    radius = max(abs(x));
end