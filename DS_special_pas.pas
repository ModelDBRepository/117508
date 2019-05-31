unit DS_special_pas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Math, TeEngine, Series, TeeProcs, Chart, ComCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label6: TLabel;
    Edit9: TEdit;
    Label7: TLabel;
    Edit10: TEdit;
    Label8: TLabel;
    Edit11: TEdit;
    Label10: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    Edit24: TEdit;
    Label20: TLabel;
    Edit25: TEdit;
    Image5: TImage;
    Label21: TLabel;
    Image6: TImage;
    Label22: TLabel;
    Label23: TLabel;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Label25: TLabel;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Image7: TImage;
    Image3: TImage;
    Image9: TImage;
    Image10: TImage;
    Edit33: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit41: TEdit;
    CheckBox1: TCheckBox;
    Label24: TLabel;
    Edit32: TEdit;
    Image8: TImage;
    Label5: TLabel;
    Image11: TImage;
    Image12: TImage;
    Edit12: TEdit;
    Edit17: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Label9: TLabel;
    Edit23: TEdit;
    Edit30: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Edit31: TEdit;
    Label31: TLabel;
    Edit42: TEdit;
    Button5: TButton;
    Button6: TButton;
    Label13: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Edit44: TEdit;
    Edit45: TEdit;
    ProgressBar1: TProgressBar;
    Label34: TLabel;
    Edit46: TEdit;
    Label35: TLabel;
    Edit47: TEdit;
    Edit48: TEdit;
    Button7: TButton;
    Button8: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Edit49: TEdit;
    Edit50: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    Memo1: TMemo;
    Label41: TLabel;
    Chart1: TChart;
    Series3: TPointSeries;
    Series1: TPointSeries;
    Series2: TPointSeries;
    Series4: TPointSeries;
    Series5: TPointSeries;
    Series6: TPointSeries;
    Series7: TFastLineSeries;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  N,NJ:integer;
  yh:array[0..9] of real;
  ar,a2r,a3r,a3ro,tx,
  rr,a2ro,a3d,a2d,ad,d:array[0..20000] of real;
  am,ta1,ta2,rt,tt0,tt1,tt2,agon,ag,
  rish,arish,a2rish,a3rish,a3roish,
  dish,adish,a2dish,a3dish,a2roish,
  k01,k10,k12,k21,k23,k32,k34,k43,
  k87,k78,k76,k67,k65,k56,k54,k45,
  k08,k80,k96,k69,k29,k92,
  tauf,taus:real;

implementation

{$R *.DFM}


function Sign(xs:real):real;
begin
   if xs=0 then Sign:=0 else
   if xs>0 then Sign:=1 else Sign:=-1;
end;

function Vspl(xt,x0,x1,xa:real):real;
var xf1,xf2,taf,tas,pok:real;
begin
   pok:=1.0/6.0;
   taf:=tauf/Ln((1-Power(0.1,pok))/(1-Power(0.9,pok)));
   tas:=-1.0*taus/Ln(0.1);
   if xt<x0 then xf1:=0.0
   else xf1:=Power(1.0-exp((x0-xt)/taf),6.0);
   if xt<(x0+x1) then xf2:=1.0
   else xf2:=1.0*exp((x0+x1-xt)/tas);
   Vspl:=xf1*xf2*xa;
end;

function so1(so1so0,so1so1,so1so2:real):real;
begin
so1:=k01*ag*so1so0-k10*so1so1-k12*ag*so1so1+k21*so1so2;
end;


function so2(so2so1,so2so2,so2so3,so2so9:real):real;
begin
so2:=k12*ag*so2so1-k21*so2so2-k23*ag*so2so2+k32*so2so3
-k29*so2so2+k92*so2so9;
end;


function so3(so3so2,so3so3,so3so4:real):real;
begin
so3:=k23*ag*so3so2-k32*so3so3-k34*so3so3+k43*so3so4;
end;

function so4(so4so3,so4so4,so4so5:real):real;
begin
so4:=k34*so4so3-k43*so4so4-k45*so4so4+k54*so4so5;
end;

function so9(so9so2,so9so6,so9so9:real):real;
begin
so9:=k29*so9so2-k92*so9so9-k96*so9so9+k69*so9so6;
end;


function so5(so5so4,so5so5,so5so6:real):real;
begin
so5:=k65*ag*so5so6-k56*so5so5-k54*so5so5+k45*so5so4;
end;

function so6(so6so5,so6so6,so6so7,so6so9:real):real;
begin
so6:=k76*ag*so6so7-k67*so6so6-k65*ag*so6so6+k56*so6so5
-k69*so6so6+k96*so6so9;
end;

function so7(so7so6,so7so7,so7so8:real):real;
begin
so7:=k87*ag*so7so8-k78*so7so7+k67*so7so6-k76*ag*so7so7;
end;

function so8(so8so0,so8so7,so8so8:real):real;
begin
so8:=k78*so8so7-k87*ag*so8so8-k80*so8so8+k08*so8so0;
end;


