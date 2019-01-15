unit uFormGeralGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadastroPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TformModuloGrupos = class(TformCadastroPai)
    FDQueryCadastroID: TIntegerField;
    FDQueryCadastroNOME: TStringField;
    FDQueryDelete: TFDQuery;
    FDQueryDeleteID: TIntegerField;
    FDQueryDeleteNOME: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure atualizarDbGrid;
  public
    { Public declarations }
  end;

var
  formModuloGrupos: TformModuloGrupos;

implementation

{$R *.dfm}

uses uFormCadastroEditGrupo, uBiblioteca, uDmDados;

procedure TformModuloGrupos.atualizarDbGrid;
begin
  FDQueryCadastro.Close;
  FDQueryCadastro.Open();
end;

procedure TformModuloGrupos.BitBtn1Click(Sender: TObject);
begin
  formCadastroEditGrupo := TformCadastroEditGrupo.Create(self);
  try
    formCadastroEditGrupo.ShowModal;
  finally
    FreeAndNil(formCadastroEditGrupo);
  end;

end;

procedure TformModuloGrupos.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if FDQueryCadastro.IsEmpty then
  begin
    ShowMessage('Selecione um grupo');
    abort;
  end;

  formCadastroEditGrupo := TformCadastroEditGrupo.Create(self);
  try

    formCadastroEditGrupo.edtCodigo.Text :=
      inttostr(FDQueryCadastro.FieldByName('id').AsInteger);
    formCadastroEditGrupo.edtNome.Text := FDQueryCadastro.FieldByName
      ('nome').AsString;
    formCadastroEditGrupo.isEdit := true;
    formCadastroEditGrupo.Caption := 'Edi��o de grupo';
    formCadastroEditGrupo.ShowModal;
  finally
    FreeAndNil(formCadastroEditGrupo);
  end;

end;

procedure TformModuloGrupos.BitBtn3Click(Sender: TObject);
begin
  if FDQueryCadastro.IsEmpty then
  begin
    ShowMessage('Selecione um grupo para excluir');
    abort;
  end;


   if Application.MessageBox('Deseja realmente excluir este grupo ?', '',
          MB_YESNO + MB_SYSTEMMODAL + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES
        then
        begin
            try
              FDQueryDelete.Close;
              FDQueryDelete.sql.Clear;
              FDQueryDelete.sql.Text := 'delete from grupo WHERE ID = :ID';
              FDQueryDelete.ParamByName('ID').AsInteger := FDQueryCadastro.FieldByName('id').AsInteger;
              FDQueryDelete.ExecSQL;
              dmDados.FDConexao.CommitRetaining;
              atualizarDbGrid;
            except
                on e: exception do begin
                  Writeln(e.Message);
                  ShowMessage('N�o foi poss�vel excluir este grupo, existem contas vinculadas ao mesmo.');
                end;
            end;


        end// fim do if - yes
        else
        begin

        end; //fim do else - no


end;

procedure TformModuloGrupos.FormCreate(Sender: TObject);
begin
  inherited;
  atualizarDbGrid;
end;

procedure TformModuloGrupos.FormShow(Sender: TObject);
begin
  inherited;
   FDQueryCadastro.Close;
   FDQueryCadastro.Open();
end;

end.
