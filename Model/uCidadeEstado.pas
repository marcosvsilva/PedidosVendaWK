unit uCidadeEstado;

interface

uses
  FireDAC.Comp.Client;

type
  TEstado = class
  private
    FCodigo: Integer;
    FSigla: String;
    FNome: String;

    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetSigla(const Value: String);
  public
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: String read FNome write SetNome;
    property Sigla: String read FSigla write SetSigla;

    procedure Map(qryDados: TFDQuery); overload;
  end;

  TCidade = class
  private
    FCodigo: Integer;
    FNome: String;
    FEstado: TEstado;
    procedure SetCodigo(const Value: Integer);
    procedure SetEstado(const Value: TEstado);
    procedure SetNome(const Value: String);
  public
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: String read FNome write SetNome;
    property Estado: TEstado read FEstado write SetEstado;

    procedure Map(qryDados: TFDQuery); overload;
  end;

implementation

{ TEstado }

procedure TEstado.Map(qryDados: TFDQuery);
begin
  if (qryDados <> nil) and not qryDados.Eof then
  begin
    Self.Codigo := qryDados.FieldByName('codigo_estado').AsInteger;
    Self.Sigla := qryDados.FieldByName('nome_estado').AsString;
    Self.Nome := qryDados.FieldByName('sigla_estado').AsString;
  end;
end;

{$region 'Sets TEstado'}

procedure TEstado.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TEstado.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TEstado.SetSigla(const Value: String);
begin
  FSigla := Value;
end;

{$endregion}

{ TCidade }

procedure TCidade.Map(qryDados: TFDQuery);
var
  lEstado: TEstado;
begin
  if (qryDados <> nil) and not qryDados.Eof then
  begin
    Self.Codigo := qryDados.FieldByName('codigo_estado').AsInteger;
    Self.Nome := qryDados.FieldByName('nome_cidade').AsString;

    lEstado := TEstado.Create;
    lEstado.Map(qryDados);
    Self.Estado := lEstado;
  end;
end;

{$region 'Sets TCidade}

procedure TCidade.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCidade.SetEstado(const Value: TEstado);
begin
  FEstado := Value;
end;

procedure TCidade.SetNome(const Value: String);
begin
  FNome := Value;
end;

{$endregion}

end.
