unit uDmRelatorios;

interface

uses
  Windows,  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, ppDB, Controls,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppVar, RpBase, RpSystem, RpDefine, RpRave, gbCobranca,
  RpCon, RpConDS, Dialogs, Forms, myChkBox, ppStrtch, ppMemo, RpFiler,
  RpRender, RpRenderPDF;

type
  TdmRelatorios = class(TDataModule)
    dstMovCaixa: TSQLDataSet;
    dspMovCaixa: TDataSetProvider;
    cdsMovCaixa: TClientDataSet;
    dstTotalProdutos: TSQLDataSet;
    dspTotalProdutos: TDataSetProvider;
    cdsTotalProdutos: TClientDataSet;
    cdsTotalProdutosHIS_LOJA: TIntegerField;
    cdsTotalProdutosHIS_PRODUTO: TStringField;
    cdsTotalProdutosTOTAL: TFMTBCDField;
    cdsTotalProdutosPRO_NOME: TStringField;
    cdsTotalProdutosHIS_VLVENDA: TFMTBCDField;
    cdsTotalProdutosHIS_VLTOTAL: TCurrencyField;
    dstClientes: TSQLDataSet;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    dstClientesCLI_CODIGO: TIntegerField;
    dstClientesCLI_FANTASIA: TStringField;
    dstClientesCLI_RAZAO: TStringField;
    dstClientesCLI_TIPOPESSOA: TStringField;
    dstClientesCLI_CGC: TStringField;
    dstClientesCLI_ENDERECO: TStringField;
    dstClientesCLI_NUMERO: TIntegerField;
    dstClientesCLI_CEP: TStringField;
    dstClientesCLI_FONE1: TStringField;
    dstClientesCLI_INSCESTADUAL: TStringField;
    dstClientesCLI_ORGAOEMISSOR: TStringField;
    dstClientesCLI_UFEMISSOR: TStringField;
    dstClientesCLI_DTANIVERSARIO: TDateField;
    cdsClientesCLI_CODIGO: TIntegerField;
    cdsClientesCLI_FANTASIA: TStringField;
    cdsClientesCLI_RAZAO: TStringField;
    cdsClientesCLI_TIPOPESSOA: TStringField;
    cdsClientesCLI_CGC: TStringField;
    cdsClientesCLI_ENDERECO: TStringField;
    cdsClientesCLI_NUMERO: TIntegerField;
    cdsClientesCLI_CEP: TStringField;
    cdsClientesCLI_FONE1: TStringField;
    cdsClientesCLI_INSCESTADUAL: TStringField;
    cdsClientesCLI_ORGAOEMISSOR: TStringField;
    cdsClientesCLI_UFEMISSOR: TStringField;
    cdsClientesCLI_DTANIVERSARIO: TDateField;
    dsClientes: TDataSource;
    ppRepFichaCliente: TppReport;
    ppDBFichaCliente: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    cdsClientesCLI_NMTPPESSOA: TStringField;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    dstClientesCLI_NMCIDADE: TStringField;
    cdsClientesCLI_NMCIDADE: TStringField;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    dstClientesCLI_NMBAIRRO: TStringField;
    cdsClientesCLI_NMBAIRRO: TStringField;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    dstClientesCLI_FONE2: TStringField;
    dstClientesCLI_FONE3: TStringField;
    dstClientesCLI_RAMAL1: TStringField;
    dstClientesCLI_RAMAL2: TStringField;
    dstClientesCLI_RAMAL3: TStringField;
    dstClientesCLI_FAX: TStringField;
    cdsClientesCLI_FONE2: TStringField;
    cdsClientesCLI_FONE3: TStringField;
    cdsClientesCLI_RAMAL1: TStringField;
    cdsClientesCLI_RAMAL2: TStringField;
    cdsClientesCLI_RAMAL3: TStringField;
    cdsClientesCLI_FAX: TStringField;
    ppLabel11: TppLabel;
    ppDBText10: TppDBText;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppLabel13: TppLabel;
    ppDBText12: TppDBText;
    ppLabel14: TppLabel;
    ppDBText13: TppDBText;
    ppLabel15: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel16: TppLabel;
    ppLine5: TppLine;
    ppLabel17: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel18: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText17: TppDBText;
    ppLabel21: TppLabel;
    ppDBText18: TppDBText;
    ppLabel22: TppLabel;
    ppDBText19: TppDBText;
    ppLabel23: TppLabel;
    ppDBText20: TppDBText;
    ppLabel24: TppLabel;
    ppDBText21: TppDBText;
    dstClientesCLI_PAGINA: TStringField;
    cdsClientesCLI_PAGINA: TStringField;
    cdsClientesCODIGO: TStringField;
    cdsClientesFONE1: TStringField;
    cdsClientesFONE2: TStringField;
    cdsClientesFONE3: TStringField;
    dstVendedores: TSQLDataSet;
    dspVendedores: TDataSetProvider;
    cdsVendedores: TClientDataSet;
    dsVendedores: TDataSource;
    cdsVendedoresFUN_CODIGO: TIntegerField;
    cdsVendedoresFUN_NOME: TStringField;
    cdsVendedoresCODIGO: TStringField;
    ppDBVendedores: TppDBPipeline;
    ppRepVendedores: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppDBImage2: TppDBImage;
    ppLabel25: TppLabel;
    ppLine1: TppLine;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel28: TppLabel;
    ppDBText24: TppDBText;
    ppLine2: TppLine;
    ppLabel29: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel30: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    cdsVendedoresFONE: TStringField;
    cdsVendedoresFUN_FONE: TStringField;
    ppLine4: TppLine;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dstClientesCLI_UFCLIENTE: TStringField;
    cdsClientesCLI_UFCLIENTE: TStringField;
    ppDBText25: TppDBText;
    ppLabel31: TppLabel;
    dstVendas: TSQLDataSet;
    dspVenda: TDataSetProvider;
    cdsVendas: TClientDataSet;
    dsVendas: TDataSource;
    ppRepVendas: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppShape1: TppShape;
    ppDBImage3: TppDBImage;
    ppLabel32: TppLabel;
    txtPedido: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppShape2: TppShape;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppShape3: TppShape;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBPItensVenda: TppDBPipeline;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppLabel57: TppLabel;
    ppShape4: TppShape;
    ppLabel58: TppLabel;
    ppLine28: TppLine;
    ppLabel59: TppLabel;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLabel62: TppLabel;
    ppLabel64: TppLabel;
    lbl_Rodape: TppLabel;
    ppLine35: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    cdsVendasMOV_PEDIDO: TIntegerField;
    cdsVendasMOV_LOJA: TIntegerField;
    cdsVendasMOV_SEQUENCIA: TIntegerField;
    cdsVendasMOV_CLIENTE: TIntegerField;
    cdsVendasCLI_FANTASIA: TStringField;
    cdsVendasCLI_ENDERECO: TStringField;
    cdsVendasCLI_CEP: TStringField;
    cdsVendasCLI_CGC: TStringField;
    cdsVendasCLI_FONE1: TStringField;
    cdsVendasCLI_FAX: TStringField;
    cdsVendasCLI_INSCESTADUAL: TStringField;
    cdsVendasMOV_DATAVENDA: TDateField;
    cdsVendasMOV_VALOR: TFMTBCDField;
    cdsVendasMOV_SITUACAO: TStringField;
    cdsVendasMOV_NOMECLIENTE: TStringField;
    cdsVendasMOV_TABELA: TIntegerField;
    ppDBText32: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    cdsVendasCLI_UFCLIENTE: TStringField;
    cdsVendasCID_NOME: TStringField;
    ppDBPVendas: TppDBPipeline;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    txtSubTotal: TppLabel;
    txtIPI: TppLabel;
    txtTOTAL: TppLabel;
    ppDBText44: TppDBText;
    txtFormaPagamento: TppLabel;
    ppRepOrcamento: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppShape5: TppShape;
    ppDBImage4: TppDBImage;
    ppLabel65: TppLabel;
    txtOrcamento: TppLabel;
    ppLine36: TppLine;
    ppLine49: TppLine;
    ppShape6: TppShape;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppShape7: TppShape;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLine69: TppLine;
    ppLine70: TppLine;
    txtCondPaga: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppLabel92: TppLabel;
    ppLine71: TppLine;
    ppLine72: TppLine;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppFooterBand4: TppFooterBand;
    ppShape8: TppShape;
    ppLabel93: TppLabel;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLine81: TppLine;
    ppLine82: TppLine;
    ppLine83: TppLine;
    ppLabel94: TppLabel;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLine86: TppLine;
    ppLine87: TppLine;
    ppLine88: TppLine;
    ppLine89: TppLine;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    txtSubTotal2: TppLabel;
    txtIPI2: TppLabel;
    txtTotal2: TppLabel;
    ppDBText63: TppDBText;
    ppDBPItensOrcamento: TppDBPipeline;
    txtRazao: TppLabel;
    txtEndereco: TppLabel;
    txtFone: TppLabel;
    txtCep: TppLabel;
    txtFax: TppLabel;
    txtCNPJ: TppLabel;
    txtEndereco2: TppLabel;
    txtCodigo: TppLabel;
    txtBairro: TppLabel;
    txtUF: TppLabel;
    txtInscricao: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine90: TppLine;
    ppLabel66: TppLabel;
    ppLabel91: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLine91: TppLine;
    ppDBText45: TppDBText;
    ppLabel101: TppLabel;
    txtTipo: TppLabel;
    txtRegiao: TppLabel;
    txtFluxo: TppLabel;
    txtOrdem: TppLabel;
    ppLabel63: TppLabel;
    txtFornecedor: TppLabel;
    txtCDCLIE: TppLabel;
    cdsVendasDOM_BAIRRO: TStringField;
    txtFone2: TppLabel;
    txtFax2: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLine92: TppLine;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    txtFornecedor2: TppLabel;
    ppLabel104: TppLabel;
    txtCidade2: TppLabel;
    cdsVendasCLI_RAZAO: TStringField;
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsTotalMes: TClientDataSet;
    ppRepTotalMes: TppReport;
    ppDBPTotalMes: TppDBPipeline;
    cdsTotalMesANO: TIntegerField;
    cdsTotalMesMES: TIntegerField;
    cdsTotalMesNOME_MES: TStringField;
    cdsTotalMesARECEBER: TFloatField;
    cdsTotalMesRECEBIDO: TFloatField;
    dsTotalMes: TDataSource;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppDBImage5: TppDBImage;
    ppLabel105: TppLabel;
    lblLoja: TppLabel;
    ppDBText33: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText46: TppDBText;
    ppLabel107: TppLabel;
    ppLine93: TppLine;
    ppLabel108: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLabel109: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLine94: TppLine;
    ppLine95: TppLine;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppLine96: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel113: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    lblExercicio: TppLabel;
    lblNomeCliente: TppLabel;
    cdsTotalMesSALDO: TFloatField;
    cdsTotalNatureza: TClientDataSet;
    dsTotalNatureza: TDataSource;
    ppRepTotalNatureza: TppReport;
    ppDBPTotalNatureza: TppDBPipeline;
    ppHeaderBand6: TppHeaderBand;
    ppDetailBand6: TppDetailBand;
    ppFooterBand6: TppFooterBand;
    ppDBImage6: TppDBImage;
    lblNomeRel: TppLabel;
    lblLoja2: TppLabel;
    ppLine97: TppLine;
    ppLine98: TppLine;
    ppLine99: TppLine;
    ppLabel115: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppLabel116: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    cdsTotalNaturezaTIPO: TStringField;
    cdsTotalNaturezaDESCRICAO: TStringField;
    cdsTotalNaturezaVALOR: TFloatField;
    ppDBText47: TppDBText;
    ppLine100: TppLine;
    ppDBText48: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppLabel117: TppLabel;
    lblPeriodo: TppLabel;
    lblTipoNatureza: TppLabel;
    cdsTotalNaturezaTIPO_DESCRICAO: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText49: TppDBText;
    ppLabel106: TppLabel;
    ppLabel114: TppLabel;
    ppLine101: TppLine;
    rvpBoleto: TRvProject;
    RvSystem2: TRvSystem;
    gbCobranca1: TgbCobranca;
    gbTitulo1: TgbTitulo;
    rvpBoletoBB: TRvProject;
    cdsVenda: TClientDataSet;
    cdsBoleto: TClientDataSet;
    cdsBoletoREC_CREDITO: TIntegerField;
    cdsBoletoREC_DATAEMISSAO: TDateField;
    cdsBoletoREC_PARCELA: TIntegerField;
    cdsBoletoREC_QTPARCELAS: TIntegerField;
    cdsBoletoREC_CLIENTE: TIntegerField;
    cdsBoletoREC_NRVENDA: TIntegerField;
    cdsBoletoREC_DESCRICAO: TMemoField;
    cdsBoletoREC_DATAVENCIMENTO: TDateField;
    cdsBoletoREC_VALORPARCELA: TFMTBCDField;
    cdsBoletoREC_NATUREZA: TIntegerField;
    cdsBoletoREC_SITUACAO: TStringField;
    cdsBoletoCLI_TIPOPESSOA: TStringField;
    cdsBoletoCLI_CGC: TStringField;
    cdsBoletoCLI_FANTASIA: TStringField;
    cdsBoletoCLI_RAZAO: TStringField;
    cdsBoletoCLI_ENDERECO: TStringField;
    cdsBoletoCLI_NUMERO: TIntegerField;
    cdsBoletoCLI_CEP: TStringField;
    cdsBoletoCLI_UFCLIENTE: TStringField;
    rvdstConfig: TRvDataSetConnection;
    rvdstBoleto: TRvDataSetConnection;
    rvdstCedente: TRvDataSetConnection;
    cdsBoletoREC_LOJA: TIntegerField;
    cdsBoletoBAI_CODIGO: TIntegerField;
    cdsBoletoCID_CODIGO: TIntegerField;
    cdsAcessos: TClientDataSet;
    cdsContaSaldo: TClientDataSet;
    cdsContaSaldoCGS_CODIGO: TIntegerField;
    cdsContaSaldoCGS_DESCRICAO: TStringField;
    cdsBoletoREC_SEQUENCIA: TIntegerField;
    cdsModalidade: TClientDataSet;
    cdsModalidadeMOD_CODIGO: TIntegerField;
    cdsModalidadeMOD_NOME: TStringField;
    cdsContasPagar: TClientDataSet;
    cdsContasPagarPAG_SEQUENCIA: TIntegerField;
    cdsContasPagarPAG_LOJA: TIntegerField;
    cdsContasPagarPAG_DATACOMPRA: TDateField;
    cdsContasPagarPAG_DATAVENCIMENTO: TDateField;
    cdsContasPagarFOR_FANTASIA: TStringField;
    cdsContasPagarPAG_VALORPARCELA: TFMTBCDField;
    cdsCedentes: TClientDataSet;
    cdsCedentesCODIGO: TIntegerField;
    cdsCedentesCEDENTE_NOME: TStringField;
    cdsCedentesCEDENTE_CODIGO: TStringField;
    cdsContSaldo: TClientDataSet;
    cdsContSaldoCGS_CODIGO: TIntegerField;
    cdsContSaldoCGS_DESCRICAO: TStringField;
    cdsContSaldoCGS_VALOR_SALDO: TFMTBCDField;
    cdsContSaldoCGS_AGENCIA: TStringField;
    cdsContSaldoCGS_BANCO: TIntegerField;
    cdsContSaldoCGS_NRCONTA: TStringField;
    cdsVendedoresFUN_PECOMI: TBCDField;
    cdsLojas: TClientDataSet;
    cdsValidarAcesso: TClientDataSet;
    dstValidarAcesso: TSQLDataSet;
    dspValidarAcesso: TDataSetProvider;
    cdsVendasBAI_CODIGO: TIntegerField;
    cdsVendasBAIRRO: TStringField;
    ppLabel118: TppLabel;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    cdsVendasTRANSPORTADORA: TStringField;
    cbkCIF: TmyCheckBox;
    ppLabel119: TppLabel;
    cbkFOB: TmyCheckBox;
    cdsVendasMOV_TIPO_FRETE: TStringField;
    cdsVendasMOV_PERC_FRETE: TFMTBCDField;
    txtPercFrete1: TppLabel;
    txtValorFrete: TppLabel;
    ppDBText52: TppDBText;
    ppLabel120: TppLabel;
    cdsVendasNOME_TAB: TStringField;
    ppDBText53: TppDBText;
    ppLabel121: TppLabel;
    cdsVendasCLI_NUMERO: TIntegerField;
    txtPercFrete: TppLabel;
    cdsVendasMOV_TABELA_PLANO: TIntegerField;
    txtFoneRepresentante: TppLabel;
    txtNmRepresentanta: TppLabel;
    ppLabel122: TppLabel;
    ppLine102: TppLine;
    ppLine103: TppLine;
    ppLabel123: TppLabel;
    ppDBText54: TppDBText;
    ppLabel124: TppLabel;
    txtObservacao: TppMemo;
    cdsVendasMOV_OBSERVACAO: TMemoField;
    txtPercIPI: TppLabel;
    ppLine104: TppLine;
    ppLabel125: TppLabel;
    txtDesconto: TppLabel;
    ppDBText55: TppDBText;
    cdsVendasCLI_END_COBRANCA: TStringField;
    ppLabel126: TppLabel;
    rvPedido: TRvProject;
    RvNDRWriter1: TRvNDRWriter;
    RvSystem1: TRvSystem;
    rvdItensVenda: TRvDataSetConnection;
    RvRenderPDF1: TRvRenderPDF;
    SaveDialog1: TSaveDialog;
    rvdConfig: TRvDataSetConnection;
    cdsVendasMOV_MODALIDADE_PEDIDO: TIntegerField;
    cdsVendasMOV_OBS1: TMemoField;
    cdsVendasMOV_OBS2: TMemoField;
    dstComissoes: TSQLDataSet;
    dspComissoes: TDataSetProvider;
    cdsComissoes: TClientDataSet;
    dstTeleEntregas: TSQLDataSet;
    dspTeleEntregas: TDataSetProvider;
    cdsTeleEntrega: TClientDataSet;
    cdsTeleEntregaTOTAL_VENDA: TFMTBCDField;
    cdsTeleEntregaTOTAL_SERVICO: TFMTBCDField;
    cdsTeleEntregaQUANTIDADE: TIntegerField;
    cdsClientesCLI_NRCPFCGC: TStringField;
    ppDBText56: TppDBText;
    cdsComissoesFUN_CODIGO: TIntegerField;
    cdsComissoesFUN_NOME: TStringField;
    cdsComissoesTOTAL: TFMTBCDField;
    cdsComissoesTAXA: TFMTBCDField;
    cdsDetalheMovCaixa: TClientDataSet;
    cdsDetalheMovCaixaMCA_TIPOMOV: TStringField;
    cdsDetalheMovCaixaMCA_NATUREZA: TIntegerField;
    cdsDetalheMovCaixaNAT_NOME: TStringField;
    cdsDetalheMovCaixaVALOR: TFMTBCDField;
    cdsMovModalidade: TClientDataSet;
    cdsMovModalidadeMCA_MODALIDADE: TIntegerField;
    cdsMovModalidadeMOD_NOME: TStringField;
    cdsMovModalidadeVALOR: TFMTBCDField;
    cdsMovModalidade2: TClientDataSet;
    cdsMovModaCredito: TClientDataSet;
    cdsMovModaCreditoMCA_MODALIDADE: TStringField;
    cdsMovModaCreditoMOD_NOME: TStringField;
    cdsMovModaCreditoMCA_TIPOMOV: TStringField;
    cdsMovModaCreditoVALOR: TFMTBCDField;
    cdsModalidades: TClientDataSet;
    cdsMovModalidade2MCA_MODALIDADE: TStringField;
    cdsMovModalidade2MOD_NOME: TStringField;
    cdsMovModalidade2MCA_TIPOMOV: TStringField;
    cdsMovModalidade2VALOR: TFMTBCDField;
    cdsMovModalidade2TROCO: TFMTBCDField;
    cdsMovModalidade2TOTAL: TFMTBCDField;
    rv2Boletos: TRvProject;
    RvSystem3: TRvSystem;
    cds2Boletos: TClientDataSet;
    cds2BoletosCDS_SEQUENCIA: TIntegerField;
    cds2BoletosCDS_CLIENTE: TIntegerField;
    cds2BoletosCDS_NMCLIENTE: TStringField;
    cds2BoletosCDS_CPF: TStringField;
    cds2BoletosCDS_ENDERECO: TStringField;
    cds2BoletosCDS_CIDADE: TStringField;
    cds2BoletosCDS_BAIRRO: TStringField;
    cds2BoletosCDS_DESCRICAO: TMemoField;
    cds2BoletosCDS_DOCUMENTO: TStringField;
    cds2BoletosCDS_NOSSONUMERO: TStringField;
    cds2BoletosCDS_DTDOCU: TDateField;
    cds2BoletosCDS_DTPROCESSAMENTO: TDateField;
    cds2BoletosCDS_DTVENCIMENTO: TDateField;
    cds2BoletosCDS_CARTEIRA: TStringField;
    cds2BoletosCDS_VALOR: TFloatField;
    cds2BoletosCDS_CEP: TStringField;
    cds2BoletosCDS_BOXMESA: TStringField;
    rvdst2Boletos: TRvDataSetConnection;
    cds2BoletosCDS_LINHA_DIGITAVEL: TStringField;
    cds2BoletosCDS_CODIGO_BARRAS: TStringField;
    cds2BoletosCDS_AGENCIA: TStringField;
    cds2BoletosCDS_DIAGEN: TStringField;
    cds2BoletosCDS_CDCEDENTE: TStringField;
    cds2BoletosCDS_DG_NNUMERO: TStringField;
    txtSituacao: TppLabel;
    procedure cdsTotalProdutosCalcFields(DataSet: TDataSet);
    procedure cdsClientesCalcFields(DataSet: TDataSet);
    procedure cdsVendedoresCalcFields(DataSet: TDataSet);
    procedure cdsTotalMesCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure RvSystem2AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Adicionar_Dados_Total_Mes(aAno, aMes : Integer; aReceber, aRecebido : Double);
    Procedure Adicionar_Total_Pagar_Receber(aTipo : Integer; aDescricao : String; aValor : Double);
    procedure IMPRIMIR_BOLETO(M_TPIMPR, aSequencia, aCedente : Integer; aDocumento, M_FLSEGU : String; aDtVenc : TDate; aValorDoc : Double);
    procedure PrepararTitulo(aSequencia, aCredito : Integer);
    Function NewPrepararTitulo(M_CDBANC : integer; aConvenio, aNossoNumero : String; aDtVenc : TDatetime; fValor : Double) : String ;    
    procedure Carregar_Movimento(aLoja, aVenda : Integer);
    Procedure LIMITE_CREDITO;
    Procedure VIA_PEDIDO_NOVO(M_NRPEDI, M_FMPAGA : Integer; M_FLSEGV, M_NMFORN, aEmail : String);
    Procedure CarregaRel();
    Procedure Comissoes(iRegInicial, iRegFinal : Integer);
    Procedure TeleEntregas(iRegInicial, iRegFinal : Integer);
    function GetDetalhesMovCaixa(iCaixa, iInicial, iFinal : integer; aTipoMov : String) : boolean;
    Function GetMovCaixaModalidades(aCaixa, aRegInicial, aRegFinal : Integer; aTipoMov : String): boolean;
    Function GetMovCaixaModalidades2(aCaixa, aModalidade, aRegInicial, aRegFinal : Integer; aTipoMov1, aTipoMov2, aEntSai: String): double;
    Function AddBoletoCliente(iSEQUENCIA, iCLIENTE : Integer;
      aNMCLIENTE, aCPF, aENDERECO, aCIDADE, aBAIRRO,
      aDOCUMENTO, aNOSSONUMERO, aCARTEIRA, aCEP, aBOXMESA,
      aLINHA_DIGITAVEL, aCODIGO_BARRAS, aAGENCIA, aDIAGEN, aCDCEDENTE, aDG_NNUMERO : String;
      aDESCRICAO : TStrings; aDTDOCU, aDTPROCESSAMENTO, aDTVENCIMENTO : TDatetime; fVALOR: Double) : Boolean;
    Function SetCodigoBarras(aNossoNumero: String; aDtVenc : TDatetime; fValor : Double): Boolean;
  end;

