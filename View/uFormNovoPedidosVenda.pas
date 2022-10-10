unit uFormNovoPedidosVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Buttons, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.StdCtrls, Vcl.Mask, System.Generics.Collections, System.StrUtils,
  uPedidosVendaControl, Vcl.NumberBox, Vcl.Grids, Vcl.Samples.Spin,
  uPessoaDAO, uPessoa, uProdutoDAO, uProduto, uPedidosVendaDAO, uPedidosVenda;

type
  TThreadPesquisaProduto = class(TThread)
  private
    FDescricaoProduto: String;
    FGrid: TStringGrid;
    FListProdutos: TList<TProduto>;
    procedure SetDescricaoProduto(const Value: String);
    procedure SetGrid(const Value: TStringGrid);
    procedure SetListProdutos(const Value: TList<TProduto>);
  protected
    procedure Execute; override;
  public
    property DescricaoProduto: String
      read FDescricaoProduto write SetDescricaoProduto;
    property ListProdutos: TList<TProduto>
      read FListProdutos write SetListProdutos;
    property Grid: TStringGrid read FGrid write SetGrid;
  end;

  TFNovoPedidosVenda = class(TForm)
    pnlMenu: TPanel;
    btnInform: TSpeedButton;
    imcIconsMenu: TImageCollection;
    imlIconsMenu: TVirtualImageList;
    pnlRodape: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlPrincipal: TPanel;
    pnlDetalhes: TPanel;
    pnlProduto: TPanel;
    pnlGridPanels: TPanel;
    lblNomeCliente: TLabel;
    lblDesconto: TLabel;
    cmbClientes: TComboBox;
    edtDataInicial: TMaskEdit;
    lblDatas: TLabel;
    edtValorDesconto: TNumberBox;
    lblProduto: TLabel;
    pnlTotalizadores: TPanel;
    lblTotal: TLabel;
    edtValorTotal: TNumberBox;
    edtTotalDesconto: TNumberBox;
    lblTotalDesconto: TLabel;
    pnlGridBuscaProduto: TPanel;
    pnlGridProdutosPedido: TPanel;
    stgProdutosPedido: TStringGrid;
    edtProduto: TEdit;
    btnAdicionarProduto: TSpeedButton;
    btnPesquisarProduto: TSpeedButton;
    lblSpace: TLabel;
    stgPesquisaProdutos: TStringGrid;
    lblQuantidade: TLabel;
    edtQuantidade: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarProdutoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAdicionarProdutoClick(Sender: TObject);
    procedure edtValorDescontoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
  private
    FPedidosVendaControl: TPedidosVendaControl;
    FListProdutos: TList<TProduto>;
    FListProdutosSelectionados: TList<TProdutoPedido>;
    FClienteDAO: TClienteDAO;
    FProdutoDAO: TProdutoDAO;
    FPedidosVendaDAO: TPedidosVendaDAO;
    FValorTotal: Double;

    procedure actPesquisaProdutos;
    procedure actProdutosPedidos;
    procedure CalculaTotal;
    procedure PreencheProdutosSelecionados;
    procedure SalvarPedido;
  public
    { Public declarations }
  end;

var
  FNovoPedidosVenda: TFNovoPedidosVenda;

implementation

{$R *.dfm}

procedure TFNovoPedidosVenda.actPesquisaProdutos;
var
  I: Integer;
begin
  for I := 1 to stgPesquisaProdutos.ColCount - 1 do
    stgPesquisaProdutos.Cols[I].Clear;

  stgPesquisaProdutos.RowCount := 1;

  stgPesquisaProdutos.Cells[0,0] := 'Codigo';
  stgPesquisaProdutos.Cells[1,0] := 'Descricao';
  stgPesquisaProdutos.Cells[2,0] := 'Marca';
  stgPesquisaProdutos.Cells[3,0] := 'Valor de Venda';

  pnlGridProdutosPedido.Align := alBottom;
  pnlGridProdutosPedido.Height := 1;

  pnlGridBuscaProduto.Align := alClient;
end;


procedure TFNovoPedidosVenda.actProdutosPedidos;
var
  I: Integer;
