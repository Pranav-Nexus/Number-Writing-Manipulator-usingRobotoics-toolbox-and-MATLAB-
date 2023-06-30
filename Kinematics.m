no = input('Enter The Number You wish to Draw:')

switch(no)

    case 0
      disp('Drawing Zero')
      zero()

   case 1
      disp('Drawing One')
      one()

    case 3
        disp('Drawing Three')
        three()
    case 4
        disp('Drawing Four')
        four()

    case 5
        disp('Drawing Five')
        five()

    case 9
        disp("Drawing Nine")
        nine()

end

%%
function Manipulator(x2,y2,x3,y3)

A1 = 10;
A2 = 10;

%DH Parameters for the 3 Joint Planar manipulator
DH = [0 0 0 0; 0 0 A1 0; 0 0 A2 0];    
A(1) = Link(DH(1,1:4), 'modified');
A(2) = Link(DH(2,1:4), 'modified');
A(3) = Link(DH(3,1:4), 'modified');

Number = SerialLink(A,'name', 'Number Writing Manipulator by team E - 16 ')


%INVERSE KINMEATICS FOR THE POINT (x2,y2)
qo2 = acos(((x2^2+y2^2)-(A1^2 + A2^2))/(2*A1*A2));
qo1 = atan(y2/x2)-atand((A2*sind(qo2))/(A1+A2*cosd(qo2)));


%INVERSE KINMEATICS FOR THE POINT (x1,y1)
q12 = acos(((x3^2+y3^2)-(A1^2 + A2^2))/(2*A1*A2));
q11 = atan(y3/x3)-atand((A2*sind(q12))/(A1+A2*cosd(q12)));

qi =[qo1 qo2 0];
qd =[q11 q12 0];
qt = jtraj(qi,qd,5)

plot(Number, qt)
end


function nine()
        Manipulator(12,11,8,11)
        hold on
        x = [12 ; 8 ];
        y = [11 ; 11 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(8,11,8,15)
        hold on
        x = [ 8 ;  8 ];
        y = [ 11 ; 15 ];
        plot(x,y,'LineWidth',2,'color','k')
       
        Manipulator(8,15,12,15)
        hold on
        x = [ 8 ;  12 ];
        y = [ 15 ; 15 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(12,15,12,7)
        hold on
        x = [ 12 ;  12 ];
        y = [ 15 ;  7 ];
        plot(x,y,'LineWidth',2,'color','k')
       
        Manipulator(12,7,8,7)
        hold on
        x = [ 12;  8];
        y = [ 7;  7];
        plot(x,y,'LineWidth',2,'color','k')
        hold off
end

function five()
        Manipulator(12,15,8,15)
        hold on
        x = [12 ; 8 ];
        y = [15 ; 15 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(8,15,8,11)
        hold on
        x = [ 8 ; 8 ];
        y = [15 ;  11 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(8,11,12,11)
        hold on
        x = [ 8 ; 12 ];
        y = [ 11 ;  11 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(12,11,12,7)
        hold on
        x = [12 ;  12 ];
        y = [ 11 ;  7 ];
        plot(x,y,'LineWidth',2,'color','k')
       
        Manipulator(12,7,8,7)
        hold on
        x = [12;  8];
        y = [ 7;  7];
        plot(x,y,'LineWidth',2,'color','k')
        hold off
end

function four()
        Manipulator(12,7,12,15)  %1st line
        hold on
        x = [12;  12];
        y = [ 7;  15];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(12,15,8,11)   %2nd line
        hold on
        x = [12 ; 8 ];
        y = [15 ; 11 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(8,11,14,11)   %3rd line
        hold on
        x = [8 ; 14 ];
        y = [ 11 ; 11 ];
        plot(x,y,'LineWidth',2,'color','k')
end

function three()
        Manipulator(8,15,12,15)
        hold on
        x = [8 ;12 ];
        y = [15 ; 15 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(12,15,12,11)
        hold on
        x = [12 ;      12 ];
        y = [ 15 ; 11 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(12,11,8,11)
        hold on
        x = [12 ;    8 ];
        y = [ 11 ; 11 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(8,11,12,11)
        hold on
        x = [8 ;   12];
        y = [11 ; 11 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(12,11,12,7)
        hold on
        x = [12 ;    12 ];
        y = [ 11 ;  7 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(12,7,8,7)
        hold on
        x = [ 12;  8];
        y = [ 7;  7];
        plot(x,y,'LineWidth',2,'color','k')
end

function one()
        clc;
        Manipulator(6,13,8,15)              
        hold on
        x = [6; 8];        
        y = [13; 15];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(8,15,8,7)               
        hold on
        x = [8; 8];        
        y = [15; 7];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(8,7,12,7)               
        hold on
        x = [8; 12];       
        y = [7; 7];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(12,7,4,7)               
        hold on
        x = [12; 4];      
        y = [7; 7];
        plot(x,y,'LineWidth',2,'color','k')
end

function zero()
        Manipulator(12,7,12,15)
        hold on
        x = [12 ; 12 ];
        y = [7 ; 15 ];
        plot(x,y,'LineWidth',2,'color','k')
        
        Manipulator(12,15,8,15)
        hold on
        x = [ 12  ;8  ];
        y = [15 ;  15  ];
        plot(x,y,'LineWidth',2,'color','k')
      
        Manipulator(8,15,8,7)
        hold on
        x = [ 8  ;  8 ];
        y = [15 ; 7 ];
        plot(x,y,'LineWidth',2,'color','k')
      
        Manipulator(8,7,12,7)
        hold on
        x = [8;  12];
        y = [ 7;  7];
        plot(x,y,'LineWidth',2,'color','k')
        hold off
end