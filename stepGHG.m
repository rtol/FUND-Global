function [CH4c, N2Oc, SF6c, CFC11c, CFC12c] = stepGHG(CH4c0,CH4e,N2Oc0,N2Oe,SF6c0,SF6e,CFC11c0,CFC11e,CFC12c0,CFC12e)
%function [CH4c, N2Oc, SF6c, CFC11c, CFC12c] = stepGHG(CH4c0,CH4e,N2Oc0,N2Oe,SF6c0,SF6e,CFC11c0,CFC11e,CFC12c0,CFC12e)
%function [CH4c, N2Oc, SF6c, CFC11c, CFC12c] = stepGHG(CH4c0,CH4e,N2Oc0,N2Oe,SF6c0,SF6e,CFC11c0,CFC11e,CFC12c0,CFC12e)

global CH41750 CH4life CH4convert
global N2O1750 N2Olife N2Oconvert
global SF61750 SF6life SF6convert
global CFC11life CFC12life

CH4c = (1-CH4life)*CH4c0 + CH4life*CH41750 + CH4convert*CH4e;
N2Oc = (1-N2Olife)*N2Oc0 + N2Olife*N2O1750 + N2Oconvert*N2Oe;
SF6c = (1-SF6life)*SF6c0 + SF6life*SF61750 + SF6convert*SF6e;
CFC11c = (1-CFC11life)*CFC11c0 + CFC11e;
CFC12c = (1-CFC12life)*CFC12c0 + CFC12e;
        