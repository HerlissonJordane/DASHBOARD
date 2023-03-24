program Dashboard;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_principal in 'U_principal.pas' {Frm_principal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm_principal, Frm_principal);
  Application.Run;
end.