procedure TForm1.Button3Click(Sender: TObject);
var iii,jjj:integer;
fou:TextFile;
si:string;
begin
si:=TimeToStr(Time);
jjj:=Length(si)-1;
for iii:=0 to jjj do if si[iii]=':' then si[iii]:='_';
si:='DS_special_'+si+'.dat';
AssignFile(fou,si);
Rewrite(fou);
Writeln(fou,'    t       r      ar    a2r    a3r    a3ro   a2ro   a3d    a2d     ad     d      rm');
for iii:=1 to NJ do
Writeln(fou,tx[iii]:9:3,rr[iii]:7:3,ar[iii]:7:3,a2r[iii]:7:3,a3r[iii]:7:3,
a3ro[iii]:7:3,a2ro[iii]:7:3,a3d[iii]:7:3,a2d[iii]:7:3,ad[iii]:7:3,d[iii]:7:3);
Writeln(fou);
if CheckBox1.Checked=false then
begin
Writeln(fou,'ag = ',agon:9:6,'   t0 = ',tt0:9:6,'   t1 = ',tt1:9:6,'   t2 = ',tt2:9:6);
Writeln(fou,'am = ',am:9:6,'  tau1 = ',ta1:12:6,'  tau2 = ',ta2:12:6,'  rt = ',rt:12:6);
Writeln(fou,'tauf = ',tauf:9:6,'  taus = ',taus:9:6,'  Parametr file: ',Edit48.Text);
end;
Writeln(fou);
Writeln(fou,'k01 = ',k01:13:5,'      k10 = ',k10:13:5);
Writeln(fou,'k12 = ',k12:13:5,'      k21 = ',k21:13:5);
Writeln(fou,'k23 = ',k23:13:5,'      k32 = ',k32:13:5);
Writeln(fou,'k34 = ',k34:13:5,'      k43 = ',k43:13:5);
Writeln(fou);
Writeln(fou,'k87 = ',k87:13:5,'      k78 = ',k78:13:5);
Writeln(fou,'k76 = ',k76:13:5,'      k67 = ',k67:13:5);
Writeln(fou,'k65 = ',k65:13:5,'      k56 = ',k56:13:5);
Writeln(fou,'k54 = ',k54:13:5,'      k45 = ',k45:13:5);
Writeln(fou);
Writeln(fou,'k08 = ',k08:13:5,'      k80 = ',k80:13:5);
Writeln(fou,'k96 = ',k96:13:5,'      k69 = ',k69:13:5);
Writeln(fou,'k29 = ',k29:13:5,'      k92 = ',k92:13:5);
Writeln(fou);
Writeln(fou,'   d ------- ad ------ a2d ----- a3d ----- a2ro');
Writeln(fou,'   r ------- ar ------ a2r ----- a3r ----- a3ro');
for iii:=8 downto 5 do
Write(fou,yh[iii]:10:5);
Writeln(fou,yh[9]:10:5);
for iii:=0 to 4 do
Write(fou,yh[iii]:10:5);
CloseFile(fou);

end;

