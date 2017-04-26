% define the matrix we want to decompose
% columns are restaurants, rows are users
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

% Determine # of concepts we have both users and restaurants for
v_concepts = length(V(1,:));
u_concepts = length(U(1,:));
if u_concepts < v_concepts
    concepts = u_concepts;
else
    concepts = v_concepts;
end

%Concept #1!
disp('These users: ');
for i=1:length(U(:,1)),
    if abs(U(i,1)) > .5
        disp(i);
    end
end
disp('Must like these restaurants: ');
for i=1:length(V(:,1)),
    if abs(V(i,1)) > .5
        disp(i);
    end
end