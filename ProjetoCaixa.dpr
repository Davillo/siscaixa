program ProjetoCaixa;

uses
  Vcl.Forms,
  uFormPrincipal in 'forms\uFormPrincipal.pas' {formPrincipal},
  uBiblioteca in 'utils\uBiblioteca.pas',
  uFormCadastroPai in 'forms\uFormCadastroPai.pas' {formCadastroPai},
  uDmDados in 'forms\uDmDados.pas' {dmDados: TDataModule},
  uFormConfigurarBase in 'forms\uFormConfigurarBase.pas' {formConfigurarBase},
  uFormGeralGrupo in 'forms\uFormGeralGrupo.pas' {formModuloGrupos},
  uFormCadastroEditGrupo in 'forms\uFormCadastroEditGrupo.pas' {formCadastroEditGrupo},
  uFormGeralConta in 'forms\uFormGeralConta.pas' {formGeralConta},
  uFormCadastroEditConta in 'forms\uFormCadastroEditConta.pas' {formCadastroEditConta},
  uLookup in 'lookups\uLookup.pas' {dmLookup: TDataModule},
  uFormGeralMovimento in 'forms\uFormGeralMovimento.pas' {formCadastroMovimento},
  uFormCadastroEditMovimento in 'forms\uFormCadastroEditMovimento.pas' {formCadastroEditMovimento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TformConfigurarBase, formConfigurarBase);
  Application.CreateForm(TdmLookup, dmLookup);
  Application.Run;
end.
