function [A] = option2
    
    fprintf('Enter 1 for option: a=0.1, b=0.2, c=0.3, d=0.4\n');
    fprintf('Enter 2 for option: a=0.4, b=0.3, c=0.2, d=0.1\n');
    fprintf('Enter 3 for option: a=1.2, b=0.9, c=0.6, d=0.3 \n');
    
    option = input(' Your Option: ');
    n = input(' \n Enter dimension n: '); fprintf('\n');

    if(option == 1)
        a=0.1; b=0.2; c=0.3; d=0.4;
    elseif (option==2)
        a=0.4; b=0.3; c=0.2; d=0.1;
    elseif(option == 3)
        a=1.2; b=0.9; c=0.6; d=0.3;
    end
    e=4;
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