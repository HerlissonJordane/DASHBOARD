unit Frame_Vendedores;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TF_vendedores = class(TFrame)
    Layout1: TLayout;
    Label_nome: TLabel;
    Label_tiket_medio: TLabel;
    Rectangle1: TRectangle;
    Label_ordem: TLabel;
    Layout2: TLayout;
    Label_total: TLabel;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation


{$R *.fmx}

end.
