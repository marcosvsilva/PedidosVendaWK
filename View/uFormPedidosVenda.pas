unit uFormPedidosVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.VirtualImageList, Vcl.StdCtrls, Vcl.Grids, Vcl.Mask,
  uConexao;

type
  TFPedidoVendas = class(TForm)
    pnlPrincipal: TPanel;
    pnlMenu: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    imlIconsMenu: TVirtualImageList;
    imcIconsMenu: TImageCollection;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    btnInform: TSpeedButton;
    pnlInfoBusca: TPanel;
    edtCliente: TEdit;
    edtCidade: TEdit;
    edtPedido: TEdit;
    lblPedido: TLabel;
    lblNomeCliente: TLabel;
    lblCidade: TLabel;
    edtEstado: TEdit;
    lblEstado: TLabel;
    rdgStatus: TRadioGroup;
    btnAtualizar: TSpeedButton;
    pnlGridPedidos: TPanel;
    pnlGrids: TPanel;
    pnlGridProdutos: TPanel;
    pnlInfo: TPanel;
    grdPedidos: TStringGrid;
    grdProdutos: TStringGrid;
    lblDatas: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declaration }
  public
    { Public declarations }
  end;

var
  FPedidoVendas: TFPedidoVendas;

implementation

uses
  uFormNovoPedidosVenda;

{$R *.dfm}


procedure TFPedidoVendas.btnNovoClick(Sender: TObject);
var
  fNovoPedidosVenda: TFNovoPedidosVenda;
begin
  fNovoPedidosVenda := TFNovoPedidosVenda.Create(self);
  fNovoPedidosVenda.ShowModal;
end;

procedure TFPedidoVendas.btnSairClick(Sender: TObject);
begin
  Application.Destroy;
end;

end.
