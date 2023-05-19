unit U_splash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TFrm_Splash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Splash: TFrm_Splash;

implementation

uses U_principal;

{$R *.fmx}

procedure TFrm_Splash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  Frm_splash:= nil;
end;

procedure TFrm_Splash.FormCreate(Sender: TObject);
begin
  Timer1.Interval:= 3000;
  Timer1.Enabled := True;
end;

procedure TFrm_Splash.FormShow(Sender: TObject);
begin
  Image1.Opacity:= 0;
  Image1.AnimateFloat('Opacity',1,0.8);
end;

procedure TFrm_Splash.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  if Not(Assigned(Frm_principal)) then begin
    Application.CreateForm(TFrm_principal, Frm_principal);
  end;

  Application.MainForm:= Frm_principal;
  Frm_principal.Show;
  Frm_Splash.Close;


end;

end.
