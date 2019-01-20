unit uFormGeralConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadastroPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TformGeralConta = class(TformCadastroPai)
    FDQueryDeleteConta: TFDQuery;
    FDQuerySelectIdGrupo: TFDQuery;
    FDQueryCadastroID: TIntegerField;
    FDQueryCadastroNOME: TStringField;
    FDQueryCadastroGRUPO: TStringField;
    FDQueryCadastroTIPO: TStringField;
    FDQueryCheck: TFDQuery;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  
  private
    { Private declarations }
    procedure atualizarDbGrid;
    procedure setEditConta;
    procedure checkAccountInMovs;
    function returnTipoContaEdit(value : string) : string;
  public
    { Public declarations }
  end;

var
  formGeralConta: TformGeralConta;
  codGrupo : integer;
implementation

{$R *.dfm}

uses uDmDados, uFormCadastroEditConta;

procedure TformGeralConta.atualizarDbGrid;
begin
  FDQueryCadastro.Close;
  FDQueryCadastro.Open();
end;

procedure TformGeralConta.BitBtn1Click(Sender: TObject);
begin

  formCadastroEditConta := TformcadastroEditConta.Create(self);
  formCadastroEditConta.isEdit := false;
  try
    formCadastroEditConta.ShowModal;
  finally
    FreeAndNil(formCadastroEditConta)
  end;
end;

procedure TformGeralConta.BitBtn2Click(Sender: TObject);
begin
  inherited;
  setEditConta;
end;

procedure TformGeralConta.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if FDQueryCadastro.IsEmpty then
  begin
    ShowMessage('Selecione uma conta para excluir');
    abort;
  end;


   if Application.MessageBox('Deseja realmente excluir esta conta ', '',
          MB_YESNO + MB_SYSTEMMODAL + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES
        then
        begin
            checkAccountInMovs;
            try
              FDQueryDeleteConta.Close;
              FDQueryDeleteConta.sql.Clear;
              FDQueryDeleteConta.sql.Text := 'delete from conta WHERE ID = :ID';
              FDQueryDeleteConta.ParamByName('ID').AsInteger := FDQueryCadastro.FieldByName('id').AsInteger;
              FDQueryDeleteConta.ExecSQL;
              dmDados.FDConexao.CommitRetaining;
              ShowMessage('Exclu�do com sucesso.');
              atualizarDbGrid;
            except
                on e: exception do begin
                  ShowMessage('N�o foi poss�vel excluir a conta: '+e.Message);
                end;
            end;


        end// fim do if - yes
        else
        begin

        end; //fim do else - no

end;



procedure TformGeralConta.checkAccountInMovs;
begin

   with FDQueryCheck do begin
      close;
      sql.Text := 'SELECT CONTA_ID FROM MOVIMENTO WHERE CONTA_ID = '+IntToStr(FDQueryCadastro.FieldByName('ID').AsInteger);
      open;
      if RowsAffected > 0 then begin
        ShowMessage('N�o � poss�vel excluir esta conta, a mesma est� vinculada a movimentos existentes.');
        abort;
      end;


   end;
end;

function TformGeralConta.returnTipoContaEdit(value : string) : string;
begin
  if value.Equals('Receita') then begin
        result :=  'RECEITA';
  end
  else
  result := 'DESPESA';

end;

procedure TformGeralConta.setEditConta;
 var codigoGrupo : integer;
  var nomegrupo : string;
begin

 formCadastroEditConta := TformCadastroEditConta.Create(self);
  try

    formCadastroEditConta.edtCodigoconta.Text := inttostr(FDQueryCadastro.FieldByName('id').AsInteger);
    formCadastroEditConta.edtNomeConta.Text := FDQueryCadastro.FieldByName('nome').AsString;
    formCadastroEditConta.cbTipoConta.Text := returnTipoContaEdit(FDQueryCadastro.FieldByName('tipo').AsString);

      FDQuerySelectIdGrupo.SQL.Clear;
      FDQuerySelectIdGrupo.SQL.Add('Select id from grupo where nome = :pNome');
      nomegrupo := FDQueryCadastro.FieldByName('grupo').AsString;
      FDQuerySelectIdGrupo.ParamByName('pNome').AsString := nomegrupo;
      FDQuerySelectIdGrupo.Open;
      codigoGrupo := FDQuerySelectIdGrupo.Fields[0].Value;
      formCadastroEditConta.DBLookupCBGrupo.KeyValue := codigoGrupo;


      formCadastroEditConta.isEdit := true;
      formCadastroEditConta.Caption := 'Edi��o de Conta';
      formCadastroEditConta.ShowModal;
  finally
    FreeAndNil(formCadastroEditConta);
  end;
end;



end.
