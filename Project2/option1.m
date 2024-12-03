function [A] = option1
    fprintf("Please enter the following matrix parameters: \n");
        n = input('Dimension n: ');
        a = input('\n a: ');
        b = input('\n b: ');
        c = input('\n c: ');
        d = input('\n d: ');
        e = input('\n e: ');

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