var
  dmRelatorios: TdmRelatorios;
  M_CODIGOBARRAS, M_DIGITOCODIGO : String;


implementation

uses Udm, uFuncoes, uDm2, udmConsulta, uFrmCadPedido, udmDados, uCodBarras,
  untFrmPreview, uFrmConsVendas;

{$R *.dfm}

procedure TdmRelatorios.cdsTotalProdutosCalcFields(DataSet: TDataSet);
begin
     cdsTotalProdutos.FieldByName('HIS_VLTOTAL').AsCurrency :=
       cdsTotalProdutos.FieldByName('HIS_VLVENDA').AsCurrency *
       cdsTotalProdutos.FieldByName('TOTAL').AsCurrency;
end;

procedure TdmRelatorios.cdsClientesCalcFields(DataSet: TDataSet);
begin
     cdsClientesCODIGO.AsString := uFuncoes.StrZero(cdsClientesCLI_CODIGO.AsString,7);
     //
     if (cdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
     begin
         cdsClientesCLI_NMTPPESSOA.AsString := 'FISICA';
         if (cdsClientes.State = dsInternalCalc) Then
            cdsClientesCLI_NRCPFCGC.AsString := uFuncoes.FormataCPF(cdsClientesCLI_CGC.AsString);
     End;
     if (cdsClientesCLI_TIPOPESSOA.AsString = 'J') Then
      begin
         cdsClientesCLI_NMTPPESSOA.AsString := 'JURIDICA';
         if (cdsClientes.State = dsInternalCalc) Then
            cdsClientesCLI_NRCPFCGC.AsString := uFuncoes.FormataCNPJ(cdsClientesCLI_CGC.AsString);
     End;
     //
     If not uFuncoes.Empty(cdsClientesCLI_FONE1.AsString) Then
        cdsClientesFONE1.AsString   :=
           '('+Copy(cdsClientesCLI_FONE1.AsString,1,2)+')'
           +Copy(cdsClientesCLI_FONE1.AsString,3,4)+'-'
           +Copy(cdsClientesCLI_FONE1.AsString,7,4);
     //
     If not uFuncoes.Empty(cdsClientesCLI_FONE2.AsString) Then
        cdsClientesFONE2.AsString   :=
           '('+Copy(cdsClientesCLI_FONE2.AsString,1,2)+')'
           +Copy(cdsClientesCLI_FONE2.AsString,3,4)+'-'
           +Copy(cdsClientesCLI_FONE2.AsString,7,4);
     //
     If not uFuncoes.Empty(cdsClientesCLI_FONE3.AsString) Then
        cdsClientesFONE3.AsString   :=
           '('+Copy(cdsClientesCLI_FONE3.AsString,1,2)+')'
           +Copy(cdsClientesCLI_FONE3.AsString,3,4)+'-'
           +Copy(cdsClientesCLI_FONE3.AsString,7,4);
     //

end;

procedure TdmRelatorios.cdsVendedoresCalcFields(DataSet: TDataSet);
begin
      cdsVendedoresCODIGO.AsString := uFuncoes.StrZero(cdsVendedoresFUN_CODIGO.AsString,5);
      //
     If not uFuncoes.Empty(cdsVendedoresFUN_FONE.AsString) Then
        cdsVendedoresFONE.AsString  :=
           '('+Copy(cdsVendedoresFUN_FONE.AsString,1,2)+')'
           +Copy(cdsVendedoresFUN_FONE.AsString,3,4)+'-'
           +Copy(cdsVendedoresFUN_FONE.AsString,7,4);

end;

procedure TdmRelatorios.cdsTotalMesCalcFields(DataSet: TDataSet);
begin
     If (cdsTotalMesARECEBER.AsFloat > 0) Then
        cdsTotalMesSALDO.AsFloat :=
            cdsTotalMesARECEBER.AsFloat - cdsTotalMesRECEBIDO.AsFloat
     Else
       cdsTotalMesSALDO.AsFloat := 0;
end;

procedure TdmRelatorios.Adicionar_Dados_Total_Mes(aAno, aMes: Integer;
  aReceber, aRecebido: Double);
begin
     If (cdsTotalMes.Active = False) Then
      begin
           cdsTotalMes.Open;
           cdsTotalMes.EmptyDataSet;
      End;
     //
     With cdsTotalMes do
      begin
           Append;
           FieldByName('ANO').AsInteger := aAno;
           FieldByName('MES').AsInteger := aMes;
           FieldByName('NOME_MES').AsString := uFuncoes.MesExtenso2(aMes);
           FieldByName('ARECEBER').AsFloat  := aReceber;
           FieldByName('RECEBIDO').AsFloat  := aRecebido; 
           post;
      End;
end;

procedure TdmRelatorios.Adicionar_Total_Pagar_Receber(aTipo: Integer;
  aDescricao: String; aValor: Double);
begin
     If (cdsTotalNatureza.Active = False) Then
      begin
           cdsTotalNatureza.Open;
           cdsTotalNatureza.EmptyDataSet;
      End;
     //
     With cdsTotalNatureza do
      begin
           Append;
           FieldByName('TIPO').AsInteger     := aTipo;
           If (aTipo = 1) Then
               FieldByName('TIPO_DESCRICAO').AsString := 'DESPESA'
           Else
               FieldByName('TIPO_DESCRICAO').AsString := 'RECEITA';
           FieldByName('DESCRICAO').AsString := aDescricao;
           FieldByName('VALOR').AsFloat      := aValor;
           post;
      End;
end;

procedure TdmRelatorios.IMPRIMIR_BOLETO(M_TPIMPR, aSequencia, aCedente : Integer;
  aDocumento, M_FLSEGU: String; aDtVenc : TDate; aValorDoc : Double);
Var
     M_NOSNUM, M_CPFCNPJ, M_NRCONV, M_CARTEIRA : String;
     M_CDBANC, M_DVBANC, M_NRAGEN, M_CDCEDE, M_CEDENTE, M_NRCEP : String;
     M_CODIGOBARRAS, M_DIGITOCODIGO : String;
     SacadoList, EnderecoList, DescricaoList : TStringList;
     M_NOVO_NOSSO_NUMERO : String;
begin
      Dm.RefreshCDS(Dm.CdsConfig);
      //
      Dm.FilterCDS(dmDados.cdsCedente, fsInteger , InttoStr(aCedente));
      // Verificar nosso numero
      If not (Dm.GetExisteNossoNumeroTitulo(aSequencia)) Then
       begin
           dmDados.cdsCedente.Edit;
           dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger :=
              dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger + 1;
           dmDados.cdsCedente.ApplyUpdates(0);
           //
           M_NOVO_NOSSO_NUMERO := dmDados.cdsCedenteINICIO_NOSSO_NUMERO.AsString +
                                  uFuncoes.StrZero(dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsString,9);
           //
           If not (Dm.SetNossoNumeroTitulo(aSequencia, M_NOVO_NOSSO_NUMERO)) Then
                ShowMessage('Erro ao tentar grava nosso número do titulo!!');
       End
       Else
           M_NOVO_NOSSO_NUMERO := Dm.GetNossoNumeroTitulo(aSequencia);
      //
      PrepararTitulo(aSequencia, StrtoInt(aDocumento));
      //carregar dados para o estratro.
      Carregar_Movimento(cdsBoletoREC_LOJA.AsInteger, cdsBoletoREC_NRVENDA.AsInteger);
      //
      M_CDBANC := dmDados.cdsCedenteBANCO_CODIGO.AsString;
      M_DVBANC := dmDados.cdsCedenteAGENCIA_DIGITO.AsString;
      M_NRAGEN := gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia+'-'+gbTitulo1.Cedente.ContaBancaria.fDigitoAgencia;
      M_CDCEDE := gbTitulo1.Cedente.CodigoCedente+'-'+gbTitulo1.Cedente.DigitoCodigoCedente;
      M_CEDENTE := dmDados.cdsCedenteCEDENTE_CODIGO.AsString;
      M_NRCONV := dmDados.cdsCedenteNUMERO_CONVENIO.AsString;
      M_CARTEIRA := dmDados.cdsCedenteCARTEIRA.AsString;
      //
      M_NRCEP := uFuncoes.FormataCep(dmDados.cdsCedenteCEP.AsString);
      //
      //If (Dm.CdsConfigCFG_MODELO_BOLETO.AsInteger = 1) Then
      If (dmDados.cdsCedenteTIPO_BOLETO.AsInteger = 1) Then
      begin
           M_CODIGOBARRAS := gbTitulo1.CodigoBarra.Codigo;
           M_NOSNUM       := gbTitulo1.NossoNumero;
      End;
      //
      If (dmDados.cdsCedenteTIPO_BOLETO.AsInteger = 2) Then
      begin
         M_NOSNUM := uFuncoes.StrZero(gbTitulo1.NossoNumero,17) + '-' + uCodBarras.Modulo11('9'+uFuncoes.StrZero(aDocumento,17),9);
         // codigo de barras
         M_CODIGOBARRAS := '1049'+CalcularFatorVencimento(aDtVenc)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',aValorDoc)),10)
                          +'1'+StrZero(Copy(M_CEDENTE,1,5),6)
                          +gbTitulo1.NossoNumero;
         // digito do codigo
         M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
         If M_DIGITOCODIGO = '0' then
             M_DIGITOCODIGO := '1';
         //
         M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                         +M_DIGITOCODIGO
                         +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);
      End;
      //
      If (dmDados.cdsCedenteTIPO_BOLETO.AsInteger = 3) Then
      begin
          gbTitulo1.NossoNumero := M_NRCONV+M_NOVO_NOSSO_NUMERO;
          //aDocumento;
          // W_NRCONV
          //
          M_NOSNUM := uFuncoes.StrZero(gbTitulo1.NossoNumero,17) +
                '-' + uCodBarras.Modulo11(gbTitulo1.NossoNumero,9);
          // codigo de barras
          M_CODIGOBARRAS := M_CDBANC+M_DVBANC
                          +CalcularFatorVencimento(aDtVenc)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',aValorDoc)),10)
                          + '000000'
                          +gbTitulo1.NossoNumero+M_CARTEIRA;
          // digito do codigo
          M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
          If M_DIGITOCODIGO = '0' then
              M_DIGITOCODIGO := '1';
          //
          M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                          +M_DIGITOCODIGO
                          +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);
      End;
      //
      EnderecoList := TStringList.Create;
      With EnderecoList do
        begin
             Add(dmDados.cdsCedenteRUA.AsString);
             Add('Bairro :' +dmDados.cdsCedenteBAIRRO.AsString);
             Add('CEP : '+dmDados.cdsCedenteCEP.AsString);
             Add(dmDados.cdsCedenteCIDADE.AsString + ' - '+ dmDados.cdsCedenteESTADO.AsString);
        End;
      // Carrega informações do sacado
      SacadoList := TStringList.Create;
         with SacadoList do
         begin
            //Add('  Código : '+ StrZero(cdsBoletoREC_CLIENTE.AsString,7));
            Add('  '+gbTitulo1.Sacado.Nome);
            If (cdsBoletoCLI_TIPOPESSOA.AsString ='F') Then
                Add('  CPF: '+ uFuncoes.FormataCPF(gbTitulo1.Sacado.NumeroCPFCGC))
            Else
                Add('  CGC: '+ uFuncoes.FormataCNPJ(gbTitulo1.Sacado.NumeroCPFCGC));
            Add('  '+gbTitulo1.Sacado.Endereco.Rua + ' ' + gbTitulo1.Sacado.Endereco.Numero + ' ');
            If not uFuncoes.Empty(gbTitulo1.Sacado.Endereco.Complemento) Then
                 Add('  '+Trim(gbTitulo1.Sacado.Endereco.Complemento));
            Add('  '+gbTitulo1.Sacado.Endereco.Bairro);
            Add('  '+cdsBoletoCLI_CEP.AsString+ '  ' + gbTitulo1.Sacado.Endereco.Cidade + '-' + gbTitulo1.Sacado.Endereco.Estado);
            //
         end;
         //
         DescricaoList := TStringList.Create;
         With DescricaoList do
          begin
                Add(' '+cdsBoletoREC_DESCRICAO.AsString);
          End;
         //txtInstrucoes.Lines.Text := dmCartao.tbParamPAR_INSTRU1.AsString;}
         //
         If (cdsBoletoCLI_TIPOPESSOA.AsString ='F') Then
             M_CPFCNPJ := 'CPF:'+ uFuncoes.FormataCPF(gbTitulo1.Sacado.NumeroCPFCGC)
         Else
             M_CPFCNPJ := 'CGC:'+uFuncoes.FormataCNPJ(gbTitulo1.Sacado.NumeroCPFCGC);
       //
       If (Dm.CdsConfigCFG_MODELO_BOLETO.AsInteger <> 3) Then
       begin
         With rvpBoleto do
         begin
              If (M_FLSEGU = 'N') Then
                  SetParam('VIA','')
              Else
                  SetParam('VIA','2ª VIA');
              //
              SetParam('ENDERECO', EnderecoList.Text);
              SetParam('CDBANC', M_CDBANC+'-'+M_DVBANC);
              SetParam('LINDIG',uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(M_CODIGOBARRAS));
              SetParam('CODIGO',M_CODIGOBARRAS);
              SetParam('MOVI', DescricaoList.Text);
              SetParam('NRDOCU', StrZero(aDocumento,10));
              SetParam('ESPECIEDOC','DM');
              //
              SetParam('ENDERECO_CLI', gbTitulo1.Sacado.Endereco.fRua);
              SetParam('CEP_CLI', uFuncoes.FormataCep(gbTitulo1.Sacado.Endereco.fCEP));
              SetParam('BAIRRO', gbTitulo1.Sacado.Endereco.fBairro);
              SetParam('CIDADE_CLI', gbTitulo1.Sacado.Endereco.fCidade);
              //
              SetParam('SACADO', SacadoList.Text);
              //SetParam('LIMCRE', 'R$ '+FormatFloat('###,##0.#0',M_LIMCRE));
              SetParam('INSTRUCOES', Dm.CdsConfigCFG_INSTRUCOES.AsString);
              //
              SetParam('Carteira',gbTitulo1.Carteira);
              SetParam('DTPROC', DatetoStr(Date));
              SetParam('AGE_CEDENTE', M_NRAGEN + '/'+M_CDCEDE);
              SetParam('NOSSONUM', M_NOSNUM);
              SetParam('CEP_CLI2', uFuncoes.FormataCep(cdsBoletoCLI_CEP.AsString));
              //+ '-' + gbTitulo1.DigitoNossoNumero
              SetParam('CPFCNPJ', M_CPFCNPJ);
              SetParam('CODBAIXA',M_NOSNUM);
              SetParam('VLDOCU', 'R$ ' + FormatFloat('###,##0.00',aValorDoc));
              SetParam('INSTRUCOES', Dm.CdsConfigCFG_INSTRUCOES.AsString);
              //SetParam('INSTRUCOES',  dmCartao.tbParamPAR_INSTRU1.AsString);
              SetParam('INSTRUCOES2', Dm.CdsConfigCFG_INSTRUCOES.AsString);
              //
              If (M_TPIMPR = 1) Then
              begin
                   RvSystem2.DefaultDest := rdPreview;
                   Execute;
              End
              Else
              begin
                   RvSystem2.DefaultDest := rdPrinter;
                   //RvSystem2.DefaultDest := rdPreview;
                   Execute;
              End;
         End;  // fim-with
         //
      End;
      //
       If (Dm.CdsConfigCFG_MODELO_BOLETO.AsInteger = 3) Then
       begin
         With rvpBoletoBB do
         begin
              If (M_FLSEGU = 'N') Then
                  SetParam('VIA','')
              Else
                  SetParam('VIA','2ª VIA');
              //
              SetParam('CDBANC', M_CDBANC+'-'+M_DVBANC);
              SetParam('LINDIG',uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(M_CODIGOBARRAS));
              SetParam('CODIGO',M_CODIGOBARRAS);
              SetParam('MOVI', DescricaoList.Text);
              SetParam('ESPECIEDOC','DM');
              {SetParam('PLANO',txtPlano.Lines.Text);
              SetParam('DEBITO',txtDebito.Lines.Text);
              SetParam('CREDITO',txtCretido.Lines.Text);}
              SetParam('SACADO', SacadoList.Text);
              {SetParam('LIMCRE', 'R$ '+FormatFloat('###,##0.#0',M_LIMCRE));
              SetParam('INSTRUCOES', txtInstrucoes.Lines.Text);}
              //
              SetParam('Carteira',M_CARTEIRA);  // gbTitulo1.Carteira
              SetParam('DTPROC', DatetoStr(Date));
              SetParam('AGE_CEDENTE', M_NRAGEN + '/'+M_CDCEDE);
              SetParam('NOSSONUM', M_NOSNUM);
              //+ '-' + gbTitulo1.DigitoNossoNumero
              SetParam('CPFCNPJ',M_CPFCNPJ);
              SetParam('CODBAIXA',M_NOSNUM);
              SetParam('VLDOCU', 'R$ ' + FormatFloat('###,##0.00',aValorDoc));
              //SetParam('INSTRUCOES',  dmCartao.tbParamPAR_INSTRU1.AsString);
              //SetParam('INSTRUCOES2', dmCartao.tbParamPAR_INSTRU2.AsString);
              //
              If (M_TPIMPR = 1) Then
              begin
                   RvSystem2.DefaultDest := rdPreview;
                   Execute;
              End
              Else
              begin
                   RvSystem2.DefaultDest := rdPrinter;
                   Execute;
              End;
         End;  // fim-with
      End;
      //
      SacadoList.Free;
      EnderecoList.Free;
      DescricaoList.Free;
