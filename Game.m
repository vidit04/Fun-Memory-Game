function varargout = Game(varargin)
% GAME MATLAB code for Game.fig
%      GAME, by itself, creates a new GAME or raises the existing
%      singleton*.
%
%      H = GAME returns the handle to a new GAME or the handle to
%      the existing singleton*.
%
%      GAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME.M with the given input arguments.
%
%      GAME('Property','Value',...) creates a new GAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Game_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Game_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Game

% Last Modified by GUIDE v2.5 12-Jul-2018 19:22:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Game_OpeningFcn, ...
                   'gui_OutputFcn',  @Game_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Game is made visible.
function Game_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Game (see VARARGIN)
clc;

global t
t = 1;
global raw
[num, txt, raw] = xlsread('Book1.xlsx');

global A
global B
global C
global D
global E
global total_questions
raw = raw(randperm(size(raw,1)),:);  %%%%%%%% Shuffling of Master Data from Excel File.
A = raw(1:6,:);
B = raw(7:12,:);
C = raw(13:18,:);
D = raw(19:24,:);
E = raw(25:30,:);
total_questions = 1;
set(handles.name, 'string','"Fun Memory Game"');

axes(handles.axes)
imshow('Pic.jpg')

main(hObject,eventdata, handles, varargin)

% Choose default command line output for Game
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Game wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Game_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function answer_Callback(hObject, eventdata, handles)
% hObject    handle to answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of answer as text
%        str2double(get(hObject,'String')) returns contents of answer as a double


% --- Executes during object creation, after setting all properties.
function answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button.
function button_Callback(hObject, eventdata, handles)
% hObject    handle to button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles = guidata(hObject);
global Choice 
global M1
global N1
global O1
global P1
global Q1


Choice = get(handles.answer,'string');
% disp(Choice)
% class(Choice)
Choice1 = char(Choice);
% disp(Choice1)

global t
global J
            if J{t,6} == Choice1
                W = ['Right answer'];
%                 disp(W)
                set(handles.text, 'string','Last Answer was Right.');
                if t==15
                    set(handles.text, 'string','Answer is Right.');
                end
                J{t,8} = 1;
%%%%%%%%%% Algorith for Geting Number of Correct Answers   %%%%%%%%%                 
                if t<6
                    M1=M1+1;
                    set(handles.box11,'string',M1); 
                end
                if (t>5 & t<10)
                    N1=N1+1;
                    set(handles.box12,'string',N1);
                end
                if (t>9 & t<13)
                    O1=O1+1;
                    set(handles.box13,'string',O1);
                end
                if (t>12 & t<15)
                    P1=P1+1;
                    set(handles.box14,'string',P1);
                end
                if (t==15)
                    Q1=Q1+1;
                    set(handles.box15,'string',Q1);
                end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        else
            U = ['Wrong answer'];
%             disp(U)
            set(handles.text, 'string','Last Answer was Wrong.');
            if t==15
                set(handles.text, 'string','Answer is Wrong.');
            end
            J{t,9}=1;
            end
           
t=t+1;
if t>=16
    set(handles.button,'Enable','off');
    set(handles.button2,'Enable','off');
    set(handles.pushbutton3,'Enable','off');
    last(hObject,eventdata, handles)
    
else
    Display(hObject,eventdata, handles)
end
% guidata(hObject, handles);
% --- Executes on button press in button2.
function button2_Callback(hObject, eventdata, handles)
% hObject    handle to button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);

global t
global J
L = J{t,7};
% disp(L)
set(handles.hint, 'string',L);
J{t,10} = 1;
set(handles.pushbutton3,'Enable','on');
guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function main(hObject,eventdata, handles, varargin)
global M1
global N1
global O1
global P1
global Q1

M1 = 0;
N1 = 0;
O1 = 0;
P1 = 0;
Q1 = 0;


global total_questions
X =['Round ',num2str(total_questions)];
% disp(X)
set(handles.round, 'string',X);

R =['Correct Answers for Round ',num2str(total_questions)];
set(handles.box6, 'string',R);

set(handles.box11,'string',M1);
set(handles.box12,'string',N1);
set(handles.box13,'string',O1);
set(handles.box14,'string',P1);
set(handles.box15,'string',Q1);

