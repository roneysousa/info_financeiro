object dmDados: TdmDados
  OldCreateOrder = False
  Left = 194
  Top = 117
  Height = 639
  Width = 799
  object dstCedente: TSQLDataSet
    CommandText = 'select * from CEDENTES Where (CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 8
    object dstCedenteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstCedenteCEDENTE_NOME: TStringField
      FieldName = 'CEDENTE_NOME'
      Size = 50
    end
    object dstCedenteCEDENTE_CODIGO: TStringField
      FieldName = 'CEDENTE_CODIGO'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object dstCedenteCEDENTE_CODIGO_DIGITO: TStringField
      FieldName = 'CEDENTE_CODIGO_DIGITO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstCedenteBANCO_CODIGO: TStringField
      FieldName = 'BANCO_CODIGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstCedenteBANCO_NOME: TStringField
      FieldName = 'BANCO_NOME'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteAGENCIA_CODIGO: TStringField
      FieldName = 'AGENCIA_CODIGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstCedenteAGENCIA_DIGITO: TStringField
      FieldName = 'AGENCIA_DIGITO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstCedenteAGENCIA_NOME: TStringField
      FieldName = 'AGENCIA_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstCedenteCONTA_NUMERO: TStringField
      FieldName = 'CONTA_NUMERO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstCedenteCONTA_NUMERO_DIGITO: TStringField
      FieldName = 'CONTA_NUMERO_DIGITO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstCedentePROXIMO_NOSSO_NUMERO: TIntegerField
      FieldName = 'PROXIMO_NOSSO_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteTIPO_INSCRICAO: TStringField
      FieldName = 'TIPO_INSCRICAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstCedenteNUMERO_INSCRICAO: TStringField
      FieldName = 'NUMERO_INSCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstCedenteRUA: TStringField
      FieldName = 'RUA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstCedenteNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstCedenteCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteESTADO: TStringField
      FieldName = 'ESTADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstCedenteCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstCedenteEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstCedenteLOGO_BANCO: TBlobField
      FieldName = 'LOGO_BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteINICIO_NOSSO_NUMERO: TStringField
      FieldName = 'INICIO_NOSSO_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object dstCedenteNUMERO_CONVENIO: TStringField
      FieldName = 'NUMERO_CONVENIO'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object dstCedenteACEITE: TStringField
      FieldName = 'ACEITE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstCedenteTIPO_BOLETO: TIntegerField
      FieldName = 'TIPO_BOLETO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
  end
  object dspCedente: TDataSetProvider
    DataSet = dstCedente
    Options = [poAllowCommandText]
    Left = 96
    Top = 8
  end
  object cdsCedente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCedente'
    Left = 160
    Top = 8
    object cdsCedenteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object cdsCedenteCEDENTE_NOME: TStringField
      FieldName = 'CEDENTE_NOME'
      Size = 50
    end
    object cdsCedenteCEDENTE_CODIGO: TStringField
      Alignment = taRightJustify
      FieldName = 'CEDENTE_CODIGO'
      ProviderFlags = [pfInUpdate]
      EditMask = '999999999999;0;_'
      Size = 12
    end
    object cdsCedenteCEDENTE_CODIGO_DIGITO: TStringField
      Alignment = taRightJustify
      FieldName = 'CEDENTE_CODIGO_DIGITO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCedenteBANCO_CODIGO: TStringField
      Alignment = taRightJustify
      FieldName = 'BANCO_CODIGO'
      ProviderFlags = [pfInUpdate]
      EditMask = '999;0;_'
      FixedChar = True
      Size = 3
    end
    object cdsCedenteBANCO_NOME: TStringField
      FieldName = 'BANCO_NOME'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCedenteAGENCIA_CODIGO: TStringField
      FieldName = 'AGENCIA_CODIGO'
      EditMask = '#####;0;_'
      FixedChar = True
      Size = 5
    end
    object cdsCedenteAGENCIA_DIGITO: TStringField
      Alignment = taRightJustify
      FieldName = 'AGENCIA_DIGITO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCedenteAGENCIA_NOME: TStringField
      FieldName = 'AGENCIA_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsCedenteCONTA_NUMERO: TStringField
      FieldName = 'CONTA_NUMERO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object cdsCedenteCONTA_NUMERO_DIGITO: TStringField
      FieldName = 'CONTA_NUMERO_DIGITO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCedentePROXIMO_NOSSO_NUMERO: TIntegerField
      FieldName = 'PROXIMO_NOSSO_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCedenteTIPO_INSCRICAO: TStringField
      FieldName = 'TIPO_INSCRICAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCedenteNUMERO_INSCRICAO: TStringField
      FieldName = 'NUMERO_INSCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsCedenteRUA: TStringField
      FieldName = 'RUA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsCedenteNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      EditFormat = '99999'
    end
    object cdsCedenteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCedenteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsCedenteCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCedenteESTADO: TStringField
      FieldName = 'ESTADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsCedenteCEP: TStringField
      Alignment = taRightJustify
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsCedenteEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsCedenteLOGO_BANCO: TBlobField
      FieldName = 'LOGO_BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsCedenteINICIO_NOSSO_NUMERO: TStringField
      FieldName = 'INICIO_NOSSO_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsCedenteNUMERO_CONVENIO: TStringField
      FieldName = 'NUMERO_CONVENIO'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object cdsCedenteACEITE: TStringField
      FieldName = 'ACEITE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCedenteTIPO_BOLETO: TIntegerField
      FieldName = 'TIPO_BOLETO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCedenteCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Size = 5
    end
  end
  object dstPermissoes: TSQLDataSet
    CommandText = 
      'select * from PERMISSOES_USUARIOS '#13#10'Where (USU_CODIGO = :pCODIGO' +
      ')'#13#10'and (MEN_CODIGO = :pMENU)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pMENU'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 40
    Top = 64
    object dstPermissoesUSU_CODIGO: TIntegerField
      FieldName = 'USU_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstPermissoesMEN_CODIGO: TIntegerField
      FieldName = 'MEN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstPermissoesPG_NOVO: TStringField
      FieldName = 'PG_NOVO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstPermissoesPU_ALTERAR: TStringField
      FieldName = 'PU_ALTERAR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstPermissoesPU_APAGAR: TStringField
      FieldName = 'PU_APAGAR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstPermissoesPU_CONSULTAR: TStringField
      FieldName = 'PU_CONSULTAR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dspPermissoes: TDataSetProvider
    DataSet = dstPermissoes
    Options = [poAllowCommandText]
    Left = 112
    Top = 64
  end
  object cdsPermissoes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pMENU'
        ParamType = ptInput
      end>
    ProviderName = 'dspPermissoes'
    Left = 192
    Top = 64
    object cdsPermissoesUSU_CODIGO: TIntegerField
      FieldName = 'USU_CODIGO'
      Required = True
    end
    object cdsPermissoesMEN_CODIGO: TIntegerField
      FieldName = 'MEN_CODIGO'
      Required = True
    end
    object cdsPermissoesPG_NOVO: TStringField
      FieldName = 'PG_NOVO'
      FixedChar = True
      Size = 1
    end
    object cdsPermissoesPU_ALTERAR: TStringField
      FieldName = 'PU_ALTERAR'
      FixedChar = True
      Size = 1
    end
    object cdsPermissoesPU_APAGAR: TStringField
      FieldName = 'PU_APAGAR'
      FixedChar = True
      Size = 1
    end
    object cdsPermissoesPU_CONSULTAR: TStringField
      FieldName = 'PU_CONSULTAR'
      FixedChar = True
      Size = 1
    end
  end
  object spAcessoMenu: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODMENU'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CONSULTAR'
        ParamType = ptOutput
        Size = 1
      end>
    SQLConnection = Dm.SqlAdmin
    StoredProcName = 'PROC_VERIFICAR_ACESSO_MENU'
    Left = 32
    Top = 248
  end
  object spDireitoAcesso: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODMENU'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'NOVO'
        ParamType = ptOutput
        Size = 1
      end
      item
        DataType = ftFixedChar
        Name = 'ALTERAR'
        ParamType = ptOutput
        Size = 1
      end
      item
        DataType = ftFixedChar
        Name = 'APAGAR'
        ParamType = ptOutput
        Size = 1
      end>
    SQLConnection = Dm.SqlAdmin
    StoredProcName = 'PROC_VERIFICA_DIREITOS_ACESSO'
    Left = 120
    Top = 248
  end
  object qryAux: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 320
    Top = 24
  end
  object dstContaSaldo: TSQLDataSet
    CommandText = 'select * from CONTAS_SALDOS order by CGS_CODIGO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 120
    object dstContaSaldoCGS_CODIGO: TIntegerField
      FieldName = 'CGS_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContaSaldoCGS_DESCRICAO: TStringField
      FieldName = 'CGS_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstContaSaldoCGS_VALOR_SALDO: TFMTBCDField
      FieldName = 'CGS_VALOR_SALDO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContaSaldoCGS_AGENCIA: TStringField
      FieldName = 'CGS_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object dstContaSaldoCGS_BANCO: TIntegerField
      FieldName = 'CGS_BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaSaldoCGS_NRCONTA: TStringField
      FieldName = 'CGS_NRCONTA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object dspContaSaldo: TDataSetProvider
    DataSet = dstContaSaldo
    Options = [poAllowCommandText]
    OnGetTableName = dspContaSaldoGetTableName
    Left = 104
    Top = 120
  end
  object cdsContaSaldo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContaSaldo'
    Left = 184
    Top = 120
    object cdsContaSaldoCGS_CODIGO: TIntegerField
      FieldName = 'CGS_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsContaSaldoCGS_DESCRICAO: TStringField
      FieldName = 'CGS_DESCRICAO'
      Size = 30
    end
    object cdsContaSaldoCGS_VALOR_SALDO: TFMTBCDField
      FieldName = 'CGS_VALOR_SALDO'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContaSaldoCGS_AGENCIA: TStringField
      FieldName = 'CGS_AGENCIA'
      Size = 5
    end
    object cdsContaSaldoCGS_BANCO: TIntegerField
      FieldName = 'CGS_BANCO'
      DisplayFormat = '000'
      EditFormat = '###'
    end
    object cdsContaSaldoCGS_NRCONTA: TStringField
      FieldName = 'CGS_NRCONTA'
      Size = 10
    end
  end
  object dstDados: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 24
    Top = 184
  end
  object dspDados: TDataSetProvider
    DataSet = dstDados
    Options = [poAllowCommandText]
    Left = 80
    Top = 184
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDados'
    Left = 144
    Top = 184
  end
  object dspAux: TDataSetProvider
    DataSet = dstAux
    Options = [poAllowCommandText]
    Left = 320
    Top = 72
  end
  object dstAux: TSQLDataSet
    CommandText = 
      'select PV.PRV_PEDIDO, PV.prv_loja, PV.prv_nrmesa, PV.prv_situaca' +
      'o from PRE_VENDA PV Where (PV.prv_situacao = '#39'A'#39')'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 264
    Top = 72
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 368
    Top = 80
  end
  object dstTransportadora: TSQLDataSet
    CommandText = 'select * from TRANSPORTADORA Where (TRP_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 224
    Top = 184
    object dstTransportadoraTRP_CODIGO: TIntegerField
      FieldName = 'TRP_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstTransportadoraTRP_NOME: TStringField
      FieldName = 'TRP_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstTransportadoraTRP_PEFRETE: TBCDField
      FieldName = 'TRP_PEFRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object dstTransportadoraTRP_NRFONE: TStringField
      FieldName = 'TRP_NRFONE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object dspTransportadora: TDataSetProvider
    DataSet = dstTransportadora
    Options = [poAllowCommandText]
    OnGetTableName = dspTransportadoraGetTableName
    Left = 296
    Top = 168
  end
  object cdsTransportadora: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspTransportadora'
    Left = 368
    Top = 184
    object cdsTransportadoraTRP_CODIGO: TIntegerField
      FieldName = 'TRP_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsTransportadoraTRP_NOME: TStringField
      FieldName = 'TRP_NOME'
      Size = 50
    end
    object cdsTransportadoraTRP_PEFRETE: TBCDField
      FieldName = 'TRP_PEFRETE'
      DisplayFormat = '##0.#0'
      EditFormat = '##0.#0'
      Precision = 9
      Size = 2
    end
    object cdsTransportadoraTRP_NRFONE: TStringField
      FieldName = 'TRP_NRFONE'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
  end
  object dstPlanos: TSQLDataSet
    CommandText = 'select * from PLANO_PAGAMENTO Where (PLA_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 200
    Top = 240
    object dstPlanosPLA_CODIGO: TIntegerField
      FieldName = 'PLA_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstPlanosPLA_DESCRICAO: TStringField
      FieldName = 'PLA_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object dspPlanos: TDataSetProvider
    DataSet = dstPlanos
    Options = [poAllowCommandText]
    OnGetTableName = dspPlanosGetTableName
    Left = 272
    Top = 240
  end
  object cdsPlanos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPlanos'
    Left = 336
    Top = 248
    object cdsPlanosPLA_CODIGO: TIntegerField
      FieldName = 'PLA_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsPlanosPLA_DESCRICAO: TStringField
      FieldName = 'PLA_DESCRICAO'
      Size = 50
    end
  end
  object dstItensPedido: TSQLDataSet
    CommandText = 'select * from PROVENDAS Where (MOP_PEDIDO = :pPEDIDO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 296
    object dstItensPedidoMOP_PEDIDO: TIntegerField
      FieldName = 'MOP_PEDIDO'
    end
    object dstItensPedidoMOP_PRODUTO: TStringField
      FieldName = 'MOP_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object dstItensPedidoMOP_QUANTIDADE: TFMTBCDField
      FieldName = 'MOP_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object dstItensPedidoMOP_UNIDADE: TStringField
      FieldName = 'MOP_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object dstItensPedidoMOP_VALOR: TFMTBCDField
      FieldName = 'MOP_VALOR'
      Precision = 18
      Size = 2
    end
    object dstItensPedidoMOP_DESCONTO: TFMTBCDField
      FieldName = 'MOP_DESCONTO'
      Precision = 18
      Size = 2
    end
    object dstItensPedidoMOP_SERIE: TStringField
      FieldName = 'MOP_SERIE'
      Size = 30
    end
    object dstItensPedidoMOP_CUSTO: TFMTBCDField
      FieldName = 'MOP_CUSTO'
      Precision = 18
      Size = 2
    end
    object dstItensPedidoMOP_COMPRA: TFMTBCDField
      FieldName = 'MOP_COMPRA'
      Precision = 18
      Size = 2
    end
    object dstItensPedidoMOP_CODCOR: TIntegerField
      FieldName = 'MOP_CODCOR'
    end
    object dstItensPedidoMOP_VALIPI: TFMTBCDField
      FieldName = 'MOP_VALIPI'
      Precision = 18
      Size = 2
    end
  end
  object dspItensPedido: TDataSetProvider
    DataSet = dstItensPedido
    Options = [poAllowCommandText]
    OnGetTableName = dspItensPedidoGetTableName
    Left = 112
    Top = 296
  end
  object cdsItensPedido: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensPedido'
    Left = 192
    Top = 296
    object cdsItensPedidoMOP_PEDIDO: TIntegerField
      FieldName = 'MOP_PEDIDO'
    end
    object cdsItensPedidoMOP_PRODUTO: TStringField
      FieldName = 'MOP_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsItensPedidoMOP_QUANTIDADE: TFMTBCDField
      FieldName = 'MOP_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsItensPedidoMOP_UNIDADE: TStringField
      FieldName = 'MOP_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsItensPedidoMOP_VALOR: TFMTBCDField
      FieldName = 'MOP_VALOR'
      Precision = 18
      Size = 2
    end
    object cdsItensPedidoMOP_DESCONTO: TFMTBCDField
      FieldName = 'MOP_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsItensPedidoMOP_SERIE: TStringField
      FieldName = 'MOP_SERIE'
      Size = 30
    end
    object cdsItensPedidoMOP_CUSTO: TFMTBCDField
      FieldName = 'MOP_CUSTO'
      Precision = 18
      Size = 2
    end
    object cdsItensPedidoMOP_COMPRA: TFMTBCDField
      FieldName = 'MOP_COMPRA'
      Precision = 18
      Size = 2
    end
    object cdsItensPedidoMOP_CODCOR: TIntegerField
      FieldName = 'MOP_CODCOR'
    end
    object cdsItensPedidoMOP_VALIPI: TFMTBCDField
      FieldName = 'MOP_VALIPI'
      Precision = 18
      Size = 2
    end
  end
  object cdsMatriz: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select CL.CLI_CODIGO, CL.cli_fantasia, CL.cli_razao from cliente' +
      's cl Where (cl.cli_flmatriz = '#39'M'#39') order by CL.cli_razao'
    Params = <>
    ProviderName = 'dspAux'
    Left = 456
    Top = 56
    object cdsMatrizCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMatrizCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsMatrizCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      Size = 50
    end
  end
  object dstMesas: TSQLDataSet
    CommandText = 'select * from MESAS Where (MES_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 24
    Top = 352
    object dstMesasMES_CODIGO: TIntegerField
      FieldName = 'MES_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstMesasMES_DESCRICAO: TStringField
      FieldName = 'MES_DESCRICAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspMesas: TDataSetProvider
    DataSet = dstMesas
    Options = [poAllowCommandText]
    OnGetTableName = dspMesasGetTableName
    Left = 104
    Top = 352
  end
  object cdsMesas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspMesas'
    Left = 176
    Top = 352
    object cdsMesasMES_CODIGO: TIntegerField
      FieldName = 'MES_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsMesasMES_DESCRICAO: TStringField
      FieldName = 'MES_DESCRICAO'
    end
  end
  object dstPreVenda: TSQLDataSet
    CommandText = 'select * from PRE_VENDA where (PRV_PEDIDO = :pPEDIDO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 288
    Top = 296
    object dstPreVendaPRV_PEDIDO: TIntegerField
      FieldName = 'PRV_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstPreVendaPRV_CUPOM: TIntegerField
      FieldName = 'PRV_CUPOM'
      ProviderFlags = [pfInUpdate]
    end
    object dstPreVendaPRV_LOJA: TIntegerField
      FieldName = 'PRV_LOJA'
      ProviderFlags = [pfInUpdate]
    end
    object dstPreVendaPRV_NRMESA: TStringField
      FieldName = 'PRV_NRMESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 6
    end
    object dstPreVendaPRV_SEQUENCIA: TIntegerField
      FieldName = 'PRV_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dstPreVendaPRV_CLIENTE: TIntegerField
      FieldName = 'PRV_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstPreVendaPRV_DATAVENDA: TDateField
      FieldName = 'PRV_DATAVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstPreVendaPRV_HORAVENDA: TStringField
      FieldName = 'PRV_HORAVENDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstPreVendaPRV_DATACANC: TDateField
      FieldName = 'PRV_DATACANC'
      ProviderFlags = [pfInUpdate]
    end
    object dstPreVendaPRV_HORACANC: TStringField
      FieldName = 'PRV_HORACANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstPreVendaPRV_MOTCANC: TStringField
      FieldName = 'PRV_MOTCANC'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstPreVendaPRV_VENDEDOR: TIntegerField
      FieldName = 'PRV_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstPreVendaPRV_VALOR: TFMTBCDField
      FieldName = 'PRV_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPreVendaPRV_ENTRADA: TFMTBCDField
      FieldName = 'PRV_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPreVendaPRV_DESCONTO: TFMTBCDField
      FieldName = 'PRV_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPreVendaPRV_ACRESCIMO: TFMTBCDField
      FieldName = 'PRV_ACRESCIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPreVendaPRV_DEVOLUSAO: TFMTBCDField
      FieldName = 'PRV_DEVOLUSAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPreVendaPRV_TROCO: TFMTBCDField
      FieldName = 'PRV_TROCO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPreVendaPRV_SITUACAO: TStringField
      FieldName = 'PRV_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstPreVendaDOM_ENDERECO: TStringField
      FieldName = 'DOM_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstPreVendaDOM_NUMERO: TStringField
      FieldName = 'DOM_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstPreVendaDOM_BAIRRO: TStringField
      FieldName = 'DOM_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstPreVendaDOM_CIDADE: TStringField
      FieldName = 'DOM_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstPreVendaDOM_REFERE: TStringField
      FieldName = 'DOM_REFERE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstPreVendaPRV_NOMECLIENTE: TStringField
      FieldName = 'PRV_NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstPreVendaPRV_OBSERVACAO: TMemoField
      FieldName = 'PRV_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstPreVendaDOM_NRFONE: TStringField
      FieldName = 'DOM_NRFONE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstPreVendaDOM_COMPLEMENTO: TStringField
      FieldName = 'DOM_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dstItensVenda: TSQLDataSet
    CommandText = 
      'select * from PRE_VENDA_ITENS Where (PVI_PEDIDO = :pPEDIDO) orde' +
      'r by PVI_PEDIDO, PVI_ITEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 288
    Top = 352
    object dstItensVendaPVI_PEDIDO: TIntegerField
      FieldName = 'PVI_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstItensVendaPVI_ITEM: TIntegerField
      FieldName = 'PVI_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstItensVendaPVI_PRODUTO: TStringField
      FieldName = 'PVI_PRODUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object dstItensVendaPVI_QUANTIDADE: TFMTBCDField
      FieldName = 'PVI_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstItensVendaPVI_UNIDADE: TStringField
      FieldName = 'PVI_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstItensVendaPVI_VALOR: TFMTBCDField
      FieldName = 'PVI_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItensVendaPVI_DESCONTO: TFMTBCDField
      FieldName = 'PVI_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItensVendaPVI_SERIE: TStringField
      FieldName = 'PVI_SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstItensVendaPVI_CUSTO: TFMTBCDField
      FieldName = 'PVI_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItensVendaPVI_COMPRA: TFMTBCDField
      FieldName = 'PVI_COMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItensVendaPVI_CODCOR: TIntegerField
      FieldName = 'PVI_CODCOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstItensVendaPVI_VALIPI: TFMTBCDField
      FieldName = 'PVI_VALIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItensVendaPVI_CDVENDEDOR: TIntegerField
      FieldName = 'PVI_CDVENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstItensVendaPVI_SEQ_SERVICO: TIntegerField
      FieldName = 'PVI_SEQ_SERVICO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspPreVenda: TDataSetProvider
    DataSet = dstPreVenda
    Options = [poAllowCommandText]
    OnGetTableName = dspPreVendaGetTableName
    Left = 368
    Top = 296
  end
  object cdsPreVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPreVenda'
    Left = 440
    Top = 296
    object cdsPreVendaPRV_PEDIDO: TIntegerField
      FieldName = 'PRV_PEDIDO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsPreVendaPRV_CUPOM: TIntegerField
      FieldName = 'PRV_CUPOM'
    end
    object cdsPreVendaPRV_LOJA: TIntegerField
      FieldName = 'PRV_LOJA'
      DisplayFormat = '000'
    end
    object cdsPreVendaPRV_NRMESA: TStringField
      FieldName = 'PRV_NRMESA'
      Size = 6
    end
    object cdsPreVendaPRV_SEQUENCIA: TIntegerField
      FieldName = 'PRV_SEQUENCIA'
    end
    object cdsPreVendaPRV_CLIENTE: TIntegerField
      FieldName = 'PRV_CLIENTE'
    end
    object cdsPreVendaPRV_DATAVENDA: TDateField
      FieldName = 'PRV_DATAVENDA'
    end
    object cdsPreVendaPRV_HORAVENDA: TStringField
      FieldName = 'PRV_HORAVENDA'
      EditMask = '99:99;1;_'
      FixedChar = True
      Size = 5
    end
    object cdsPreVendaPRV_DATACANC: TDateField
      FieldName = 'PRV_DATACANC'
    end
    object cdsPreVendaPRV_HORACANC: TStringField
      FieldName = 'PRV_HORACANC'
      FixedChar = True
      Size = 5
    end
    object cdsPreVendaPRV_MOTCANC: TStringField
      FieldName = 'PRV_MOTCANC'
      Size = 50
    end
    object cdsPreVendaPRV_VENDEDOR: TIntegerField
      FieldName = 'PRV_VENDEDOR'
    end
    object cdsPreVendaPRV_VALOR: TFMTBCDField
      FieldName = 'PRV_VALOR'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsPreVendaPRV_ENTRADA: TFMTBCDField
      FieldName = 'PRV_ENTRADA'
      Precision = 18
      Size = 2
    end
    object cdsPreVendaPRV_DESCONTO: TFMTBCDField
      FieldName = 'PRV_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsPreVendaPRV_ACRESCIMO: TFMTBCDField
      FieldName = 'PRV_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object cdsPreVendaPRV_DEVOLUSAO: TFMTBCDField
      FieldName = 'PRV_DEVOLUSAO'
      Precision = 18
      Size = 2
    end
    object cdsPreVendaPRV_TROCO: TFMTBCDField
      FieldName = 'PRV_TROCO'
      Precision = 18
      Size = 2
    end
    object cdsPreVendaPRV_SITUACAO: TStringField
      FieldName = 'PRV_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsPreVendaDOM_ENDERECO: TStringField
      FieldName = 'DOM_ENDERECO'
      Size = 40
    end
    object cdsPreVendaDOM_NUMERO: TStringField
      FieldName = 'DOM_NUMERO'
      Size = 10
    end
    object cdsPreVendaDOM_BAIRRO: TStringField
      FieldName = 'DOM_BAIRRO'
      Size = 30
    end
    object cdsPreVendaDOM_CIDADE: TStringField
      FieldName = 'DOM_CIDADE'
    end
    object cdsPreVendaDOM_REFERE: TStringField
      FieldName = 'DOM_REFERE'
      Size = 50
    end
    object cdsPreVendaPRV_NOMECLIENTE: TStringField
      FieldName = 'PRV_NOMECLIENTE'
      Size = 40
    end
    object cdsPreVendaPRV_OBSERVACAO: TMemoField
      FieldName = 'PRV_OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsPreVendaDOM_NRFONE: TStringField
      Alignment = taRightJustify
      FieldName = 'DOM_NRFONE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 10
    end
    object cdsPreVendaDOM_COMPLEMENTO: TStringField
      FieldName = 'DOM_COMPLEMENTO'
      Size = 30
    end
  end
  object dspItensVenda: TDataSetProvider
    DataSet = dstItensVenda
    OnGetTableName = dspItensVendaGetTableName
    Left = 368
    Top = 352
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensVenda'
    OnCalcFields = cdsItensVendaCalcFields
    Left = 448
    Top = 352
    object cdsItensVendaPVI_PEDIDO: TIntegerField
      FieldName = 'PVI_PEDIDO'
      Required = True
    end
    object cdsItensVendaPVI_ITEM: TIntegerField
      FieldName = 'PVI_ITEM'
      Required = True
      DisplayFormat = '000'
    end
    object cdsItensVendaPVI_PRODUTO: TStringField
      FieldName = 'PVI_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsItensVendaPVI_QUANTIDADE: TFMTBCDField
      FieldName = 'PVI_QUANTIDADE'
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      Precision = 18
      Size = 3
    end
    object cdsItensVendaPVI_UNIDADE: TStringField
      FieldName = 'PVI_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsItensVendaPVI_VALOR: TFMTBCDField
      FieldName = 'PVI_VALOR'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsItensVendaPVI_DESCONTO: TFMTBCDField
      FieldName = 'PVI_DESCONTO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsItensVendaPVI_SERIE: TStringField
      FieldName = 'PVI_SERIE'
      Size = 30
    end
    object cdsItensVendaPVI_CUSTO: TFMTBCDField
      FieldName = 'PVI_CUSTO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsItensVendaPVI_COMPRA: TFMTBCDField
      FieldName = 'PVI_COMPRA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsItensVendaPVI_CODCOR: TIntegerField
      FieldName = 'PVI_CODCOR'
    end
    object cdsItensVendaPVI_VALIPI: TFMTBCDField
      FieldName = 'PVI_VALIPI'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsItensVendaPVI_CDVENDEDOR: TIntegerField
      FieldName = 'PVI_CDVENDEDOR'
      DisplayFormat = '000'
    end
    object cdsItensVendaPVI_NMPROD: TStringField
      FieldKind = fkLookup
      FieldName = 'PVI_NMPROD'
      LookupDataSet = cdsListaProdutos
      LookupKeyFields = 'PRO_CODIGO'
      LookupResultField = 'PRO_DESCRICAO'
      KeyFields = 'PVI_PRODUTO'
      Size = 60
      Lookup = True
    end
    object cdsItensVendaPVI_SUBTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PVI_SUBTOTAL'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Calculated = True
    end
    object cdsItensVendaPVI_NMVEND: TStringField
      FieldKind = fkLookup
      FieldName = 'PVI_NMVEND'
      LookupDataSet = cdsListaVendedores
      LookupKeyFields = 'FUN_CODIGO'
      LookupResultField = 'FUN_NOME'
      KeyFields = 'PVI_CDVENDEDOR'
      Size = 40
      Lookup = True
    end
    object cdsItensVendaPVI_SEQ_SERVICO: TIntegerField
      FieldName = 'PVI_SEQ_SERVICO'
    end
    object cdsItensVendaPVI_STATUS: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'PVI_STATUS'
      Size = 10
    end
  end
  object cdsListaProdutos: TClientDataSet
    Aggregates = <>
    CommandText = 'select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO from PRODUTOS'
    Params = <>
    ProviderName = 'dspAux'
    Left = 288
    Top = 408
    object cdsListaProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      FixedChar = True
      Size = 13
    end
    object cdsListaProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
  end
  object cdsListaVendedores: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select FUN_CODIGO, FUN_NOME from FUNCIONARIOS Where (FUN_TPFUNC ' +
      '= '#39'V'#39');'
    Params = <>
    ProviderName = 'dspAux'
    Left = 384
    Top = 408
    object cdsListaVendedoresFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Required = True
    end
    object cdsListaVendedoresFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
  end
  object cdsMesasOcupadas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select PV.PRV_PEDIDO, PV.prv_loja, PV.prv_nrmesa, PV.prv_situaca' +
      'o from PRE_VENDA PV Where (PV.prv_situacao = '#39'A'#39')'
    Params = <>
    ProviderName = 'dspAux'
    Left = 472
    Top = 144
    object cdsMesasOcupadasPRV_PEDIDO: TIntegerField
      FieldName = 'PRV_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMesasOcupadasPRV_LOJA: TIntegerField
      FieldName = 'PRV_LOJA'
    end
    object cdsMesasOcupadasPRV_NRMESA: TStringField
      FieldName = 'PRV_NRMESA'
      Size = 6
    end
    object cdsMesasOcupadasPRV_SITUACAO: TStringField
      FieldName = 'PRV_SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object dstPromocoes: TSQLDataSet
    CommandText = 'select * from PROMOCAO Where (PRM_IDPRODUTO =  :pIDPRODUTO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pIDPRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 464
    Top = 224
    object dstPromocoesPRM_IDPRODUTO: TStringField
      FieldName = 'PRM_IDPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object dstPromocoesPRM_DTCADA: TDateField
      FieldName = 'PRM_DTCADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstPromocoesPRM_DTALTE: TDateField
      FieldName = 'PRM_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstPromocoesPRM_ALTUSU: TIntegerField
      FieldName = 'PRM_ALTUSU'
      ProviderFlags = [pfInUpdate]
    end
    object dstPromocoesPRM_CADUSU: TIntegerField
      FieldName = 'PRM_CADUSU'
      ProviderFlags = [pfInUpdate]
    end
    object dstPromocoesPRM_VLSEGU: TFMTBCDField
      FieldName = 'PRM_VLSEGU'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPromocoesPRM_VLTERC: TFMTBCDField
      FieldName = 'PRM_VLTERC'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPromocoesPRM_VLQUAR: TFMTBCDField
      FieldName = 'PRM_VLQUAR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPromocoesPRM_VLQUIN: TFMTBCDField
      FieldName = 'PRM_VLQUIN'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPromocoesPRM_VLSEXT: TFMTBCDField
      FieldName = 'PRM_VLSEXT'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPromocoesPRM_VLSABA: TFMTBCDField
      FieldName = 'PRM_VLSABA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPromocoesPRM_VLDOMI: TFMTBCDField
      FieldName = 'PRM_VLDOMI'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
  end
  object dspPromocoes: TDataSetProvider
    DataSet = dstPromocoes
    Options = [poAllowCommandText]
    OnGetTableName = dspPromocoesGetTableName
    Left = 544
    Top = 224
  end
  object cdsPromocoes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pIDPRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPromocoes'
    OnCalcFields = cdsPromocoesCalcFields
    Left = 624
    Top = 224
    object cdsPromocoesPRM_IDPRODUTO: TStringField
      FieldName = 'PRM_IDPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object cdsPromocoesPRM_DTCADA: TDateField
      FieldName = 'PRM_DTCADA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPromocoesPRM_DTALTE: TDateField
      FieldName = 'PRM_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPromocoesPRM_NMPROD: TStringField
      FieldKind = fkCalculated
      FieldName = 'PRM_NMPROD'
      Size = 60
      Calculated = True
    end
    object cdsPromocoesPRM_ALTUSU: TIntegerField
      FieldName = 'PRM_ALTUSU'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPromocoesPRM_CADUSU: TIntegerField
      FieldName = 'PRM_CADUSU'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPromocoesPRM_VLSEGU: TFMTBCDField
      FieldName = 'PRM_VLSEGU'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsPromocoesPRM_VLTERC: TFMTBCDField
      FieldName = 'PRM_VLTERC'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsPromocoesPRM_VLQUAR: TFMTBCDField
      FieldName = 'PRM_VLQUAR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsPromocoesPRM_VLQUIN: TFMTBCDField
      FieldName = 'PRM_VLQUIN'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsPromocoesPRM_VLSEXT: TFMTBCDField
      FieldName = 'PRM_VLSEXT'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsPromocoesPRM_VLSABA: TFMTBCDField
      FieldName = 'PRM_VLSABA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsPromocoesPRM_VLDOMI: TFMTBCDField
      FieldName = 'PRM_VLDOMI'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsPromocoesPRM_VLUNIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRM_VLUNIT'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Calculated = True
    end
  end
  object cdsBuscaTelefone: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from CLIENTES CL where (CL.CLI_FONE1 = :pNRFONE)'
    Params = <
      item
        DataType = ftString
        Name = 'pNRFONE'
        ParamType = ptInput
      end>
    ProviderName = 'dspAux'
    Left = 544
    Top = 40
  end
  object dstServicos: TSQLDataSet
    CommandText = 
      'select * from STATUS_SERVICOS where (STS_SEQUENCIA = :pSEQUENCIA' +
      ')'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 416
    object dstServicosSTS_SEQUENCIA: TIntegerField
      FieldName = 'STS_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstServicosSTS_NRMESA: TStringField
      FieldName = 'STS_NRMESA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 6
    end
    object dstServicosSTS_DATA: TDateField
      FieldName = 'STS_DATA'
      ProviderFlags = [pfInUpdate]
    end
    object dstServicosSTS_HORA: TStringField
      FieldName = 'STS_HORA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstServicosSTS_IDPRODUTO: TStringField
      FieldName = 'STS_IDPRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstServicosSTS_QUANTIDADE: TFMTBCDField
      FieldName = 'STS_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstServicosSTS_STATUS: TStringField
      FieldName = 'STS_STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspServicos: TDataSetProvider
    DataSet = dstServicos
    Options = [poAllowCommandText]
    OnGetTableName = dspServicosGetTableName
    Left = 104
    Top = 416
  end
  object cdsServicos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
      end>
    ProviderName = 'dspServicos'
    Left = 176
    Top = 416
    object cdsServicosSTS_SEQUENCIA: TIntegerField
      FieldName = 'STS_SEQUENCIA'
      Required = True
    end
    object cdsServicosSTS_NRMESA: TStringField
      FieldName = 'STS_NRMESA'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsServicosSTS_DATA: TDateField
      FieldName = 'STS_DATA'
    end
    object cdsServicosSTS_HORA: TStringField
      FieldName = 'STS_HORA'
      FixedChar = True
      Size = 5
    end
    object cdsServicosSTS_IDPRODUTO: TStringField
      FieldName = 'STS_IDPRODUTO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsServicosSTS_QUANTIDADE: TFMTBCDField
      FieldName = 'STS_QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object cdsServicosSTS_STATUS: TStringField
      FieldName = 'STS_STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsListaServicos: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select SV.sts_sequencia, SV.sts_nrmesa, SV.sts_idproduto, SV.sts' +
      '_status, P.PRO_DESCRICAO from status_servicos SV INNER JOIN  PRO' +
      'DUTOS P ON P.PRO_CODIGO = SV.STS_IDPRODUTO Where (sv.sts_status ' +
      '= '#39'C'#39') or (sv.sts_status = '#39'P'#39') order by SV.sts_sequencia'
    Params = <>
    ProviderName = 'dspAux'
    OnCalcFields = cdsListaServicosCalcFields
    Left = 528
    Top = 296
    object cdsListaServicosSTS_SEQUENCIA: TIntegerField
      FieldName = 'STS_SEQUENCIA'
      Required = True
    end
    object cdsListaServicosSTS_NRMESA: TStringField
      FieldName = 'STS_NRMESA'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsListaServicosSTS_IDPRODUTO: TStringField
      FieldName = 'STS_IDPRODUTO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaServicosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsListaServicosSTS_STATUS: TStringField
      FieldName = 'STS_STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsListaServicosSTS_STDESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'STS_STDESC'
      Size = 10
      Calculated = True
    end
  end
  object cdsPrevendasAbertas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select PV.prv_pedido, PV.prv_situacao from PRE_VENDA PV Where (p' +
      'v.prv_situacao = '#39'A'#39');'
    Params = <>
    ProviderName = 'dspAux'
    Left = 536
    Top = 96
  end
  object dstGrupos: TSQLDataSet
    CommandText = 'select * from GRUPOS Where (GRU_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 520
    Top = 352
    object dstGruposGRU_CODIGO: TIntegerField
      FieldName = 'GRU_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstGruposGRU_DESCRICAO: TStringField
      FieldName = 'GRU_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
  end
  object dspGrupos: TDataSetProvider
    DataSet = dstGrupos
    Options = [poAllowCommandText]
    OnGetTableName = dspGruposGetTableName
    Left = 576
    Top = 344
  end
  object cdsGrupos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspGrupos'
    Left = 640
    Top = 352
    object cdsGruposGRU_CODIGO: TIntegerField
      FieldName = 'GRU_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsGruposGRU_DESCRICAO: TStringField
      FieldName = 'GRU_DESCRICAO'
      Required = True
      Size = 30
    end
  end
  object cdsTitulos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 24
    Data = {
      180200009619E0BD01000000180000001300000000000300000018020F434453
      5F4E4F53534F4E554D45524F0100490000000100055749445448020002001400
      0A4344535F445456454E430100490000000100055749445448020002000A000A
      4344535F4454504147410100490000000100055749445448020002000A000A43
      44535F4454435245440100490000000100055749445448020002000A000C4344
      535F564C5441524946410800040000000000134344535F4F55545241535F4445
      5350455341530800040000000000124344535F4A55524F535F444553434F4E54
      4F0800040000000000104344535F494F465F444553434F4E544F080004000000
      0000104344535F564C41424154494D454E544F08000400000000000A4344535F
      564C4445534308000400000000000E4344535F564C524543454249444F080004
      00000000000E4344535F4A55524F535F4D4F5241080004000000000017434453
      5F4F5554524F535F5245434542494D454E544F53080004000000000014434453
      5F56414C4F525F4C414E43414D454E544F0800040000000000134344535F5641
      4C4F525F444F43554D454E544F08000400000000000B4344535F464C42414958
      4102000300000000000A4344535F4344434C494504000100000000000A434453
      5F4E4D434C494501004900000001000557494454480200020032000A4344535F
      43504643474301004900000001000557494454480200020014000000}
    object cdsTitulosCDS_NOSSONUMERO: TStringField
      FieldName = 'CDS_NOSSONUMERO'
    end
    object cdsTitulosCDS_DTVENC: TStringField
      FieldName = 'CDS_DTVENC'
      Size = 10
    end
    object cdsTitulosCDS_DTPAGA: TStringField
      FieldName = 'CDS_DTPAGA'
      Size = 10
    end
    object cdsTitulosCDS_DTCRED: TStringField
      FieldName = 'CDS_DTCRED'
      Size = 10
    end
    object cdsTitulosCDS_VLTARIFA: TFloatField
      FieldName = 'CDS_VLTARIFA'
      DisplayFormat = '###,##0.#0'
    end
    object cdsTitulosCDS_OUTRAS_DESPESAS: TFloatField
      FieldName = 'CDS_OUTRAS_DESPESAS'
      DisplayFormat = '###,##0.#0'
    end
    object cdsTitulosCDS_JUROS_DESCONTO: TFloatField
      FieldName = 'CDS_JUROS_DESCONTO'
      DisplayFormat = '###,##0.#0'
    end
    object cdsTitulosCDS_IOF_DESCONTO: TFloatField
      FieldName = 'CDS_IOF_DESCONTO'
      DisplayFormat = '###,##0.#0'
    end
    object cdsTitulosCDS_VLABATIMENTO: TFloatField
      FieldName = 'CDS_VLABATIMENTO'
      DisplayFormat = '###,##0.#0'
    end
    object cdsTitulosCDS_VLDESC: TFloatField
      FieldName = 'CDS_VLDESC'
      DisplayFormat = '###,##0.#0'
    end
    object cdsTitulosCDS_VLRECEBIDO: TFloatField
      FieldName = 'CDS_VLRECEBIDO'
      DisplayFormat = '###,##0.#0'
    end
    object cdsTitulosCDS_JUROS_MORA: TFloatField
      FieldName = 'CDS_JUROS_MORA'
      DisplayFormat = '###,##0.#0'
    end
    object cdsTitulosCDS_OUTROS_RECEBIMENTOS: TFloatField
      FieldName = 'CDS_OUTROS_RECEBIMENTOS'
      DisplayFormat = '###,##0.#0'
    end
    object cdsTitulosCDS_VALOR_LANCAMENTO: TFloatField
      FieldName = 'CDS_VALOR_LANCAMENTO'
      DisplayFormat = '###,##0.#0'
    end
    object cdsTitulosCDS_VALOR_DOCUMENTO: TFloatField
      FieldName = 'CDS_VALOR_DOCUMENTO'
      DisplayFormat = '###,##0.#0'
    end
    object cdsTitulosCDS_FLBAIXA: TBooleanField
      FieldName = 'CDS_FLBAIXA'
    end
    object cdsTitulosCDS_CDCLIE: TIntegerField
      FieldName = 'CDS_CDCLIE'
    end
    object cdsTitulosCDS_NMCLIE: TStringField
      FieldName = 'CDS_NMCLIE'
      Size = 50
    end
    object cdsTitulosCDS_CPFCGC: TStringField
      FieldName = 'CDS_CPFCGC'
    end
  end
  object qryPadrao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 40
    Top = 472
  end
  object dspPadrao: TDataSetProvider
    DataSet = qryPadrao
    Options = [poAllowCommandText]
    Left = 112
    Top = 472
  end
  object cdsClientesAdiplentes: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select CL.CLI_CODIGO, CL.CLI_RAZAO, CL.CLI_FANTASIA, CL.CLI_CGC,' +
      ' CL.CLI_CDGRUPO, G.GRU_DESCRICAO, CL.CLI_NRBOX from CLIENTES CL ' +
      'inner Join CONTASRECEBER R ON CL.CLI_CODIGO = R.REC_CLIENTE inne' +
      'r Join GRUPOS G ON CL.CLI_CDGRUPO = G.GRU_CODIGO Where (R.rec_da' +
      'tavencimento >= :pDATA) AND (R.rec_datavencimento <= :pDTFINAL) ' +
      'Group By CL.CLI_CODIGO, CL.CLI_RAZAO, CL.CLI_FANTASIA, CL.CLI_CG' +
      'C, CL.CLI_CDGRUPO, G.GRU_DESCRICAO, CL.CLI_NRBOX order by CL.CLI' +
      '_CDGRUPO, CL.CLI_NRBOX'
    Params = <
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 200
    Top = 464
    object cdsClientesAdiplentesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
    end
    object cdsClientesAdiplentesCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      Size = 50
    end
    object cdsClientesAdiplentesCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsClientesAdiplentesCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      Size = 14
    end
    object cdsClientesAdiplentesCLI_CDGRUPO: TIntegerField
      FieldName = 'CLI_CDGRUPO'
    end
    object cdsClientesAdiplentesGRU_DESCRICAO: TStringField
      FieldName = 'GRU_DESCRICAO'
      Required = True
      Size = 30
    end
    object cdsClientesAdiplentesCLI_NRBOX: TStringField
      FieldName = 'CLI_NRBOX'
    end
  end
  object cdsParcelasCliente: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select R.rec_sequencia, R.rec_loja, R.rec_credito, R.rec_parcela' +
      ', R.rec_cliente, R.rec_dataemissao, R.rec_datavencimento, R.rec_' +
      'datapagamento, R.rec_situacao, R.REC_VALORPARCELA, R.REC_PAGO, R' +
      '.rec_nosso_numero, R.REC_PEMULTA, R.REC_PEJURO from CONTASRECEBE' +
      'R R Where (R.REC_CLIENTE = :pCLIENTE) AND (R.rec_datavencimento ' +
      '>= :pDTINIC) AND (R.rec_datavencimento <= :pDTFINA) Order by R.r' +
      'ec_dataemissao'
    Params = <
      item
        DataType = ftInteger
        Name = 'pCLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 304
    Top = 472
    object cdsParcelasClienteREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      Required = True
    end
    object cdsParcelasClienteREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      Required = True
    end
    object cdsParcelasClienteREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      Required = True
    end
    object cdsParcelasClienteREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      Required = True
    end
    object cdsParcelasClienteREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
    end
    object cdsParcelasClienteREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
    end
    object cdsParcelasClienteREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
    end
    object cdsParcelasClienteREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
    end
    object cdsParcelasClienteREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsParcelasClienteREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      Precision = 18
      Size = 2
    end
    object cdsParcelasClienteREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      Precision = 18
      Size = 2
    end
    object cdsParcelasClienteREC_NOSSO_NUMERO: TStringField
      FieldName = 'REC_NOSSO_NUMERO'
    end
    object cdsParcelasClienteREC_PEMULTA: TFMTBCDField
      FieldName = 'REC_PEMULTA'
      Precision = 18
      Size = 2
    end
    object cdsParcelasClienteREC_PEJURO: TFMTBCDField
      FieldName = 'REC_PEJURO'
      Precision = 18
      Size = 2
    end
  end
  object cdsListaClientes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsListaClientesCalcFields
    Left = 408
    Top = 464
    Data = {
      5D0100009619E0BD01000000180000000E0000000000030000005D010A434453
      5F434F4449474F0400010000000000084344535F4E4F4D450100490000000100
      0557494454480200020032000A4344535F434743435046010049000000010005
      57494454480200020012000B4344535F4344475255504F04000100000000000B
      4344535F4E4D475255504F0100490000000100055749445448020002001E0009
      4344535F4E52424F5801004900000001000557494454480200020014000A4344
      535F51545041524304000100000000000A4344535F5154504147410400010000
      0000000D4344535F51544142455254415308000400000000000D4344535F564C
      5043415455414C08000400000000000A4344535F564C5041474F080004000000
      00000C4344535F564C44454249544F08000400000000000B4344535F564C4D55
      4C544108000400000000000B4344535F564C4A55524F53080004000000000000
      00}
    object cdsListaClientesCDS_CODIGO: TIntegerField
      FieldName = 'CDS_CODIGO'
    end
    object cdsListaClientesCDS_NOME: TStringField
      FieldName = 'CDS_NOME'
      Size = 50
    end
    object cdsListaClientesCDS_CGCCPF: TStringField
      FieldName = 'CDS_CGCCPF'
      Size = 18
    end
    object cdsListaClientesCDS_CDGRUPO: TIntegerField
      FieldName = 'CDS_CDGRUPO'
    end
    object cdsListaClientesCDS_NMGRUPO: TStringField
      FieldName = 'CDS_NMGRUPO'
      Size = 30
    end
    object cdsListaClientesCDS_NRBOX: TStringField
      FieldName = 'CDS_NRBOX'
    end
    object cdsListaClientesCDS_QTPARC: TIntegerField
      FieldName = 'CDS_QTPARC'
    end
    object cdsListaClientesCDS_QTPAGA: TIntegerField
      FieldName = 'CDS_QTPAGA'
    end
    object cdsListaClientesCDS_QTABERTAS: TFloatField
      FieldName = 'CDS_QTABERTAS'
    end
    object cdsListaClientesCDS_VLPCATUAL: TFloatField
      FieldName = 'CDS_VLPCATUAL'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsListaClientesCDS_VLPAGO: TFloatField
      FieldName = 'CDS_VLPAGO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsListaClientesCDS_VLDEBITO: TFloatField
      FieldName = 'CDS_VLDEBITO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsListaClientesCDS_VLMULTA: TFloatField
      FieldName = 'CDS_VLMULTA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsListaClientesCDS_VLJUROS: TFloatField
      FieldName = 'CDS_VLJUROS'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsListaClientesCDS_SUBTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CDS_SUBTOTAL'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Calculated = True
    end
  end
  object cdsInadimplentes: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select CL.CLI_CODIGO, CL.CLI_RAZAO, CL.CLI_FANTASIA, CL.CLI_CGC,' +
      ' CL.CLI_CDGRUPO, G.GRU_DESCRICAO, CL.CLI_NRBOX from CLIENTES CL ' +
      'inner Join CONTASRECEBER R ON CL.CLI_CODIGO = R.REC_CLIENTE inne' +
      'r Join GRUPOS G ON CL.CLI_CDGRUPO = G.GRU_CODIGO Where (R.rec_da' +
      'tavencimento >= :pDATA) AND (R.rec_datavencimento <= :pDTFINAL) ' +
      'Group By CL.CLI_CODIGO, CL.CLI_RAZAO, CL.CLI_FANTASIA, CL.CLI_CG' +
      'C, CL.CLI_CDGRUPO, G.GRU_DESCRICAO, CL.CLI_NRBOX order by CL.CLI' +
      '_CDGRUPO, CL.CLI_NRBOX'
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 488
    Top = 448
  end
  object dstRenegociacao: TSQLDataSet
    CommandText = 'select * from RENEGOCIACAO where (RNG_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 584
    Top = 128
    object dstRenegociacaoRNG_CODIGO: TIntegerField
      FieldName = 'RNG_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstRenegociacaoRNG_CDLOJA: TIntegerField
      FieldName = 'RNG_CDLOJA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstRenegociacaoRNG_CLIENTE: TIntegerField
      FieldName = 'RNG_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstRenegociacaoRNG_DTMOVI: TDateField
      FieldName = 'RNG_DTMOVI'
      ProviderFlags = [pfInUpdate]
    end
    object dstRenegociacaoRGN_TOTAL_RENEGOCIACAO: TFMTBCDField
      FieldName = 'RGN_TOTAL_RENEGOCIACAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstRenegociacaoRGN_DESCONTO: TBCDField
      FieldName = 'RGN_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object dstRenegociacaoRGN_VLENTRADA: TFMTBCDField
      FieldName = 'RGN_VLENTRADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstRenegociacaoRGN_VLFINANCIADO: TFMTBCDField
      FieldName = 'RGN_VLFINANCIADO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstRenegociacaoRGN_PEJUROS: TBCDField
      FieldName = 'RGN_PEJUROS'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object dstRenegociacaoRGN_QUANTIDADE: TIntegerField
      FieldName = 'RGN_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstRenegociacaoRGN_VLPARCELA: TFMTBCDField
      FieldName = 'RGN_VLPARCELA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstRenegociacaoRGN_DTVENC1: TDateField
      FieldName = 'RGN_DTVENC1'
      ProviderFlags = [pfInUpdate]
    end
    object dstRenegociacaoRGN_DTVENC2: TDateField
      FieldName = 'RGN_DTVENC2'
      ProviderFlags = [pfInUpdate]
    end
    object dstRenegociacaoRGN_OBSERVACAO: TMemoField
      FieldName = 'RGN_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstRenegociacaoRGN_USUARIO: TIntegerField
      FieldName = 'RGN_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstRenegociacaoRNG_NOME_CLIENTE: TStringField
      FieldName = 'RNG_NOME_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstRenegociacaoRNG_NRBOX: TStringField
      FieldName = 'RNG_NRBOX'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dspRenegociacao: TDataSetProvider
    DataSet = dstRenegociacao
    Options = [poAllowCommandText]
    Left = 648
    Top = 152
  end
  object cdsRenegociacao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspRenegociacao'
    Left = 712
    Top = 128
    object cdsRenegociacaoRNG_CODIGO: TIntegerField
      FieldName = 'RNG_CODIGO'
      Required = True
    end
    object cdsRenegociacaoRNG_CDLOJA: TIntegerField
      FieldName = 'RNG_CDLOJA'
      Required = True
    end
    object cdsRenegociacaoRNG_CLIENTE: TIntegerField
      FieldName = 'RNG_CLIENTE'
      Required = True
    end
    object cdsRenegociacaoRNG_DTMOVI: TDateField
      FieldName = 'RNG_DTMOVI'
    end
    object cdsRenegociacaoRGN_TOTAL_RENEGOCIACAO: TFMTBCDField
      FieldName = 'RGN_TOTAL_RENEGOCIACAO'
      Precision = 18
      Size = 2
    end
    object cdsRenegociacaoRGN_DESCONTO: TBCDField
      FieldName = 'RGN_DESCONTO'
      Precision = 9
      Size = 2
    end
    object cdsRenegociacaoRGN_VLENTRADA: TFMTBCDField
      FieldName = 'RGN_VLENTRADA'
      Precision = 18
      Size = 2
    end
    object cdsRenegociacaoRGN_VLFINANCIADO: TFMTBCDField
      FieldName = 'RGN_VLFINANCIADO'
      Precision = 18
      Size = 2
    end
    object cdsRenegociacaoRGN_PEJUROS: TBCDField
      FieldName = 'RGN_PEJUROS'
      Precision = 9
      Size = 2
    end
    object cdsRenegociacaoRGN_QUANTIDADE: TIntegerField
      FieldName = 'RGN_QUANTIDADE'
    end
    object cdsRenegociacaoRGN_VLPARCELA: TFMTBCDField
      FieldName = 'RGN_VLPARCELA'
      Precision = 18
      Size = 2
    end
    object cdsRenegociacaoRGN_DTVENC1: TDateField
      FieldName = 'RGN_DTVENC1'
    end
    object cdsRenegociacaoRGN_DTVENC2: TDateField
      FieldName = 'RGN_DTVENC2'
    end
    object cdsRenegociacaoRGN_OBSERVACAO: TMemoField
      FieldName = 'RGN_OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsRenegociacaoRGN_USUARIO: TIntegerField
      FieldName = 'RGN_USUARIO'
    end
    object cdsRenegociacaoRNG_NOME_CLIENTE: TStringField
      FieldName = 'RNG_NOME_CLIENTE'
      Size = 50
    end
    object cdsRenegociacaoRNG_NRBOX: TStringField
      FieldName = 'RNG_NRBOX'
      Size = 30
    end
  end
  object dstEletros: TSQLDataSet
    CommandText = 'select * from ELETROS where (ELE_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 544
    Top = 400
    object dstEletrosELE_CODIGO: TIntegerField
      FieldName = 'ELE_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstEletrosELE_DESCRICAO: TStringField
      FieldName = 'ELE_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
  end
  object dspEletros: TDataSetProvider
    DataSet = dstEletros
    Options = [poAllowCommandText]
    Left = 600
    Top = 408
  end
  object cdsEletros: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspEletros'
    Left = 656
    Top = 408
    object cdsEletrosELE_CODIGO: TIntegerField
      FieldName = 'ELE_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsEletrosELE_DESCRICAO: TStringField
      FieldName = 'ELE_DESCRICAO'
      Required = True
      Size = 40
    end
  end
  object dstClienteEletro: TSQLDataSet
    CommandText = 
      'select CLE_CLIENTE, CLE_ELETRO from CLIENTE_ELETRO Where (CLE_CL' +
      'IENTE = :pCLIENTE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 616
    Top = 280
    object dstClienteEletroCLE_CLIENTE: TIntegerField
      FieldName = 'CLE_CLIENTE'
      Required = True
    end
    object dstClienteEletroCLE_ELETRO: TIntegerField
      FieldName = 'CLE_ELETRO'
      Required = True
    end
  end
  object dspCLienteEletro: TDataSetProvider
    DataSet = dstClienteEletro
    Options = [poAllowCommandText]
    Left = 704
    Top = 272
  end
  object cdsClienteEletro: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCLIENTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspCLienteEletro'
    Left = 712
    Top = 328
    object cdsClienteEletroCLE_CLIENTE: TIntegerField
      FieldName = 'CLE_CLIENTE'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsClienteEletroCLE_ELETRO: TIntegerField
      FieldName = 'CLE_ELETRO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsClienteEletroCLE_DESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'CLE_DESCRICAO'
      LookupDataSet = cdsListaEletros
      LookupKeyFields = 'ELE_CODIGO'
      LookupResultField = 'ELE_DESCRICAO'
      KeyFields = 'CLE_ELETRO'
      Size = 40
      Lookup = True
    end
  end
  object cdsListaEletros: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select e.ele_codigo, e.ele_descricao from ELETROS E Order by e.e' +
      'le_descricao'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 592
    Top = 464
    object cdsListaEletrosELE_CODIGO: TIntegerField
      FieldName = 'ELE_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsListaEletrosELE_DESCRICAO: TStringField
      FieldName = 'ELE_DESCRICAO'
      Required = True
      Size = 40
    end
  end
  object dstMovimentoBox: TSQLDataSet
    CommandText = 
      'select * from MOVIMENTO_BOX Where (MBX_DTMOVI = :pDtmovi)'#13#10'and (' +
      'MBX_USUARIO = :pUsuario)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDtmovi'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pUsuario'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 536
    object dstMovimentoBoxMBX_CODIGO: TIntegerField
      FieldName = 'MBX_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstMovimentoBoxMBX_LOJA: TIntegerField
      FieldName = 'MBX_LOJA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstMovimentoBoxMBX_NRPISO: TIntegerField
      FieldName = 'MBX_NRPISO'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoBoxMBX_CLIENTE: TIntegerField
      FieldName = 'MBX_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstMovimentoBoxMBX_DTMOVI: TDateField
      FieldName = 'MBX_DTMOVI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstMovimentoBoxMBX_HOMOVI: TStringField
      FieldName = 'MBX_HOMOVI'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object dstMovimentoBoxMBX_NUMBOX: TStringField
      FieldName = 'MBX_NUMBOX'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoBoxMBX_JUSTIFICATIVA: TStringField
      FieldName = 'MBX_JUSTIFICATIVA'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object dstMovimentoBoxMBX_SITUACAO: TStringField
      FieldName = 'MBX_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstMovimentoBoxMBX_USUARIO: TIntegerField
      FieldName = 'MBX_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspMovimentoBox: TDataSetProvider
    DataSet = dstMovimentoBox
    Options = [poAllowCommandText]
    OnGetTableName = dspMovimentoBoxGetTableName
    Left = 104
    Top = 520
  end
  object cdsMovimentoBox: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDtmovi'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pUsuario'
        ParamType = ptInput
      end>
    ProviderName = 'dspMovimentoBox'
    OnCalcFields = cdsMovimentoBoxCalcFields
    Left = 192
    Top = 528
    object cdsMovimentoBoxMBX_CODIGO: TIntegerField
      FieldName = 'MBX_CODIGO'
    end
    object cdsMovimentoBoxMBX_LOJA: TIntegerField
      FieldName = 'MBX_LOJA'
      Required = True
      DisplayFormat = '000'
    end
    object cdsMovimentoBoxMBX_NRPISO: TIntegerField
      FieldName = 'MBX_NRPISO'
    end
    object cdsMovimentoBoxMBX_CLIENTE: TIntegerField
      FieldName = 'MBX_CLIENTE'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsMovimentoBoxMBX_DTMOVI: TDateField
      FieldName = 'MBX_DTMOVI'
      Required = True
    end
    object cdsMovimentoBoxMBX_HOMOVI: TStringField
      FieldName = 'MBX_HOMOVI'
      EditMask = '99:99;1;_'
      Size = 5
    end
    object cdsMovimentoBoxMBX_NUMBOX: TStringField
      FieldName = 'MBX_NUMBOX'
    end
    object cdsMovimentoBoxMBX_JUSTIFICATIVA: TStringField
      FieldName = 'MBX_JUSTIFICATIVA'
      Size = 255
    end
    object cdsMovimentoBoxMBX_SITUACAO: TStringField
      FieldName = 'MBX_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsMovimentoBoxMBX_USUARIO: TIntegerField
      FieldName = 'MBX_USUARIO'
    end
    object cdsMovimentoBoxMBX_NMCLIE: TStringField
      FieldKind = fkCalculated
      FieldName = 'MBX_NMCLIE'
      Size = 50
      Calculated = True
    end
    object cdsMovimentoBoxMBX_STDESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'MBX_STDESC'
      Size = 10
      Calculated = True
    end
  end
end
