unit uPessoa;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.StrUtils, uCidadeEstado;

type
  TTipoPessoa = (tpGeral, tpCliente, tpVendedor);
  TTipoDocumento = (tdCPF, tdPassaporte, tdRG);

  TPessoa = class
  private
    FTipoPessoa: TTipoPessoa;
    FEmail: String;
    FDataNascimento: TDateTime;
    FTipoDocumento: TTipoDocumento;
    FCodigoPessoa: Integer;
    FDocumento: String;
    FContato: String;
    FDataCadastro: TDateTime;
    FNome: String;
    FCidade: TCidade;

    procedure SetCodigoPessoa(const Value: Integer);
    procedure SetContato(const Value: String);
    procedure SetDataCadastro(const Value: TDateTime);
    procedure SetDataNascimento(const Value: TDateTime);
    procedure SetDocumento(const Value: String);
    procedure SetEmail(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetTipoDocumento(const Value: TTipoDocumento);
    procedure SetTipoPessoa(const Value: TTipoPessoa);
    procedure SetCidade(const Value: TCidade);
  public
    property CodigoPessoa: Integer read FCodigoPessoa write SetCodigoPessoa;
    property TipoPessoa: TTipoPessoa read FTipoPessoa write SetTipoPessoa;
    property Nome: String read FNome write SetNome;
    property TipoDocumento: TTipoDocumento
      read FTipoDocumento write SetTipoDocumento;
    property Documento: String read FDocumento write SetDocumento;
    property DataNascimento: TDateTime
      read FDataNascimento write SetDataNascimento;
    property DataCadastro: TDateTime read FDataCadastro write SetDataCadastro;
    property Email: String read FEmail write SetEmail;
    property Contato: String read FContato write SetContato;
    property Cidade: TCidade read FCidadE write SetCidade;

    procedure Map(qryDados: TFDQuery); overload;
  End;

  TVendedor = class(TPessoa)
  private
    FDataUltimoLogin: TDateTime;
    FSalario: Double;
    FCodigoVendedor: Integer;

    procedure SetDataUltimoLogin(const Value: TDateTime);
    procedure SetSalario(const Value: Double);
    procedure SetCodigoVendedor(const Value: Integer);
  public
    property CodigoVendedor: Integer
      read FCodigoVendedor write SetCodigoVendedor;
    property DataUltimoLogin: TDateTime
      read FDataUltimoLogin write SetDataUltimoLogin;
    property Salario: Double read FSalario write SetSalario;

    procedure Map(qryDados: TFDQuery); overload;
  end;

  TCliente = class(TPessoa)
  private
    FCodigoCliente: Integer;
    FDataUltimaCompra: TDateTime;

    procedure SetCodigoCliente(const Value: Integer);
    procedure SetDataUltimaCompra(const Value: TDateTime);
  public
    property CodigoCliente: Integer read FCodigoCliente write SetCodigoCliente;
    property DataUltimaCompra: TDateTime
      read FDataUltimaCompra write SetDataUltimaCompra;

    procedure Map(qryDados: TFDQuery); overload;
  end;

implementation

{ TPessoa }

procedure TPessoa.Map(qryDados: TFDQuery);
var
  lCidade: TCidade;
begin
  if (qryDados <> nil) and not qryDados.Eof then
  begin
    Self.CodigoPessoa := qryDados.FieldByName('codigo_pessoa').AsInteger;
    Self.Nome := qryDados.FieldByName('nome').AsString;
    Self.Documento := qryDados.FieldByName('documento').AsString;
    Self.DataNascimento := qryDados.FieldByName('data_nascimento').AsDateTime;
    Self.DataCadastro := qryDados.FieldByName('data_cadastro').AsDateTime;
    Self.Email := qryDados.FieldByName('email').AsString;
    Self.Contato := qryDados.FieldByName('contato').AsString;

    case IndexStr(qryDados.FieldByName('tipo_pessoa').AsString,
      ['G', 'V', 'C']) of
      0: Self.TipoPessoa := tpGeral;
      1: Self.TipoPessoa := tpVendedor;
      2: Self.TipoPessoa := tpCliente;
    end;

    case IndexStr(qryDados.FieldByName('tipo_documento').AsString,
      ['C', 'P', 'R']) of
      0: Self.TipoDocumento := tdCPF;
      1: Self.TipoDocumento := tdPassaporte;
      2: Self.TipoDocumento := tdRG;
    end;

    lCidade := TCidade.Create;
    lCidade.Map(qryDados);
    Self.Cidade := lCidade;
  end;
end;

{$region 'Sets TPessoa'}

procedure TPessoa.SetCidade(const Value: TCidade);
begin
  FCidade := Value;
end;

procedure TPessoa.SetCodigoPessoa(const Value: Integer);
begin
  FCodigoPessoa := Value;
end;

procedure TPessoa.SetContato(const Value: String);
begin
  FContato := Value;
end;

procedure TPessoa.SetDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
end;

procedure TPessoa.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
end;

procedure TPessoa.SetDocumento(const Value: String);
begin
  FDocumento := Value;
end;

procedure TPessoa.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoa.SetTipoDocumento(const Value: TTipoDocumento);
begin
  FTipoDocumento := Value;
end;

procedure TPessoa.SetTipoPessoa(const Value: TTipoPessoa);
begin
  FTipoPessoa := Value;
end;

{$endregion}

{ TVendedor }

procedure TVendedor.Map(qryDados: TFDQuery);
begin
  inherited;
  if (qryDados <> nil) and not qryDados.Eof then
  begin
    Self.CodigoVendedor := qryDados.FieldByName('codigo_vendedor').AsInteger;
    Self.DataUltimoLogin :=
      qryDados.FieldByName('data_ultimo_login').AsDateTime;
    Self.Salario := qryDados.FieldByName('salario').AsFloat;
  end;
end;

{$region 'Sets TVendedor'}

procedure TVendedor.SetCodigoVendedor(const Value: Integer);
begin
  FCodigoVendedor := Value;
end;

procedure TVendedor.SetDataUltimoLogin(const Value: TDateTime);
begin
  FDataUltimoLogin := Value;
end;

procedure TVendedor.SetSalario(const Value: Double);
begin
  FSalario := Value;
end;

{$endregion}

{ TCliente }

procedure TCliente.Map(qryDados: TFDQuery);
begin
  inherited;
  if (qryDados <> nil) and not qryDados.Eof then
  begin
    Self.CodigoCliente := qryDados.FieldByName('codigo_cliente').AsInteger;
    Self.DataUltimaCompra :=
      qryDados.FieldByName('data_ultima_compra').AsDatetime;
  end;
end;

{$region 'Sets TCliente'}

procedure TCliente.SetCodigoCliente(const Value: Integer);
begin
  FCodigoCliente := Value;
end;

procedure TCliente.SetDataUltimaCompra(const Value: TDateTime);
begin
  FDataUltimaCompra := Value;
end;

{$endregion}

end.
