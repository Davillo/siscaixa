unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TformPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    MenuPrincipal1: TMenuItem;
    GrupodeContas1: TMenuItem;
    Contas1: TMenuItem;
    Movimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    procedure GrupodeContas1Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure Movimentos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses uFormGeralGrupo, uFormCadastroEditConta, uFormGeralConta,
  uFormGeralMovimento;

procedure TformPrincipal.Contas1Click(Sender: TObject);
begin
  formGeralConta := TformGeralConta.Create(self);
  try
    formGeralConta.ShowModal;
  finally
    FreeAndNil(formGeralConta);
  end;
end;

procedure TformPrincipal.GrupodeContas1Click(Sender: TObject);
begin
   formModuloGrupos := TformModuloGrupos.Create(self);
  try
    formModuloGrupos.ShowModal;
  finally
    FreeAndNil(formModuloGrupos);
  end;
end;

procedure TformPrincipal.Movimentos1Click(Sender: TObject);
begin
    formCadastroMovimento := TformCadastroMovimento.Create(self);
    try
      formCadastroMovimento.ShowModal;
    finally
      FreeAndNil(formCadastroMovimento);
    end;
end;

end.
