unit uDmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TdmDados = class(TDataModule)
    FDConexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure carregarBanco;
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uBiblioteca, Vcl.Forms, uFormConfigurarBase;

{$R *.dfm}

procedure TdmDados.carregarBanco;
begin
    try
    //tenta conectar na base
    FDConexao.Params.Database := getValorIni(ExtractFilePath(Application.exeName)+'config.ini','CONFIGURACAO','LOCAL');
    FDConexao.Connected := true;

    except
       //caso nao de certo, abre o form de configurar a base.

      formConfigurarBase := TformConfigurarBase.Create(self);
      try
        formConfigurarBase.ShowModal;
      finally
         FreeAndNil(formConfigurarBase);
      end;

    end;
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
    carregarBanco;
end;

end.