end;

procedure TdmRelatorios.Carregar_Movimento(aLoja, aVenda : Integer);
Var
   M_NRCART,M_DTREFE,M_NMCRE :String;
   M_NMPLAN,M_TPMOVI,M_NRFATU:String;
   M_DEBITO, M_CREDI, M_CDCLIE, W_CDCLIE, W_NRCART :String;
   M_VLPARC,M_TODEBI,M_TOCRED,M_SLREST,M_VLDOCU:Double;
   M_CREDIT, M_SLANTE, M_ESPACO : String;
   MovList : TStringList;
begin
   //
   M_TODEBI := 0;
   M_TOCRED := 0;
   M_ESPACO := uFuncoes.Replicate(' ',5);
   //
   With cdsVenda do
    begin
         Active :=  False;
         Params.ParamByName('pVENDA').AsInteger := aVenda;
         Params.ParamByName('pLOJA').AsInteger  := aLoja;
         active :=  True;
    End;
   //
   M_NRFATU := StrZero(InttoStr(aVenda),10);
   M_VLDOCU := 0;;
   W_CDCLIE := StrZero(cdsVenda.FieldBYName('MOV_CLIENTE').AsString,7);
   //
   //txtMov.Clear;
   MovList := TStringList.Create;
   //
   {txtPlano.Lines.Clear;
   txtDebito.Lines.Clear;
   txtCretido.Lines.Clear;}
   //
   If not (cdsvenda.IsEmpty) Then
   begin
       cdsvenda.First;
       While Not (cdsvenda.Eof) do
       begin
           M_CREDI := '';
           M_DEBITO:= '';
           //
           //M_DTREFE := cdsMovCaixa.FieldByName('MOV_DATAVENDA').AsString ;
           M_NMCRE  := 'VENDEDOR';
           M_NMPLAN := '';
           //M_VLPARC := cdsMovCaixa.FieldByName('H.HIS_MOVIMENTO').AsFloat * cdsMovCaixa.FieldByName('H.HIS_VLCOMPRA').AsFloat;
           M_TPMOVI := 'D';
           W_NRCART := '00000';
           //
           { If Empty(M_NMPLAN) Then
             M_NMPLAN := tbReplChar(' ',10);
            //
            If M_TPMOVI <> 'C' Then
            Begin
                M_TODEBI := M_TODEBI+M_VLPARC;
                M_DEBITO := Format('%-10.2f',[M_VLPARC]);
            End
            Else
            Begin
                M_TOCRED := M_TOCRED+M_VLPARC;
                M_CREDI := Format('%-10.2f',[M_VLPARC]);

            End;}
           //
           With MovList do
           begin
              Add (Format('%7s',[M_DTREFE])+M_ESPACO+
                 Format('%-13s',[W_NRCART])+M_ESPACO+
                 Format('%-25s',[M_NMCRE]));
             //
             {txtPlano.Lines.Add(M_NMPLAN);
             // Valore do Debito
             txtDebito.Lines.Add(M_DEBITO);
             // Valores de credito
             txtCretido.Lines.Add(M_CREDI);}
           End;
         //
          CDSVENDA.Next;
      End;                // Fim-do-Enquanto.
    End;
    // Libera o filtro.
    //dmCartao.tbAccBom.Filtered := False;
    //
    {M_CREDIT := (dmCartao.qryACCBOLBOL_VLCRED.AsString);
    M_SLANTE := (dmCartao.qryACCBOLBOL_VLANTE.AsString);
    M_CREDIT := (dmCartao.qryACCBOLBOL_VLCRED.AsString);
    M_SLREST := dmCartao.qryACCBOLBOL_VLREST.Value;}
    //
    If (DM.CdsConfigCFG_MODELO_BOLETO.AsInteger <> 3) Then
    begin
      With rvpBoleto do
      begin
          {SetParam('SDANTERIOR', Format('%15.2m',[StrtoFloat( dmCartao.qryACCBOLBOL_VLANTE.AsString)]));
          SetParam('CREDPAG',Format('%15.2m',[M_TOCRED]));
          SetParam('SDRESTANTE',Format('%15.2M',[M_SLREST]));
          SetParam('DEBPERIODO',Format('%15.2M',[M_TODEBI]));}
          SetParam('VALORDOC', FormatFloat('R$ #,##0.00',gbTitulo1.ValorDocumento));
          SetParam('PGMINIMO','R$ '+FormatFloat('#,##0.00',gbTitulo1.ValorDocumento));
      End;
    End;
    //
    If (DM.CdsConfigCFG_MODELO_BOLETO.AsInteger = 3) Then
    begin
      With rvpBoletoBB do
      begin
          {SetParam('SDANTERIOR', Format('%15.2m',[StrtoFloat( dmCartao.qryACCBOLBOL_VLANTE.AsString)]));
          SetParam('CREDPAG',Format('%15.2m',[M_TOCRED]));
          SetParam('SDRESTANTE',Format('%15.2M',[M_SLREST]));
          SetParam('DEBPERIODO',Format('%15.2M',[M_TODEBI]));}
          SetParam('VALORDOC', FormatFloat('R$ #,##0.00',gbTitulo1.ValorDocumento));
          SetParam('PGMINIMO','R$ '+FormatFloat('#,##0.00',gbTitulo1.ValorDocumento));
      End;
    End;
        //txtMovimentacao.Lines.Add(tbReplChar('-',89));
        MovList.Add(' ');
        MovList.Add(' SUBTOTAL DESPESAS/ENCARGOS:');
        //
        MovList.Add(' ');
        MovList.Add(Format('%-10.2f',[M_TODEBI]));
        //
        MovList.Add(' ');
        MovList.Add(Format('%-10.2f',[M_TOCRED]));
     //
     MovList.Free;     
