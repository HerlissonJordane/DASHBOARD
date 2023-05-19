unit U_aviso;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,System.StrUtils;

type
  TFrm_aviso = class(TForm)
    Rec_Background: TRectangle;
    Rec_Titulo: TRectangle;
    Label_titulo: TLabel;
    Img_background: TImage;
    Text_msg: TText;
    Rec_Buttom1: TRectangle;
    Text_buttom1: TText;
    Anima_X: TFloatAnimation;
    Anima_Y: TFloatAnimation;
    Rec_Buttom2: TRectangle;
    Text_buttom2: TText;
    Anima2_X: TFloatAnimation;
    Anima2_Y: TFloatAnimation;
    Rec_buttons: TRectangle;
    procedure Rec_Buttom1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rec_Buttom2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_aviso: TFrm_aviso;
  Return_Button: Boolean;
  F_titulo, F_mensagem: String;

function Aviso(Titulo, Mensagem: String): Boolean;

implementation

{$R *.fmx}

Function Aviso(Titulo, Mensagem: String):Boolean;
begin
  F_Titulo:= Titulo;
  F_Mensagem:= Mensagem;
  Frm_aviso:= TFrm_aviso.Create(Application);
  Frm_aviso.ShowModal;
  Result:= Return_Button;
end;


procedure TFrm_aviso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TFrm_aviso.FormCreate(Sender: TObject);
begin
  Rec_Buttom1.Visible:= False;
  Rec_Buttom2.Visible:= False;
end;

procedure TFrm_aviso.FormShow(Sender: TObject);
begin
  case AnsiIndexStr(F_titulo, ['AVISO', 'ALERTA','CONCLUÍDO']) of

      0:begin //AVISO
          Text_msg.Text              := F_mensagem;
          Label_titulo.Text          := F_titulo;
          Rec_Background.Stroke.Color:= TAlphaColorRec.Red;
          Rec_Buttom1.Stroke.Color   := TAlphaColorRec.Red;
          Rec_Buttom1.Visible        := True;
          Text_buttom1.Text          := 'OK';
          Img_background.Bitmap:= Img_background.MultiResBitmap[0].Bitmap;

      end;

      1: begin //ALERTA
          Text_msg.Text              := F_mensagem;
          Label_titulo.Text          := F_titulo;
          Rec_Background.Stroke.Color:= TAlphaColor($FFFFC21A);  //PADRÃO DE CORES ARGB COM PREFIXO $
          Rec_Buttom1.Stroke.Color   := TAlphaColor($FFFFC21A);
          Rec_Buttom1.Visible        := True;
          Text_buttom1.Text          := 'SIM';

          Rec_Buttom2.Stroke.Color   := TAlphaColor($FFFFC21A);
          Rec_Buttom2.Visible        := True;
          Text_buttom2.Text          := 'NÃO';
          Img_background.Bitmap:= Img_background.MultiResBitmap[1].Bitmap;
          Img_background.Opacity:= 1;
      end;

      2: begin //CONCLUÍDO
          Text_msg.Text              := F_mensagem;
          Label_titulo.Text          := F_titulo;
          Rec_Background.Stroke.Color:= TAlphaColor($FF71CA5F);
          Rec_Buttom1.Stroke.Color   := TAlphaColor($FF71CA5F);
          Rec_Buttom1.Visible        := True;
          Text_buttom1.Text          := 'OK';
          Rec_Buttom2.Visible        := False;

          Img_background.Bitmap:= Img_background.MultiResBitmap[2].Bitmap;
          Img_background.Opacity:= 0.8;
      end

      else begin
      //Essa opção não foi programada, amigo.
      end;
    end;
end;

procedure TFrm_aviso.Rec_Buttom1Click(Sender: TObject);
begin
  Return_Button:= True;
  Close;
end;

procedure TFrm_aviso.Rec_Buttom2Click(Sender: TObject);
begin
  Return_Button:= True;
  Close;
end;

end.
