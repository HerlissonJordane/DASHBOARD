program Dashboard;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_principal in 'U_principal.pas' {Frm_principal},
  U_aviso in 'U_aviso.pas' {Frm_aviso};

{$R *.res}

begin
  ReportMemoryLeaksOnShutDown:= True;
  Application.Initialize;
  Application.CreateForm(TFrm_principal, Frm_principal);
  Application.Run;
end.
