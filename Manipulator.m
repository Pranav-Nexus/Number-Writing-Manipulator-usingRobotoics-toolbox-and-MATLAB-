function [] = Manipulator(x1,y1,x2,y2)
A1 = 10;
A2 = 10;

%DH Parameters for the 3R manipulator
DH = [0 0 0 0; 0 0 A1 0; 0 0 A2 0]    
A(1)=Link(DH(1,1:4), 'modified')
A(2)=Link(DH(2,1:4), 'modified')
A(3)=Link(DH(3,1:4), 'modified')

Number = SerialLink(A,'name', 'Number Writing Manipulator');

%INVERSE KINMEATICS FOR THE POINT (x2,y2)
qo2 = acos(((x1^2+y1^2)-(A1^2 + A2^2))/(2*A1*A2));
qo1 = atan(y1/x1)-atand((A2*sind(qo2))/(A1+A2*cosd(qo2)));

%INVERSE KINMEATICS FOR THE POINT (x3,y3)
q12 = acos(((x2^2+y2^2)-(A1^2 + A2^2))/(2*A1*A2));
q11 = atan(y2/x2)-atand((A2*sind(q12))/(A1+A2*cosd(q12)));

%Joint Trajectory
qi =[qo1 qo2 0]; 
qd =[q11 q12 0]; 
qt = jtraj(qi,qd,5)  

plot(Number, qt)
end