begin
  for I := 1 to stgProdutosPedido.ColCount - 1 do
    stgProdutosPedido.Cols[I].Clear;

  stgProdutosPedido.RowCount := 1;

  stgProdutosPedido.Cells[0,0] := 'Codigo';
  stgProdutosPedido.Cells[1,0] := 'Descricao';
  stgProdutosPedido.Cells[2,0] := 'Marca';
  stgProdutosPedido.Cells[3,0] := 'Valor Unitario';
  stgProdutosPedido.Cells[4,0] := 'Quantidade';
  stgProdutosPedido.Cells[5,0] := 'Valor Total';


  stgProdutosPedido.RowCount := 1;

  PreencheProdutosSelecionados;
  CalculaTotal;
  edtProduto.Clear;

  pnlGridBuscaProduto.Align := alTop;
  pnlGridBuscaProduto.Height := 1;

  pnlGridProdutosPedido.Align := alClient;
end;

procedure TFNovoPedidosVenda.btnAdicionarProdutoClick(Sender: TObject);
var
  lCodigoProduto: Integer;
  lLinhaGrid: Integer;
  lProdutoPedido: TProdutoPedido;
begin
  if edtQuantidade.Value <= 0 then
  begin
    MessageDlg('A quantidade nao pode ser menor do que 1!',
      mtInformation, [mbok], 0);
  end
  else
  begin
    if stgPesquisaProdutos.Row > 0 then
    begin
      lLinhaGrid := stgPesquisaProdutos.Row;
      lCodigoProduto := StrToIntDef(
        stgPesquisaProdutos.Cells[0, lLinhaGrid], 0);

      if lCodigoProduto > 0 then
      begin
        lProdutoPedido := TProdutoPedido.Create;

        lProdutoPedido.Codigo := lCodigoProduto;
        lProdutoPedido.Descricao := stgPesquisaProdutos.Cells[1, lLinhaGrid];
        lProdutoPedido.Marca := stgPesquisaProdutos.Cells[2, lLinhaGrid];
        lProdutoPedido.ValorVenda :=
          StrToFloatDef(stgPesquisaProdutos.Cells[3, lLinhaGrid], 0);
        lProdutoPedido.ValorUnitario := lProdutoPedido.ValorVenda;
        lProdutoPedido.Quantidade := edtQuantidade.Value;
        lProdutoPedido.ValorTotal :=
          lProdutoPedido.Quantidade * lProdutoPedido.ValorUnitario;

        FListProdutosSelectionados.Add(lProdutoPedido);
      end;
    end;

    edtQuantidade.Value := 1;
    actProdutosPedidos;
  end;
end;

procedure TFNovoPedidosVenda.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFNovoPedidosVenda.btnPesquisarProdutoClick(Sender: TObject);
var
  lThreadBusca: TThreadPesquisaProduto;
begin
  if Length(edtProduto.Text) > 0 then
  begin
    actPesquisaProdutos;

    lThreadBusca := TThreadPesquisaProduto.Create;
    lThreadBusca.ListProdutos := FListProdutos;
    lThreadBusca.DescricaoProduto := edtProduto.Text;
    lThreadBusca.Grid := stgPesquisaProdutos;
    lThreadBusca.Execute;
  end
  else
  begin
    actProdutosPedidos;
  end;
end;

procedure TFNovoPedidosVenda.btnSalvarClick(Sender: TObject);
begin
  SalvarPedido;
end;

procedure TFNovoPedidosVenda.CalculaTotal;
var
  lValorTotal: Double;
begin
  lValorTotal := FValorTotal;
  lValorTotal := lValorTotal - edtValorDesconto.Value;

  if lValorTotal > 0 then
    edtValorTotal.Value := lValorTotal
  else
    edtValorTotal.Value := 0;

  edtTotalDesconto.Value := edtValorDesconto.Value;
end;

procedure TFNovoPedidosVenda.edtProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  btnPesquisarProdutoClick(Self);
end;

procedure TFNovoPedidosVenda.edtValorDescontoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CalculaTotal;
end;

procedure TFNovoPedidosVenda.FormActivate(Sender: TObject);
var
  lClientes: TList<TCliente>;
  lCliente: String;
  I: Integer;
begin
  lClientes := FClienteDAO.BuscarDados(0);

  cmbClientes.Items.Clear;
  if lClientes.Count > 0 then
  begin
    for I := 0 to lClientes.Count -1 do
    begin
      lCliente := IntToStr(lClientes[I].CodigoCliente) + ' - ' +
        lClientes[I].Nome;

      cmbClientes.Items.Add(lCliente);
    end;

    cmbClientes.ItemIndex := -1;
  end;

  if (FListProdutos <> nil) and (FProdutoDAO <> nil) then
    FListProdutos := FProdutoDAO.BuscarDados(0);

  edtDataInicial.Text := DateTimeToStr(now);

  actProdutosPedidos;