end;

procedure TdmRelatorios.LIMITE_CREDITO;
Var
   M_NRCART,M_CDCLIE : String;
   M_VLLIMI : dOUBLE;
begin
     //M_LIMCRE := 0;
     //
     // PESSOA JURIDICA
    { If (dmDados.cdsCedenteTIPO_INSCRICAO.AsString = 'J') Then
     begin
          M_CDCLIE := qryBoletos.FieldByName('BOL_CDCLIE').Value;
          M_NRCART := qryBoletos.FieldByName('BOL_NRCART').Value;
          //
          With qryPesquisa do
            begin
                 SQL.Clear;
                 Close;
                 SQL.Add('Select CLI_CDCLIE , CLI_VLLIMI from ACCCLI WHERE (CLI_CDCLIE = :pCDCLIE)');
                 ParamByName('pCDCLIE').AsString := M_CDCLIE;
                 Open;
                 //
                 If (RecordCount > 0) Then
                  begin
                       M_CDCLIE := FieldByName('CLI_CDCLIE').Value;
                       //
                       If (FieldByName('CLI_VLLIMI').AsFloat > 0 ) Then
                          M_LIMCRE := FieldByName('CLI_VLLIMI').AsFloat
                        Else
                        begin
                             SQL.Clear;
                             Close;
                             SQL.Add('Select CAR_CDCLIE, CAR_VLLIMI FROM ACCCAR Where (CAR_NRCART = :pNRCART)');
                             ParamByName('pNRCART').AsString := M_NRCART;
                             Open;
                             //
                            If (RecordCount > 0) Then
                                M_LIMCRE := FieldByName('CAR_VLLIMI').AsFloat
                        End;
                      //

                  End;
            End;}
