unit U_principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMXTee.Engine,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.DateTimeCtrls, FMX.ListBox,
  FMX.Controls3D, FMXTee.Chart3D, FMX.Ani, System.ImageList, FMX.ImgList,
  Data.DB, Data.Win.ADODB, DateUtils, System.IOUtils, FMX.TabControl,
  FMX.Layouts, Frame_Vendedores;

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
    Label_titulo_meta: TLabel;
    Label_titulo_supermeta: TLabel;
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
    ADOQuery_grafico: TADOQuery;
    Anima_inicio_grafico: TFloatAnimation;
    Series2: TLineSeries;
    Anim_X_grafico: TFloatAnimation;
    Anim_Y_grafico: TFloatAnimation;
    ADOQuery_metas: TADOQuery;
    Btn_configReceber: TCircle;
    RB_vencimento: TRadioButton;
    RB_dataEmissao: TRadioButton;
    RB_todasAberto: TRadioButton;
    RB_dataSelecionada: TRadioButton;
    Rect_config: TCalloutRectangle;
    Rect_separacao: TRectangle;
    Btn_configPagar: TCircle;
    Rect_config_pagar: TCalloutRectangle;
    Rectangle1: TRectangle;
    RB_todasAbertoPagar: TRadioButton;
    RB_dataSelecionadaPagar: TRadioButton;
    RB_emissaoPagar: TRadioButton;
    RB_vencimentoPagar: TRadioButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Rectangle2: TRectangle;
    ListBox1: TListBox;
    VertScrollBox1: TVertScrollBox;
    ADOQuery_vendedores: TADOQuery;
    GridPanelLayout1: TGridPanelLayout;
    Chart1: TChart;
    FloatAnimation3: TFloatAnimation;
    FloatAnimation4: TFloatAnimation;
    FloatAnimation5: TFloatAnimation;
    LineSeries1: TLineSeries;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    Label2: TLabel;
    Arc1: TArc;
    Arc2: TArc;
    Label6: TLabel;
    FloatAnimation1: TFloatAnimation;
    Rectangle4: TRectangle;
    Label8: TLabel;
    Arc3: TArc;
    Arc4: TArc;
    Label10: TLabel;
    FloatAnimation2: TFloatAnimation;
    Rectangle5: TRectangle;
    RoundRect1: TRoundRect;
    Image1: TImage;
    Label11: TLabel;
    Lbl_vendas_vendedor: TLabel;
    RoundRect2: TRoundRect;
    Image2: TImage;
    Label13: TLabel;
    Lbl_qtd_vendedor: TLabel;
    RoundRect3: TRoundRect;
    Image3: TImage;
    Label17: TLabel;
    Lbl_ticket_vendedor: TLabel;
    RoundRect4: TRoundRect;
    Label20: TLabel;
    Label21: TLabel;
    RoundRect5: TRoundRect;
    Label4: TLabel;
    Label9: TLabel;
    Layout2: TLayout;
    Label22: TLabel;
    Label23: TLabel;
    ADOQuery_hist_vendedor: TADOQuery;
    ADOQuery_info_diaria_vendedor: TADOQuery;
    CornerButton1: TCornerButton;
    CornerButton2: TCornerButton;
    RoundRect6: TRoundRect;
    Label12: TLabel;
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
    procedure Chart_vendas_por_mesMouseEnter(Sender: TObject);
    procedure Chart_vendas_por_mesMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Btn_configReceberClick(Sender: TObject);
    procedure Btn_configPagarClick(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure TabControl1Change(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
  private
    procedure Atualiza_dados;
    procedure Atualiza_Resumo_Mensal();
    procedure InformacoesDiarias;
    FUNCTION RetornaMes(numero_mes:Integer): String;
    procedure Preenche_grafico;
    procedure ThreadEnd(Sender: TObject);
    procedure Busca_metas;
    procedure CalculaMetas(Meta, Venda_total: Double; FloatAnimation:TFloatAnimation; Label_percentual:TLabel );
    function Local_do_aplicativo: string;
    procedure Ranking_vendedores();
    function Retorna_Venda_total_Funcionario(Item: TListBoxItem): Double;
    var Processo: String;
        venda_total, meta, super_meta: Double;
        String_connection: TStringList;
    { Private declarations }
  public
    { Public declarations }
    var codigo_loja: String;
  end;

var
  Frm_principal: TFrm_principal;

implementation
{$R *.fmx}
uses U_aviso;

procedure TFrm_principal.FormCreate(Sender: TObject);
var Query: TADOQuery;
begin
  //CRIA A CONEXÃO PEGANDO STRING DO CONFEX
  if Not(ADOConnection1.Connected) then begin

    String_connection:= TStringList.Create;
    if FileExists(Local_do_aplicativo+'confex') then
    begin
      String_connection.LoadFromFile(Local_do_aplicativo+'confex');
    end else
    begin
      String_connection.LoadFromFile('D:\Programas Desenvolvidos\SIPAK - Sistema de automação comercial\PROJETOS\GIT-SIPAK\confex');
    end;
    ADOConnection1.ConnectionString:= String_connection.Text;
    ADOConnection1.Connected:= True;
  end;

  //CONSULTA CÓDIGO DA LOJA LOGADA
  Query:= TADOQuery.Create(nil);
  Query.Connection:= ADOConnection1;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT LJ_ID FROM CAD_LJ');
  Query.Open;

  codigo_loja:= Query.FieldByName('lj_id').AsString;

  String_connection.Free;
  Query.Free;
end;

procedure TFrm_principal.FormShow(Sender: TObject);
var I: Integer;
    FFrame: TF_vendedores;
    item: TListBoxItem;
    data_inicial, data_final: String;
begin
  //ABERTURA DO FORM QUE PREENCHE TODAS AS INFORMAÇÕES
  DateEdit_inicial.Date := StartOfTheMonth(Now); // primeiro dia do mês atual
  DateEdit_final.Date   := EndOfTheMonth(Now); // último dia do mês atual
  Atualiza_dados();

  //ABA VENDEDORES
  Ranking_vendedores();
end;

procedure TFrm_principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOConnection1.Connected:= False;
  Action:= TCloseAction.caFree;
  Frm_principal:= nil;
end;

procedure TFrm_principal.Timer_info_diariasTimer(Sender: TObject);
begin
  //TIMER QUE ATUALIZA AS INFORMAÇÕES DIÁRIAS DE 1 EM 1 MINUTO
  InformacoesDiarias();
end;

{$region 'Animações Painéis'}

procedure TFrm_principal.Rect_vendas_mensalMouseEnter(Sender: TObject);
begin
  //ANIMA O MOVIMENTO DO PAINEL VENDAS MENSAL
  Anim_X_mensal.Inverse:= False;
  Anim_X_mensal.Start;

  Anim_Y_mensal.Inverse:= False;
  Anim_Y_mensal.Start;
end;

procedure TFrm_principal.Rect_vendas_mensalMouseLeave(Sender: TObject);
begin
  //ANIMA O MOVIMENTO DO PAINEL VENDAS MENSAL
  Anim_X_mensal.Inverse:= True;
  Anim_X_mensal.Start;

  Anim_Y_mensal.Inverse:= True;
  Anim_Y_mensal.Start;
end;

procedure TFrm_principal.Chart_vendas_por_mesMouseEnter(Sender: TObject);
begin
  //ANIMA O MOVIMENTO DO GRÁFICO
  Anim_X_grafico.Inverse:= False;
  Anim_X_grafico.Start;

  Anim_Y_grafico.Inverse:= False;
  Anim_Y_grafico.Start;
  //Chart_vendas_por_mes.Legend.VertSpacing:= 4;
end;

procedure TFrm_principal.Chart_vendas_por_mesMouseLeave(Sender: TObject);
begin
  //ANIMA O MOVIMENTO DO GRÁFICO
  Anim_X_grafico.Inverse:= True;
  Anim_X_grafico.Start;

  Anim_Y_grafico.Inverse:= True;
  Anim_Y_grafico.Start;
  //Chart_vendas_por_mes.Legend.VertSpacing:= 2;
end;

procedure TFrm_principal.CornerButton1Click(Sender: TObject);
begin
  if TabControl1.TabIndex > 0 then
    TabControl1.Previous
  else
    TabControl1.TabIndex := TabControl1.TabCount -1; // Retorna para a primeira aba

  case TabControl1.TabIndex of
    0:begin
      Label12.Text:= 'Geral';
    end;
    1:begin
      Label12.Text:= 'Vendedores';
    end;
  end;

end;

procedure TFrm_principal.CornerButton2Click(Sender: TObject);
begin
  if TabControl1.TabIndex < TabControl1.TabCount - 1 then
    TabControl1.Next
  else
    TabControl1.TabIndex := 0; // Retorna para a primeira aba

  case TabControl1.TabIndex of
    0:begin
      Label12.Text:= 'Geral';
    end;
    1:begin
      Label12.Text:= 'Vendedores';
    end;
  end;

end;

procedure TFrm_principal.Btn_configPagarClick(Sender: TObject);
begin
  if Rect_config_pagar.Visible then begin
    Rect_config_pagar.Visible:= False;
    Rect_config_pagar.Align:= TAlignLayout.None;
  end else begin
    Rect_config_pagar.Visible:= True;
    Rect_config_pagar.Align:= TAlignLayout.Top;
  end;
end;

procedure TFrm_principal.Btn_configReceberClick(Sender: TObject);
begin
  if Rect_config.Visible then begin
    Rect_config.Visible:= False;
    Rect_config.Align:= TAlignLayout.None;
  end else begin
    Rect_config.Visible:= True;
    Rect_config.Align:= TAlignLayout.Top;
  end;

end;

procedure TFrm_principal.Rect_contas_receberMouseEnter(Sender: TObject);
begin
  //ANIMA O MOVIMENTO DO PAINEL CONTAS A REECEBER
  Anim_X_receber.Inverse:= False;
  Anim_X_receber.Start;

  Anim_Y_receber.Inverse:= False;
  Anim_Y_receber.Start;
end;

procedure TFrm_principal.Rect_contas_receberMouseLeave(Sender: TObject);
begin
  //ANIMA O MOVIMENTO DO PAINEL CONTAS A RECEBER
  Anim_X_receber.Inverse:= True;
  Anim_X_receber.Start;

  Anim_Y_receber.Inverse:= True;
  Anim_Y_receber.Start;
end;

procedure TFrm_principal.Rect_contas_pagarMouseEnter(Sender: TObject);
begin
  //ANIMA O MOVIMENTO DO PAINEL CONTAS A PAGAR
  Anim_X_pagar.Inverse:= False;
  Anim_X_pagar.Start;

  Anim_Y_pagar.Inverse:= False;
  Anim_Y_pagar.Start;
end;

procedure TFrm_principal.Rect_contas_pagarMouseLeave(Sender: TObject);
begin
  //ANIMA O MOVIMENTO DO PAINEL CONTAS A PAGAR
  Anim_X_pagar.Inverse:= True;
  Anim_X_pagar.Start;

  Anim_Y_pagar.Inverse:= True;
  Anim_Y_pagar.Start;
end;

procedure TFrm_principal.Rect_lucroMouseEnter(Sender: TObject);
begin
  //ANIMA O MOVIMENTO DO PAINEL LUCRO
  Anim_X_lucro.Inverse:= False;
  Anim_X_lucro.Start;

  Anim_Y_lucro.Inverse:= False;
  Anim_Y_lucro.Start;
end;

procedure TFrm_principal.Rect_lucroMouseLeave(Sender: TObject);
begin
  //ANIMA O MOVIMENTO DO PAINEL LUCRO
  Anim_X_lucro.Inverse:= True;
  Anim_X_lucro.Start;

  Anim_Y_lucro.Inverse:= True;
  Anim_Y_lucro.Start;
end;

{$EndRegion 'Animações Painéis'}


{$region 'Botão atualizar'}

procedure TFrm_principal.img_atualizarClick(Sender: TObject);
begin


    if TabItem2.IsSelected then
  begin
    Ranking_vendedores()
  end else
  begin
   //ATUALIZA A PÁGINA
    Atualiza_dados();
    Anim_grafico_meta.Start;
    Anim_grafico_superMeta.Start;
  end;
end;

procedure TFrm_principal.img_atualizarMouseEnter(Sender: TObject);
begin
  //ANIMAÇÃO DO BOTÃO DE ATUALIZAR
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
  //ANIMAÇÃO DO BOTÃO DE ATUALIZAR
  Anim_rotacao_btn.Inverse:= True;
  Anim_rotacao_btn.Start;

  Anim_opacidade.Inverse:= True;
  Anim_opacidade.Delay:= 0;
  Anim_opacidade.Start;

  Anim_largura_rect.Inverse:= True;
  Anim_largura_rect.Start;
end;

{$EndRegion 'Botão atualizar'}


{$REGION 'Procedures'}

procedure TFrm_principal.Atualiza_dados();
var Thread: TThread;
begin
  //CHAMA AS PROCEDURES QUE ATUALIZAM AS INFORMAÇÕES DA TELA

  InformacoesDiarias(); //THREAD PRINCIPAL

  //THREAD 1 --INFORMAÇÕES PAINÉIS SUPERIORES
  Thread:= TThread.CreateAnonymousThread(procedure
  begin
    Processo:= 'Painéis superiores';
    Thread.Synchronize(nil, Atualiza_Resumo_Mensal);
  end);
  Thread.OnTerminate:= ThreadEnd;
  Thread.FreeOnTerminate:= False;
  Thread.Start;
  Thread.WaitFor;
  Thread.Free;

  //THREAD 2  -- PAINEL DE METAS
  Thread:= TThread.CreateAnonymousThread(procedure
  begin
    Thread.Sleep(500);
    Processo:= 'Gráfico Metas';
    Thread.Synchronize(nil, Busca_metas);
  end);
  Thread.OnTerminate:= ThreadEnd;
  Thread.Start;
  //Thread.Free;
  //Thread_metas.WaitFor;

  Preenche_grafico(); //possui thread interna

end;

procedure TFrm_principal.Atualiza_Resumo_Mensal();
var data_inicial, data_final, tipo_data, periodo_data: String;
begin
  venda_total:= 0;
  data_inicial:= FormatDateTime('yyyy-mm-dd', StrToDate(DateEdit_inicial.Text));
  data_final  := FormatDateTime('yyyy-mm-dd', StrToDate(DateEdit_final.Text));

  //BUSCA O VALOR TOTAL DAS VENDAS NO PERÍODO SELECIONADO
  ADOQuery_painel_mensal.Close;
  ADOQuery_painel_mensal.SQL.Clear;
  ADOQuery_painel_mensal.SQL.Add('PR_TOTAL_VENDAS_PERIODO '
                                +chr(39)+data_inicial+chr(39)+', '
                                +chr(39)+data_final+chr(39)
                                );
  ADOQuery_painel_mensal.Open;

  Label_valor_mensal.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_painel_mensal.FieldByName('total').AsCurrency);
  venda_total:= ADOQuery_painel_mensal.FieldByName('total').AsCurrency;
{----------------------------------------------------------------------------------------------------------------------------}

  //BUSCA O LUCRO OBTIDO COM VENDAS NO PERÍODO SELECIONADO
  ADOQuery_painel_mensal.Close;
  ADOQuery_painel_mensal.SQL.Clear;
  ADOQuery_painel_mensal.SQL.Add('PR_CALCULA_LUCRO '
                                +chr(39)+data_inicial+chr(39)+', '
                                +chr(39)+data_final+chr(39)
                                );
  ADOQuery_painel_mensal.Open;

  Label_valor_lucro.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_painel_mensal.FieldByName('lucro').AsCurrency);
{----------------------------------------------------------------------------------------------------------------------------}
  //BUSCA O VALOR DO CONTAS A RECEBER

  if RB_dataEmissao.IsChecked then begin
    tipo_data:= '1'; //DATA EMISSÃO
  end else begin
    tipo_data:= '0'; //DATA VENCIMENTO
  end;

  if RB_dataSelecionada.IsChecked then begin
    periodo_data:= '0'; //PERÍODO DE DATA
  end else begin
    periodo_data:= '1'; //TODAS EM ABERTO ATÉ A DATA FINAL
  end;

  ADOQuery_painel_mensal.Close;
  ADOQuery_painel_mensal.SQL.Clear;
  ADOQuery_painel_mensal.SQL.Add('PR_TOTAL_CONTAS_RECEBER_DASH '
                                +chr(39)+data_inicial+chr(39)+', '
                                +chr(39)+data_final+chr(39)+', '
                                +chr(39)+codigo_loja+chr(39)+', '
                                +chr(39)+tipo_data+chr(39)+', '
                                +chr(39)+periodo_data+chr(39)
                                );
  ADOQuery_painel_mensal.Open;

  Label_valor_receber.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_painel_mensal.FieldByName('saldo').AsCurrency);

