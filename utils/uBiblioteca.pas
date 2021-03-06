unit uBiblioteca;


interface  //declarações
 uses IniFiles;
 procedure setValorIni(local,sessao,subsessao: string; valor: string);
 function getValorIni(local,sessao,subsessao : string) : string;
 function returnQuotedStrTrim (valor : string) : string;
  function returnLikeString (valor : string):string;
  function validateIsEmptyString(valor : string) : boolean;


implementation

uses
  System.SysUtils, Vcl.Forms; // implementações

    //seta os valores do arquivo .ini
   procedure setValorIni(local,sessao,subsessao: string; valor: string);
   var vArquivo : TIniFile;
   begin
    vArquivo := TIniFile.Create(local); // cria o arquivo no diretorio
    vArquivo.WriteString(sessao, subsessao, valor);  //escreve no arquivo
    vArquivo.Free; // libera da memoria
   end;


   function getValorIni(local,sessao,subsessao : string) : string;
   var vArquivo : TIniFile;
   begin
      vArquivo := TIniFile.Create(local);
      result := vArquivo.ReadString(sessao,subsessao, '');
      vArquivo.Free;
   end;


   function returnQuotedStrTrim (valor : string) : string;
   begin
     result := quotedStr(trim(valor));
   end;

    function returnLikeString (valor : string):string;
    begin
      result := UpperCase(QuotedStr(trim('%'+valor+'%')));
    end;

     function validateIsEmptyString(valor : string) : boolean;
     begin

        if trim(valor) <> ''  then begin
          result := true;
        end
        else
        result := false;
     end;

end.
