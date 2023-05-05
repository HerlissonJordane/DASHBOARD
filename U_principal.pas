unit U_principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMXTee.Engine,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.DateTimeCtrls, FMX.ListBox,
  FMX.Controls3D, FMXTee.Chart3D, FMX.Ani, System.ImageList, FMX.ImgList,
  Data.DB, Data.Win.ADODB;

type
  TFrm_principal = class(TForm)
    Rect_resumo_mensal: TRectangle;
    Rect_contas_receber: TRectangle;
    Rect_contas_pagar: TRectangle;
    Rect_lucro: TRectangle;
    Rect_vendas_mensal: TRectangle;
    img_mensal: TCircle;
    img_lucro: TCircle;
    img_pagar: TCircle;
    img_receber: TCircle;
    Label1: TLabel;
    Label_valor_mensal: TLabel;
    Rect_graficos: TRectangle;
    Chart_vendas_por_mes: TChart;
    Series1: TFastLineSeries;
    Rect_grafico_meta: TRectangle;
    Label3: TLabel;
    Label_valor_lucro: TLabel;
    Label5: TLabel;
    Label_valor_pagar: TLabel;
    Label7: TLabel;
    Label_valor_receber: TLabel;
    Rect_meta_mensal: TRectangle;
    Rect_super_meta: TRectangle;
    Label9: TLabel;
    Label10: TLabel;
    Rect_toolbar: TRectangle;
    Label_usuario: TLabel;
    Rect_info_diaria: TRectangle;
    React_vendas_hoje: TRoundRect;
    img_vendas_hoje: TImage;
    Label14: TLabel;
    Label_valor_hoje: TLabel;
    Rect_qtd_vendas_hoje: TRoundRect;
    img_qtd_produtos: TImage;
    Label16: TLabel;
    Label_qtd: TLabel;
    Rect_tktMedio_hoje: TRoundRect;
    img_tkt_medio: TImage;
    Label18: TLabel;
    Label_valo_tktMedio: TLabel;
    Label_valor_meta: TLabel;
    Label_valor_superMeta: TLabel;
    Arc_Base: TArc;
    Arc_meta: TArc;
    Label_percentual_Meta: TLabel;
    Anim_grafico_meta: TFloatAnimation;
    Arc_base2: TArc;
    Arc_superMeta: TArc;
    Label_percentual_superMeta: TLabel;
    Anim_grafico_superMeta: TFloatAnimation;
    StyleBook1: TStyleBook;
    Rect_data_final: TRectangle;
    DateEdit_final: TDateEdit;
    Rect_data_inicial: TRectangle;
    DateEdit_inicial: TDateEdit;
    img_atualizar: TCircle;
    Btn_atualizar: TRectangle;
    Label_atualizar: TLabel;
    Anim_rotacao_btn: TFloatAnimation;
    Anim_largura_rect: TFloatAnimation;
    Anim_opacidade: TFloatAnimation;
    Anim_X_mensal: TFloatAnimation;
    Anim_Y_mensal: TFloatAnimation;
    Anim_X_lucro: TFloatAnimation;
    Anim_Y_lucro: TFloatAnimation;
    Anim_X_pagar: TFloatAnimation;
    Anim_Y_pagar: TFloatAnimation;
    Anim_X_receber: TFloatAnimation;
    Anim_Y_receber: TFloatAnimation;
    ADOConnection1: TADOConnection;
    ADOQuery_painel_mensal: TADOQuery;
    ADOQuery_informacoes_diarias: TADOQuery;
    Timer_info_diarias: TTimer;
    DS_grafico: TDataSource;
    ADOQuery_grafico: TADOQuery;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure Rect_vendas_mensalMouseEnter(Sender: TObject);
    procedure Rect_vendas_mensalMouseLeave(Sender: TObject);
    procedure Rect_lucroMouseLeave(Sender: TObject);
    procedure Rect_lucroMouseEnter(Sender: TObject);
    procedure Rect_contas_pagarMouseEnter(Sender: TObject);
    procedure Rect_contas_pagarMouseLeave(Sender: TObject);
    procedure Rect_contas_receberMouseEnter(Sender: TObject);
    procedure Rect_contas_receberMouseLeave(Sender: TObject);
    procedure img_atualizarClick(Sender: TObject);
    procedure Timer_info_diariasTimer(Sender: TObject);
    procedure img_atualizarMouseEnter(Sender: TObject);
    procedure img_atualizarMouseLeave(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure Atualiza_dados;
    procedure Atualiza_Resumo_Mensal;
    procedure informacoesDiarias;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_principal: TFrm_principal;

implementation

{$R *.fmx}

procedure TFrm_principal.img_atualizarClick(Sender: TObject);
begin
  Atualiza_dados();
  Anim_grafico_meta.Start;
  Anim_grafico_superMeta.Start;
end;

procedure TFrm_principal.img_atualizarMouseEnter(Sender: TObject);
begin
  Anim_rotacao_btn.Inverse:= False;
  Anim_rotacao_btn.Start;

  Anim_opacidade.Inverse:= False;
  Anim_opacidade.Delay:= 0.2;
  Anim_opacidade.Start;

  Anim_largura_rect.Inverse:= False;
  Anim_largura_rect.Start;
end;

procedure TFrm_principal.img_atualizarMouseLeave(Sender: TObject);
begin
  Anim_rotacao_btn.Inverse:= True;
  Anim_rotacao_btn.Start;

  Anim_opacidade.Inverse:= True;
  Anim_opacidade.Delay:= 0;
  Anim_opacidade.Start;

  Anim_largura_rect.Inverse:= True;
  Anim_largura_rect.Start;
end;

procedure TFrm_principal.FormShow(Sender: TObject);
begin

  Anim_grafico_meta.StopValue:= 270;
  Anim_grafico_superMeta.StopValue:= 170;
  Anim_grafico_meta.Start;
  Anim_grafico_superMeta.Start;
  Atualiza_dados();

end;

procedure TFrm_principal.Rect_vendas_mensalMouseEnter(Sender: TObject);
begin
  Anim_X_mensal.Inverse:= False;
  Anim_X_mensal.Start;

  Anim_Y_mensal.Inverse:= False;
  Anim_Y_mensal.Start;
end;

procedure TFrm_principal.Rect_vendas_mensalMouseLeave(Sender: TObject);
begin
  Anim_X_mensal.Inverse:= True;
  Anim_X_mensal.Start;

  Anim_Y_mensal.Inverse:= True;
  Anim_Y_mensal.Start;
end;

procedure TFrm_principal.SpeedButton1Click(Sender: TObject);
begin
  Series1.Clear;
  Series1.addY(0,'');
  Series1.addY(1200.50,'Jan');
  Series1.addY(1300.00,'Fev');
  Series1.addY(620.00,'Mar');
  Series1.addY(880.00,'Abr');
  Series1.addY(701.00,'Mai');
  Series1.addY(664.50,'Jun');
  Series1.addY(70,'Jul');
  Series1.addY(20,'Ago');
  Series1.addY(12,'Set');
  Series1.addY(12,'Out');
  Series1.addY(12,'Nov');
  Series1.addY(12,'Dez');

end;

procedure TFrm_principal.Timer_info_diariasTimer(Sender: TObject);
begin
  informacoesDiarias();
end;

procedure TFrm_principal.Rect_contas_receberMouseEnter(Sender: TObject);
begin
  Anim_X_receber.Inverse:= False;
  Anim_X_receber.Start;

  Anim_Y_receber.Inverse:= False;
  Anim_Y_receber.Start;
end;

procedure TFrm_principal.Rect_contas_receberMouseLeave(Sender: TObject);
begin
  Anim_X_receber.Inverse:= True;
  Anim_X_receber.Start;

  Anim_Y_receber.Inverse:= True;
  Anim_Y_receber.Start;
end;

procedure TFrm_principal.Rect_contas_pagarMouseEnter(Sender: TObject);
begin
  Anim_X_pagar.Inverse:= False;
  Anim_X_pagar.Start;

  Anim_Y_pagar.Inverse:= False;
  Anim_Y_pagar.Start;
end;

procedure TFrm_principal.Rect_contas_pagarMouseLeave(Sender: TObject);
begin
  Anim_X_pagar.Inverse:= True;
  Anim_X_pagar.Start;

  Anim_Y_pagar.Inverse:= True;
  Anim_Y_pagar.Start;
end;

procedure TFrm_principal.Rect_lucroMouseEnter(Sender: TObject);
begin

  Anim_X_lucro.Inverse:= False;
  Anim_X_lucro.Start;

  Anim_Y_lucro.Inverse:= False;
  Anim_Y_lucro.Start;
end;

procedure TFrm_principal.Rect_lucroMouseLeave(Sender: TObject);
begin
  Anim_X_lucro.Inverse:= True;
  Anim_X_lucro.Start;

  Anim_Y_lucro.Inverse:= True;
  Anim_Y_lucro.Start;
end;

procedure TFrm_principal.Atualiza_dados();
begin
  Atualiza_Resumo_Mensal();
  informacoesDiarias();
end;

procedure TFrm_principal.Atualiza_Resumo_Mensal();
begin
  ADOQuery_painel_mensal.Close;
  ADOQuery_painel_mensal.SQL.Clear;
  ADOQuery_painel_mensal.SQL.Add('PR_TOTAL_VENDAS_PERIODO '
                                +chr(39)+DateToStr(DateEdit_inicial.Date)+chr(39)+', '
                                +chr(39)+DateToStr(DateEdit_final.Date)+chr(39)
                                );
  ADOQuery_painel_mensal.Open;

  Label_valor_mensal.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_painel_mensal.FieldByName('total').AsCurrency);


  ADOQuery_painel_mensal.Close;
  ADOQuery_painel_mensal.SQL.Clear;
  ADOQuery_painel_mensal.SQL.Add('PR_CALCULA_LUCRO '
                                +chr(39)+DateToStr(DateEdit_inicial.Date)+chr(39)+', '
                                +chr(39)+DateToStr(DateEdit_final.Date)+chr(39)
                                );
  ADOQuery_painel_mensal.Open;

  Label_valor_lucro.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_painel_mensal.FieldByName('lucro').AsCurrency);


end;

procedure TFrm_principal.informacoesDiarias();
begin
  ADOQuery_informacoes_diarias.Close;
  ADOQuery_informacoes_diarias.SQL.Clear;
  ADOQuery_informacoes_diarias.SQL.Add('PR_DASH_INFORMACOES_DIARIAS ');
  ADOQuery_informacoes_diarias.Open;

  Label_valor_hoje.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_informacoes_diarias.FieldByName('total').AsCurrency);
  Label_valo_tktMedio.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_informacoes_diarias.FieldByName('ticket').AsCurrency);
  Label_qtd.Text:= FormatCurr('####,###0.000',ADOQuery_informacoes_diarias.FieldByName('quantidade').AsCurrency);
end;

end.
