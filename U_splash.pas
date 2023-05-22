unit U_splash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Ani;

type
  TFrm_Splash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Label_percentual: TLabel;
    ProgressBar1: TProgressBar;
    Anima_progressBar: TFloatAnimation;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Anima_progressBarProcess(Sender: TObject);
    procedure Anima_progressBarFinish(Sender: TObject);
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

procedure TFrm_Splash.Anima_progressBarFinish(Sender: TObject);
begin
  ProgressBar1.Free;
  Label_percentual.Free;
end;

procedure TFrm_Splash.Anima_progressBarProcess(Sender: TObject);
begin
  //PREENCHE O LABEL COM O PERCENTUAL DA PROGRESSBAR
  Label_percentual.Text:=  FormatCurr('#,#0.',ProgressBar1.Value) + '%';
end;

procedure TFrm_Splash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
  Frm_splash:= nil;
end;

procedure TFrm_Splash.FormCreate(Sender: TObject);
begin
  Timer1.Interval:= 4000;
  Timer1.Enabled := True;
end;

procedure TFrm_Splash.FormShow(Sender: TObject);
begin
  Image1.Opacity:= 0;
  Image1.AnimateFloat('Opacity',1,0.8);

end;

procedure TFrm_Splash.Timer1Timer(Sender: TObject);
var Thread: TThread;
begin

  if Not(Assigned(Frm_principal)) then begin
    Application.CreateForm(TFrm_principal, Frm_principal);
  end;

  Application.MainForm:= Frm_principal;

  Thread.CreateAnonymousThread(procedure
  begin
    //FAZ A SINCRONIZAÇÃO COM O QUE ESTÁ NA THREAD PRINCIPAL
    Thread.Synchronize(Thread.CurrentThread, Frm_principal.Show);

  end).Start;

  Timer1.Enabled:= False;
  Frm_Splash.Close;


end;

end.