{----------------------------------------------------------------------------------------------------------------------------}
  //BUSCA O VALOR DO CONTAS A PAGAR

  if RB_emissaoPagar.IsChecked then begin
    tipo_data:= '1'; //DATA EMISSÃO
  end else begin
    tipo_data:= '0'; //DATA VENCIMENTO
  end;

  if RB_dataSelecionadaPagar.IsChecked then begin
    periodo_data:= '0'; //PERÍODO DE DATA
  end else begin
    periodo_data:= '1'; //TODAS EM ABERTO ATÉ A DATA FINAL
  end;

  ADOQuery_painel_mensal.Close;
  ADOQuery_painel_mensal.SQL.Clear;
  ADOQuery_painel_mensal.SQL.Add('PR_TOTAL_CONTAS_PAGAR_DASH '
                                +chr(39)+data_inicial+chr(39)+', '
                                +chr(39)+data_final+chr(39)+', '
                                +chr(39)+codigo_loja+chr(39)+', '
                                +chr(39)+tipo_data+chr(39)+', '
                                +chr(39)+periodo_data+chr(39)
                                );
  ADOQuery_painel_mensal.Open;

  Label_valor_pagar.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_painel_mensal.FieldByName('saldo').AsCurrency);
end;

procedure TFrm_principal.InformacoesDiarias();
begin
  //BUSCA AS INFORMAÇÕES PARA O PAINEL DE INFORMAÇÕES DIÁRIAS
  ADOQuery_informacoes_diarias.Close;
  ADOQuery_informacoes_diarias.SQL.Clear;
  ADOQuery_informacoes_diarias.SQL.Add('PR_DASH_INFORMACOES_DIARIAS ');
  ADOQuery_informacoes_diarias.Open;

  //PREENCHE O LABEL DE INFORMAÇÕES DIÁRIAS NO RODAPÉ DA PÁGINA
  Label_valor_hoje.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_informacoes_diarias.FieldByName('total').AsCurrency);
  Label_valo_tktMedio.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_informacoes_diarias.FieldByName('ticket').AsCurrency);
  Label_qtd.Text:= FormatCurr('####,###0.000',ADOQuery_informacoes_diarias.FieldByName('quantidade').AsCurrency);
