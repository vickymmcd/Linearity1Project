function linfinal()
user = [];
    % define the matrix we want to decompose
    % columns are restaurants, rows are users
    % a=[ 4 1 5 1;
    %     5 1 5 1;
    %     0 5 0 0];
    % Create the figure
    restaurant_list = {'Two', 'Three', 'Four'};
    mFigure = figure();
    quesnum = 1;
    rating = 2;
    updatequesview(quesnum);

     function popupchoice(source,event)
            val = source.Value;
            maps = source.String;
            % For R2014a and earlier: 
            % val = get(source,'Value');
            % maps = get(source,'String'); 

            rating = val+1;
     end

    function buttonpress(source, event)
        if rating == 2
            user = [0; 5; 0; 0; 0];
        elseif rating ==3
            user = [0; 0; 5; 0; 0];
        elseif rating ==4
            user = [0; 0; 0; 5; 0];
        end
        disp(user)
        recommender(user)
    end

    function updatequesview(restaurantnum)

        % Create a uicontrol of type "text"
        mTextBox = uicontrol('style','text');
        prompt = strcat({'Which restaurant do you like the best?'});
        set(mTextBox,'String', prompt);

        % To move the the Text Box around you can set and get the position of Text 
        mTextBoxPosition = [210,250,150,30];
        set(mTextBox,'Position',mTextBoxPosition);

        % Create pop-up menu
        popup = uicontrol('Style', 'popup',...
                   'String', {'Two','Three','Four'},...
                   'Position', [180 200 200 50],...
                   'Callback', @popupchoice); 
        % Create push button
         btn = uicontrol('Style', 'pushbutton', 'String', 'Next',...
                'Position', [248 180 50 20],...
                'Callback', @buttonpress); 

        % To move the the Text Box around you can set and get the position of Text 
        mTextBoxPosition = [210,250,150,30];
        set(mTextBox,'Position',mTextBoxPosition);


    end
    function recommender(user)
    a = [4 4 4 1 1;
        5 5 5 1 1;
        1 2 1 4 4;
        1 1 1 5 5];


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
        disp(U)
        disp(V)
        disp(s)

        x = (V*[0; 0; 0; 0; 5]);
        z = (V*[5; 0; 0; 0; 0]);
        y = (V*user);
        result1 = (dot(x, y)/(norm(x)*norm(y)));
        result2 = (dot(z, y)/(norm(z)*norm(y)));
        disp(result1)
        disp(result2)
        if result1 > result2
           disp('You should try restaurant 5'); 
        elseif result2 > result1
            disp('You should try restaurant 1');
        end
    end
end
    
  