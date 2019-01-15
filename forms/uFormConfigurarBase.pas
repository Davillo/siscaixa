unit uFormConfigurarBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TformConfigurarBase = class(TForm)
    opnPastas: TOpenDialog;
    edtCaminhoBase: TEdit;
    btnConfigurarBase: TButton;
    procedure btnConfigurarBaseClick(Sender: TObject);
  private
    { Private declarations }
    procedure configurarBase;
  public
    { Public declarations }
  end;

var
  formConfigurarBase: TformConfigurarBase;

implementation

{$R *.dfm}

uses uBiblioteca;

procedure TformConfigurarBase.btnConfigurarBaseClick(Sender: TObject);
begin
configurarBase;
end;

procedure TformConfigurarBase.configurarBase;
var vFileName : string;
begin
    if opnPastas.Execute  then // se houve diretorio selecionado
  begin
     edtCaminhoBase.Text := opnPastas.FileName;// coloca o caminho completo no edit
     vFileName := ExtractFilePath(Application.ExeName) + 'config.ini';  // coloca o nome do arquivo e o diretorio
     setValorIni(vFileName,'CONFIGURACAO','LOCAL', edtCaminhoBase.Text); // cria sessao e subsessao no .ini
      ShowMessage('Configurado com sucesso!');
      Application.Terminate;
  end;
end;

end.
