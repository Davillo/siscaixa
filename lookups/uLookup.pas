unit uLookup;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmLookup = class(TDataModule)
    FDTransaction: TFDTransaction;
    dsGrupos: TDataSource;
    FDQueryGrupos: TFDQuery;
    FDQueryContas: TFDQuery;
    dsContas: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLookup: TdmLookup;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDmDados;

{$R *.dfm}

end.