global t
global A
global B
global C
global D
global E

if size(A,1) > 0
    for i = 1:size(A,1)
        A{i,11} = 1;
    end
    A = A(randperm(size(A,1)),:);   %%%%%%%% Shuffling of Cards of Box A
end
if size(B,1) > 0
    for i = 1:size(B,1)
        B{i,11} = 2;
    end
    B = B(randperm(size(B,1)),:);   %%%%%%%% Shuffling of Cards of Box B
end
if size(C,1) > 0
    for i = 1:size(C,1)
        C{i,11} = 3;
    end
    C = C(randperm(size(C,1)),:);   %%%%%%%% Shuffling of Cards of Box C
end
if size(D,1) > 0
    for i = 1:size(D,1)
        D{i,11} = 4;
    end
    D = D(randperm(size(D,1)),:);   %%%%%%%% Shuffling of Cards of Box D
end
if size(E,1) > 0
    for i = 1:size(E,1)
        E{i,11} = 5;
    end
    E = E(randperm(size(E,1)),:);   %%%%%%%% Shuffling of Cards of Box E
end

if (size(E,1)<30)
global raw
global M
M = raw(1:5,:);
global N
N = raw(7:10,:);
global O
O = raw(13:15,:);
global P
P = raw(19:20,:);
global Q
Q = raw(25:25,:);