end;

PROCEDURE TFrm_principal.Preenche_grafico();
var Thread: TThread;
begin
  Thread:= TThread.CreateAnonymousThread(procedure
  begin
      //BUSCA O TOTAL DAS VENDAS DOS ÚLTIMOS 12 MESES
      ADOQuery_grafico.Close;
      ADOQuery_grafico.SQL.Clear;
      ADOQuery_grafico.SQL.Add('PR_HISTORICO_12MESES');
      ADOQuery_grafico.Open;

      Processo:= 'Preenche Gráfico';

      TThread.Synchronize(Thread.CurrentThread, procedure
      var I: Integer;
      begin
        Series2.Clear;
        ADOQuery_grafico.First;

        //PREENCHE O GRÁFICO
        for I := 0 to 12 do
        begin
          Anima_inicio_grafico.Stop;
          Series2.add(ADOQuery_grafico.FieldByName('TOTAL').AsCurrency,
                      RetornaMes(ADOQuery_grafico.FieldByName('MES').AsInteger)+''#13''+
                      ADOQuery_grafico.FieldByName('ANO').AsString
                      );

          //ANIMAÇÃO DE PREENCHIMETNO DO GRÁFICO
          Anima_inicio_grafico.StopValue:= 105;
          Anima_inicio_grafico.Start;
          ADOQuery_grafico.Next;
        end;
      end);

  end);

  //CAPTURA UM POSSÍVEL ERRO AO TERMINAR A THREAD
  Thread.OnTerminate:= ThreadEnd;
  Thread.Start;