procedure TForm1.Button1Click(Sender: TObject);
var fop:TextFile;
par:real;
ps,psn:string;
pj,pk,pm:integer;
begin
ForceCurrentDirectory:=True;
OpenDialog1.DefaultExt:='tpt';
OpenDialog1.Filter:='Parameter files(*.tpt)|*.tpt';
OpenDialog1.FilterIndex := 1;
if OpenDialog1.Execute then
begin
ps:=OpenDialog1.FileName;
pk:=Length(ps);
pm:=1;
for pj:=1 to pk do if ps[pj]='\' then pm:=pj;
psn:=ps;
Delete(psn,1,pm);
AssignFile(fop,ps);
Reset(fop);
readln(fop,par);
Edit1.Text:=FloatToStrF(par,ffFixed,9,2);
readln(fop,par);
Edit2.Text:=FloatToStrF(par,ffFixed,5,2);
readln(fop,par);
Edit3.Text:=FloatToStrF(par,ffFixed,9,2);
readln(fop,par);
Edit4.Text:=FloatToStrF(par,ffFixed,5,2);
readln(fop,par);
Edit12.Text:=FloatToStrF(par,ffFixed,9,2);
readln(fop,par);
Edit17.Text:=FloatToStrF(par,ffFixed,5,2);
readln(fop,par);
Edit5.Text:=FloatToStrF(par,ffFixed,6,2);
readln(fop,par);
Edit6.Text:=FloatToStrF(par,ffFixed,6,2);
readln(fop,par);
Edit7.Text:=FloatToStrF(par,ffFixed,8,3);
readln(fop,par);
Edit8.Text:=FloatToStrF(par,ffFixed,8,5);
readln(fop,par);
Edit26.Text:=FloatToStrF(par,ffFixed,6,2);
readln(fop,par);
Edit27.Text:=FloatToStrF(par,ffFixed,7,3);
readln(fop,par);
Edit28.Text:=FloatToStrF(par,ffFixed,6,2);
readln(fop,par);
Edit29.Text:=FloatToStrF(par,ffFixed,7,3);
readln(fop,par);
Edit19.Text:=FloatToStrF(par,ffFixed,6,2);
readln(fop,par);
Edit20.Text:=FloatToStrF(par,ffFixed,7,3);
readln(fop,par);
Edit33.Text:=FloatToStrF(par,ffFixed,7,5);
readln(fop,par);
Edit39.Text:=FloatToStrF(par,ffFixed,7,3);
readln(fop,par);
Edit38.Text:=FloatToStrF(par,ffFixed,8,3);
readln(fop,par);
Edit22.Text:=FloatToStrF(par,ffFixed,8,5);
readln(fop,par);
Edit21.Text:=FloatToStrF(par,ffFixed,7,2);
readln(fop,par);
Edit41.Text:=FloatToStrF(par,ffFixed,7,2);
readln(fop,par);
Edit9.Text:=FloatToStrF(par,ffFixed,9,7);
readln(fop,par);
Edit10.Text:=FloatToStrF(par,ffFixed,7,2);
readln(fop,par);
Edit31.Text:=FloatToStrF(par,ffFixed,7,2);
readln(fop,par);
Edit42.Text:=FloatToStrF(par,ffFixed,7,2);
readln(fop,par);
Edit46.Text:=FloatToStrF(par,ffFixed,8,4);
readln(fop,par);
Edit47.Text:=FloatToStrF(par,ffFixed,8,4);
Edit48.Text:=psn;
CloseFile(fop);
end
else
begin
Edit1.Text:='600000.0';
Edit2.Text:='10000.0';
Edit3.Text:='400000.0';
Edit4.Text:='20000.0';
Edit12.Text:='200000.0';
Edit17.Text:='30000.0';
Edit5.Text:='50.0';
Edit6.Text:='0.1';
Edit7.Text:='15.0';
Edit8.Text:='0.0003';
Edit26.Text:='300000.0';
Edit27.Text:='0.2';
Edit28.Text:='200000.0';
Edit29.Text:='0.4';
Edit19.Text:='100000.0';
Edit20.Text:='0.6';
Edit33.Text:='0.01';
Edit39.Text:='500.0';
Edit38.Text:='15.0';
Edit22.Text:='0.0003';
Edit21.Text:='50.0';
Edit41.Text:='0.1';
Edit9.Text:='0.01';
Edit10.Text:='0.0';
Edit31.Text:='2.0';
Edit42.Text:='0.0';
Edit46.Text:='0.04';
Edit47.Text:='0.04';
Edit48.Text:='control.tpt';
end;
Edit11.Text:='0.005';
Edit13.Text:='1.0';
Edit14.Text:='0.0';
Edit15.Text:='0.0';
Edit30.Text:='0.0';
Edit16.Text:='0.0';
Edit45.Text:='0.0';
Edit23.Text:='0.0';
Edit36.Text:='0.0';
Edit35.Text:='0.0';
Edit34.Text:='0.0';
Edit44.Text:='???.?';
Edit24.Text:='???.?';
Edit49.Text:='1.0';
Edit50.Text:='???.?';
Edit25.Text:='???.?';
Edit32.Text:='???.?';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Series3.Clear;
Series2.Clear;
Series1.Clear;
Series4.Clear;
Series5.Clear;
Series6.Clear;
Series7.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
label 1,2,51,79,99;
const
   Nmax=10000000;
   uround:real=1.73e-18;
   c2:real=1./18. ;
   c3:real=1./12. ;
   c4:real=1./8.  ;
   c5:real=5./16. ;
   c6:real=3./8.   ;
   c7:real=59./400.;
   c8:real=93./200.;
   c9:real=5490023248./9719169821.;
   c10:real=13./20. ;
   c11:real=1201146811./1299019798.;
   c12:real=1.      ;
   c13:real=1.      ;
   a21:real=1./18.  ;
   a31:real=1./48.   ;
   a32:real=1./16.   ;
   a41:real=1./32.   ;
   a43:real=3./32.    ;
   a51:real=5./16.    ;
   a53:real= -75./64. ;
   a54:real= 75./64.    ;
   a61:real=3./80.    ;
   a64:real=3./16.    ;
   a65:real=3./20.     ;
   a71:real=29443841./614563906.   ;
   a74:real=77736538./692538347.   ;
   a75:real= -28693883./1125.e6    ;
   a76:real=23124283./18.e8        ;
   a81:real=16016141./946692911.    ;
   a84:real=61564180./158732637.     ;
   a85:real=22789713./633445777.     ;
   a86:real=545815736./2771057229.   ;
   a87:real= -180193667./1043307555. ;
   a91:real=39632708./573591083.      ;
   a94:real= -433636366./683701615.   ;
   a95:real= -421739975./2616292301.  ;
   a96:real=100302831./723423059.     ;
   a97:real=790204164./839813087.     ;
   a98:real=800635310./3783071287.     ;
   a101:real=246121993./1340847787.     ;
   a104:real= -37695042795./15268766246. ;
   a105:real= -309121744./1061227803.    ;
   a106:real= -12992083./490766935.      ;
   a107:real=6005943493./2108947869.     ;
   a108:real=393006217./1396673457.      ;
   a109:real=123872331./1001029789.      ;
   a111:real= -1028468189./846180014.    ;
   a114:real=8478235783./508512852.      ;
   a115:real=1311729495./1432422823.      ;
   a116:real= -10304129995./1701304382.    ;
   a117:real= -48777925059./3047939560.   ;
   a118:real=15336726248./1032824649.       ;
   a119:real= -45442868181./3398467696.     ;
   a1110:real=3065993473./597172653.        ;
   a121:real=185892177./718116043.          ;
   a124:real= -3185094517./667107341.       ;
   a125:real= -477755414./1098053517.       ;
   a126:real= -703635378./230739211.        ;
   a127:real=5731566787./1027545527.        ;
   a128:real=5232866602./850066563.         ;
   a129:real= -4093664535./808688257.       ;
   a1210:real=3962137247./1805957418.       ;
   a1211:real=65686358./487910083.          ;
   a131:real=403863854./491063109.           ;
   a134:real= -5068492393./434740067.         ;
   a135:real= -411421997./543043805.           ;
   a136:real=652783627./914296604.              ;
   a137:real=11173962825./925320556.      ;
   a138:real= -13158990841./6184727034.   ;
   a139:real=3936647629./1978049680.      ;
   a1310:real= -160528059./685178525.     ;
   a1311:real=248638103./1413531060.      ;
   b1:real=14005451./335480064.           ;
   b6:real= -59238493./1068277825.        ;
   b7:real=181606767./758867731.          ;
   b8:real=561292985./797845732.          ;
   b9:real= -1041891430./1371343529.      ;
   b10:real=760417239./1151165299.        ;
   b11:real=118820643./751138087.         ;
   b12:real= -528747749./2220607170.      ;
   b13:real=1./4.                         ;
   bh1:real=13451932./455176623.     ;
   bh6:real= -808719846./976000145.  ;
   bh7:real=1757004468./5645159321.  ;
   bh8:real=656045339./265891186.      ;
   bh9:real= -3867574721./1518517206.  ;
   bh10:real=465885868./322736535.     ;
   bh11:real=53011238./667516719.      ;
   bh12:real=2./45. ;
var j,jj,ii,im,i,nstep,imi:integer;
dp,x,xend,xold,eps,hmax,h,su,r1,ddp,
t1,t9,t2,t8,a2,a8,r,mam,
posneg,y11s,y12s,hnew,xph,err,denom,fac,
tt,xx,a5,ami,amo,t5:real;
k1,k2,k3,k4,k5,k6,k7,y1,y:array[1..9] of real;
reject,quit:boolean;
{fff:TextFile;   }
begin
{ Assignfile(fff,'sig.dat');
  Rewrite(fff);}
