program projPedidoVendas;

uses
  Vcl.Forms,
  uConexao in 'Dao\uConexao.pas',
  uPedidosVenda in 'Model\uPedidosVenda.pas',
  uProduto in 'Model\uProduto.pas',
  uPedidosVendaControl in 'Controller\uPedidosVendaControl.pas',
  uCidadeEstado in 'Model\uCidadeEstado.pas',
  uPessoa in 'Model\uPessoa.pas',
  uPersistencia in 'Dao\uPersistencia.pas',
  uPessoaDAO in 'Dao\uPessoaDAO.pas',
  uProdutoDAO in 'Dao\uProdutoDAO.pas',
  uCidadeEstadoDAO in 'Dao\uCidadeEstadoDAO.pas',
  uPedidosVendaDAO in 'Dao\uPedidosVendaDAO.pas',
  uFormNovoPedidosVenda in 'View\uFormNovoPedidosVenda.pas' {FNovoPedidosVenda},
  uFormPedidosVenda in 'View\uFormPedidosVenda.pas' {FPedidoVendas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPedidoVendas, FPedidoVendas);
  Application.CreateForm(TFNovoPedidosVenda, FNovoPedidosVenda);
  Application.Run;
end.
