function restaurant()
% define the matrix we want to decompose
% columns are restaurants, rows are users
% a=[ 4 1 5 1;
%     5 1 5 1;
%     0 5 0 0];
% Create the figure
mFigure = figure();

% Create a uicontrol of type "text"
mTextBox = uicontrol('style','text');
set(mTextBox,'String','Rate the restaurant Lemon Thai');

% To move the the Text Box around you can set and get the position of Text 
mTextBoxPosition = [210,250,150,30];
set(mTextBox,'Position',mTextBoxPosition);

% Create pop-up menu
popup = uicontrol('Style', 'popup',...
           'String', {'0 - Have not been','1 - I hate it!','2','3','4','5 - I love it!'},...
           'Position', [180 200 200 50],...
           'Callback', @popupchoice); 
% Create push button
 btn = uicontrol('Style', 'pushbutton', 'String', 'Next',...
        'Position', [248 180 50 20],...
        'Callback', @buttonpress); 
    % Create push button

rating = 0

 function popupchoice(source,event)
        val = source.Value;
        maps = source.String;
        % For R2014a and earlier: 
        % val = get(source,'Value');
        % maps = get(source,'String'); 

        rating = val;
    end

function buttonpress(source, event)
disp(rating)
end

a = [1 1 1 0 0;
    3 3 3 0 0;
    4 4 4 0 0;
    5 5 5 0 0;
    0 2 0 4 4;
    0 0 0 5 5;
    0 1 0 2 2];

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
disp(U);
disp(V);
disp(s);
   
% Determine # of concepts we have both users and restaurants for
v_concepts = length(V(1,:));
u_concepts = length(U(1,:));
if u_concepts < v_concepts
    concepts = u_concepts;
else
    concepts = v_concepts;
end

for j=1:concepts,
    %Concept #1!
    disp('These users: ');
    for i=1:length(U(:,j)),
        if s(j,j)*abs(U(i,j)) > s(j,j)*.5
            disp(i);
        end
    end
    disp('Must like these restaurants: ');
    for i=1:length(V(:,j)),
        if s(j,j)*abs(V(i,j)) > s(j,j)*.5
            disp(i);
        end
    end
end
end