mam:=StrToFloat(Edit49.Text);
if mam<=0.0 then mam:=1.0;
agon:=StrToFloat(Edit9.Text);
tt0:=StrToFloat(Edit10.Text);
tt1:=StrToFloat(Edit31.Text);
tt2:=StrToFloat(Edit42.Text);
tt:=tt0+tt1+tt2;
tauf:=StrToFloat(Edit46.Text);
taus:=StrToFloat(Edit47.Text);
dp:=StrToFloat(Edit11.Text);
if tt<2.0 then dp:=dp*tt/2.0;

  if CheckBox1.Checked=false then
  begin
  if tt0<=2.0 then jj:=Trunc(tt0/(10.0*dp))+1 else
  jj:=Trunc((2.0/(10.0*dp))+((tt0-2.0)/(100.0*dp)))+1;
  if tt1>0.0 then if tt1<=6.0 then
  jj:=jj+Trunc(tt1/dp)+1 else
  jj:=jj+Trunc((6.0/dp)+((tt1-6.0)/(10.0*dp)))+1;
  if tt2>0.0 then
  jj:=jj+Trunc(tt2/(100.0*dp))+1;
  if jj<3 then jj:=3;
  end
  else
  jj:=Trunc(tt/(500.0*dp))+1;
  ProgressBar1.Min:=0;
  ProgressBar1.Max:=jj;
  ProgressBar1.Position:=0;

k01:=StrToFloat(Edit1.Text);
k10:=StrToFloat(Edit2.Text);
k12:=StrToFloat(Edit3.Text);
k21:=StrToFloat(Edit4.Text);
k23:=StrToFloat(Edit12.Text);
k32:=StrToFloat(Edit17.Text);
k34:=StrToFloat(Edit5.Text);
k43:=StrToFloat(Edit6.Text);

k87:=StrToFloat(Edit26.Text);
k78:=StrToFloat(Edit27.Text);
k76:=StrToFloat(Edit28.Text);
k67:=StrToFloat(Edit29.Text);
k65:=StrToFloat(Edit19.Text);
k56:=StrToFloat(Edit20.Text);

k08:=StrToFloat(Edit33.Text);
k80:=StrToFloat(Edit39.Text);
k96:=StrToFloat(Edit38.Text);
k69:=StrToFloat(Edit22.Text);
k29:=StrToFloat(Edit21.Text);
k92:=StrToFloat(Edit41.Text);
k45:=StrToFloat(Edit7.Text);
k54:=StrToFloat(Edit8.Text);

rr[0]:=StrToFloat(Edit13.Text);
ar[0]:=StrToFloat(Edit14.Text);
a2r[0]:=StrToFloat(Edit15.Text);
a3r[0]:=StrToFloat(Edit30.Text);
a3ro[0]:=StrToFloat(Edit16.Text);
a2ro[0]:=StrToFloat(Edit45.Text);
a3d[0]:=StrToFloat(Edit23.Text);
a2d[0]:=StrToFloat(Edit36.Text);
ad[0]:=StrToFloat(Edit35.Text);
d[0]:=StrToFloat(Edit34.Text);
tx[0]:=0.0;
su:=rr[0]+ar[0]+a2r[0]+a3r[0]+a3ro[0]+a2ro[0]+a3d[0]+a2d[0]+ad[0]+d[0];
if (su>1.001) OR (su<0.999) then
begin
rr[0]:=rr[0]/su; ar[0]:=ar[0]/su; a2r[0]:=a2r[0]/su;
a3ro[0]:=a3ro[0]/su; a2ro[0]:=a2ro[0]/su; d[0]:=d[0]/su;
ad[0]:=ad[0]/su; a2d[0]:=a2d[0]/su; a3d[0]:=a3d[0]/su;
a3r[0]:=a3r[0]/su;
end;
xend:=tt; eps:=0.05; h:=0.0001; hmax:=0.5*dp;
y[1]:=ar[0]; y[2]:=a2r[0]; y[3]:=a3r[0]; y[4]:=a3ro[0];
y[5]:=a3d[0]; y[6]:=a2d[0]; y[7]:=ad[0]; y[8]:=d[0]; y[9]:=a2ro[0];

