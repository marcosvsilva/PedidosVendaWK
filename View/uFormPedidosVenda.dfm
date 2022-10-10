object FPedidoVendas: TFPedidoVendas
  Left = 248
  Top = 204
  Caption = 'Pedido de Venas'
  ClientHeight = 1130
  ClientWidth = 1788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  PixelsPerInch = 192
  TextHeight = 32
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 1788
    Height = 1130
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1774
    ExplicitHeight = 1129
    object pnlMenu: TPanel
      Left = 1
      Top = 1
      Width = 1786
      Height = 160
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 1772
      object btnNovo: TSpeedButton
        Left = 1
        Top = 1
        Width = 160
        Height = 158
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alLeft
        Caption = 'Novo'
        ImageIndex = 29
        ImageName = 'icons8-file'
        Images = imlIconsMenu
        Flat = True
        Layout = blGlyphTop
        OnClick = btnNovoClick
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitHeight = 156
      end
      object btnEditar: TSpeedButton
        Left = 161
        Top = 1
        Width = 140
        Height = 158
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alLeft
        Caption = 'Editar'
        ImageIndex = 13
        ImageName = 'icons8-edit'
        Images = imlIconsMenu
        Flat = True
        Layout = blGlyphTop
        ExplicitLeft = 162
        ExplicitTop = 2
        ExplicitHeight = 156
      end
      object btnExcluir: TSpeedButton
        Left = 301
        Top = 1
        Width = 140
        Height = 158
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alLeft
        Caption = 'Excluir'
        ImageIndex = 12
        ImageName = 'icons8-trash'
        Images = imlIconsMenu
        Flat = True
        Layout = blGlyphTop
        ExplicitLeft = 289
        ExplicitTop = 2
      end
      object btnSair: TSpeedButton
        Left = 1645
        Top = 1
        Width = 140
        Height = 158
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alRight
        Caption = 'Sair'
        ImageIndex = 14
        ImageName = 'icons8-close'
        Images = imlIconsMenu
        Flat = True
        Layout = blGlyphTop
        OnClick = btnSairClick
        ExplicitLeft = 1713
        ExplicitTop = -10
      end
      object btnInform: TSpeedButton
        Left = 1505
        Top = 1
        Width = 140
        Height = 158
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alRight
        Caption = 'Sobre'
        ImageIndex = 4
        ImageName = 'icons8-info'
        Images = imlIconsMenu
        Flat = True
        Layout = blGlyphTop
        ExplicitLeft = 753
      end
      object btnAtualizar: TSpeedButton
        Left = 441
        Top = 1
        Width = 140
        Height = 158
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alLeft
        Caption = 'Atualizar'
        ImageIndex = 10
        ImageName = 'icons8-refresh'
        Images = imlIconsMenu
        Flat = True
        Layout = blGlyphTop
        ExplicitLeft = 557
        ExplicitTop = -10
      end
    end
    object pnlInfoBusca: TPanel
      Left = 1
      Top = 161
      Width = 1786
      Height = 224
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 1772
      object lblPedido: TLabel
        Left = 8
        Top = 10
        Width = 150
        Height = 40
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Pedido'
      end
      object lblNomeCliente: TLabel
        Left = 8
        Top = 60
        Width = 150
        Height = 40
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cliente'
      end
      object lblCidade: TLabel
        Left = 8
        Top = 110
        Width = 150
        Height = 40
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cidade'
      end
      object lblEstado: TLabel
        Left = 8
        Top = 160
        Width = 150
        Height = 40
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Estado'
      end
      object lblDatas: TLabel
        Left = 1175
        Top = 12
        Width = 321
        Height = 40
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alCustom
        AutoSize = False
        Caption = 'Data do Pedido Entre:'
      end
      object edtCliente: TEdit
        Left = 170
        Top = 60
        Width = 900
        Height = 40
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        TabOrder = 1
      end
      object edtCidade: TEdit
        Left = 170
        Top = 110
        Width = 900
        Height = 40
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        TabOrder = 2
      end
      object edtPedido: TEdit
        Left = 170
        Top = 10
        Width = 295
        Height = 40
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        TabOrder = 0
      end
      object edtEstado: TEdit
        Left = 170
        Top = 160
        Width = 900
        Height = 40
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        TabOrder = 3
      end
      object rdgStatus: TRadioGroup
        Left = 1508
        Top = 1
        Width = 277
        Height = 222
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alRight
        Caption = 'Status'
        ItemIndex = 0
        Items.Strings = (
          'Todos'
          'Abertos'
          'Faturados'
          'Cancelados')
        TabOrder = 6
        ExplicitLeft = 1494
      end
      object edtDataInicial: TMaskEdit
        Left = 1175
        Top = 60
        Width = 321
        Height = 40
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alCustom
        TabOrder = 4
        Text = ''
      end
      object edtDataFinal: TMaskEdit
        Left = 1175
        Top = 110
        Width = 321
        Height = 40
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alCustom
        TabOrder = 5
        Text = ''
      end
    end
    object pnlGrids: TPanel
      Left = 1
      Top = 385
      Width = 1786
      Height = 662
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      Color = clMedGray
      ParentBackground = False
      TabOrder = 2
      ExplicitWidth = 1772
      ExplicitHeight = 661
      object pnlGridPedidos: TPanel
        Left = 1
        Top = 1
        Width = 1784
        Height = 336
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 1770
        object grdPedidos: TStringGrid
          Left = 1
          Top = 1
          Width = 1782
          Height = 334
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Align = alClient
          DefaultColWidth = 128
          DefaultRowHeight = 48
          FixedColor = clGray
          FixedCols = 0
          TabOrder = 0
          ExplicitWidth = 1768
        end
      end
      object pnlGridProdutos: TPanel
        Left = 1
        Top = 365
        Width = 1784
        Height = 296
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 364
        ExplicitWidth = 1770
        object grdProdutos: TStringGrid
          Left = 1
          Top = 1
          Width = 1782
          Height = 294
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Align = alClient
          ColCount = 4
          DefaultColWidth = 128
          DefaultRowHeight = 48
          FixedColor = clGray
          FixedCols = 0
          TabOrder = 0
          ExplicitWidth = 1768
          ColWidths = (
            220
            700
            350
            300)
        end
      end
    end
    object pnlInfo: TPanel
      Left = 1
      Top = 1047
      Width = 1786
      Height = 82
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alBottom
      TabOrder = 3
      ExplicitTop = 1046
      ExplicitWidth = 1772
    end
  end
  object imlIconsMenu: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'icons8-done'
        Name = 'icons8-done'
      end
      item
        CollectionIndex = 1
        CollectionName = 'icons8-ok-32'
        Name = 'icons8-ok-32'
      end
      item
        CollectionIndex = 2
        CollectionName = 'icons8-synchronize'
        Name = 'icons8-synchronize'
      end
      item
        CollectionIndex = 3
        CollectionName = 'icons8-box'
        Name = 'icons8-box'
      end
      item
        CollectionIndex = 4
        CollectionName = 'icons8-info'
        Name = 'icons8-info'
      end
      item
        CollectionIndex = 5
        CollectionName = 'icons8-download-from-the-cloud'
        Name = 'icons8-download-from-the-cloud'
      end
      item
        CollectionIndex = 6
        CollectionName = 'icons8-ok'
        Name = 'icons8-ok'
      end
      item
        CollectionIndex = 7
        CollectionName = 'icons8-plus'
        Name = 'icons8-plus'
      end
      item
        CollectionIndex = 8
        CollectionName = 'icons8-filled-bookmark-ribbon'
        Name = 'icons8-filled-bookmark-ribbon'
      end
      item
        CollectionIndex = 9
        CollectionName = 'icons8-remove-bookmark'
        Name = 'icons8-remove-bookmark'
      end
      item
        CollectionIndex = 10
        CollectionName = 'icons8-refresh'
        Name = 'icons8-refresh'
      end
      item
        CollectionIndex = 11
        CollectionName = 'icons8-share-arrow-squared'
        Name = 'icons8-share-arrow-squared'
      end
      item
        CollectionIndex = 12
        CollectionName = 'icons8-trash'
        Name = 'icons8-trash'
      end
      item
        CollectionIndex = 13
        CollectionName = 'icons8-edit'
        Name = 'icons8-edit'
      end
      item
        CollectionIndex = 14
        CollectionName = 'icons8-close'
        Name = 'icons8-close'
      end
      item
        CollectionIndex = 15
        CollectionName = 'icons8-binoculars'
        Name = 'icons8-binoculars'
      end
      item
        CollectionIndex = 16
        CollectionName = 'icons8-mailbox'
        Name = 'icons8-mailbox'
      end
      item
        CollectionIndex = 17
        CollectionName = 'icons8-user-male'
        Name = 'icons8-user-male'
      end
      item
        CollectionIndex = 18
        CollectionName = 'icons8-toolbox'
        Name = 'icons8-toolbox'
      end
      item
        CollectionIndex = 19
        CollectionName = 'icons8-clock'
        Name = 'icons8-clock'
      end
      item
        CollectionIndex = 20
        CollectionName = 'icons8-picture'
        Name = 'icons8-picture'
      end
      item
        CollectionIndex = 21
        CollectionName = 'icons8-scroll'
        Name = 'icons8-scroll'
      end
      item
        CollectionIndex = 22
        CollectionName = 'icons8-support'
        Name = 'icons8-support'
      end
      item
        CollectionIndex = 23
        CollectionName = 'icons8-linkedin'
        Name = 'icons8-linkedin'
      end
      item
        CollectionIndex = 24
        CollectionName = 'icons8-menu'
        Name = 'icons8-menu'
      end
      item
        CollectionIndex = 25
        CollectionName = 'icons8-unavailable'
        Name = 'icons8-unavailable'
      end
      item
        CollectionIndex = 26
        CollectionName = 'icons8-checkmark'
        Name = 'icons8-checkmark'
      end
      item
        CollectionIndex = 27
        CollectionName = 'icons8-cancel'
        Name = 'icons8-cancel'
      end
      item
        CollectionIndex = 28
        CollectionName = 'icons8-settings'
        Name = 'icons8-settings'
      end
      item
        CollectionIndex = 29
        CollectionName = 'icons8-file'
        Name = 'icons8-file'
      end>
    ImageCollection = imcIconsMenu
    Width = 32
    Height = 32
    Left = 1216
    Top = 8
  end
  object imcIconsMenu: TImageCollection
    Images = <
      item
        Name = 'icons8-done'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000086494441545885ED9451
              0A80201044DF292CBAA21D37B24E531F098944A8E81AB10FF6D7995D67171445
              9165046C4F71071CC02C2D3E008B17DF8049C5555CC53F2B6EB90E462EE19171
              856F30173E50451CC0708F70276D84D5FF3CC744B3C0A598689EF6371362ABF6
              64427CCFE38457497B2EE124BA5C38B8BA5D7D89751E637C29CABF3801E3F74A
              59E6F588470000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-ok-32'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA793000001A7494441545885ED96BF
              4A034110873F5013058D412B4D63236861EB13588820496C2DED34C90BF80A16
              12C4CE47B0D4CA46C424421441C4686D2318914410FC77163B472EE12E3B8721
              8DF78381BD9DD99BEF3633BB81489122F92B0EE4810AF02656067240CC27DE11
              0BD2BAF89BC0AC2D790AB8F6BCB4D3AE80E9100033C0ABF8376CC9E39EE47740
              1A1813CB0035F15DD2BE13410003C099F80E6DC9010A9EE4491F7FD203B1A500
              D896F94760520370210BD25D62D624A66C0158043E806F6049931C4C9138982D
              0F5242621A5D0046810799DBD126F77B9136AEF3F9409E6F80E17E036465FC0E
              2C8449DE0B8014F02CE3FDB0C97B0170E219BFA0ACFC5E0238C013702AE3BD7E
              03FC00ABC03CA605BF0859077F05F07E7191D6CFD2378011CFDC045097F9152D
              4003FB41348EFD207295A775B40F69002AB220D325C63D8A4B0A8041E0567C05
              0D404E826B045F46F712B3A9000058165F1D455BC630F7BD0B91C59CFD09CC97
              BBC9ABB46FA9AD768EC45FB40180F9B3E142F8591598EA58630398C3B4E527A6
              45AD8A61EEFB12E6866C02E7986DF72B264DF7EC4ACCB1062052A4FFA35FF2BD
              BA5802E536250000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-synchronize'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000180494441545885ED96B1
              4E835014863F5B6A1C5CA1D5410775511FC3A84BEDD2C7E850E30B38E98B3486
              D5E730C6C1AA84D51877ED624D8AC33D042485C2855B96FEC9CD4D389CF3FD70
              B9E7022BE9CB065CC0A9CB800B04C0735D266C810780076CD761C201C6CB34D1
              02FAC008780326020FC72B0697A307F80960721831D0006E63903130048E803D
              8186F04ED57062F01F600034E57A7CFD5F80B609780F9809FC241133BE0D5B44
              6B3E98132FD288D6740CF489D6BCB9E0DE2C5D035D9DC491181896809F4B8D3B
              9D644F920F4B183820DA2185F52DC99B250C6C488DAFB41B1A19C9410970A8F5
              45B5B20C7CC8BC5BC2C08ECC9F3A069E1245747426F3834E7217B5857465A10E
              AC00B5A50B2B4FF37050CDC89E13BB14B88F6A6A95CB21FA217113B153608A6A
              E31726E06DD4011476CAB01D5BA8279F4AECC604BCC3FF23781F3806AE62D767
              02CFFAC8B5E4C42069C3A7C06BB72A303501DE8147E05EC66F05755315FFF83C
              60CB242CAF0923BF62454C24B7E1524DA435A29572E90F4F5271B3DF1D380800
              00000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-box'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000070494441545885ED9641
              0AC0200C04A7A5F4FF7FEA27FA1B7B2C9498223546E80E7851D0759243408864
              1663AF8C7C730D7EEC95CD39B3EC7CC1343BB581E85E00263050A3D0D740F5BE
              7403AD0176E0E4FED1731DD101C02F4DB7B2A90714400114E03F01BC790006CC
              04E9068448E702BCF415BDC7B947F60000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-info'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA793000001EA494441545885ED97BB
              4A035110863F25DA18126DBD56218A85B7F80492D6CB337969C560A9F8080A56
              1A157C082DC44293A0958286C42A89C5CC6197A09B396BA28D3F2CB39C9DF9E7
              E79C61E62CFCE38FD1E7E99F05D6813C30064CE87A19A80045E004B8EB964087
              1C7009B48CCF05B0D48DC403C03ED054E217E00058457663489F2CB0061CAA4F
              4B630A40226EF211E04AC96AC0269032C4A5802DA04EB01BC3BEC90708B6BC82
              1C812FE68007E5B806067D82F735B0048CC648EE308A14680BD8B306E590F3AB
              010B3F48EEB0881C4743DF3BC26DFDA6C1D7557D276CAB5FB1936396A0DA2D05
              671590065ED53713FED0DFE6B8A1F618783710F7616B666F4883026964DF0A58
              517B6A20F585E3CC470998527B6324B51E01C0ADDAC928A7AA12267B2020A9BE
              D5F062FB0E58C9E2C0E56A46097856FB93E6F31D1CE753948092DA991E08709C
              A5F062BB00D728567B20604DED7994D3AF37A2AF70A18E5B5D14B0A37E67065F
              96904AAD631C1E1D90033E9061346F0D2A208ACBC8DD2F2EC608C6F1AE4F6082
              E0282AC0728CE4F3C023C114F4BE9A0D8744D491919A36C4A59133FFD0D87362
              5CC91C12C84DA6A164AFC01132D1A691F69AD4F70DFDE6AABD816C7BEC4B6918
              B3C834B35ECB8B180BD8F7C72443F06332018CEB7A591FF76372EFC9FB8FBFC3
              27D05091B722F57FB30000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-download-from-the-cloud'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA793000001DE494441545885EDD54D
              8F0C511406E0C7E7245A4F88AF16F6AC4462AC66C3C45282053BFE8021C146F8
              01229905F12BD8584C62C10A8989D50832363E3612099188319898288B7B6ABA
              B4AEEE2E7A88A4DFE4A4D2F7BEE7BCEFBD75FA14030CF01F6207AEE0293E610E
              33B88A9D4B29BC1297B180AC24BEE11256F45B7C396E84C81C26B01735ACC19E
              58FB129CEB91D3379C8FC22F75BEE65D7817DC0BFD12DF249D7AAE8B788E11CC
              E333B6F6C3C019E944131572AE45CE7BDCC339D47FD7C0CD2836522167B75F1B
              F40DC6AA088F4A8D9737D6DA369CBC78196AD88FC9E0CD635F2FE267F1DDCF27
              68876E068AB818DCD761AC14A321FE15A7B1B103B78A019A37315E4638802741
              3AD543C1AA06C6827FBB75A3865B85820BCABBF6241A6D0C3462AF13EAC17F8B
              E17C7115EEC7C62B9CC0BA9202E3C17B1682B98146AC75BCDE40CEBB8365F989
              323C97864E271485F267D6B2D628CD4ED8105A198EC3C3F871B44B623B13C5E8
              453CC7B1C8B94B1AB119B6F498DCCE441571581F791F6056F9A0E9666226A28A
              38A901337CA4F90A0E562C029B23AAE248684E91864D86C7FEE0835101C3D267
              7DF11F338447B1F0028796C8481D870BE2D3589D6F6E2F98F81B318D6DAD0E87
              A4F13BA5D998FD8C593C90AE7DF1E4030CF0CFF10345AEC5BFBB3A5B1A000000
              0049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-ok'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA7930000021B494441545885ED97CD
              4A234110C77F42F4B29AB817153F8E31010FEB6A7C84BDAEFA1C7A13F501FCB8
              8AE251711F61614F6BDC05DF418C8A0735B92A28989CE278A86A7A0C494FF718
              F0E21F1A666AAAEA5F5355D3D5039FF860F404EA178005E00730064CA8BC0AD4
              8032F01BB8EA56800625E01F1079AE1360B61BC4BDC03EF0A28EEF8103E02792
              8D2FBA0AC03C70A83A91DAEC0199B4E45F81FFEAEC19D800B21E76596013A863
              B331184ADE8B4D790D294128BE0137EAE314E80B31DE57C33B603405B9C128D2
              A011B0EB6B5442EAF70C7C7F07B9C10C528EA65E27C2A47EA30BE4065BEAB39C
              A458C076BB4FC375C208B014BBCF010FEA3BEF325C57A5C3779257D4CF724C7E
              A4B25597715995E6BB405ED17B8345951FBB1C5CAAD2649B674B2D0E43C8C196
              F7C215C0932A0DB4C8971D8E7DC8519F91722406D0DF221F02CEF4D9256FF786
              E1D8B30B3AEF1B59D5797405E02A41BB207CC9018AD80C75445213B6A63A29ED
              719826FCEB525A23F9338C67C2E7CD0D7EA9FE8A4BC977231A01CE7525BD3904
              6C4420E3334246AA0B43BA7CB08D47FA0D66916154C7737824A00434906134ED
              6BB487445C45CE7E6931861DC73B2186196C296AC05C0AF269E0163B05838F66
              83B120EAC848CD79D8E5909A37B07B7FF091CC20839C649AEAEC01996A0BC8C6
              D2AFAB887CE747D86E6F22694F7D288D630AF883FFB1BC8C670387FE98E4B13F
              2613C0B8CAABBACC8FC975A0DF4F7C1C5E0122AEB7617DDDCBBF000000004945
              4E44AE426082}
          end>
      end
      item
        Name = 'icons8-plus'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA793000001F0494441545885ED97CD
              2E435110C77FA46C34CAB694959458F8683D81745B3C938FAD104BE21148AC28
              120FC1422C681B5624887655B59839B937CD753BF76A75D37F723237E7FCE723
              732633E7421F3DC640447E1658070AC00490D1FD0A50054AC02970DFA9001DF2
              C015D034AE4B20D709C743C001F0AD865F8143A088646344571658038E94D354
              9D7D2011D7F93870ADC6BE804D60D4A0370A6C0135BC6C8C45753E8497F22A72
              0551B1003CAA8D1B60388AF2812A9681740CE70E69A4409BC09E55298FDCDF17
              B0F407E70ECBC87534F4BB2D5CEA370D5C57F5EDB0ADBC523B6216AFDA2D0567
              0D2005BC2977C67F30D842DC5079027C180C5BF18E34289046F66B00AB2ACF3A
              E8DCC1D92C840530ADF2B60B01DCA99C0A237D22F7940C38B3B6E1DFEA22A9FB
              9FFECDD60C580A2A2E9CAFEFB0005E5406359F818065397370369FC30228AB9C
              0B30F057389B65FF666B00AE5114BB10C09ACA8B30D2BF37A2205C2A71AB8301
              EC28EFDCC02587546A0DE3F068833C504786D1A255691F89B882BCFDE262026F
              1CEF46514CE05D45155889E17C1178C29B82919F6663BE206AC8484D19F452C8
              9DD755F782184F328704F29269A8B137E0189968B3487B4DEAF7869EB96A6F20
              698FFD28F5631E9966D63950C258C0517F4C66F07E4C32C0A4EE5774B91F9387
              8876FBE81D7E003E1699B7BEC342440000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-filled-bookmark-ribbon'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA7930000007F494441545885ED9131
              0A80301004473BC9476CFC92A57FB2527C928D1F11DBD8A408C124A0060477E0
              AA2CB9610FC4DFA932EFB6F49EFAA505B7918004242001094840024F056637C5
              B0913980C1CBF5C09EC8BF2AB001DD45B605D6D2020B6012F906184B088495E7
              084FF2482056790EFF24B79948579EC3B83F84F82E27A6873239C82D974C0000
              000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-remove-bookmark'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000173494441545885ED95C1
              4EC24010863F8DE201F4358C120217019FC583F58154A8F1CC73084F618018AF
              E20B68254284E061FF269B86B25B52E2C14E3269BBFBCFCCD7D96E170AFBEFB6
              E7985FEDBACE7E4E05B6B6034F9DAB5369E6ECE09F77A00028000A8002601700
              A7400778B6C686C00350CD9A6C85FF815452E1A51597F425100247790104C035
              70083C49FB2D90265096B7802E3093A6EF0B910650067AD6FCABAE6F406D43BE
              3A309136DC16E01C186BFC4B1EBFF9A6E236C40CB31C67590102ABE058308F7A
              BEF7281E5BA898AE2F40B2E53D8D018C34769101A0A598912F80DDF220A18934
              5749C4A439C0B1EE235F8015F0C2FA35FEDC02E044F71FBE0076CB931677A7E9
              4A66595B3143D79F700ADCC8A7299ABEAE571900626D7FA30AF395BBAC0A2C30
              5BABEEA16F0073C5F8E4F7B2785B4D1C100DE05DDA4E5EC5C1FC8A074A3C1350
              1BF36156804BCC61349766A0985CADA4C20BD277C00FE6CD732F6E5B15B8C31C
              C1917C08DCB266CD7F0182DD8D85FAA1E34F0000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-refresh'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000176494441545885EDD63F
              4B1D411C85E147458836162A018D289A904653D8FB11828822A8855636161616
              A952D8D9A50CC1CAC210085A49D299E05710AC0382857F8AA452BC5753CCACAE
              8DD9D92B44705F1858D83973CECCCECEFCA878EA3425F6EFC31CC6F0069DA8E1
              10BFB0832D1C3F6046F0029FA3D9F53F5A0DEBE8CAE9B377A598C49F38C03936
              318D01B4A10323C2CA7CCB853CC378A301967015C55FD15B40F3123FA3E6120B
              65034CA01EDB72A2B619ABD1349B405280E7388DA29544F33C6BEEEE8FC27C8C
              829D12A6F76DD042B4E240D84CAFFE4700C2371C2D615E5151F16819157EEDC2
              3CC86112792D1C6A07C2217787A4542568C207B46057B81D0B919FF16A0301DE
              C5318ED19D22CCCCB3ABF4BDF4F26D25EA6B789BA8BD09302F2CDB357E60A880
              B61FDB5153C762AA793E00217D561BD4F01DB318C433B4C7E7197CC145ECFBDB
              6D49D6500042F5FBC9ED6ADCD72EB1819E2246A9DFB50B53C2CC86858D55C709
              F6B12714AD4789E3563C61FE025FA685788EFA0BFE0000000049454E44AE4260
              82}
          end>
      end
      item
        Name = 'icons8-share-arrow-squared'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000100494441545885ED953D
              12C14018861F3FA373067107DC80526106150751E016A4A3D771219C80CEC80C
              45166124D9FDF2D7EC3393229BECF73ED9BF80C5921D15A02FEDFC105C1E3009
              D4D8A8F6591E021E30FDA93106EEEAF95C2A90949154222D815F894511020043
              5389380107708133FEFC9BAE99B744D5E83B7C7AC00EA80BFABE28C5BD103602
              4DE0AA9EED813650D3080CEE88A58E6198801B08D7C5383C4AE0ACDA5B598647
              09DC54BBCEFC8BC3A3044EE88FC0561A1E25B0467F0D548041E03E952970F8EC
              8203D0416F172C43EA190B0074810BDF074B927AA20E0D60051CF14FC2DC054C
              09AD574E3144841588FB1BA6B90EFE52F808582C85F304A2C0837BEF19130200
              00000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-trash'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000090494441545885ED9661
              0A80200C46BF22BC541DA24B4517CDAE517F1684A54E9D48B107434CEC7BEC8F
              0314258F19C00EE070CAD25975EC4BF85DA23A5718F7BB978E1124C923AF170E
              A842725B53EE37EFC02705DC96C6F6E202A2A8800AA8800A34171832EEB86F7A
              6C1FA4790738023BAD63C6FF275A8BE6C415FE01945B4B89802189D024ECAB8D
              C24D8980F26F4E10293F59BD3B01610000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-edit'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA7930000011C494441545885EDD6BF
              4A034110C7F14FC4D4A6112CD442DF402BF12144B4F175544CA156798DD48220
              E80BD804F41524096A218A264A2C32E196A05DF650B81F0CB37F86FDCECDDEEE
              1D952AE5D1366E30C41BDA582B0BBE8F014678C147B4FB582F033E0CE019EA68
              E022C6DA65C17B584CE61A78C72B6AB9E1FDF09D2489BAF1760C309713DE0C68
              672A89F3E85FE7864F9426D10B3FC05619F03489C9760C237E66DA531CB5D35F
              628E63FE130715BC8257F07F074F2F99D62F314D992E19E8C6E2233C62B74CF8
              722CFE84AB687F25496485C34E002E8DBFDD478A4AB472C3E1302027D1AF292A
              3173F8FC0F631BE1172289CD308AB73DEBAFD583E26953EBCA50F6E90AAC6209
              CFB8C76D6277B386FFA40656CA0055FA33FA069EEB90C7ADB9DB0B0000000049
              454E44AE426082}
          end>
      end
      item
        Name = 'icons8-close'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA793000000B2494441545885ED9631
              0EC2300C455F993B978A8B32D291032201A7090344425505B57FDC74C85BAA0E
              C97F716B2BD068EC9CBEE61E13F0044E42F811B80157EBC21EB803E9F31C1DE1
              E36C0F732506DEF6097B25F2C913F030AE95258A857B248A875B24C2C2D74884
              87FF92D82C3C336F2FB55D5D7C57423AF9C129D0FD790FA5EA2758FAE1948929
              8767C225D6B45A9884A5CF8B4B78864C310965C2C912BBB8909CD1677BAEC4C5
              BB41D54B69A3B1092F374B64BF0070DCE80000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-binoculars'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000249494441545885EDD6BF
              4B55611807F08F52534690664A654545436B530E6644D110651AB4B604B5B864
              1204A59243534151FF40053528060DD1E81265818DD5962541FE4A8548BB0DE7
              3DDCC3F17A3C5773887CE0E5BEE77DBE3F9E7BDEF77DEE652DD6E21F88063CC4
              28BEE1117696C0EDC2E380190D9C86959AD7630485D4F88CED09DC8E0C5CFD4A
              0AB817849EA02E8CA761ED7E02F72003777739C6B5B88289205297C8D55BF84D
              0B19B80974604B5EF3568C2544674A60162B201D3389DC779C5DCAFC047E610E
              B7B0276FD519B15FB40DBF83EEE9C580EBF14154EDA5BF609C8EF6A03D820DA5
              00E702E03D2A56A1800ABC0A1EE74B019E8564FB2A98C7712178BC8C172AC367
              0D8E87F95E0C6112B318460FB6966154879B813B2BBA09AFB12FE49BB12D49B8
              68F1931D8F091CCB61DEA6787DB3C6E524693091788EA3D82C3A2C87D11F723F
              7132C3BC15F301DB87A6A091D629E05D4CDA2DBA22055CCF10EF0C9831D1EBBB
              13E663B82D6ACDE301D39143A78003702D3CBCC820C53110B05F2D7CA5F15A5F
              193A3D4407AEA07808B3A239657A088DA9B5A63274DE523C309B721037A6CC1A
              4B14505586CED43AC5AB389F83986E50833938593A854A7C0A0F07731063CC30
              7AF1258C5E51072D57E723748B5E477F0E62DC2DBB4AE47A96A17383E8777A32
              2C746690AE2A5EC3DA12F93AC56B9847671CD5F1E219C50632203AA555611C49
              543C87960CF1B680594A671EA7D2E416D92D743C14BA542CD58AC74B99C75123
              DADF21FCC074987729E32F95688BBA45F77C1A537823DAF3EA0CDE5AFC87F107
              765EE7FD95EDE0850000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-mailbox'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA793000000B9494441545885ED95B1
              11C2400C041786224C333400E5181A809AC84C3FA49880EC49147834FA476FCC
              3C816E46C9DF493A5D60432010F8631C8001780269668D32635FBBFCF2C5D25C
              9D6B2E4FC00BE881ADD451DE12B073CED27DAE246E22EE0DEE24DCD56940F70D
              1EF128E2CEE03AE1EEEABD14FDB4EFA107AE8C25A9C0E5F8640995CE9CBB2934
              5A8373A64A8714B1F6887E894F09E42EF6C0D5DB3C81301006C2C0EC2FD8523B
              9B27B004A67FBD6A344F200C049AE30DBC994BFDD947691A0000000049454E44
              AE426082}
          end>
      end
      item
        Name = 'icons8-user-male'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA793000001F0494441545885EDD6BD
              6B14511405F05F24C6148212C44541140BC14E148C06AC24ADA022165AA801D3
              B98ABD85858204C5FF40C4C20F10C126B258881F55ECD45A41104DA124420231
              AEC5BBC3C66577D8CC4C1ACD81C7CEBD7BCF3DF7CD7DEFCD6315FF3BFA0A706A
              388103D88B216CC067ECC6AFCAAA6BC326DCC13C9A5DC6999512DF2FCDB029CD
              F029EA38845D381FFFCD601263E8AF4A7C3BBE8640033B3AC4F4E393BFDFC61B
              6CACA280C948F8046B72E26E2E29F2633C3F282BBE2F127D97161A0CE01826F0
              10CFF0416A4D1367B113B361EF2953C0B5487223EC1ADEE9BC0017714FABF7B7
              C33F51A68097916434ECBB61BFC7159CC4616996436DDCD1887D55A6806CE56F
              0D7BBACDCEC39688FD52A680B948325880BB2EB8F345C5FBB4FA5B1419BFEB89
              9BB7AD2EC7EF42890232EEA522E46C2F1F6CF3BF9616673B3AF94722C7B76E22
              796F20EBFBFA36FF6F9DDBD2C99F71177374BAA2AED5C346017E6309FF429102
              E0A8B41316A443A857D4823317394AE1B1348BFA32381783F3A8AC381C8F6453
              CBE0BC0DCE912A0A18943E464D0CF7103F1CB1D3585B4501702B92BEE821F679
              C45EAF4A1CB6E167241ECF891B8F9859E95B5029C6B4F6FA7DE9801A8831225D
              3E9A1173AE6AF10CA7A57B5FB74BE90C4EAD9478861AAE4A2BFD478CA9F06D5E
              69F155FC7BF8030E5191B4F861AF570000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-toolbox'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000081494441545885ED946F
              0A80200CC59FD1E1BCFF11EC20F5A5406D95ABE908DE0F04D9067BEC1F40C8CF
              88001600EBC54B7B4C37D24DF25C44378E246FFD27A64F720C08D95FA5DC2AB7
              7B0566C116049B2545A5DD2B4001D20CD4D4DBF13423AA78AE61CB1A5AB7A0F0
              B7CC80F62EA8E2DD5B400114206DC1D083E45E0142DCD900A4B71F3759AF8820
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-clock'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA793000001F2494441545885EDD6CD
              4E14511005E0CF9F4730666424288B0197FA0C6E941FDD61F4098C1A0D090FE2
              4E8C4FA02041A3B831BE8411311163D48D2B65058C9371716FA78749CFF4ED66
              767092CECD644E559DAEBA5D551CE3A8E34445FE386E600617E26FF8816F7883
              75FC1C95C00C4D2CA38D6EC9D3C1734C8C2AF83C76A2F3DDE87C012DBC8DCF14
              6E61057B91BB83B9C3067F20BC51172FE4291F8609ACCAB371BF6EF0F9E8E01F
              1ED6B05F8CF61D3532D194A7FDD1105E56F76122BAF88B7355043C8B862B25BC
              3201B01639CBA9C1C785B4EF2ABFC929022E0A17B32D64F6004E1618DCC429BC
              C6F712E729C8FAC369A187940AB816CFD51104CF9095F27A0AF98B90D6560237
              A504301D799F530464B77FA3828046096F43DE9C0EA0A804BDCECBB019CF0F09
              2292B115834F2570CFE263E46F616C00EF52E47CEAFFA328035FE3793941C06F
              5C156ADBC27BC599B812CFED049FEE496B42BD6808E5E82AEEFD5933BA9BE2EC
              BCD034F6541BA90D417C3F26B16F40231A84A782E251F482F5E8EB4915A331F9
              E7B87888E04BD1C71F35BE9239F938AD2362A9C77EA6863DC285CA16923561B0
              9461529EF68EE27B5109B3C23CEF0A17F3256E0BEDF59DD0E5A671278ADC97A7
              BDF69BF7E30C1E4B5B4ADBC2EC4F5A40AAAEE54D61559B15CAD1BB966F0B63F7
              157E55F47B8C238CFF304A976E28798DBF0000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-picture'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000133494441545885ED96DD
              6AC2401085BF84BE562944048317A53E5611BC295429F6ADFA02DA3750FBE745
              7A910919D74C7643B57BB30742C26636E79B3321049292222B53D7550CEFFC9F
              4DCF74D3B19675AC5D522749474FE09A0053E01DD80265C8868ACBBE885BF5CC
              8DE5137D045ABE0472860197D4296C8049884F1F400EACE5F86B6A83011AF3E6
              FE4B00445F5A8300B4F9418E0A58617F2F7C69050364C0B3321F01B7C09E3609
              1742EFA980D70E882000B7F342D58D810FB9F7A420ACB4DC917901BA3A773506
              3E69C7913B7B0AEAB476B2A6C7E105B03A7755025F52FB26E71D70A76A0ADA24
              96D29C1720C4BCD154411CA9BB76A521F4FB610258B15B9A28888551A3C7E105
              08E9DCD53DF02DFBE7468D4E62F09730440FC08F3CE3B107E26A000033056125
              71E293FE099392A2EB174E7990D89C15BBAB0000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-scroll'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA793000000BB494441545885ED9651
              0E823010449FC67022F9309E4FD1EB7906C063E8CF120DA9E04E49CC6227D9D0
              8FCE76182665A1A0601E1570057AE021560734D6CB8D4BC6C1E33A2B023A231F
              9CBCBBF1F640CDCB093706F5B9BC649FADA26849EC04CE9C1B1BCFFE900E8CDF
              306B7F4807BC1998444807BC19984448075219905D09E9C0BA32F07301A94FF0
              E9A2F9F697BC9E8BC81B366568493AD0DBB376F6BABDF18EB69646B086E586D0
              9322A03211C330AA546B874B6378C17FE109E1605E65770F0105000000004945
              4E44AE426082}
          end>
      end
      item
        Name = 'icons8-support'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA793000001A8494441545885EDD6C1
              6B134114C7F18F1E54305E84B4F1EE4108E6A47812B45E052FFE1F82085ED363
              A134964A29FE1BE24914FF02054B7AD49E8B5850AB05ABF1306FD93126159BDD
              04A43F58D87DF3E67DDFCCBCC72CC7FA4FD4C12AFAF8825DBCC1122ED6093E8D
              0DFCC060CC73808775C15F05640FCBB88AB3B88C4F31F616CD3A12D808C03B5C
              CAECCD800EB089B9CC5ED94E74A46DDF3B04DECFE073613F50514DAC0664790C
              7C0BF3197C5359134B5524D08F6057E2BB91C1B7D10AFB7CE65BD4C4EB2A1228
              823532DB62D8BEE36E24B1A52CC44EBCEF4E0A3F81FD08766668AC9B25B1EDF7
              2E38A7DC8989E0EBCAD6BB30C2A74862B805AF293BA312F8C221BE8BFEECFF5E
              CC5DA91B5E28AF8F36BE496DD89E063C571BEF63FE5ADDF09654980DE9CC7BD2
              CA0778895375C217C26FD465B4364DF83E3E4BD5BEE28867FE3883DFFA8BFFF5
              000EF00427FF1538AC478EB6F27529F9897427827D9D051C5E44C07BB380932E
              8A01CECF020E1F22706BCC78AD707816C1BBB380C34DFC94AED3AE74DB35715F
              2ACC5AE1851E4412A37EB17B75C30BDDC053ECE0239EE3F634C0C79ABA7E019C
              91ACAB6CB72A9A0000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-linkedin'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000129494441545885EDD6A1
              4EC35014C6F11FB090A989090409336812FC0C827740E391BC06EFC02BE0B621
              49303810682C6216464686680BEDC6BADDEED220FA2537EDB9E9F9FABFE7B627
              97468DFEA97A186182D98663927AF542006E23BC787E0C4300B29577439296A8
              9B7ABD872465D4993AE8A35D1162DE2F28A18397347EC04EDD007DC5BDDCAF1B
              A02D59F90C37D8AA1B80A4EC5556BE12A0B5A6C1657A9DE20A7B384FE79EF08C
              0B1CE215D7B8AF088B45E22C7E4BE3E3DCDC1DC68ADFC9274E4BFCA20264631E
              62F84BFE82B643A84A604F240DE72C377FB4A9E9BA1578CC3DD7F2D34527257E
              DF8A518171EE7E9A83DC5D2739D61694C57F0EB0911A80650A6E1C55FD9655E0
              23BDC63A9050FC2D576A24FE916C1002D093B4D25887D2010E42001A35AA4D5F
              1326B26F8EC052CD0000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-menu'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA7930000002F494441545885EDD4A1
              11003008044142FF3D270D640605985DF9E6DD4500CBCE67BB939FD97C069474
              00D00160DD03D18A030A5F39A0E30000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-unavailable'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA7930000026C494441545885EDD74B
              6B14511005E04F493679FB4251830FD4282E0C26E042772AEE8C4AFE8A082E5C
              88AE45115C49FE82202826EA421044044504638C208E0141E22B10A2988C8B5B
              638F6132D33D04B2F140D3D3F79EAA7BE6D6EDAA6AFE6385B1AA20BF0FA7701C
              5BD01BE3257CC4186E6162B9045630880728E7BCEE636039166EC5752C84E32F
              F13C84ED6843BBB43343B889E9E02EE01A5A9A5D7C0D1E86B3399C47670EBB2E
              5CC2AC6C377A8A2EDE5AB57819C3451D482128558928B413D7C3F077DCA7B0BB
              09119BAB445CCD6B3428C5EF270E63341C94B0B3091107A570CCC7EF86A89CF6
              0BF1DC260BC77B6C6B42C4E5B01F6B44EC0BE25774578DB7E351CCBD93BDFF79
              D12DBD41650D42792E48376ACC75E271CCBF951251118C84EDD97AA4B1209D5A
              62BE0B4F82338E4D05049C0EBBD17AA48920EDA8C3E9C6D3264454C23B5E8F34
              13A4F606CE7AF02CB8AFB13187808EE0CFD423FD0852470E87EBF132F82FB0AE
              01BF33B8DFEB91DE04694F0E01B001AFC2E639D6D6E1EE92EDD85FAC5E44FA10
              F77D39057CC63149783FEE4807B5160E2C5AA3A6804AA2389953007CC2514CE2
              10EEAA5DB44E2C5AA3262A2775DAD2FF6429F44A49AA2C25ADEA83BC468A7DC3
              4444AA5C65A9A416C536295D97A5F4DD16E31763EC5E1E270352319A95B3782C
              C24E59051CC511FC928A517F5E27D76415B068CA256DF3947F4BFA95220E5A64
              A128696E2786650DCDA8265AB39E2A11B35249EDAE6B91D02595F2B9AAC50BB7
              6415B4489DCCBCAC291D918AD55E2963B64B713F2355D16FC19D97B6BDE9A6B4
              1AFB715BFEB67C4CCEB015FD30D92DFB30E9C5D6182FC555F930992CE8F73F56
              0E7F000F80B9D22A0192900000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-checkmark'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA7930000021A494441545885EDD73B
              4F16411406E0470D2446BC041344A28585028D578231B1B43301FC1D50589818
              4BBC15B6241AE2ADB6D412F112FD0B46401B2F9460A209C65880C59E753F083B
              BBDF07090D6F32C5CEBCE7BC67E6CCCE9C611B5B8C1D4DF2FB318C4B38120DE6
              A34DE10566372BC01C83788D959AED25CE6D86703B26B11C8E17F01043E8C59E
              68BD18C163FC08EE32EE6157ABE207F12E9C2D611C7B6BD81DC05DFC09DB67AD
              88B737887FC5E9167C5CC0675C8CEF6E8CD6359E6C103FDC82788E9D0DE233E1
              73ACCAE8BC2C7F4B5A9BF95A348ACFC477126F833CBE15E2FD8ADD5E67C3B522
              9E3C7B6E84C1C30D8A1FC287F0358B9EE8BF8CAB29C3E9301ADA8078D9CC4FE2
              AFEC902AC55C189E28191F95CE632AE7C7A2FF5B2A805F415A2FFF63258EEB88
              C36EC5A1561940C73A635D8ABCCE29F24A79CE1BB12FC67FA602C85370BC647C
              BD20EA88439F62754A916FC2E10467ED52D7FDCFAF046F2A15C0F5203D4A91AC
              5E89AA99E7781ADC6B2952BE4C0BB29CA5D08D8FD1AA4EB8FD5894FEC3FEE34D
              106F5611652BD15583773B7C4ED7E01A545C4667EA1854E02C7E87CFDA55D203
              C5A15195DB147AC2C70A269A316C53D480F3186841FC14BE848FF7B222A72974
              2AAEE625DC52BD3105E78E6CD957647BAAB359F11C6DB8AF284A176585E788EC
              8FE988D6177D4FAC2E4A27C2C786318057EA97E5D36A6EB8661F26BD8A87C951
              AB1F26DF6557ED737C6AD2EF36B60EFF0005ADB6B312AAC9B40000000049454E
              44AE426082}
          end>
      end
      item
        Name = 'icons8-cancel'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA79300000200494441545885EDD7BD
              4E14511407F09F066CDC0036660352222616A2AC8F602BF02E7EB424A8AD9150
              4A7C05132B5D35F11D4C4463A12EAD3404A896B5B867329BCDECECCC8A6EC33F
              B9C9E49E8FFFC93967EEB997734C18176AEA2F631DF7B080C5D8EF601F6DBCC6
              B7B30A30430B1FD0ABB8DE63F52C88A7B183D370FC1B2F715FCAC6E558CB58C3
              6EE8F4C2661B53E3925FC1C77076842DCC54B09BC1131CCBB33157977C5A9EF2
              7DA90475710B3FC2C7275CAA63BC1386BF303F06798679A9417B7851D5A825D5
              EF08B7FF823CC31DA91CDDF81E892CF55B43E48D12DB61B2A7E1B33D8A7C59DE
              ED450DB7892F6816C89A21DB2C90CDE2207C2F9505F03894760B648D20E81504
              D11C901565E255C81F9605D00EA5B521F241A2E690BD226C84CEBBB200BE86D2
              F5129D41C22AE4E4E5DD2B0BE03094CA1A0DAEE2B3FCE8DD33FA776D84EE61FF
              E6C501A5DE08271906875895A196719D96294DBC04FFA309DF9605F0C8BFFF0D
              1F940530F18388343E7BD2482DC23847F13315D29F6155EAD4631587C708B470
              220DA395AA46DB52C41DE9EE372E16E4E3F8791DC3297929F671770CF215FC94
              4FC1DA57B3B9BE208EA5913A5BC16E56AAF989FCECAF7D25CB3025DD64BAE1EC
              40FA9DD671436ABA467C6F842CEBF6AE94F6B12FA5FDB88937AA5FCBDB2A3670
              DD87C992FC61B2886BB1DF89953D4CBED7F47B8EC9E10F036CBBCEA8DE0FC100
              00000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-settings'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA793000001FC494441545885ED973B
              4B03411485BF98C22258FB8A200414441B6D55EC23D858DAA7D4426367A3E9F2
              1FECF307B451484A15C55AB10BC42AC6283E9AB5C8597692EC4E76D74411BC30
              CCEC99731F3373E7B1F02F7F546A80D3516A3FE53CEDE3DC2D93518D0DC50860
              49F509905039EDE81B68002BAA6F0CEC5AF56A0C7BBE320D5C0107C08CB005A0
              8237DD9B067FD3C0CBE222DD03D99A8E124089F6B5BD05DED4BE03B68194C14F
              09BB13E74D3AA68D5258E76B526800C7405DDF9FC02EF6651B12E7533A75D968
              E87BAD97F3A411795ED830B0012C871D81B81BD245B6DC994CDA147378A34D5B
              78EBC019F00234D5CE5AF869BC59C9D90298051EF0D63AE3C33922F81C38F4E1
              67F072E3413EAC320A5C48E1116F17406BE40EF04E6BADC755F68439B4CFC48C
              6C38B239DACBB92B29A02AC539033F17B6EBA3E3AEF39981CD09ABD2BE6B42C9
              9394470CAC296CCC873FA6BE67031B11F614E424EA49E8A84EF8F4253B3841BC
              5001A48057B5A70CFC52F5968F8E8B5D1998BB935E89B004B624CCE225611E98
              50D9073EE84EC20C119330CC363C6480DB30EC4194A595ED4DFA7C10FDFA510C
              F6CB688FDE97519E6F5C46AED8AEE37B6087EEEB78477DDFBE8E21F84152360C
              DA1E24F3C2633F486C5294A38281158415A31A8BF326ACA85E3430F7315A8E61
              2FB24C127C0E4CFC4400F0CB3F26FFD257F902D138D27E49B3665A0000000049
              454E44AE426082}
          end>
      end
      item
        Name = 'icons8-file'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F400000006624B474400FF00FF00FFA0BDA7930000007D494441545885EDD64D
              0A80201086E1B7E80C11DDFF4851741ADBB6D074C6015B7C1F881B191FFC8101
              E5C7498E7102DB4840026E608F0478C021082FE07ACD5DD7E105ACC041C04978
              0144217ADE40EE776433550AD6D6E4D69BF65A1A8BB7A404FD84CD8100570410
              40000104104080967EC0D2159933FC0494E179001B43451BB45948EB00000000
              49454E44AE426082}
          end>
      end>
    Left = 1336
    Top = 8
  end
end