end;

procedure TFrm_principal.TabControl1Change(Sender: TObject);
var data_inicial, data_final: String;
    I: Integer;
    FFrame: TF_vendedores;
    item: TListBoxItem;
begin

  if TabItem2.IsSelected then
  begin
    Ranking_vendedores()
  end else
  begin
   //
  end;
end;

procedure TFrm_principal.ThreadEnd(Sender: TObject);
begin

  //CONTROLA O RETORNO DO FIM DA THREAD
  if Assigned(TThread(Sender).FatalException) then begin
    ShowMessage('Erro em: '+Processo+' - '+Exception(TThread(Sender).FatalException).Message);
  end

end;


PROCEDURE TFrm_principal.Busca_metas();
var mes, ano: Integer;
begin
  if MonthOf(DateEdit_inicial.Date) <> MonthOf(DateEdit_final.Date) then begin

    Label_titulo_meta.Text:= 'Meta';
    Label_titulo_supermeta.Text:= 'Super Meta';

    CalculaMetas(0, 0, Anim_grafico_meta, Label_percentual_Meta);
    CalculaMetas(0, 0, Anim_grafico_superMeta, Label_percentual_superMeta);

    Label_valor_meta.Text     := 'Período selecionado inválido';
    Label_valor_superMeta.Text:= 'Período selecionado inválido';


    Aviso('AVISO', 'As informações de Meta e Supermeta só serão exibidas se '+
                   'o perído selecionado da data inicial e final forem dentro do mesmo mês.');
    //Aviso('ALERTA', 'MENSAGEM DE TEXTO DE ALERTA');
    //Aviso('CONCLUÍDO', 'MENSAGEM DE TEXTO DE ALERTA');

  end else begin

    meta:= 0;
    super_meta:= 0;
    mes:= MonthOf(DateEdit_inicial.Date);
    ano:= YearOf(DateEdit_inicial.Date);

    ADOQuery_metas.Close;
    ADOQuery_metas.SQL.Clear;
    ADOQuery_metas.SQL.Add('PR_BUSCA_METAS '
                          +chr(39)+IntToStr(mes)+chr(39)+', '
                          +chr(39)+IntToStr(ano)+chr(39)+', '
                          +chr(39)+codigo_loja+chr(39));
    ADOQuery_metas.Open;

    //VALIDA SE RETORNOU META
    if ADOQuery_metas.FieldByName('META').AsString = '' then begin
      Label_valor_meta.Text:= 'Nenhuma Meta cadastrada';
      meta:= 0;
    end else begin
      Label_valor_meta.Text:= 'Valor da meta: R$'+FormatCurr('####,##0.00',ADOQuery_metas.FieldByName('META').AsCurrency);
      meta:= ADOQuery_metas.FieldByName('META').AsCurrency;
    end;

    //VALIDA SE RETORNOU SUPER META
    if ADOQuery_metas.FieldByName('SUPER_META').AsString = '' then begin
      Label_valor_superMeta.Text:= 'Nenhuma Super Meta cadastrada';
      super_meta:= 0;
    end else begin
      Label_valor_superMeta.Text:= 'Valor da Super Meta: R$'+FormatCurr('####,##0.00', ADOQuery_metas.FieldByName('SUPER_META').AsCurrency);
      super_meta:= ADOQuery_metas.FieldByName('SUPER_META').AsCurrency;
    end;

    CalculaMetas(meta, venda_total, Anim_grafico_meta, Label_percentual_Meta);
    CalculaMetas(super_meta, venda_total, Anim_grafico_superMeta, Label_percentual_superMeta);

    Label_titulo_meta.Text:= 'Meta: '+mes.ToString+'/'+ano.ToString;
    Label_titulo_supermeta.Text:= 'Super meta: '+mes.ToString+'/'+ano.ToString;
  end;