set(handles.textA, 'string','A');
set(handles.textB, 'string','B');
set(handles.textC, 'string','C');
set(handles.textD, 'string','D');
set(handles.textE, 'string','E');
set(handles.sizeA, 'string',size(A,1));
set(handles.sizeB, 'string',size(B,1));
set(handles.sizeC, 'string',size(C,1));
set(handles.sizeD, 'string',size(D,1));
set(handles.sizeE, 'string',size(E,1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.textA1, 'string','A');
set(handles.textB1, 'string','B');
set(handles.textC1, 'string','C');
set(handles.textD1, 'string','D');
set(handles.textE1, 'string','E');

set(handles.textB2, 'string','B');
set(handles.textC2, 'string','C');
set(handles.textD2, 'string','D');
set(handles.textE2, 'string','E');

set(handles.textC3, 'string','C');
set(handles.textD3, 'string','D');
set(handles.textE3, 'string','E');


set(handles.textD4, 'string','D');
set(handles.textE4, 'string','E');

set(handles.textE5, 'string','E');

set(handles.textM, 'string','M');
set(handles.textN, 'string','N');
set(handles.textO, 'string','O');
set(handles.textP, 'string','P');
set(handles.textQ, 'string','Q');

%%%%% Selection of Cards for BOX M  %%%%%%%%%
    m = 1 ;
    m1=0;
    m2=0;
    m3=0;
    m4=0;
    m5=0;
    set(handles.sizeA1, 'string',m1);
    set(handles.sizeB1, 'string',m2);
    set(handles.sizeC1, 'string',m3);
    set(handles.sizeD1, 'string',m4);
    set(handles.sizeE1, 'string',m5);
    for i = 1:5
        
        if size(A,1) > 0
            M(m,:) = A(1,:);
            A(1,:) = [];
            m1 = m;
            m = m + 1;
            set(handles.sizeA1, 'string',m1);
        else
            if size(B,1) > 0
                M(m,:) = B(1,:);
                B(1,:) = [];
                m2 = m -m1;
                m = m + 1;
                set(handles.sizeB1, 'string',m2);
            else
                if size(C,1) > 0
                    M(m,:) = C(1,:);
                    C(1,:) = [];
                    m3 = m - m2 - m1;
                    m = m + 1;
                    set(handles.sizeC1, 'string',m3);
                else
                    if size(D,1) > 0
                        M(m,:) = D(1,:);
                        D(1,:) = [];
                        m4 = m - m3 - m2 - m1;
                        m = m + 1;
                        set(handles.sizeD1, 'string',m4);
                    else
                        if size(E,1) > 0
                            M(m,:) = E(1,:);
                            E(1,:) = [];
                            m5 = m - m1 -m2 - m3 - m4;
                            m = m + 1;
                            set(handles.sizeE1, 'string',m5);
                        end
                    end
                end
            end
        end
    end

%%%%%% Selection of Cards for BOX N  %%%%%%%%%
    n=1;
    n1=0;
    n2=0;
    n3=0;
    n4=0;
    
    set(handles.sizeB2, 'string',n1);
    set(handles.sizeC2, 'string',n2);
    set(handles.sizeD2, 'string',n3);
    set(handles.sizeE2, 'string',n4);
    for i = 1:4
        if size(B,1) > 0
            N(n,:) = B(1,:);
            B(1,:) = [];
            n1 = n;
            n = n+1;
            set(handles.sizeB2, 'string',n1);
        else
            if size(C,1) > 0
                N(n,:) = C(1,:);
                C(1,:) = [];
                n2 = n - n1;
                n = n + 1;
                set(handles.sizeC2, 'string',n2);
            else
                if size(D,1) > 0
                    N(n,:) = D(1,:);
                    D(1,:) = [];
                    n3 = n - n1 - n2;
                    n = n + 1;
                    set(handles.sizeD2, 'string',n3);
                else
                    if size(E,1) > 0
                        N(n,:) = E(1,:);
                        E(1,:) = [];
                        n4 = n - n1 - n2 - n3;
                        n = n + 1;
                        set(handles.sizeE2, 'string',n4);
                    end
                end
            end
        end
    end
%%%%% Selection of Cards of BOX O  %%%%%%%%%
    o=1;
    o1=0;
    o2=0;
    o3=0;
    
    set(handles.sizeC3, 'string',o1);
    set(handles.sizeD3, 'string',o2);
    set(handles.sizeE3, 'string',o3);
    for i = 1:3
        if size(C,1) > 0
            O(o,:) = C(1,:);
            C(1,:) = [];
            o1 = o;
            o = o + 1;
            set(handles.sizeC3, 'string',o1);
        else
            if size(D,1) > 0
                O(o,:) = D(1,:);
                D(1,:) = [];
                o2 = o - o1;
                o = o + 1;
                set(handles.sizeD3, 'string',o2);
            else
                if size(E,1) > 0
                    O(o,:) = E(1,:);
                    E(1,:) = [];
                    o3 = o - o1 -o2;
                    o = o + 1;
                    set(handles.sizeE3, 'string',o3);
                end
            end
        end
    end

 %%%%%%% Selection of cards for BOX P   %%%%%%%%%
    p=1;
    p1=0;
    p2=0;
    
    set(handles.sizeD4, 'string',p1);
    set(handles.sizeE4, 'string',p2);
    for i = 1:2
            if size(D,1) > 0
                P(p,:) = D(1,:);
                D(1,:) = [];
                p1 = p;
                p = p + 1;
                set(handles.sizeD4, 'string',p1);
                
            else
                if size(E,1) > 0
                    P(p,:) = E(1,:);
                    E(1,:) = [];
                    p2 = p - p1;
                    p = p + 1;
                    set(handles.sizeE4, 'string',p2);
                end
            end
    end

global J  
%%%%%% BOX E %%%%%%
    
    if size(E,1)==0
        set(handles.sizeE5, 'string','0');
        msgbox('Box E is Empty.')
        playagain1 = menu('Want to Restart the Game..??,','Yes','No..:-(');
        if playagain1 == 1
            close
            Game
%             figure1_CloseRequestFcn(hObject,eventdata,handles)
        else
            close
            msgbox('Thank You for Playing...(^_^)')
%             return;
%             figure1_CloseRequestFcn(hObject,eventdata,handles)
        end
    else
        Q = E(1:1,:);
        set(handles.sizeE5, 'string',size(E(1:1),1));
        E(1:1,:)=[];
        J = cat(1,M,N,O,P,Q);
        Display(hObject,eventdata, handles, varargin)
    end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
    if size(E,1)==30
        msgbox('Congrats..!!. You have Learned All Cards.')
        playagain1 = menu('Want to Restart the Game..??,','Yes','No..:-(');
        if playagain1 == 1
            close
            Game
%             figure1_CloseRequestFcn(hObject,eventdata,handles)
        else
            close
            msgbox('Thank You for Playing...(^_^)')
%             return;
%             figure1_CloseRequestFcn(hObject,eventdata,handles)
        end
    end

function Display(hObject,eventdata, handles,varargin)

global t
global J
if t==1
    set(handles.text, 'string','');
    set(handles.Ans, 'string','');
end
set(handles.button,'Enable','on');
set(handles.button2,'Enable','on');
set(handles.pushbutton3,'Enable','off');
set(handles.answer, 'string',''); 
set(handles.hint, 'string',''); 
set(handles.Ans, 'string','');
set(handles.question,'string',J{t,1});
set(handles.option1,'string',J{t,2});
set(handles.option2,'string',J{t,3});
set(handles.option3,'string',J{t,4});
set(handles.option4,'string',J{t,5});
if t<6
    H=['Question ',num2str(t),' of Set M'];
    set(handles.box,'string',H);
end
if (t>5 & t<10)
    t1= t-5;
    H=['Question ',num2str(t1),' of Set N'];
    set(handles.box,'string',H);
end
if (t>9 & t<13)
    t1= t-9;
    H=['Question ',num2str(t1),' of Set O'];
    set(handles.box,'string',H);
end
if (t>12 & t<15)
    t1= t-12;
    H=['Question ',num2str(t1),' of Set P'];
    set(handles.box,'string',H);
end
if (t==15)
    t1= t-14;
    H=['Question ',num2str(t1),' of Set E'];
    set(handles.box,'string',H);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
function last(hObject,eventdata, handles,varargin)
global J
global A
global B
global C
global D
global E


     %%%%% Process of putting cards back for [ PACK M ]%%%%%%% 
    m = 1; 
    for i = 1:15
        if ((J{i,9}==1 & J{i,10}==0) | (J{i,9}==1 & J{i,10}==1))
            if size(A,1)>0
                A(size(A,1)+1,:) = A(size(A,1),:);
                A(size(A,1),:) = J(m,:);
                A{size(A,1),8} = 0;
                A{size(A,1),9} = 0;
                A{size(A,1),10} = 0;
            end
            if size(A,1)==0
                A = J(m,:);
                A{size(A,1),8} = 0;
                A{size(A,1),9} = 0;
                A{size(A,1),10} = 0;
            end
        end
        if (J{i,10}==0 & J{i,9}==0 & J{i,8}==1)
            %q = size(Q,1);
            if J{i,11} == 1
                if size(B,1)>0
                    B(size(B,1)+ 1,:) = B(size(B,1),:);
                    B(size(B,1),:) = J(m,:);
                    B{size(B,1),8} = 0;
                    B{size(B,1),9} = 0;
                    B{size(B,1),10} = 0;
                end
                if size(B,1)==0
                    B = J(m,:);
                    B{size(B,1),8} = 0;
                    B{size(B,1),9} = 0;
                    B{size(B,1),10} = 0;
                end
            end
            if J{i,11} == 2
                if size(C,1)>0
                    C(size(C,1)+ 1,:) = C(size(C,1),:);
                    C(size(C,1),:) = J(m,:);
                    C{size(C,1),8} = 0;
                    C{size(C,1),9} = 0;
                    C{size(C,1),10} = 0;
                end
                if size(C,1)==0
                    C = J(m,:);
                    C{size(C,1),8} = 0;
                    C{size(C,1),9} = 0;
                    C{size(C,1),10} = 0;
                end
            end
            if J{i,11} == 3
                if size(D,1)>0
                    D(size(D,1)+ 1,:) = D(size(D,1),:);
                    D(size(D,1),:) = J(m,:);
                    D{size(D,1),8} = 0;
                    D{size(D,1),9} = 0;
                    D{size(D,1),10} = 0;
                end
                if size(D,1)==0
                    D = J(m,:);
                    D{size(D,1),8} = 0;
                    D{size(D,1),9} = 0;
                    D{size(D,1),10} = 0;
                end
            end
            if (J{i,11} == 4 | J{i,11} == 5)
                if size(E,1)>0
                    E(size(E,1)+ 1,:) = E(size(E,1),:);
                    E(size(E,1),:) = J(m,:);
                    E{size(E,1),8} = 0;
                    E{size(E,1),9} = 0;
                    E{size(E,1),10} = 0;
                end
                if size(E,1)==0
                    E = J(m,:);
                    E{size(E,1),8} = 0;
                    E{size(E,1),9} = 0;
                    E{size(E,1),10} = 0;
                end
            end
        end
        if ((J{i,10}==1 & J{i,9}==0 & J{i,8}==0)| (J{i,10}==1 & J{i,9}==0 & J{i,8}==1))
            if J{i,11} == 1
                if size(A,1)>0
                    A(size(A,1)+1,:) = A(size(A,1),:);
                    A(size(A,1),:) = J(m,:);
                    A{size(A,1),8} = 0;
                    A{size(A,1),9} = 0;
                    A{size(A,1),10} = 0;
                end
                if size(A,1)==0
                    A = J(m,:);
                    A{size(A,1),8} = 0;
                    A{size(A,1),9} = 0;
                    A{size(A,1),10} = 0;
                end
            end
            
             if J{i,11} == 2
                if size(B,1)>0
                    B(size(B,1)+ 1,:) = B(size(B,1),:);
                    B(size(B,1),:) = J(m,:);
                    B{size(B,1),8} = 0;
                    B{size(B,1),9} = 0;
                    B{size(B,1),10} = 0;
                end
                if size(B,1)==0
                    B = J(m,:);
                    B{size(B,1),8} = 0;
                    B{size(B,1),9} = 0;
                    B{size(B,1),10} = 0;
                end
            end
            if J{i,11} == 3
                if size(C,1)>0
                    C(size(C,1)+ 1,:) = C(size(C,1),:);
                    C(size(C,1),:) = J(m,:);
                    C{size(C,1),8} = 0;
                    C{size(C,1),9} = 0;
                    C{size(C,1),10} = 0;
                end
                if size(C,1)==0
                    C = J(m,:);
                    C{size(C,1),8} = 0;
                    C{size(C,1),9} = 0;
                    C{size(C,1),10} = 0;
                end
            end
            if J{i,11} == 4
                if size(D,1)>0
                    D(size(D,1)+ 1,:) = D(size(D,1),:);
                    D(size(D,1),:) = J(m,:);
                    D{size(D,1),8} = 0;
                    D{size(D,1),9} = 0;
                    D{size(D,1),10} = 0;
                end
                if size(D,1)==0
                    D = J(m,:);
                    D{size(D,1),8} = 0;
                    D{size(D,1),9} = 0;
                    D{size(D,1),10} = 0;
                end
            end
            if J{i,11} == 5
                if size(E,1)>0
                    E(size(E,1)+ 1,:) = E(size(E,1),:);
                    E(size(E,1),:) = J(m,:);
                    E{size(E,1),8} = 0;
                    E{size(E,1),9} = 0;
                    E{size(E,1),10} = 0;
                end
                if size(E,1)==0
                    E = J(m,:);
                    E{size(E,1),8} = 0;
                    E{size(E,1),9} = 0;
                    E{size(E,1),10} = 0;
                end
            end
        end
        m=m+1;
    end
    for i = 1:15
        J{i,8}=0;
        J{i,9}=0;
        J{i,10}=0;
    end

    
global total_questions
Y =['Round ',num2str(total_questions),' Complete'];
msgbox(Y)    
global t
t = 1;
total_questions = total_questions + 1;
% disp(t)
% disp(A)
% disp(B)
% disp(C)
% disp(D)
% disp(E)
% disp(J)
% if size(E,1)==0
%         disp('Box E is Empty. Start the Flash Card game again.');
%         Com(hObject,eventdata, handles, varargin)
% end
%     
% if size(E,1)==30
%         disp('Box E is Full. You Learned All Cards.Start the Flash Card game again.');
%         Com(hObject,eventdata, handles, varargin)
% end

% disp('Complete cycle')

    playagain = menu('Want to continue the Game..??,','Yes','No..:-(','Start Game Again');
    if playagain == 3
        close
        Game
%         return;
%         figure1_CloseRequestFcn(hObject,eventdata,handles)
    end
    if (playagain == 2 |  playagain ==0)
        close
        msgbox('Thank You for Playing...(^_^)')
%         return;
%         figure1_CloseRequestFcn(hObject,eventdata,handles)
    end
    if playagain == 1
        main(hObject,eventdata, handles, varargin)
    end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);

global t
global J
S = J{t,6};

set(handles.Ans, 'string',S);              
guidata(hObject,handles);