end;

procedure TdmRelatorios.PrepararTitulo(aSequencia, aCredito : Integer);
{
   Objetivo:
      Preencher as propriedades do componente gbTitulo1 com os dados da conta selecionada.
      Servirá de apoio para diveras outras rotinas
}
Var
    M_CDCLIE, M_COMPLE, W_NRDOCU : String;
begin
    W_NRDOCU := StrZero(InttoStr(aCredito),10);
    With cdsBoleto do
      begin
           Active := False;
           Params.ParamByName('pSEQUENCIA').AsInteger := aSequencia;
           Params.ParamByName('pCREDITO').AsInteger   := aCredito;
           Params.ParamByName('pSITUACAO').AsString   := 'A';
           Active := True;
      End;
      //
   {Dados do titulo}
   with gbTitulo1 do
   begin
      SeuNumero   := StrZero(InttoStr(aCredito),10);
      Carteira    := dmDados.cdsCedente.FieldByName('CARTEIRA').AsString;
      //
      If (dmDados.cdsCedenteINICIO_NOSSO_NUMERO.AsString = '82') Then
      Begin
            NossoNumero    := '82'+StrZero(InttoStr(aCredito),8);
            Carteira := 'SR';
      End;
      //
      If (dmDados.cdsCedenteINICIO_NOSSO_NUMERO.AsString = '9') Then
      begin
             gbTitulo1.NossoNumero    :=
               dmDados.cdsCedenteINICIO_NOSSO_NUMERO.AsString+uFuncoes.StrZero(W_NRDOCU,17);
             gbTitulo1.Carteira := dmDados.cdsCedenteCARTEIRA.AsString;
             //gbTitulo1.Carteira := 'CR';
      End;
      //
      If (dmDados.cdsCedenteINICIO_NOSSO_NUMERO.AsString = '9')
       and (dmDados.cdsCedenteCARTEIRA.AsString = '17') Then
         Begin
             gbTitulo1.Carteira       := dmDados.cdsCedenteCARTEIRA.AsString;
             gbTitulo1.NossoNumero    :=
                  dmDados.cdsCedente.FieldByname('NUMERO_CONVENIO').AsString+ W_NRDOCU;
             //
             gbTitulo1.Carteira := dmDados.cdsCedenteCARTEIRA.AsString;
         End;
      //
       DataDocumento  := cdsBoleto.FieldByName('REC_DATAEMISSAO').AsDateTime;
       DataVencimento := cdsBoleto.FieldByName('rec_datavencimento').AsDateTime;
       ValorDocumento := cdsBoleto.FieldByName('REC_VALORPARCELA').AsFloat;

      //  Dados do cedente
      with Cedente do
      begin

         TipoInscricao := tiPessoaJuridica; //CNPJ
         If (Carteira = 'SR') Then
         Begin
           CodigoCedente := dmDados.cdsCedenteCEDENTE_CODIGO.AsString;
           DigitoCodigoCedente := dmDados.cdsCedenteCEDENTE_CODIGO_DIGITO.AsString;          //'7';
         End;
         //
         If (Carteira = 'CR') Then
         Begin
             CodigoCedente       := uFuncoes.StrZero(dmDados.cdsCedenteCEDENTE_CODIGO.AsString,6);
             DigitoCodigoCedente := dmDados.cdsCedenteCEDENTE_CODIGO_DIGITO.AsString;
         End;
         //
         If (Carteira = '17') Then
         Begin
             CodigoCedente       := uFuncoes.StrZero(dmDados.cdsCedenteCEDENTE_CODIGO.AsString,6);
             DigitoCodigoCedente := dmDados.cdsCedenteCEDENTE_CODIGO_DIGITO.AsString;
         End;
         //   Endereço do cedente
         with Endereco do
         begin
            Rua := dmDados.cdsCedenteRUA.AsString;
            Endereco.Numero := dmDados.cdsCedenteNUMERO.AsString;
            Complemento := dmDados.cdsCedenteCOMPLEMENTO.AsString;
            Bairro := dmDados.cdsCedenteBAIRRO.AsString;
            Cidade := dmDados.cdsCedenteCIDADE.AsString;
            Estado := dmDados.cdsCedenteESTADO.AsString;
            CEP    := dmDados.cdsCedenteCEP.AsString;
            Email  := dmDados.cdsCedenteEMAIL.AsString;
         end;  //  with Endereco

         //  Dados bancários do cedente
         with ContaBancaria do
         begin
              Banco.Codigo  := dmDados.cdsCedenteBANCO_CODIGO.AsString;;
              CodigoAgencia := dmDados.cdsCedenteAGENCIA_CODIGO.AsString;
              DigitoAgencia := dmDados.cdsCedenteAGENCIA_DIGITO.AsString;
             NumeroConta    := dmDados.cdsCedenteCONTA_NUMERO.AsString;
             //'87000000004';
             If (Banco.Codigo = '000') Then
                 Banco.Codigo := '104';
             //DigitoConta := '7';
         end;  // with Banco
      end; //  with Cedente

     //Dados do sacado do título
      with Sacado do
      begin
         NumeroCPFCGC := cdsBoletoCLI_CGC.AsString;
         Nome := cdsBoletoCLI_RAZAO.AsString;
         //Endereço do sacado do título
         with Endereco do
         begin
            Rua         := cdsBoletoCLI_ENDERECO.AsString;
            Complemento := '';   //cdsBoletoCLI_ENDERECO.AsString;
            Bairro      := GetBairro(cdsBoletoCID_CODIGO.AsInteger, cdsBoletoBAI_CODIGO.AsInteger);
            Cidade      := GetCidade(cdsBoletoCID_CODIGO.AsInteger);
            Estado      := cdsBoletoCLI_UFCLIENTE.AsString;
         end; //with Endereco

      end; //with Sacado
   end; //with Titulo}