end;

procedure TFrm_principal.CalculaMetas(Meta, Venda_total: Double; FloatAnimation:TFloatAnimation; Label_percentual:TLabel );
var perc_meta: Double;
begin
  if Meta = 0 then begin
    Label_percentual.Text:= '0%';
    FloatAnimation.StopValue:= 0;
  end else begin

    perc_meta:= (Venda_total * 100) / Meta;
    Label_percentual.Text:= FormatFloat('#0.0',perc_meta)+ '%';
    FloatAnimation.StopValue:= ((perc_meta * 360) / 100);

  end;

  FloatAnimation.Start;
end;

{$ENDREGION}


{$REGION 'Functions'}

FUNCTION TFrm_principal.RetornaMes(numero_mes:Integer):String;
var nome_mes: String;
begin
  //RETORNA A ABREVIAÇÃO DO MÊS ATUAL DE ACORDO COM O NÚMERO DO MÊS
  case numero_mes of
    1:begin
      nome_mes:= 'Jan';
    end;

    2: begin
      nome_mes:= 'Fev';
    end;

    3:begin
      nome_mes:= 'Mar';
    end;

    4: begin
      nome_mes:= 'Abr';
    end;

    5:begin
      nome_mes:= 'Mai';
    end;

    6: begin
      nome_mes:= 'Jun';
    end;

    7:begin
      nome_mes:= 'Jul';
    end;

    8: begin
      nome_mes:= 'Ago';
    end;

    9:begin
      nome_mes:= 'Set';
    end;

    10: begin
      nome_mes:= 'Out';
    end;

    11:begin
      nome_mes:= 'Nov';
    end;

    12: begin
      nome_mes:= 'Dez';
    end;

    else begin
      nome_mes:= 'Não encontrado!';
    end;

  end;

  Result:= nome_mes;
