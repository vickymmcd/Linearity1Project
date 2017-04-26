%Mimics analysis of Figure 3 of "Singular Vectors' Subtle Secrets" paper
%clear;clc;clf
 
labels=['SoRoGi'];
a=[ 4 1 5 1;
    5 1 5 1;
    0 5 0 0];

% use atransposea and aatranspose to find SVD breakdown
ata = transpose(a)*a;
aat = a*transpose(a);

% solve for sigma (eigenvalues)
e = eig(ata);
s = sqrt(e);
s = real(s);
s = sort(s, 'descend');
s = diag(s);

% solve for U and V (eigenvectors)
[V,~] = eig(ata);
[U,~] = eig(aat);
V = fliplr(V);
U = fliplr(U);
 
 
[u,s,v]=svd(a);%get svd; outputs, U, S, V

disp(v);
disp(u);
v_concepts = length(v(1,:));
u_concepts = length(u(1,:));

% Determine # of concepts we have both users and restaurants for
if u_concepts < v_concepts
    concepts = u_concepts;
else
    concepts = v_concepts;
end

%Concept #1!
disp('These users: ');
for i=1:length(u(:,1)),
    if abs(u(i,1)) > .5
        disp(i);
    end
end
disp('Must like these restaurants: ');
for i=1:length(v(:,1)),
    if abs(v(i,1)) > .5
        disp(i);
    end
end
 
% a1=s(1,1)*u(:,1)*v(:,1)';%first single rank matrix
% u1v1a1=[u(:,1) v(:,1) a1]%displays u1, v1, and a1
% subplot(121);hold on;grid on;
% for i=1:length(a),
%     labels(2*i-1:2*i);
%     text(-u(i,1),-v(i,1),labels(2*i-1:2*i))%vectors are displayed negated
% end
% %axis([0 .5 0 .5])%Change limits if needed
% xlabel('others agree with')
% ylabel('agrees with others')
%  
%  
% a2=s(2,2)*u(:,2)*v(:,2)';%second single rank matrix
% u2v2a2=[u(:,2) v(:,2) a2]%displays u2, v2, and a2
% subplot(122);hold on;grid on;
% for i=1:length(a),
%     text(u(i,2),v(i,2),labels(2*i-1:2*i))
% end
% %axis([-1 1 -1 1])%Change limits if needed
% xlabel('others agree with')
% ylabel('agrees with others')
%  
%  
% a3=s(3,3)*u(:,3)*v(:,3)';%third single rank matrix
% u3v3a3=[u(:,3) v(:,3) a3]%ditto
%  
% rank3approx=a1+a2+a3%create a rank 3 approximation
% %a-approx%difference with original