end;

procedure TdmRelatorios.DataModuleCreate(Sender: TObject);
begin
     rvpBoleto.ProjectFile   := ExtractFilePath( Application.ExeName )+'\Relatorios\rvBoleto.rav';
     rvpBoletoBB.ProjectFile := ExtractFilePath( Application.ExeName )+'\Relatorios\rvBoleto2.rav';
     rv2Boletos.ProjectFile  := ExtractFilePath( Application.ExeName )+'\Relatorios\rv2Boletos.rav';
     CarregaRel;
     //rvPedido.ProjectFile    := ExtractFilePath( Application.ExeName )+'\Relatorios\rvPedido.rav';
end;

procedure TdmRelatorios.RvSystem2AfterPrint(Sender: TObject);
begin
     Dm.Fluxo_Boleto(cdsBoleto ,'S');
end;

procedure TdmRelatorios.VIA_PEDIDO_NOVO(M_NRPEDI, M_FMPAGA: Integer;
  M_FLSEGV, M_NMFORN, aEmail: String);
var
  stream : TMemoryStream;
  aArquivo : String;
Begin
     fPeFrete := 0;
     Dm.RefreshCDS(dm.CdsConfig);
     //
     udm.aArquivoAnexo := '';
     //
     With cdsvendas do
      begin
           Close;
           Params.ParamByName('pPEDIDO').AsInteger := M_NRPEDI;
           Open;
           //
      End;
      //
      If not (dmRelatorios.cdsvendas.IsEmpty) Then
      begin
           //stream := TMemoryStream.Create;
           RvNDRWriter1.StreamMode := smUser;
           RvNDRWriter1.Stream := Stream;
           { Executa o relatório  }
           dm.CdsEmpresas.Close;
           With dm.SdsEmpresas do
              Begin
                   Active := False;
                   CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
                   Params.ParamByName('pCODIGO').AsInteger := cdsVendasMOV_LOJA.AsInteger;
                   Active := true;
              End;
           dm.CdsEmpresas.Open;
           //
           udm.fPeFrete :=cdsVendasMOV_PERC_FRETE.AsFloat;
           //
           uFuncoes.TOTAIS;
           //
           With rvPedido do
           begin
                SetParam('pCNPJ_MATRIZ',' ');
                SetParam('pNMMATRIZ', ' ');
                //
                dm.FilterCDS(Dm.CdsClientes, fsInteger, cdsVendasMOV_CLIENTE.AsString);
                //
                If not (Dm.CdsClientes.IsEmpty) Then
                 begin
                      If (Dm.CdsClientesCLI_FLMATRIZ.AsString = 'F' )
                       and not uFuncoes.Empty(Dm.CdsClientesCLI_CODIGO_MATRIZ.AsString) Then
                      Begin
                          SetParam('pCNPJ_MATRIZ', 'Matriz - CNPJ/Razão : '+uFuncoes.FormataCNPJ(uFuncoes.CNPJ_CLIENTE(Dm.CdsClientesCLI_CODIGO_MATRIZ.AsInteger)));
                          SetParam('pNMMATRIZ', uFuncoes.RAZAO_CLIENTE(Dm.CdsClientesCLI_CODIGO_MATRIZ.AsInteger));
                      End;
                 End;
                // Cabeçalho
                SetParam('IMAGEM', Dm.CdsConfigCFG_IMAGEMLOGO.Value);
                SetParam('pPEDIDO', 'Nº.: '+uFuncoes.StrZero(inttoStr(M_NRPEDI),7));
                If not Empty(M_NMFORN) Then
                    SetParam('pNMFORNECEDOR', M_NMFORN)
                Else
                    SetParam('pNMFORNECEDOR',getFornecedor(M_NRPEDI));
                // Dados Cabeçalho
                SetParam('pRAZAO', cdsVendasCLI_RAZAO.AsString);
                SetParam('pCDCLIE', uFuncoes.StrZero(cdsVendasMOV_CLIENTE.AsString,7));
                SetParam('pENDERECO', cdsVendasCLI_ENDERECO.AsString + ', '+ cdsVendasCLI_NUMERO.AsString);
                SetParam('pBAIRRO', cdsVendasBAIRRO.AsString);
                SetParam('pCEP', uFuncoes.FormataCep(cdsVendasCLI_CEP.AsString));
                SetParam('pCIDADE', cdsVendasCID_NOME.AsString);
                SetParam('pUF', cdsVendasCLI_UFCLIENTE.AsString);
                SetParam('pFONE', uFuncoes.FormataFONE(cdsVendasCLI_FONE1.AsString));
                SetParam('pFAX', uFuncoes.FormataFONE(cdsVendasCLI_FAX.AsString));
                SetParam('pCNPJ', uFuncoes.FormataCNPJ(cdsVendasCLI_CGC.AsString));
                SetParam('pINSCRICAO', cdsVendasCLI_INSCESTADUAL.AsString);
                SetParam('pENDENTREGA', cdsVendasCLI_END_COBRANCA.AsString);
                if (cdsVendasMOV_TIPO_FRETE.AsString = 'F' ) Then
                 begin
                      SetParam('pCIF','(  )');
                      SetParam('pFOB','(X)');
                 End
                 Else
                 begin
                      SetParam('pCIF','(X)');
                      SetParam('pFOB','(  )');
                 End;
                //
                If (udm.aValor_Frete > 0) then
                begin
                    SetParam('pPERC_FRETE', FormatFloat('##0.#0',fPeFrete) + '%');
                    SetParam('pVLFRETE',  'R$ ' + FormatFloat('###,##0.#0', udm.aValor_Frete));
                End
                Else
                begin
                    SetParam('pPERC_FRETE', '0.00 %');
                    SetParam('pVLFRETE',  '0.00');
                End;
                //
                SetParam('pCOND_PAGA', uFuncoes.GetCondicaoPagamento(cdsVendasMOV_TABELA_PLANO.AsInteger) + ' - '+
                                       uFuncoes.GetFormaPagamento(cdsVendasMOV_MODALIDADE_PEDIDO.AsInteger));
                                       // GetModaPedido(cdsVendasMOV_PEDIDO.AsInteger
                SetParam('pTAB_DESC', cdsVendasNOME_TAB.AsString);
                SetParam('pTransportadora', cdsVendasTRANSPORTADORA.AsString);
                SetParam('pFONE_REP', FormataFone(Dm.CdsEmpresasEMP_NRFONE.AsString));
                SetParam('pNOM_REPRE',Dm.CdsEmpresasEMP_RAZAO.AsString);
                //
                SetParam('pDESC_PERC', FormatFloat('##0.#0',dmConsultas.cdsItensVendasITE_VLDESC.AsFloat) + ' %');
                SetParam('pIPI_PERC', FormatFloat('##0.#0',dmConsultas.cdsItensVendasITE_VALIPI.AsFloat)+ ' %');
                //
                SetParam('pOBSERVACAO', cdsVendasMOV_OBSERVACAO.AsString);
                SetParam('pOBS1', cdsVendasMOV_OBS1.AsString);
                SetParam('pOBS2', cdsVendasMOV_OBS2.AsString);
                SetParam('pDATA', cdsVendasMOV_DATAVENDA.AsString);
                //
                SetParam('pMENS2', Dm.CdsConfigCFG_MENS_RODAPE_PEDIDO.AsString);
                SetParam('pMENS1', Dm.CdsConfigCFG_MENS_RODAPE.AsString);
                //
                If (aEmail = 'N') Then
                 begin
                      RvSystem1.DefaultDest := rdPreview;
                      Execute;
                 End
                Else
                begin
                     aArquivo := Dm.cdsconfigCFG_ARQUIVO_PEDIDO.AsString+'\'+'PC'+StrZero(InttoStr(M_NRPEDI),6)+'.PDF';
                     //
                     RvSystem1.DefaultDest    := rdFile;
                     RvSystem1.DoNativeOutput := false;
                     RvSystem1.SystemSetups   := RvSystem1.SystemSetups - [ssAllowSetup];
                     RvSystem1.OutputFileName := aArquivo;
                     RvSystem1.RenderObject   := RvRenderPDF1;
                     SaveDialog1.Filter       := 'Acrobat Reader|PDF';
                     SaveDialog1.DefaultExt   := 'PDF';
                     {if SaveDialog1.Execute then
                     begin}
                         SaveDialog1.FileName     := aArquivo;
                         RvSystem1.OutputFileName := SaveDialog1.FileName;
                         rvPedido.ExecuteReport('Pedido');
                     //End;
                     udm.aArquivoAnexo := aArquivo;
                End;
           End;
      //
      End;
     {FrmPreview := TFrmPreview.Create(Self, Stream,  'Pedido ');
     try
           FrmPreview.ShowModal;
     finally
           FrmPreview.Release;
           FrmPreview := nil;
     end;}