end;

procedure TFrm_principal.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var total: Double;
begin
  Total:= Retorna_Venda_total_Funcionario(Item);
  //CHAMAR PROCEDURE QUE RETORNA METAS, PASSANDO CÓDIGO FUNCIONÁRIO, VALOR TOTAL E MÊS
  CalculaMetas(10000,Total,FloatAnimation1,Label6);
  CalculaMetas(12000,Total,FloatAnimation2,Label10);
  
  ADOQuery_hist_vendedor.Close;
  ADOQuery_hist_vendedor.SQL.Clear;
  ADOQuery_hist_vendedor.SQL.Add('PRD_HISTORICO_VENDEDOR '+chr(39)+Item.Tag.ToString+chr(39));
  ADOQuery_hist_vendedor.Open;

  //PREENCHE O GADOQuery_hist_vendedorRÁFICO
  LineSeries1.Clear;
  ADOQuery_hist_vendedor.First;
  for var I:= 0 to 12 do
  begin
    //Anima_inicio_grafico.Stop;
    LineSeries1.add(ADOQuery_hist_vendedor.FieldByName('TOTAL_VENDA').AsCurrency,
                RetornaMes(ADOQuery_hist_vendedor.FieldByName('MES').AsInteger)+''#13''+
                ADOQuery_hist_vendedor.FieldByName('ANO').AsString
                );

    //ANIMAÇÃO DE PREENCHIMETNO DO GRÁFICO
