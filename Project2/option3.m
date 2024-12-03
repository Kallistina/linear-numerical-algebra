function [A] = option3
    fileID = fopen('ask2_1_i.txt','r');%edo vazoume to onoma tou arxeiou pou theloume
    B = fscanf(fileID,'%f');
    disp(B);
    n = B(1,1);
    a=B(2,1);
    b=B(3,1);
    c=B(4,1);
    d=B(5,1);
    e=B(6,1);

    %Create the pentadiagonal matrix
    A = zeros(n,n);
    for i=1:n
        A(i,i) = e;
    end
    for i=2:n
        A(i,i-1) = -b;
    end
    for i=1:n-1
        A(i, i+1) = -c;
    end
    for i=1:n-2
        A(i,i+2) = -d;
    end
    for i=3:n
        A(i,i-2) = -a;
    end
end