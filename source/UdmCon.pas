unit UdmCon;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, DBXpress;

type
  TDmCon = class(TDataModule)
    SdsEmpresas: TSQLDataSet;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    DsEmpresas: TDataSource;
    SdsClientes: TSQLDataSet;
    DsClientes: TDataSource;
    CdsClientes: TClientDataSet;
    DspClientes: TDataSetProvider;
    CdsEmpresasEMP_CODIGO: TIntegerField;
    CdsEmpresasEMP_CNPJ: TStringField;
    CdsEmpresasEMP_FANTASIA: TStringField;
    CdsEmpresasEMP_RAZAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCon: TDmCon;

implementation

uses Udm;

{$R *.dfm}

end.
