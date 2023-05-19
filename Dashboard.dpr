program Dashboard;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_principal in 'U_principal.pas' {Frm_principal},
  U_aviso in 'U_aviso.pas' {Frm_aviso},
  U_splash in 'U_splash.pas' {Frm_Splash};

{$R *.res}

begin
  ReportMemoryLeaksOnShutDown:= True;
  Application.Initialize;
  Application.CreateForm(TFrm_Splash, Frm_Splash);
  Application.Run;
end.