//    Anima_inicio_grafico.StopValue:= 105;
//    Anima_inicio_grafico.Start;
    ADOQuery_hist_vendedor.Next;
  end;

  ADOQuery_info_diaria_vendedor.Close;
  ADOQuery_info_diaria_vendedor.SQL.Clear;
  ADOQuery_info_diaria_vendedor.SQL.Add('PRD_INFORMACOES_DIARIAS_VENDEDOR '+chr(39)+Item.Tag.ToString+chr(39));
  ADOQuery_info_diaria_vendedor.Open;

  //PREENCHE O LABEL DE INFORMAÇÕES DIÁRIAS NO RODAPÉ DA PÁGINA
  Lbl_vendas_vendedor.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_info_diaria_vendedor.FieldByName('total').AsCurrency);
  Lbl_ticket_vendedor.Text:= 'R$ '+ FormatCurr('####,##0.00',ADOQuery_info_diaria_vendedor.FieldByName('ticket').AsCurrency);
  Lbl_qtd_vendedor.Text:= FormatCurr('####,###0.000',ADOQuery_info_diaria_vendedor.FieldByName('quantidade').AsCurrency);
end;

function TFrm_principal.Local_do_aplicativo: string;
begin
  Result:= ExtractFilePath(ParamStr(0));
end;

