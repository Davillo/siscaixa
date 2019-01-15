unit uFormCadastroEditGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, uFormGeralGrupo;

type
  TformCadastroEditGrupo = class(TForm)
    FDQryGetGenerator: TFDQuery;
    FDUpdateSQLGrupos: TFDUpdateSQL;
    FDQryGrupos: TFDQuery;
    dsGrupos: TDataSource;
    edtNome: TEdit;
    Nome: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    btnSalvarGrupo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarGrupoClick(Sender: TObject);

  private
  var
    formGeralGrupo: TformModuloGrupos;

    function validateFieldSize(valor: string): boolean;
    procedure atualizarDbGrid;



  public
    { Public declarations }
    isEdit: boolean;

  end;

var
  formCadastroEditGrupo: TformCadastroEditGrupo;

implementation

{$R *.dfm}

uses uDmDados, uBiblioteca;

procedure TformCadastroEditGrupo.atualizarDbGrid;
begin
  formModuloGrupos.FDQueryCadastro.Close;
  formModuloGrupos.FDQueryCadastro.open;
end;

procedure TformCadastroEditGrupo.btnSalvarGrupoClick(Sender: TObject);
begin

  if validateIsEmptyString(edtNome.Text) and (validateFieldSize(edtNome.Text) )
  then
  begin

      if not isEdit then   //cadastro novo
     
      begin
          try
            with FDQryGrupos do begin
              Close;
              sql.clear;
              sql.Text := 'INSERT INTO GRUPO (nome) VALUES (:nome)';
              ParamByName('nome').AsString := edtNome.Text;
              ExecSQL;
              ShowMessage('Salvo com sucesso.');
                 if Application.MessageBox('Deseja cadastrar um novo grupo?', '',
          MB_YESNO + MB_SYSTEMMODAL + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES
        then
        begin
          formCadastroEditGrupo.Close;
          formCadastroEditGrupo.Free;

          formCadastroEditGrupo := TformCadastroEditGrupo.Create(nil);
          formCadastroEditGrupo.ShowModal;
          atualizarDbGrid;

        end// fim do if - yes
        else
        begin
          formCadastroEditGrupo.Close;
          atualizarDbGrid;
        end; //fim do else - no
        end;

        except on e: EDatabaseError do begin
            ShowMessage('Grupo já cadastrado.');
            ShowMessage('Mensagem original:'+e.Message);
        end;

      end;


      end

      else //end do isEdit
      begin
        with FDQryGrupos do begin
        try
          Close;
          sql.clear;
          sql.Text := 'UPDATE GRUPO SET nome = :nome WHERE id = :id';//update
          ParamByName('nome').AsString := edtNome.Text;  // params
          ParamByName('id').AsInteger := strtoint(edtCodigo.Text);
          ExecSQL;
          ShowMessage('Salvo com sucesso.');
          atualizarDbGrid;
          self.Close;
        except on e:exception do begin
            ShowMessage('Grupo já cadastrado.');
            ShowMessage('Mensagem original:'+e.Message);
        end;

        end;

        end;
      end;
  end
  else
    ShowMessage('Preencha os campos obrigatórios corretamente.'); // else do if principal

end; // fim da procedure

procedure TformCadastroEditGrupo.FormCreate(Sender: TObject);
var
  proximoCod: integer;
begin
  if not isEdit then
  begin
    with FDQryGetGenerator do begin
       Close;
       sql.clear;
       sql.Text := 'SELECT GEN_ID(GEN_GRUPO_ID, 0) FROM RDB$DATABASE';
       open;
       proximoCod := (Fields[0].AsInteger) + 1;
       edtCodigo.Text := IntToStr(proximoCod);
    end;

  end;

end;

function TformCadastroEditGrupo.validateFieldSize(valor: string): boolean;
begin
  if (edtNome.GetTextLen >= 51) then
  begin
    ShowMessage('Tamanho digitado maior que o permitido, máximo : 50');
    result := false;
  end
  else
    result := true;
end;



end.