end;

procedure TdmRelatorios.CarregaRel;
begin
     rvPedido.ProjectFile    := ExtractFilePath( Application.ExeName )+'\Relatorios\rvPedido.rav';
end;

procedure TdmRelatorios.Comissoes(iRegInicial, iRegFinal: Integer);
begin
     with cdsComissoes do
      begin
           Close;
           Params[0].AsInteger := iRegInicial;
           Params[1].AsInteger := iRegFinal;
           Open; 
      End;
end;

procedure TdmRelatorios.TeleEntregas(iRegInicial, iRegFinal: Integer);
begin
     With cdsTeleEntrega do
      begin
           Close;
           Params[0].AsInteger := iRegInicial;
           Params[1].AsInteger := iRegFinal;
           Open;    
      End;
end;

function TdmRelatorios.GetDetalhesMovCaixa(iCaixa, iInicial,
  iFinal: integer; aTipoMov: String): boolean;
begin
     Result := False;
     With cdsDetalheMovCaixa do
      begin
           close;
           Params.ParamByName('pRGINICIAL').AsInteger := iInicial;
           Params.ParamByName('pRGFINAL').AsInteger   := iFinal;
           Params.ParamByName('pCAIXA').AsInteger     := iCaixa;
           Params.ParamByName('pTIPOMOV').AsString    := aTipoMov;
           Open;
           //
           if not (IsEmpty) Then
              Result := True;
      End;
end;

function TdmRelatorios.GetMovCaixaModalidades(aCaixa, aRegInicial,
  aRegFinal: Integer; aTipoMov: String): boolean;
begin
      result := false;
      With cdsMovModalidade do
        begin
             Close;
             CommandText := 'Select MC.MCA_MODALIDADE, M.MOD_NOME, Sum(MC.MCA_VLMODALIDADE) AS VALOR ';
             CommandText := CommandText + ' from MOVIMENTO_CAIXA MC INNER JOIN MODALIDADE M ON MC.MCA_MODALIDADE = M.MOD_CODIGO ';
             CommandText := CommandText + ' Where (MC.MCA_SEQUENCIA >= :pRGINICIAL) and (MC.MCA_SEQUENCIA <= :pRGFINAL) AND ';
             CommandText := CommandText + ' (MC.MCA_CAIXA = :pCAIXA) AND ((MC.MCA_TIPOMOV = :pTIPOMOV) or (MC.MCA_TIPOMOV = :pTIPOMOV2)) Group by MC.MCA_MODALIDADE, M.MOD_NOME ';
             //
             Params.ParamByName('pRGINICIAL').AsInteger := aRegInicial;
             Params.ParamByName('pRGFINAL').AsInteger   := aRegFinal;
             Params.ParamByName('pCAIXA').AsInteger     := aCaixa;
             Params.ParamByName('pTIPOMOV').AsString    := aTipoMov;
             Params.ParamByName('pTIPOMOV2').AsString   := 'E';
             //
             Open;
             //
             If not (IsEmpty) Then
                result := True;
        End;
end;

function TdmRelatorios.GetMovCaixaModalidades2(aCaixa, aModalidade,
  aRegInicial, aRegFinal: Integer; aTipoMov1, aTipoMov2,
  aEntSai: String): double;
Var
    M_TOENTR, M_TOSAID, M_TOCRED : Double;
begin
     Result := 0;
     M_TOENTR := 0;
     M_TOSAID := 0;
     M_TOCRED := 0;
     //
     With cdsMovModalidade2 do
      begin
           Active := False;
           CommandText := 'Select MC.MCA_MODALIDADE, M.MOD_NOME, MC.MCA_TIPOMOV, Sum(MC.MCA_VLMODALIDADE) AS VALOR, Sum(MC.mca_vltroco) AS TROCO, (Sum(MC.MCA_VLMODALIDADE) - Sum(MC.mca_vltroco)) AS TOTAL ';
           CommandText := CommandText + ' from MOVIMENTO_CAIXA MC INNER JOIN MODALIDADE M ON MC.MCA_MODALIDADE = M.MOD_CODIGO ';
           CommandText := CommandText + ' Where (MC.MCA_SEQUENCIA >= :pRGINICIAL) and (MC.MCA_SEQUENCIA <= :pRGFINAL) AND  ';
           CommandText := CommandText + ' (MC.MCA_CAIXA = :pCAIXA) and (MC.MCA_MODALIDADE = :pMODALIDADE) and (MC.MCA_TIPOMOV = :pTIPOMOV1) ';
           CommandText := CommandText + ' Group by MC.MCA_MODALIDADE, M.MOD_NOME, MC.MCA_TIPOMOV';
           //
           Params.ParamByName('pRGINICIAL').AsInteger := aRegInicial;
           Params.ParamByName('pRGFINAL').AsInteger   := aRegFinal;
           Params.ParamByName('pCAIXA').AsInteger     := aCaixa;
           Params.ParamByName('pMODALIDADE').AsInteger := aModalidade;
           Params.ParamByName('pTIPOMOV1').AsString   := aTipoMov1;
           Active := True;
           //
           If not (IsEmpty) Then
              if (FieldByName('TROCO').AsFloat > 0) Then
                  Result := FieldByName('VALOR').AsFloat - FieldByName('TROCO').AsFloat
              Else
                  Result := FieldByName('VALOR').AsFloat;
      End;
end;

function TdmRelatorios.AddBoletoCliente(iSEQUENCIA, iCLIENTE: Integer;
  aNMCLIENTE, aCPF, aENDERECO, aCIDADE, aBAIRRO, aDOCUMENTO, aNOSSONUMERO,
  aCARTEIRA, aCEP, aBOXMESA, aLINHA_DIGITAVEL, aCODIGO_BARRAS,
  aAGENCIA, aDIAGEN, aCDCEDENTE, aDG_NNUMERO : String;
  aDESCRICAO: TStrings; aDTDOCU, aDTPROCESSAMENTO,
  aDTVENCIMENTO: TDatetime; fVALOR: Double): Boolean;
Var
   M_NRDOCU : String;
begin
     result := false;
      //
      With cds2Boletos do
        begin
             Append;
             FieldByName('CDS_SEQUENCIA').AsInteger := iSEQUENCIA;
             FieldByName('CDS_CLIENTE').AsInteger   := iCLIENTE;
             FieldByName('CDS_NMCLIENTE').AsString  := aNMCLIENTE;
             FieldByName('CDS_CPF').AsString        := uFuncoes.FormataCPF(aCPF);
             If not uFuncoes.Empty(aENDERECO) Then
                 FieldByName('CDS_ENDERECO').AsString   := aENDERECO
             Else
                 FieldByName('CDS_ENDERECO').AsString   := 'SHOPPING DA CIDADE';
             FieldByName('CDS_CIDADE').AsString     := aCIDADE;
             FieldByName('CDS_BAIRRO').AsString     := aBAIRRO;
             FieldByName('CDS_DESCRICAO').Assign(aDESCRICAO);
             If (aDTDOCU > StrtoDate('22/04/2010')) Then
              begin
                //M_NRDOCU := Copy(aDOCUMENTO, 1,6)+'.'+uFuncoes.RemoveChar(Copy(aDOCUMENTO,7,8));
                M_NRDOCU := aDOCUMENTO;
                //M_NRDOCU := Copy(aDOCUMENTO, 1,2)+'.'+Copy(uFuncoes.RemoveChar(aDOCUMENTO),3,Length(aDOCUMENTO) - 1);
                FieldByName('CDS_DOCUMENTO').AsString  := M_NRDOCU;
              End
             Else
                FieldByName('CDS_DOCUMENTO').AsString  := aDOCUMENTO;
             //
             FieldByName('CDS_NOSSONUMERO').AsString := aNOSSONUMERO;
             FieldByName('CDS_DTDOCU').AsDateTime   := aDTDOCU;
             FieldByName('CDS_DTPROCESSAMENTO').AsDateTime := aDTPROCESSAMENTO;
             FieldByName('CDS_DTVENCIMENTO').AsDateTime := aDTVENCIMENTO;
             FieldByName('CDS_CARTEIRA').AsString   := aCARTEIRA;
             FieldByName('CDS_VALOR').AsFloat       := fVALOR;
             If not uFuncoes.Empty(aCEP) Then
                FieldByName('CDS_CEP').AsString      := uFuncoes.FormataCep(aCEP)
             Else
                FieldByName('CDS_CEP').AsString      := '64000-100';
             FieldByName('CDS_BOXMESA').AsString    := aBOXMESA;
             FieldByName('CDS_AGENCIA').AsString    := aAGENCIA;
             FieldByName('CDS_DIAGEN').AsString     := aDIAGEN;
             FieldByName('CDS_CDCEDENTE').AsString  := aCDCEDENTE;
             FieldByName('CDS_DG_NNUMERO').AsString := aDG_NNUMERO;
             FieldByName('CDS_LINHA_DIGITAVEL').AsString := aLINHA_DIGITAVEL;
             FieldByName('CDS_CODIGO_BARRAS').AsString   := aCODIGO_BARRAS;
             //
             Post;
        End;
      //
      Result := true;
end;

Function TdmRelatorios.NewPrepararTitulo(M_CDBANC: integer; aConvenio, aNossoNumero : String;
         aDtVenc : TDatetime; fValor : Double) : String;
{
   Objetivo:
      Preencher as propriedades do componente gbTitulo1 com os dados da conta selecionada.
      Servirá de apoio para diveras outras rotinas
}
Var
    M_CDCLIE, M_COMPLE, aDigito : String;
    M_ININSN : String;
    M_BANC_PADRAO : integer;