jj:=0; x:=0.0; xold:=x;
        {begin of Runge-Kutta calc}

  quit:=false;
  posneg:=Sign(xend-x);
  hmax:=abs(hmax);
  h:=min(max(1.0e-10,abs(h)),hmax);
  h:=h*posneg;
  reject:=false; nstep:=0;
  {naccpt:=0; nreject:=0; nfcn:=0;}
  su:=rr[0]+ar[0]+a2r[0]+a3r[0];
  Series1.AddXY(x,su,'',clred);
  Series2.AddXY(x,a3ro[0],'',clblue);
  Series3.AddXY(x,a2ro[0],'',cllime);
  su:=a2ro[0]+a3ro[0];
  Series4.AddXY(x,su,'',clfuchsia);
  su:=d[0]+ad[0]+a2d[0]+a3d[0];
  Series5.AddXY(x,su,'',clblack);
  if CheckBox1.Checked=false then
  if x>tt0 then ag:=vspl(x,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  ag:=ag*0.8/agon;
  Series6.AddXY(x,ag,'',clyellow);
  Series7.AddXY(x,0.5,'',clwhite);
{  writeln(fff,j:5,jj:8,y[3]:8:5);}
  { Basic Integration Step }
1:
  if {quit or} (nstep>nmax) or ((x+0.03*h)=x) then goto 79;
  if (x-xend)*posneg>0 then goto 79;        { !!!!!!!!!!! }
  if (x+h-xend)*posneg>0 then h:=xend-x;
  if CheckBox1.Checked=false then
  if x>tt0 then ag:=vspl(x,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  r:=1.0-y[1]-y[2]-y[3]-y[4]-y[5]-y[6]-y[7]-y[8]-y[9];
  k1[1]:=so1(r,y[1],y[2]);
  k1[2]:=so2(y[1],y[2],y[3],y[9]);
  k1[3]:=so3(y[2],y[3],y[4]);
  k1[4]:=so4(y[3],y[4],y[5]);
  k1[9]:=so9(y[2],y[6],y[9]);
  k1[5]:=so5(y[4],y[5],y[6]);
  k1[6]:=so6(y[5],y[6],y[7],y[9]);
  k1[7]:=so7(y[6],y[7],y[8]);
  k1[8]:=so8(r,y[7],y[8]);
2:
{  inc(nstep);}
{ the First 9 stages }
  for i:=1 to 9 do
  y1[i]:=y[i]+h*a21*k1[i];
  r:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  k2[1]:=so1(r,y1[1],y1[2]);
  k2[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k2[3]:=so3(y1[2],y1[3],y1[4]);
  k2[4]:=so4(y1[3],y1[4],y1[5]);
  k2[9]:=so9(y1[2],y1[6],y1[9]);
  k2[5]:=so5(y1[4],y1[5],y1[6]);
  k2[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k2[7]:=so7(y1[6],y1[7],y1[8]);
  k2[8]:=so8(r,y1[7],y1[8]);
  for i:=1 to 9 do
  y1[i]:=y[i]+h*(a31*k1[i]+a32*k2[i]);
  r1:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  xx:=x+c3*h;
  if CheckBox1.Checked=false then
  if xx>tt0 then ag:=vspl(xx,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  k3[1]:=so1(r1,y1[1],y1[2]);
  k3[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k3[3]:=so3(y1[2],y1[3],y1[4]);
  k3[4]:=so4(y1[3],y1[4],y1[5]);
  k3[9]:=so9(y1[2],y1[6],y1[9]);
  k3[5]:=so5(y1[4],y1[5],y1[6]);
  k3[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k3[7]:=so7(y1[6],y1[7],y1[8]);
  k3[8]:=so8(r1,y1[7],y1[8]);
  for i:=1 to 9 do
  y1[i]:=y[i]+h*(a41*k1[i]+a43*k3[i]);
  r1:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  xx:=x+c4*h;
  if CheckBox1.Checked=false then
  if xx>tt0 then ag:=vspl(xx,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  k4[1]:=so1(r1,y1[1],y1[2]);
  k4[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k4[3]:=so3(y1[2],y1[3],y1[4]);
  k4[4]:=so4(y1[3],y1[4],y1[5]);
  k4[9]:=so9(y1[2],y1[6],y1[9]);
  k4[5]:=so5(y1[4],y1[5],y1[6]);
  k4[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k4[7]:=so7(y1[6],y1[7],y1[8]);
  k4[8]:=so8(r1,y1[7],y1[8]);
  for i:=1 to 9 do
  y1[i]:=y[i]+h*(a51*k1[i]+a53*k3[i]+a54*k4[i]);
  r1:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  xx:=x+c5*h;
  if CheckBox1.Checked=false then
  if xx>tt0 then ag:=vspl(xx,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  k5[1]:=so1(r1,y1[1],y1[2]);
  k5[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k5[3]:=so3(y1[2],y1[3],y1[4]);
  k5[4]:=so4(y1[3],y1[4],y1[5]);
  k5[9]:=so9(y1[2],y1[6],y1[9]);
  k5[5]:=so5(y1[4],y1[5],y1[6]);
  k5[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k5[7]:=so7(y1[6],y1[7],y1[8]);
  k5[8]:=so8(r1,y1[7],y1[8]);
  for i:=1 to 9 do
  y1[i]:=y[i]+h*(a61*k1[i]+a64*k4[i]+a65*k5[i]);
  r1:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  xx:=x+c6*h;
  if CheckBox1.Checked=false then
  if xx>tt0 then ag:=vspl(xx,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  k6[1]:=so1(r1,y1[1],y1[2]);
  k6[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k6[3]:=so3(y1[2],y1[3],y1[4]);
  k6[4]:=so4(y1[3],y1[4],y1[5]);
  k6[9]:=so9(y1[2],y1[6],y1[9]);
  k6[5]:=so5(y1[4],y1[5],y1[6]);
  k6[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k6[7]:=so7(y1[6],y1[7],y1[8]);
  k6[8]:=so8(r1,y1[7],y1[8]);
  for i:=1 to 9 do
  y1[i]:=y[i]+h*(a71*k1[i]+a74*k4[i]+a75*k5[i]+a76*k6[i]);
  r1:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  xx:=x+c7*h;
  if CheckBox1.Checked=false then
  if xx>tt0 then ag:=vspl(xx,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  k7[1]:=so1(r1,y1[1],y1[2]);
  k7[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k7[3]:=so3(y1[2],y1[3],y1[4]);
  k7[4]:=so4(y1[3],y1[4],y1[5]);
  k7[9]:=so9(y1[2],y1[6],y1[9]);
  k7[5]:=so5(y1[4],y1[5],y1[6]);
  k7[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k7[7]:=so7(y1[6],y1[7],y1[8]);
  k7[8]:=so8(r1,y1[7],y1[8]);
  for i:=1 to 9 do
  y1[i]:=y[i]+h*(a81*k1[i]+a84*k4[i]+a85*k5[i]+a86*k6[i]+a87*k7[i]);
  r1:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  xx:=x+c8*h;
  if CheckBox1.Checked=false then
  if xx>tt0 then ag:=vspl(xx,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  k2[1]:=so1(r1,y1[1],y1[2]);
  k2[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k2[3]:=so3(y1[2],y1[3],y1[4]);
  k2[4]:=so4(y1[3],y1[4],y1[5]);
  k2[9]:=so9(y1[2],y1[6],y1[9]);
  k2[5]:=so5(y1[4],y1[5],y1[6]);
  k2[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k2[7]:=so7(y1[6],y1[7],y1[8]);
  k2[8]:=so8(r1,y1[7],y1[8]);
  for i:=1 to 9 do
  y1[i]:=y[i]+h*(a91*k1[i]+a94*k4[i]+a95*k5[i]+a96*k6[i]+a97*k7[i]+a98*k2[i]);
  r1:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  xx:=x+c9*h;
  if CheckBox1.Checked=false then
  if xx>tt0 then ag:=vspl(xx,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  k3[1]:=so1(r1,y1[1],y1[2]);
  k3[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k3[3]:=so3(y1[2],y1[3],y1[4]);
  k3[4]:=so4(y1[3],y1[4],y1[5]);
  k3[9]:=so9(y1[2],y1[6],y1[9]);
  k3[5]:=so5(y1[4],y1[5],y1[6]);
  k3[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k3[7]:=so7(y1[6],y1[7],y1[8]);
  k3[8]:=so8(r1,y1[7],y1[8]);
  for i:=1 to 9 do
  y1[i]:=y[i]+h*(a101*k1[i]+a104*k4[i]+a105*k5[i]+a106*k6[i]+a107*k7[i]+a108*k2[i]+a109*k3[i]);
{ Compute Imtermeniate Sums To Save Memory }
  for i:=1 to 9 do
  begin
    y11s:=a111*k1[i]+a114*k4[i]+a115*k5[i]+a116*k6[i]+a117*k7[i]+a118*k2[i]+a119*k3[i];
    y12s:=a121*k1[i]+a124*k4[i]+a125*k5[i]+a126*k6[i]+a127*k7[i]+a128*k2[i]+a129*k3[i];
    k4[i]:=a131*k1[i]+a134*k4[i]+a135*k5[i]+a136*k6[i]+a137*k7[i]+a138*k2[i]+a139*k3[i];
    k5[i]:=b1*k1[i]+b6*k6[i]+b7*k7[i]+b8*k2[i]+b9*k3[i];
    k6[i]:=bh1*k1[i]+bh6*k6[i]+bh7*k7[i]+bh8*k2[i]+bh9*k3[i];
    k2[i]:=y11s;
    k3[i]:=y12s;
  end;
{ The Last 4 stages }
  r1:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  xx:=x+c10*h;
  if CheckBox1.Checked=false then
  if xx>tt0 then ag:=vspl(xx,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  k7[1]:=so1(r1,y1[1],y1[2]);
  k7[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k7[3]:=so3(y1[2],y1[3],y1[4]);
  k7[4]:=so4(y1[3],y1[4],y1[5]);
  k7[9]:=so9(y1[2],y1[6],y1[9]);
  k7[5]:=so5(y1[4],y1[5],y1[6]);
  k7[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k7[7]:=so7(y1[6],y1[7],y1[8]);
  k7[8]:=so8(r1,y1[7],y1[8]);
  for i:=1 to 9 do
  y1[i]:=y[i]+h*(k2[i]+a1110*k7[i]);
  r1:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  xx:=x+c11*h;
  if CheckBox1.Checked=false then
  if xx>tt0 then ag:=vspl(xx,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  k2[1]:=so1(r1,y1[1],y1[2]);
  k2[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k2[3]:=so3(y1[2],y1[3],y1[4]);
  k2[4]:=so4(y1[3],y1[4],y1[5]);
  k2[9]:=so9(y1[2],y1[6],y1[9]);
  k2[5]:=so5(y1[4],y1[5],y1[6]);
  k2[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k2[7]:=so7(y1[6],y1[7],y1[8]);
  k2[8]:=so8(r1,y1[7],y1[8]);
  xph:=x+h;
  for i:=1 to 9 do
  y1[i]:=y[i]+h*(k3[i]+a1210*k7[i]+a1211*k2[i]);
  r1:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  xx:=xph;
  if CheckBox1.Checked=false then
  if xx>tt0 then ag:=vspl(xx,tt0,tt1,agon) else ag:=0.0
  else ag:=0.0;
  k3[1]:=so1(r1,y1[1],y1[2]);
  k3[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k3[3]:=so3(y1[2],y1[3],y1[4]);
  k3[4]:=so4(y1[3],y1[4],y1[5]);
  k3[9]:=so9(y1[2],y1[6],y1[9]);
  k3[5]:=so5(y1[4],y1[5],y1[6]);
  k3[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k3[7]:=so7(y1[6],y1[7],y1[8]);
  k3[8]:=so8(r1,y1[7],y1[8]);
  for i:=1 to 9 do
  y1[i]:=y[i]+h*(k4[i]+a1310*k7[i]+a1311*k2[i]);
  r1:=1.0-y1[1]-y1[2]-y1[3]-y1[4]-y1[5]-y1[6]-y1[7]-y1[8]-y1[9];
  k4[1]:=so1(r1,y1[1],y1[2]);
  k4[2]:=so2(y1[1],y1[2],y1[3],y1[9]);
  k4[3]:=so3(y1[2],y1[3],y1[4]);
  k4[4]:=so4(y1[3],y1[4],y1[5]);
  k4[9]:=so9(y1[2],y1[6],y1[9]);
  k4[5]:=so5(y1[4],y1[5],y1[6]);
  k4[6]:=so6(y1[5],y1[6],y1[7],y1[9]);
  k4[7]:=so7(y1[6],y1[7],y1[8]);
  k4[8]:=so8(r1,y1[7],y1[8]);
{  nfcn:=nfcn+13;}
  for i:=1 to 9 do
  begin
    k5[i]:=y[i]+h*(k5[i]+b10*k7[i]+b11*k2[i]+b12*k3[i]+b13*k4[i]);
    k6[i]:=y[i]+h*(k6[i]+bh10*k7[i]+bh11*k2[i]+bh12*k3[i]);
  end;
{ Error estimation }
  Err:=0;
  for i:=1 to 9 do
  begin
    denom:=max(max(1e-6,abs(k5[i])),max(abs(y[i]),2.0*uround/eps));
    err:=err+sqr((k5[i]-k6[i])/denom);
  end;
  err:=sqrt(err/(5.0));
{ Computation HNEW }
  fac:=max((1.0/6.0),min(3.0,Power(err/eps,1.0/8.0)/0.9));
  hnew:=h/fac; nstep:=nstep+1;
  if err>eps then goto 51;
{ Step is accepted }
{  inc(naccpt);}
  for i:=1 to 9 do
  y[i]:=k5[i];
  yh[0]:=1.0-y[1]-y[2]-y[3]-y[4]-y[5]-y[6]-y[7]-y[8]-y[9];
  for ii:=1 to 9 do yh[ii]:=y[ii];
  x:=xph;
  if CheckBox1.Checked=true then ddp:=500.0*dp
  else
  if x<tt0 then
  if x<2.0 then ddp:=10.0*dp else ddp:=100.0*dp
  else
  if x<(tt0+tt1) then if x<(tt0+6.0) then ddp:=dp else ddp:=10.0*dp
  else if x<(tt0+6.0) then ddp:=dp else ddp:=100.0*dp;
  if (x-xold)>ddp then
  begin
  xold:=xold+ddp;
  jj:=jj+1;
  ProgressBar1.StepBy(1);
  tx[jj]:=x;
  ar[jj]:=y[1];
  a2r[jj]:=y[2];
  a3r[jj]:=y[3];
  a3ro[jj]:=y[4];
  rr[jj]:=yh[0];
  a2ro[jj]:=y[9];
  a3d[jj]:=y[5];
  a2d[jj]:=y[6];
  ad[jj]:=y[7];
  d[jj]:=y[8];
  end;
  if abs(hnew)>hmax then hnew:=posneg*hmax;
  if reject then hnew:=posneg*min(abs(hnew),abs(h));
  reject:=false;
  h:=hnew;
  if (xend-x)<hnew then goto 79;
  goto 1;
51:
  reject:=true;
  h:=hnew;
{  if naccpt>=1 then inc(nreject);}
{  dec(nfcn);}
 if nstep<nmax then goto 2;
79:
        {end of Runge-Kutta calc}
        NJ:=jj; am:=-10.0; ta1:=-10.0; ta2:=-10.0; rt:=-10.0;
         for ii:=1 to jj do
         begin
         su:=rr[ii]+ar[ii]+a2r[ii]+a3r[ii];
         Series1.AddXY(tx[ii],su,'',clred);
         Series2.AddXY(tx[ii],a3ro[ii],'',clblue);
         Series3.AddXY(tx[ii],a2ro[ii],'',cllime);
         su:=a2ro[ii]+a3ro[ii];
         Series4.AddXY(tx[ii],su,'',clfuchsia);
         su:=d[ii]+ad[ii]+a2d[ii]+a3d[ii];
         Series5.AddXY(tx[ii],su,'',clblack);
         if x>tt0 then ag:=vspl(tx[ii],tt0,tt1,agon) else ag:=0.0;
         ag:=ag*0.8/agon;
         Series6.AddXY(tx[ii],ag,'',clyellow);
         end;
  Series7.AddXY(tx[jj],0.5,'',clwhite);
if CheckBox1.Checked=false then
begin
         im:=0; imi:=jj-1;
         for ii:=1 to jj do
         begin
         su:=a2ro[ii]+a3ro[ii];
         if su>am then begin am:=su; im:=ii; end;
         end;
         for ii:=2 to jj-1 do
         if (tx[ii-1]<(tt0+tt1)) AND (tx[ii+1]>(tt0+tt1)) then imi:=ii;
         ami:=a3ro[imi]+a2ro[imi]; amo:=am-ami;
         for ii:=2 to im-1 do
         if ((a3ro[ii-1]+a2ro[ii-1])<0.1*am) AND ((a3ro[ii+1]+a2ro[ii+1])>0.1*am) then t1:=tx[ii];
         for ii:=2 to im-1 do
         if ((a3ro[ii-1]+a2ro[ii-1])<0.9*am) AND ((a3ro[ii+1]+a2ro[ii+1])>0.9*am) then t9:=tx[ii];
         rt:=t9-t1;

         for ii:=im+1 to jj-1 do
         if ((a3ro[ii-1]+a2ro[ii-1]-ami)>0.8*amo) AND ((a3ro[ii+1]+a2ro[ii+1]-ami)<0.8*amo) then
         begin t2:=tx[ii]; a2:=a3ro[ii]+a2ro[ii]; end;
         if (t2<(tt0+tt1)) AND (a2>ami) AND (ami>0.0) then
         ta2:=(t2-tt0-tt1)/ln(ami/a2)
         else ta2:=-1.0;

         t5:=tt0+tt1;
         for ii:=im+1 to jj-1 do
         if ((a3ro[ii-2]+a2ro[ii-2])>0.5*am) AND ((a3ro[ii+2]+a2ro[ii+2])<0.5*am) then t5:=tx[ii];
         if t5<(tt0+tt1) then ta1:=t5-tx[im]
         else ta1:=-1;
end;

Edit13.Text:=FloatToStrF(yh[0],ffFixed,7,4);
Edit14.Text:=FloatToStrF(yh[1],ffFixed,7,4);
Edit15.Text:=FloatToStrF(yh[2],ffFixed,7,4);
Edit30.Text:=FloatToStrF(yh[3],ffFixed,7,4);
Edit16.Text:=FloatToStrF(yh[4],ffFixed,7,4);
Edit45.Text:=FloatToStrF(yh[9],ffFixed,7,4);
Edit23.Text:=FloatToStrF(yh[5],ffFixed,7,4);
Edit36.Text:=FloatToStrF(yh[6],ffFixed,7,4);
Edit35.Text:=FloatToStrF(yh[7],ffFixed,7,4);
Edit34.Text:=FloatToStrF(yh[8],ffFixed,7,4);
Edit24.Text:=FloatToStrF(am,ffFixed,7,4);
Edit50.Text:=FloatToStrF(100.0*am/mam,ffFixed,6,1);
Edit25.Text:=FloatToStrF(ta1,ffFixed,7,4);
Edit44.Text:=FloatToStrF(ta2,ffFixed,7,4);
Edit32.Text:=FloatToStrF(rt,ffFixed,7,4);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
rish:=StrToFloat(Edit13.Text);
arish:=StrToFloat(Edit14.Text);
a2rish:=StrToFloat(Edit15.Text);
a3rish:=StrToFloat(Edit30.Text);
a3roish:=StrToFloat(Edit16.Text);
a2roish:=StrToFloat(Edit45.Text);
a3dish:=StrToFloat(Edit23.Text);
a2dish:=StrToFloat(Edit36.Text);
adish:=StrToFloat(Edit35.Text);
dish:=StrToFloat(Edit34.Text);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
Edit13.Text:=FloatToStr(rish);
Edit14.Text:=FloatToStr(arish);
Edit15.Text:=FloatToStr(a2rish);
Edit30.Text:=FloatToStr(a3rish);
Edit16.Text:=FloatToStr(a3roish);
Edit45.Text:=FloatToStr(a2roish);
Edit23.Text:=FloatToStr(a3dish);
Edit36.Text:=FloatToStr(a2dish);
Edit35.Text:=FloatToStr(adish);
Edit34.Text:=FloatToStr(dish);

end;

procedure TForm1.Button8Click(Sender: TObject);
var foo:TextFile;
pao:real;
pmo,pjo,pko:integer;
pps,ppsn:string;
begin
ForceCurrentDirectory:=True;
SaveDialog1.FileName:=Edit48.Text;
SaveDialog1.Filter:='Parameter files(*.tpt)|*.tpt';
if SaveDialog1.Execute then
begin
pps:=SaveDialog1.FileName;
pko:=Length(pps);
pmo:=1;
for pjo:=1 to pko do if pps[pjo]='\' then pmo:=pjo;
ppsn:=pps;
Delete(ppsn,1,pmo);
AssignFile(foo,pps);
Rewrite(foo);
pao:=StrToFloat(Edit1.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit2.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit3.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit4.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit12.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit17.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit5.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit6.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit7.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit8.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit26.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit27.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit28.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit29.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit19.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit20.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit33.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit39.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit38.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit22.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit21.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit41.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit9.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit10.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit31.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit42.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit46.Text);
writeln(foo,pao);
pao:=StrToFloat(Edit47.Text);
writeln(foo,pao);
Edit48.Text:=ppsn;
CloseFile(foo);
end;

end;

procedure TForm1.Button7Click(Sender: TObject);
var fpp:TextFile;
pkp,pmp,pjp:integer;
ppr:real;
psp,pspn:string;
begin
ForceCurrentDirectory:=True;
OpenDialog1.DefaultExt:='tpt';
OpenDialog1.Filter:='Parameter files(*.tpt)|*.tpt';
if OpenDialog1.Execute then
begin
psp:=OpenDialog1.FileName;
pkp:=Length(psp);
pmp:=1;
for pjp:=1 to pkp do if psp[pjp]='\' then pmp:=pjp;
pspn:=psp;
Delete(pspn,1,pmp);
AssignFile(fpp,psp);
Reset(fpp);
readln(fpp,ppr);
Edit1.Text:=FloatToStrF(ppr,ffFixed,9,2);
readln(fpp,ppr);
Edit2.Text:=FloatToStrF(ppr,ffFixed,5,2);
readln(fpp,ppr);
Edit3.Text:=FloatToStrF(ppr,ffFixed,9,2);
readln(fpp,ppr);
Edit4.Text:=FloatToStrF(ppr,ffFixed,5,2);
readln(fpp,ppr);
Edit12.Text:=FloatToStrF(ppr,ffFixed,9,2);
readln(fpp,ppr);
Edit17.Text:=FloatToStrF(ppr,ffFixed,5,2);
readln(fpp,ppr);
Edit5.Text:=FloatToStrF(ppr,ffFixed,6,2);
readln(fpp,ppr);
Edit6.Text:=FloatToStrF(ppr,ffFixed,6,2);
readln(fpp,ppr);
Edit7.Text:=FloatToStrF(ppr,ffFixed,8,3);
readln(fpp,ppr);
Edit8.Text:=FloatToStrF(ppr,ffFixed,8,5);
readln(fpp,ppr);
Edit26.Text:=FloatToStrF(ppr,ffFixed,6,2);
readln(fpp,ppr);
Edit27.Text:=FloatToStrF(ppr,ffFixed,7,3);
readln(fpp,ppr);
Edit28.Text:=FloatToStrF(ppr,ffFixed,6,2);
readln(fpp,ppr);
Edit29.Text:=FloatToStrF(ppr,ffFixed,7,3);
readln(fpp,ppr);
Edit19.Text:=FloatToStrF(ppr,ffFixed,6,2);
readln(fpp,ppr);
Edit20.Text:=FloatToStrF(ppr,ffFixed,7,3);
readln(fpp,ppr);
Edit33.Text:=FloatToStrF(ppr,ffFixed,7,5);
readln(fpp,ppr);
Edit39.Text:=FloatToStrF(ppr,ffFixed,7,3);
readln(fpp,ppr);
Edit38.Text:=FloatToStrF(ppr,ffFixed,8,3);
readln(fpp,ppr);
Edit22.Text:=FloatToStrF(ppr,ffFixed,8,5);
readln(fpp,ppr);
Edit21.Text:=FloatToStrF(ppr,ffFixed,7,2);
readln(fpp,ppr);
Edit41.Text:=FloatToStrF(ppr,ffFixed,7,2);
readln(fpp,ppr);
Edit9.Text:=FloatToStrF(ppr,ffFixed,9,7);
readln(fpp,ppr);
Edit10.Text:=FloatToStrF(ppr,ffFixed,7,2);
readln(fpp,ppr);
Edit31.Text:=FloatToStrF(ppr,ffFixed,7,2);
readln(fpp,ppr);
Edit42.Text:=FloatToStrF(ppr,ffFixed,7,2);
readln(fpp,ppr);
Edit46.Text:=FloatToStrF(ppr,ffFixed,8,4);
readln(fpp,ppr);
Edit47.Text:=FloatToStrF(ppr,ffFixed,8,4);
Edit48.Text:=pspn;
CloseFile(fpp);
end;

end;

end.
