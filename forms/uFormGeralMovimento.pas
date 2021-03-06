unit uFormGeralMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadastroPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TformCadastroMovimento = class(TformCadastroPai)
    FDQueryDeleteMov: TFDQuery;
    FDQueryCadastroID: TIntegerField;
    FDQueryCadastroDATA: TDateField;
    FDQueryCadastroCONTA: TStringField;
    FDQueryCadastroTIPO: TStringField;
    FDQueryCadastroVALOR: TSingleField;
    FDQueryCadastroHISTORICO: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure atualizarDBGrid;
    procedure findOneConta;
  public
    { Public declarations }
  end;

var
  formCadastroMovimento: TformCadastroMovimento;
  codigoConta : integer;

implementation

{$R *.dfm}

uses uFormCadastroEditMovimento, uDmDados;

procedure TformCadastroMovimento.atualizarDBGrid;
begin

  with FDQueryCadastro do
  begin
    close;
    Open();
  end;

end;

procedure TformCadastroMovimento.BitBtn1Click(Sender: TObject);
begin
  inherited;
  formCadastroEditMovimento := TformCadastroEditMovimento.Create(self);
  try
    formCadastroEditMovimento.ShowModal;
  finally
    FreeAndNil(formCadastroEditMovimento);
  end;
end;

procedure TformCadastroMovimento.BitBtn2Click(Sender: TObject);
begin
  inherited;
  formCadastroEditMovimento := TformCadastroEditMovimento.Create(self);
  try

  with FDQueryCadastro do
  begin
   formCadastroEditMovimento.isEdit := true;
  formCadastroEditMovimento.edtCodigo.Text := inttostr(FieldByName('id').AsInteger);
  formCadastroEditMovimento.edtHistorico.Text := FieldByName('historico').AsString;
  formCadastroEditMovimento.edtValor.Text := FieldByName('valor').AsString;
  formCadastroEditMovimento.edtData.Text := FieldByName('data').AsString;

  if FieldByName('tipo').AsString = 'entrada' then begin
    formCadastroEditMovimento.cbTipo.Text := 'entrada';
  end
  else
    formCadastroEditMovimento.cbTipo.Text := 'sa�da';

  findOneConta;
  formCadastroEditMovimento.ShowModal;
  end;

  finally
  FreeAndNil(formCadastroEditMovimento);
  end;
end;

procedure TformCadastroMovimento.BitBtn3Click(Sender: TObject);
begin
  inherited;

  with FDQueryDeleteMov do
  begin

   try
    close;
    sql.Clear;
    sql.Text := 'DELETE FROM MOVIMENTO WHERE ID = :ID';
    ParamByName('ID').AsInteger := FDQueryCadastro.FieldByName('id').AsInteger;
    ExecSQL;
    atualizarDBGrid;
    ShowMessage('Exclu�do com sucesso.');
   except on e:exception do
   begin
      ShowMessage('Erro ao excluir movimento. msg original:'+e.Message);
   end;

   end;

  end;

end;

procedure TformCadastroMovimento.findOneConta;
begin
  with FDQueryDeleteMov do
  begin
     Close;
     sql.Clear;
     sql.Text := 'SELECT id FROM CONTA WHERE nome = :nome';
     ParamByName('nome').AsString := FDQueryCadastro.FieldByName('conta').AsString;
     open();
     codigoConta := Fields[0].Value;
     formCadastroEditMovimento.DBLookupContas.KeyValue := codigoConta;
  end;


end;

end.