end;

procedure TFNovoPedidosVenda.FormCreate(Sender: TObject);
begin
  if FPedidosVendaControl = nil then
    FPedidosVendaControl := TPedidosVendaControl.Create;

  if FClienteDAO = nil then
    FCLienteDAO := TClienteDAO.Create;

  if FProdutoDAO = nil then
    FProdutoDAO := TProdutoDAO.Create;

  if FPedidosVendaDAO = nil then
    FPedidosVendaDAO := TPedidosVendaDAO.Create;

  if FListProdutos = nil then
    FListProdutos := TList<TProduto>.Create;

  if FListProdutosSelectionados = nil then
    FListProdutosSelectionados := TList<TProdutoPedido>.Create;
end;

procedure TFNovoPedidosVenda.FormDestroy(Sender: TObject);
begin
  if FPedidosVendaControl <> nil then
    FPedidosVendaControl.Free;

  if FClienteDAO <> nil then
    FClienteDAO.Destroy;

  if FProdutoDAO <> nil then
    FProdutoDAO.Free;

  if FPedidosVendaDAO <> nil then
    FPedidosVendaDAO.Free;

  if FListProdutos <> nil then
    FListProdutos.Free;

  if FListProdutosSelectionados <> nil then
    FListProdutosSelectionados.Free;
end;

procedure TFNovoPedidosVenda.PreencheProdutosSelecionados;
var
  I: Integer;
begin
  FValorTotal := 0;

  if FListProdutosSelectionados.Count > 0 then
  begin
    stgProdutosPedido.RowCount := FListProdutosSelectionados.Count + 1;

    for I := 0 to FListProdutosSelectionados.Count - 1 do
    begin
      stgProdutosPedido.Cells[0, I+1] :=
        IntToStr(FListProdutosSelectionados[I].Codigo);
      stgProdutosPedido.Cells[1, I+1] :=
        FListProdutosSelectionados[I].Descricao;
      stgProdutosPedido.Cells[2, I+1] :=
        FListProdutosSelectionados[I].Marca;
      stgProdutosPedido.Cells[3, I+1] :=
        FloatToStr(FListProdutosSelectionados[I].ValorVenda);
      stgProdutosPedido.Cells[4, I+1] :=
        IntToStr(FListProdutosSelectionados[I].Quantidade);
      stgProdutosPedido.Cells[5, I+1] :=
        FloatToStr(FListProdutosSelectionados[I].ValorTotal);

      FValorTotal := FValorTotal + FListProdutosSelectionados[I].ValorTotal;
    end;
  end;
end;

procedure TFNovoPedidosVenda.SalvarPedido;
begin
  //
end;

{ TThreadPesquisaProduto }

procedure TThreadPesquisaProduto.Execute;
var
  lStringTest: String;
  lPos: Integer;
  I: Integer;
begin
  inherited;

  for I := 1 to Self.Grid.RowCount - 1 do
    Self.Grid.Rows[I].Clear;

  Self.Grid.RowCount := 1;

  if (Self.FListProdutos <> nil) and (Length(FDescricaoProduto) > 0) then
  begin
    lPos := Self.Grid.RowCount;
    for I := 0 to FListProdutos.Count - 1 do
    begin
      lStringTest := IntToStr(FListProdutos[I].Codigo) + ' ' +
        FListProdutos[I].Descricao + ' ' + FListProdutos[I].Marca;

      lStringTest := lStringTest.ToLower;

      if lStringTest.Contains(FDescricaoProduto.ToLower) then
      begin
        Self.Grid.RowCount := lPos;
        Self.Grid.Cells[0, lPos] := IntToStr(FListProdutos[I].Codigo);
        Self.Grid.Cells[1, lPos] := FListProdutos[I].Descricao;
        Self.Grid.Cells[2, lPos] := FListProdutos[I].Marca;
        Self.Grid.Cells[3, lPos] := FloatToStr(FListProdutos[I].ValorVenda);
        lPos := lPos + 1;
      end;
    end;
  end;
end;

procedure TThreadPesquisaProduto.SetDescricaoProduto(const Value: String);
begin
  FDescricaoProduto := Value;
end;

procedure TThreadPesquisaProduto.SetGrid(const Value: TStringGrid);
begin
  FGrid := Value;
end;

procedure TThreadPesquisaProduto.SetListProdutos(const Value: TList<TProduto>);
begin
  FListProdutos := Value;
end;

end.