procedure TFrm_principal.Ranking_vendedores();
var I: Integer;
    FFrame: TF_vendedores;
    item: TListBoxItem;
    data_inicial, data_final: String;
begin
  //teste aba vendedores
  Try

    data_inicial:= FormatDateTime('yyyy-mm-dd', StrToDate(DateEdit_inicial.Text));
    data_final  := FormatDateTime('yyyy-mm-dd', StrToDate(DateEdit_final.Text));
    I:= 0;
    if ADOQuery_vendedores.IsEmpty then
      sleep(1000);
    ADOQuery_vendedores.Close;
    ADOQuery_vendedores.SQL.Clear;
    ADOQuery_vendedores.SQL.Add('PRD_INFO_VENDEDORES '
                                +chr(39)+data_inicial+chr(39)+', '
                                +chr(39)+data_final+chr(39));
    ADOQuery_vendedores.Open;

    ADOQuery_vendedores.First;
    ListBox1.Clear;
    ListBox1.BeginUpdate;
    while not(ADOQuery_vendedores.Eof) do
    begin
      item:= TListBoxItem.Create(nil);
      item.Margins.Left:= 8;
      item.Margins.Top:= 3;
      item.Margins.Bottom:= 3;
      item.Margins.Right:= 8;
      FFrame:= TF_vendedores.Create(nil);

      //o frame vai ser criado dentro do item

      FFrame.Align:= TAlignLayout.Top;
      item.Height:= 107;
      FFrame.Label_nome.Text:= ADOQuery_vendedores.FieldByName('vendedor').AsString;
      FFrame.Label_ordem.Text:= (I+1).ToString+'º';
      FFrame.Label_total.Text:= CurrToStr(ADOQuery_vendedores.FieldByName('total').AsCurrency);
      FFrame.Label_tiket_medio.Text:= 'Ticket Médio: '+CurrToStr(ADOQuery_vendedores.FieldByName('ticket').AsCurrency);
      item.Tag:= ADOQuery_vendedores.FieldByName('codigo_vendedor').AsInteger;
      item.AddObject(FFrame);

      ListBox1.AddObject(item);
      ADOQuery_vendedores.Next;
      I:= I+1;
    end;
  finally
    ListBox1.EndUpdate;//anula o repaint ou refresh do component.
  end;
end;

function TFrm_principal.Retorna_Venda_total_Funcionario(Item: TListBoxItem): Double;
var Objetc: TFmxObject;
    Component: TComponent;
begin
  for var I := 0 to Item.ChildrenCount -1 do
  begin
    Objetc:= Item.Children.Items[I];
    if Objetc is TFrame then
    begin
      for var J:= 0 to TFrame(Objetc).ComponentCount - 1 do
      begin
        Component:= TFrame(Objetc).Components[J];
        if Component is TLabel then
        begin
          if pos('total',TLabel(Component).Name) > 0 then
          begin
            Result:= TLabel(Component).Text.ToDouble;
            Exit;
          end;
        end;
        
      end;
    end;
  end;
end;

{$ENDREGION}

end.