begin
      If (M_CDBANC = 0) Then
          M_BANC_PADRAO := 1
      eLSE
          M_BANC_PADRAO := M_CDBANC;
      //
    M_ININSN := '9';
   {Dados do titulo}
   with gbTitulo1 do
   begin
      //
      SeuNumero   := aNossoNumero;
      Carteira    := dmDados.cdsCedenteCARTEIRA.AsString;
      //
      If (M_ININSN = '82') Then
      Begin
            NossoNumero    := '82'+Copy(uFuncoes.StrZero(aNossoNumero,8),3,8);
            Carteira := 'SR';
      End;
      //
      If (M_ININSN = '9') and (Carteira = '1') Then
      begin
             gbTitulo1.NossoNumero    :=
               uFuncoes.StrZero(aNossoNumero,17);
             gbTitulo1.Carteira := dmDados.cdsCedenteCARTEIRA.AsString;
      End;
      //
      If (M_ININSN = '9') and (Carteira = '18') Then
         Begin
             gbTitulo1.Carteira       := dmDados.cdsCedenteCARTEIRA.AsString;
             //
             gbTitulo1.NossoNumero    := aNossoNumero;
             //dmAdmDados.cdsbancosBAN_CONVENIO.AsString
         End;
       //
       If (Carteira = 'CNR') Then
        begin
             gbTitulo1.NossoNumero    := aNossoNumero;
        End;
        //
       If (Carteira = '57') Then
         Begin
              gbTitulo1.NossoNumero := aNossoNumero;
         End;
       //
      aDigito := uCodBarras.Modulo11(gbTitulo1.NossoNumero,9);
      DataDocumento  := Date();
      DataVencimento := aDtVenc;
      ValorDocumento := fValor;
      //
      {Dados do cedente}
      with Cedente do
      begin

         TipoInscricao := tiPessoaJuridica; //CNPJ
         If (Carteira = 'SR') Then
         Begin
           CodigoCedente := dmDados.cdsCedenteCEDENTE_CODIGO.AsString;
           DigitoCodigoCedente := dmDados.cdsCedenteCEDENTE_CODIGO_DIGITO.AsString;
         End;
         //
         If (Carteira = 'CR') or (Carteira = '1') Then
         Begin
             CodigoCedente       := uFuncoes.StrZero(dmDados.cdsCedenteCEDENTE_CODIGO.AsString,6);
             DigitoCodigoCedente := dmDados.cdsCedenteCEDENTE_CODIGO_DIGITO.AsString;
         End;
         //
         If (Carteira = '18') Then
         Begin
             CodigoCedente       := uFuncoes.StrZero(dmDados.cdsCedenteCEDENTE_CODIGO.AsString,6);
             DigitoCodigoCedente := dmDados.cdsCedenteCEDENTE_CODIGO_DIGITO.AsString;
         End;
         //
         If (Carteira = '57') Then
         Begin
             CodigoCedente       := uFuncoes.StrZero( dmDados.cdsCedenteCEDENTE_CODIGO.AsString,7);
             DigitoCodigoCedente := dmDados.cdsCedenteCEDENTE_CODIGO_DIGITO.AsString;
         End;
         {Endereço do cedente}
         //
         Dm.RefreshCDS(dm.cdsConfig);
         //
         with Endereco do
         begin
            Rua := dmDados.cdsCedenteRUA.AsString;
            Endereco.Numero := dmDados.cdsCedenteNUMERO.AsString;
            Complemento := 'Complemento';
            Bairro := dmDados.cdsCedenteBAIRRO.AsString;
            Cidade := dmDados.cdsCedenteCIDADE.AsString;
            Estado := dmDados.cdsCedenteESTADO.AsString;
            CEP    := uFuncoes.FormataCep(dmDados.cdsCedenteCEP.AsString);
            //Email  := 'radiotaxi@bol.com.br';
         end; {with Endereco}

         {Dados bancários do cedente}
         with ContaBancaria do
         begin
              Banco.Codigo  := dmDados.cdsCedenteBANCO_CODIGO.AsString;
              CodigoAgencia := dmDados.cdsCedenteAGENCIA_CODIGO.AsString;
              DigitoAgencia := dmDados.cdsCedenteAGENCIA_DIGITO.AsString;
              NumeroConta    := DmDados.cdsCedenteCONTA_NUMERO.AsString;
             //
             If (Banco.Codigo = '000') Then
                 Banco.Codigo := '001';
         end; {with Banco}
      end; {with Cedente}

     //Dados do sacado do título
      with Sacado do
      begin
         {if not uFuncoes.Empty(dmAdmDados.cdsClientesCLI_CPF.AsString) Then
            NumeroCPFCGC := dmAdmDados.cdsClientesCLI_CPF.AsString;
         //
         if not uFuncoes.Empty(dmAdmDados.cdsClientesCLI_CGC.AsString) and uFuncoes.Empty(dmAdmDados.cdsClientesCLI_CPF.AsString) Then
            NumeroCPFCGC := dmAdmDados.cdsClientesCLI_CGC.AsString;
         //
         Nome := dmAdmDados.cdsClientesCLI_NOME.AsString;
         //Endereço do sacado do título
         with Endereco do
         begin
            Rua         := dmAdmDados.cdsClientesCLI_ENDERECO.AsString;
            Complemento := '';
            Bairro      := dmAdmDados.cdsClientesCLI_BAIRRO.AsString;
            Cidade      := dmAdmDados.cdsClientesCLI_CIDADE.AsString;
            Estado      := dmAdmDados.cdsClientesCLI_UFCLIE.AsString;
         end; //with Endereco}

      end; //with Sacado
      //
   end; //with Titulo
   //
   result := aDigito;
end;

function TdmRelatorios.SetCodigoBarras(aNossoNumero: String; aDtVenc : TDatetime; fValor : Double): Boolean;
Var
     M_NOSNUM, M_CPFCNPJ, M_NRCONV, M_CARTEIRA, W_DTVENC : String;
     W_CDBANC, W_DVBANC, W_NRAGEN, W_CDCEDE, x , M_DTVCJU: String;
     M_NRCEP, M_CDCEDE : String;
     M_TPBOLE, M_BANC_PADRAO : Integer;
     M_DTVENC : TDate;
     M_VLDOCU : DOuble;
begin
      dm.RefreshCDS(dm.CdsConfig);
      //
      //uFuncoes.FilterCDS(dmAdmDados.cdsbancos, fsString, InttoStr(M_BANC_PADRAO));
      //
      if not (dmDados.cdsCedente.IsEmpty) Then
         M_TPBOLE := dmDados.cdsCedenteTIPO_BOLETO.AsInteger;
      //PrepararTituloNovo;
      //
      W_CDBANC := uFuncoes.StrZero(dmDados.cdsCedenteBANCO_CODIGO.AsString,3);
      W_DVBANC := dmDados.cdsCedenteAGENCIA_DIGITO.AsString;
      W_NRAGEN := gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia+'-'+gbTitulo1.Cedente.ContaBancaria.fDigitoAgencia;
      W_CDCEDE := gbTitulo1.Cedente.CodigoCedente+'-'+gbTitulo1.Cedente.DigitoCodigoCedente;
      M_NRCONV := dmDados.cdsCedenteNUMERO_CONVENIO.AsString;
      M_CARTEIRA := dmDados.cdsCedenteCARTEIRA.AsString;
      //
      M_VLDOCU := fValor;
      M_DTVENC := aDtVenc;
      W_DTVENC := DatetoStr(aDtVenc);
      //
      M_NRCEP := uFuncoes.FormataCep('64000000');
      //
      If (M_TPBOLE = 1) Then
      begin
           M_CODIGOBARRAS := gbTitulo1.CodigoBarra.Codigo;
           M_NOSNUM       := gbTitulo1.NossoNumero;
           //
      End;
      //  alteração 11/09/2008
      If (M_TPBOLE = 2) and (M_CARTEIRA = 'CNR') Then
      begin
         // codigo de barras
         x := Copy(gbTitulo1.DigitoNossoNumero,13,3);
         M_DTVCJU := uFuncoes.StrZero(uFuncoes.Data_Juliana(M_DTVENC),3)+Copy(DatetoStr(M_DTVENC), 10,1) ;
         //uCodBarras.Modulo11(gbTitulo1.NossoNumero,9);
         M_CODIGOBARRAS := '3999'+CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',M_VLDOCU)),10)
                          +M_NRCONV
                          +uFuncoes.StrZero(gbTitulo1.NossoNumero,13) +M_DTVCJU+'2';
                          // +'1'+StrZero(Copy(M_NRCONV,1,5),5)
         // digito do codigo
         M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
         If M_DIGITOCODIGO = '0' then
             M_DIGITOCODIGO := '1';
         //
         M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                         +M_DIGITOCODIGO
                         +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);
         //
      End;
      //
      If (M_TPBOLE = 3) and (M_CARTEIRA = '1') Then
      begin
         // codigo de barras
         M_CODIGOBARRAS := '1049'+CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',M_VLDOCU)),10)
                          +'1'+StrZero(Copy(M_NRCONV,1,5),6)
                          +gbTitulo1.NossoNumero;
                          // +'1'+StrZero(Copy(M_NRCONV,1,5),5)
         // digito do codigo
         M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
         If M_DIGITOCODIGO = '0' then
             M_DIGITOCODIGO := '1';
         //
         M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                         +M_DIGITOCODIGO
                         +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);
      End;
      // 18/10/2008
      If (M_TPBOLE = 3) and (M_CARTEIRA = '18') Then
      begin
          //gbTitulo1.NossoNumero := aNossoNumero;
          gbTitulo1.NossoNumero := M_NRCONV+aNossoNumero;
          // W_NRCONV M_NRCONV
          //
          M_NOSNUM := uFuncoes.StrZero(gbTitulo1.NossoNumero,11) +
                '-' + uCodBarras.Modulo11(gbTitulo1.NossoNumero,9);
          // codigo de barras
          M_CODIGOBARRAS := W_CDBANC+'9'
                          +uCodBarras.CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',M_VLDOCU)),10)
                          + '000000'
                          + gbTitulo1.NossoNumero+M_CARTEIRA;
                          //+gbTitulo1.NossoNumero+gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia+gbTitulo1.Cedente.CodigoCedente+M_CARTEIRA;
          // digito do codigo
          M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
          If M_DIGITOCODIGO = '0' then
              M_DIGITOCODIGO := '1';
          //      Aqui
          M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                          +M_DIGITOCODIGO
                          +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);
      End;
      //        REAL
      If (M_TPBOLE = 4) Then
        begin
             // codigo de barras
             M_CODIGOBARRAS := '3569'
                          +CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',M_VLDOCU)),10)
                          +uFuncoes.StrZero(gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia,4)
                          +uFuncoes.StrZero(M_NRCONV,7)
                          +uCodBarras.Modulo10(gbTitulo1.NossoNumero
                                               +uFuncoes.StrZero(gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia,4)
                                               +uFuncoes.StrZero(M_NRCONV,7))
                          +gbTitulo1.NossoNumero;
             // digito do codigo
             M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
             If M_DIGITOCODIGO = '0' then
                 M_DIGITOCODIGO := '1';
             //
             M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                         +M_DIGITOCODIGO
                         +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);
        End;
        //
end;

end.
