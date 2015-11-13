function [RA,VA,RB,VB] = vectorsFromScalars([XA,YA,VXA,VYA,XB,YB,VXB,VYB]);
RA = [XA,YA];
VA = [VXA,VYA];
RB = [XB,YB];
VB = [VXB,VYB];
end