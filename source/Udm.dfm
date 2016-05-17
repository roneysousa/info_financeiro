object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 204
  Top = 137
  Height = 646
  Width = 986
  object DsEmpresas: TDataSource
    AutoEdit = False
    DataSet = CdsEmpresas
    Left = 232
    Top = 45
  end
  object DspEmpresas: TDataSetProvider
    DataSet = SdsEmpresas
    OnGetTableName = DspEmpresasGetTableName
    Left = 88
    Top = 45
  end
  object CdsEmpresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEmpresas'
    Left = 160
    Top = 45
    object CdsEmpresasEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object CdsEmpresasEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CdsEmpresasEMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CdsEmpresasEMP_ENDERECO: TStringField
      FieldName = 'EMP_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CdsEmpresasEMP_NUMERO: TIntegerField
      FieldName = 'EMP_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsEmpresasBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '999'
    end
    object CdsEmpresasCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '999'
    end
    object CdsEmpresasEMP_CNPJ: TStringField
      FieldName = 'EMP_CNPJ'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object CdsEmpresasEMP_LIMCAIXA: TIntegerField
      FieldName = 'EMP_LIMCAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsEmpresasEMP_SEQUENCIA: TIntegerField
      FieldName = 'EMP_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsEmpresasEMP_VENDA: TIntegerField
      FieldName = 'EMP_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsEmpresasEMP_DTCAIXA: TDateField
      FieldName = 'EMP_DTCAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsEmpresasEMP_FLCAIXA: TStringField
      FieldName = 'EMP_FLCAIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object CdsEmpresasEMP_CAIXA: TIntegerField
      FieldName = 'EMP_CAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsEmpresasEMP_NRNOTA: TIntegerField
      FieldName = 'EMP_NRNOTA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsEmpresasEMP_NMCIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'EMP_NMCIDADE'
      LookupDataSet = dmConsultas.cdsCidades
      LookupKeyFields = 'CID_CODIGO'
      LookupResultField = 'CID_NOME'
      KeyFields = 'CID_CODIGO'
      Size = 40
      Lookup = True
    end
    object CdsEmpresasEMP_NMBAIRRO: TStringField
      FieldKind = fkLookup
      FieldName = 'EMP_NMBAIRRO'
      LookupDataSet = dmConsultas.cdsBairros
      LookupKeyFields = 'BAI_CODIGO'
      LookupResultField = 'BAI_NOME'
      KeyFields = 'BAI_CODIGO'
      Lookup = True
    end
    object CdsEmpresasEMP_INSCRICAOESTADUAL: TStringField
      FieldName = 'EMP_INSCRICAOESTADUAL'
      FixedChar = True
      Size = 14
    end
    object CdsEmpresasEMP_DATA_CAD: TDateField
      FieldName = 'EMP_DATA_CAD'
    end
    object CdsEmpresasEMP_HOCADA: TStringField
      FieldName = 'EMP_HOCADA'
      FixedChar = True
      Size = 5
    end
    object CdsEmpresasEMP_USUARIO_CAD: TIntegerField
      FieldName = 'EMP_USUARIO_CAD'
    end
    object CdsEmpresasEMP_DATA_ALT: TDateField
      FieldName = 'EMP_DATA_ALT'
    end
    object CdsEmpresasEMP_HORA_ALT: TStringField
      FieldName = 'EMP_HORA_ALT'
      FixedChar = True
      Size = 5
    end
    object CdsEmpresasEMP_USUARIO_ALT: TIntegerField
      FieldName = 'EMP_USUARIO_ALT'
    end
    object CdsEmpresasEMP_NRFONE: TStringField
      FieldName = 'EMP_NRFONE'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object CdsEmpresasEMP_NRFAX: TStringField
      FieldName = 'EMP_NRFAX'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object CdsEmpresasEMP_NRCEP: TStringField
      FieldName = 'EMP_NRCEP'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object CdsEmpresasEMP_UF: TStringField
      FieldName = 'EMP_UF'
      FixedChar = True
      Size = 2
    end
  end
  object SdsEmpresas: TSQLDataSet
    CommandText = 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 16
    Top = 45
    object SdsEmpresasEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SdsEmpresasEMP_CNPJ: TStringField
      FieldName = 'EMP_CNPJ'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 14
    end
    object SdsEmpresasEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SdsEmpresasEMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SdsEmpresasEMP_ENDERECO: TStringField
      FieldName = 'EMP_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SdsEmpresasEMP_NUMERO: TIntegerField
      FieldName = 'EMP_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasEMP_LIMCAIXA: TIntegerField
      FieldName = 'EMP_LIMCAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasEMP_SEQUENCIA: TIntegerField
      FieldName = 'EMP_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasEMP_VENDA: TIntegerField
      FieldName = 'EMP_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasEMP_DTCAIXA: TDateField
      FieldName = 'EMP_DTCAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasEMP_FLCAIXA: TStringField
      FieldName = 'EMP_FLCAIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object SdsEmpresasEMP_CAIXA: TIntegerField
      FieldName = 'EMP_CAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasEMP_NRNOTA: TIntegerField
      FieldName = 'EMP_NRNOTA'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasEMP_INSCRICAOESTADUAL: TStringField
      FieldName = 'EMP_INSCRICAOESTADUAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 14
    end
    object SdsEmpresasEMP_DATA_CAD: TDateField
      FieldName = 'EMP_DATA_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasEMP_HOCADA: TStringField
      FieldName = 'EMP_HOCADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object SdsEmpresasEMP_USUARIO_CAD: TIntegerField
      FieldName = 'EMP_USUARIO_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasEMP_DATA_ALT: TDateField
      FieldName = 'EMP_DATA_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasEMP_HORA_ALT: TStringField
      FieldName = 'EMP_HORA_ALT'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object SdsEmpresasEMP_USUARIO_ALT: TIntegerField
      FieldName = 'EMP_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object SdsEmpresasEMP_NRFONE: TStringField
      FieldName = 'EMP_NRFONE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SdsEmpresasEMP_NRFAX: TStringField
      FieldName = 'EMP_NRFAX'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SdsEmpresasEMP_NRCEP: TStringField
      FieldName = 'EMP_NRCEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object SdsEmpresasEMP_UF: TStringField
      FieldName = 'EMP_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
  end
  object DsCidades: TDataSource
    AutoEdit = False
    DataSet = CdsCidades
    Left = 232
    Top = 85
  end
  object CdsCidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCidades'
    Left = 152
    Top = 85
    object CdsCidadesCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object CdsCidadesCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Size = 40
    end
    object CdsCidadesCID_UF: TStringField
      FieldName = 'CID_UF'
      FixedChar = True
      Size = 2
    end
  end
  object DspCidades: TDataSetProvider
    DataSet = SdsCidades
    OnGetTableName = DspCidadesGetTableName
    Left = 80
    Top = 85
  end
  object SdsCidades: TSQLDataSet
    CommandText = 'select * from CIDADES order by CID_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 8
    Top = 93
  end
  object SdsBairros: TSQLDataSet
    CommandText = 'select * from BAIRROS order by BAI_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 16
    Top = 149
  end
  object SdsClientes: TSQLDataSet
    CommandText = 
      'SELECT * FROM CLIENTES WHERE CLI_CODIGO = :PCODIGO'#13#10'order by CLI' +
      '_FANTASIA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SqlAdmin
    Left = 16
    Top = 213
    object SdsClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SdsClientesCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object SdsClientesCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SdsClientesCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SdsClientesCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SdsClientesCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object SdsClientesBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_FONE1: TStringField
      FieldName = 'CLI_FONE1'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SdsClientesCLI_FONE2: TStringField
      FieldName = 'CLI_FONE2'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SdsClientesCLI_FONE3: TStringField
      FieldName = 'CLI_FONE3'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SdsClientesCLI_RAMAL1: TStringField
      FieldName = 'CLI_RAMAL1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object SdsClientesCLI_RAMAL2: TStringField
      FieldName = 'CLI_RAMAL2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object SdsClientesCLI_RAMAL3: TStringField
      FieldName = 'CLI_RAMAL3'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object SdsClientesCLI_FAX: TStringField
      FieldName = 'CLI_FAX'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SdsClientesCLI_INSCESTADUAL: TStringField
      FieldName = 'CLI_INSCESTADUAL'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object SdsClientesCLI_DATACAD: TDateField
      FieldName = 'CLI_DATACAD'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesSIT_CODIGO: TIntegerField
      FieldName = 'SIT_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_PAGINA: TStringField
      FieldName = 'CLI_PAGINA'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object SdsClientesATI_CODIGO: TIntegerField
      FieldName = 'ATI_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_ORGAOEMISSOR: TStringField
      FieldName = 'CLI_ORGAOEMISSOR'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object SdsClientesCLI_UFEMISSOR: TStringField
      FieldName = 'CLI_UFEMISSOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object SdsClientesCLI_TIPOPESSOA: TStringField
      FieldName = 'CLI_TIPOPESSOA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object SdsClientesCLI_FOTOCLIENTE: TBlobField
      FieldName = 'CLI_FOTOCLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_DTANIVERSARIO: TDateField
      FieldName = 'CLI_DTANIVERSARIO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_UFCLIENTE: TStringField
      FieldName = 'CLI_UFCLIENTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object SdsClientesCLI_TIPOCLIENTE: TIntegerField
      FieldName = 'CLI_TIPOCLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_REGIAO: TIntegerField
      FieldName = 'CLI_REGIAO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_FLMATRIZ: TStringField
      FieldName = 'CLI_FLMATRIZ'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object SdsClientesCLI_USUARIO_INC: TIntegerField
      FieldName = 'CLI_USUARIO_INC'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_USUARIO_ALT: TIntegerField
      FieldName = 'CLI_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_DATA_INC: TDateField
      FieldName = 'CLI_DATA_INC'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_HORA_INC: TStringField
      FieldName = 'CLI_HORA_INC'
      ProviderFlags = [pfInUpdate]
      EditMask = '99:99'
      FixedChar = True
      Size = 5
    end
    object SdsClientesCLI_DATA_ALT: TDateField
      FieldName = 'CLI_DATA_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_HORA_ALT: TStringField
      FieldName = 'CLI_HORA_ALT'
      ProviderFlags = [pfInUpdate]
      EditMask = '99:99'
      FixedChar = True
      Size = 5
    end
    object SdsClientesCLI_END_COBRANCA: TStringField
      FieldName = 'CLI_END_COBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SdsClientesCLI_CODIGO_MATRIZ: TIntegerField
      FieldName = 'CLI_CODIGO_MATRIZ'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_PONTO_REFERENCIA: TStringField
      FieldName = 'CLI_PONTO_REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object SdsClientesCLI_NRBOX: TStringField
      FieldName = 'CLI_NRBOX'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_CDGRUPO: TIntegerField
      FieldName = 'CLI_CDGRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_FOTO: TGraphicField
      FieldName = 'CLI_FOTO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object SdsClientesCLI_END_NUMERO: TIntegerField
      FieldName = 'CLI_END_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_END_CIDADE: TIntegerField
      FieldName = 'CLI_END_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_END_CEP: TStringField
      FieldName = 'CLI_END_CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object SdsClientesCLI_END_UF: TStringField
      FieldName = 'CLI_END_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object SdsClientesCLI_END_BAIRRO: TIntegerField
      FieldName = 'CLI_END_BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_GRAU_ESCOLARIDADE: TStringField
      FieldName = 'CLI_GRAU_ESCOLARIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object SdsClientesCLI_FLPORTADOR_DEFICIENCIA: TStringField
      FieldName = 'CLI_FLPORTADOR_DEFICIENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object SdsClientesCLI_DESCRICAO_DEFICIENCIA: TStringField
      FieldName = 'CLI_DESCRICAO_DEFICIENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_CONJUGUE_NOME: TStringField
      FieldName = 'CLI_CONJUGUE_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object SdsClientesCLI_CONJUGUE_CPF: TStringField
      FieldName = 'CLI_CONJUGUE_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object SdsClientesCLI_TEMPO_RESIDENCIA: TStringField
      FieldName = 'CLI_TEMPO_RESIDENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object SdsClientesCLI_ESTADO_CIVIL: TIntegerField
      FieldName = 'CLI_ESTADO_CIVIL'
      ProviderFlags = [pfInUpdate]
    end
    object SdsClientesCLI_OBSERVACAO: TMemoField
      FieldName = 'CLI_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object SdsClientesCLI_END_LOGRADOURO: TStringField
      FieldName = 'CLI_END_LOGRADOURO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object SdsContatos: TSQLDataSet
    CommandText = 
      'SELECT * FROM CONTATOS WHERE CLI_CODIGO = :PCODIGO'#13#10'order by CON' +
      '_NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SqlAdmin
    Left = 16
    Top = 277
    object SdsContatosCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
    end
    object SdsContatosCON_CODIGO: TIntegerField
      FieldName = 'CON_CODIGO'
    end
    object SdsContatosCON_NOME: TStringField
      FieldName = 'CON_NOME'
      Size = 50
    end
    object SdsContatosCON_DATANASC: TDateField
      FieldName = 'CON_DATANASC'
    end
    object SdsContatosCON_FONE: TStringField
      FieldName = 'CON_FONE'
      Size = 10
    end
    object SdsContatosCON_CELULAR: TStringField
      FieldName = 'CON_CELULAR'
      Size = 10
    end
    object SdsContatosCAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
    end
    object SdsContatosCON_OBSERVACAO: TMemoField
      FieldName = 'CON_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object SdsContatosCON_DTCADA: TDateField
      FieldName = 'CON_DTCADA'
      ProviderFlags = [pfInUpdate]
    end
    object SdsContatosCON_HOCADA: TStringField
      FieldName = 'CON_HOCADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object SdsContatosCON_USUARIO_CAD: TIntegerField
      FieldName = 'CON_USUARIO_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object SdsContatosCON_DTALTE: TDateField
      FieldName = 'CON_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object SdsContatosCON_HOALTE: TStringField
      FieldName = 'CON_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object SdsContatosCON_USUARIO_ALT: TIntegerField
      FieldName = 'CON_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
  end
  object DsBairros: TDataSource
    AutoEdit = False
    DataSet = CdsBairros
    Left = 224
    Top = 149
  end
  object DsClientes: TDataSource
    AutoEdit = False
    DataSet = CdsClientes
    Left = 216
    Top = 213
  end
  object DsContatos: TDataSource
    AutoEdit = False
    DataSet = CdsContatos
    Left = 216
    Top = 277
  end
  object CdsBairros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspBairros'
    Left = 152
    Top = 149
    object CdsBairrosBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object CdsBairrosBAI_NOME: TStringField
      FieldName = 'BAI_NOME'
      Size = 40
    end
    object CdsBairrosCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
    end
    object CdsBairrosCID_NOME: TStringField
      FieldKind = fkLookup
      FieldName = 'CID_NOME'
      LookupDataSet = CdsCidades
      LookupKeyFields = 'CID_CODIGO'
      LookupResultField = 'CID_NOME'
      KeyFields = 'CID_CODIGO'
      Size = 40
      Lookup = True
    end
  end
  object CdsClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'DspClientes'
    Left = 152
    Top = 213
    object CdsClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object CdsClientesCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CdsClientesCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CdsClientesCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CdsClientesCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '#####-###;0;_'
      Size = 8
    end
    object CdsClientesBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      ProviderFlags = [pfInUpdate]
      EditFormat = '000'
    end
    object CdsClientesCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      ProviderFlags = [pfInUpdate]
      EditFormat = '000'
    end
    object CdsClientesCLI_FONE1: TStringField
      FieldName = 'CLI_FONE1'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object CdsClientesCLI_FONE2: TStringField
      FieldName = 'CLI_FONE2'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object CdsClientesCLI_FONE3: TStringField
      FieldName = 'CLI_FONE3'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object CdsClientesCLI_RAMAL1: TStringField
      FieldName = 'CLI_RAMAL1'
      ProviderFlags = [pfInUpdate]
      EditMask = '9999;1;_'
      FixedChar = True
      Size = 4
    end
    object CdsClientesCLI_RAMAL2: TStringField
      FieldName = 'CLI_RAMAL2'
      ProviderFlags = [pfInUpdate]
      EditMask = '9999;1;_'
      FixedChar = True
      Size = 4
    end
    object CdsClientesCLI_RAMAL3: TStringField
      FieldName = 'CLI_RAMAL3'
      ProviderFlags = [pfInUpdate]
      EditMask = '9999;1;_'
      FixedChar = True
      Size = 4
    end
    object CdsClientesCLI_FAX: TStringField
      FieldName = 'CLI_FAX'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object CdsClientesCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      ProviderFlags = [pfInUpdate]
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object CdsClientesCLI_INSCESTADUAL: TStringField
      FieldName = 'CLI_INSCESTADUAL'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object CdsClientesCLI_DATACAD: TDateField
      FieldName = 'CLI_DATACAD'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesSIT_CODIGO: TIntegerField
      FieldName = 'SIT_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_PAGINA: TStringField
      FieldName = 'CLI_PAGINA'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CdsClientesATI_CODIGO: TIntegerField
      FieldName = 'ATI_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_ORGAOEMISSOR: TStringField
      FieldName = 'CLI_ORGAOEMISSOR'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object CdsClientesCLI_UFEMISSOR: TStringField
      FieldName = 'CLI_UFEMISSOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object CdsClientesCLI_TIPOPESSOA: TStringField
      FieldName = 'CLI_TIPOPESSOA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object CdsClientesCLI_FOTOCLIENTE: TBlobField
      FieldName = 'CLI_FOTOCLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_DTANIVERSARIO: TDateField
      FieldName = 'CLI_DTANIVERSARIO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object CdsClientesCLI_UFCLIENTE: TStringField
      FieldName = 'CLI_UFCLIENTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object CdsClientesCLI_TIPOCLIENTE: TIntegerField
      FieldName = 'CLI_TIPOCLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_REGIAO: TIntegerField
      FieldName = 'CLI_REGIAO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesTIPOCLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'TIPOCLIENTE'
      LookupDataSet = cdsTpClientes
      LookupKeyFields = 'TPC_CODIGO'
      LookupResultField = 'TPC_DESCRICAO'
      KeyFields = 'CLI_TIPOCLIENTE'
      Lookup = True
    end
    object CdsClientesREGIAO: TStringField
      FieldKind = fkLookup
      FieldName = 'REGIAO'
      LookupDataSet = DM2.cdsRegioes
      LookupKeyFields = 'REG_CODIGO'
      LookupResultField = 'REG_DESCRICAO'
      KeyFields = 'CLI_REGIAO'
      Size = 12
      Lookup = True
    end
    object CdsClientesCLI_FLMATRIZ: TStringField
      FieldName = 'CLI_FLMATRIZ'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object CdsClientesCLI_USUARIO_INC: TIntegerField
      FieldName = 'CLI_USUARIO_INC'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_USUARIO_ALT: TIntegerField
      FieldName = 'CLI_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_DATA_INC: TDateField
      FieldName = 'CLI_DATA_INC'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_HORA_INC: TStringField
      FieldName = 'CLI_HORA_INC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object CdsClientesCLI_DATA_ALT: TDateField
      FieldName = 'CLI_DATA_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_HORA_ALT: TStringField
      FieldName = 'CLI_HORA_ALT'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object CdsClientesCLI_END_COBRANCA: TStringField
      FieldName = 'CLI_END_COBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CdsClientesCLI_CODIGO_MATRIZ: TIntegerField
      FieldName = 'CLI_CODIGO_MATRIZ'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_NMMATRIZ: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_NMMATRIZ'
      LookupDataSet = dmDados.cdsMatriz
      LookupKeyFields = 'CLI_CODIGO'
      LookupResultField = 'CLI_RAZAO'
      KeyFields = 'CLI_CODIGO_MATRIZ'
      Size = 50
      Lookup = True
    end
    object CdsClientesCLI_NOME_ATIV: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_NOME_ATIV'
      LookupDataSet = cdsListaAtividades
      LookupKeyFields = 'ATI_CODIGO'
      LookupResultField = 'ATI_NOME'
      KeyFields = 'ATI_CODIGO'
      Size = 40
      Lookup = True
    end
    object CdsClientesCLI_PONTO_REFERENCIA: TStringField
      FieldName = 'CLI_PONTO_REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CdsClientesCLI_NOME_SITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_NOME_SITUACAO'
      LookupDataSet = cdsListaSituacao
      LookupKeyFields = 'SIT_CODIGO'
      LookupResultField = 'SIT_NOME'
      KeyFields = 'SIT_CODIGO'
      Size = 40
      Lookup = True
    end
    object CdsClientesCLI_NRBOX: TStringField
      FieldName = 'CLI_NRBOX'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_CDGRUPO: TIntegerField
      FieldName = 'CLI_CDGRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_NMGRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_NMGRUPO'
      LookupDataSet = cdsListaGrupos
      LookupKeyFields = 'GRU_CODIGO'
      LookupResultField = 'GRU_DESCRICAO'
      KeyFields = 'CLI_CDGRUPO'
      Size = 30
      Lookup = True
    end
    object CdsClientesCLI_FOTO: TGraphicField
      FieldName = 'CLI_FOTO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object CdsClientesCLI_END_NUMERO: TIntegerField
      FieldName = 'CLI_END_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_END_CIDADE: TIntegerField
      FieldName = 'CLI_END_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_END_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_END_CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '#####-###;0;_'
      FixedChar = True
      Size = 8
    end
    object CdsClientesCLI_END_UF: TStringField
      FieldName = 'CLI_END_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object CdsClientesCLI_END_BAIRRO: TIntegerField
      FieldName = 'CLI_END_BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_GRAU_ESCOLARIDADE: TStringField
      FieldName = 'CLI_GRAU_ESCOLARIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object CdsClientesCLI_FLPORTADOR_DEFICIENCIA: TStringField
      FieldName = 'CLI_FLPORTADOR_DEFICIENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object CdsClientesCLI_DESCRICAO_DEFICIENCIA: TStringField
      FieldName = 'CLI_DESCRICAO_DEFICIENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_CONJUGUE_NOME: TStringField
      FieldName = 'CLI_CONJUGUE_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CdsClientesCLI_CONJUGUE_CPF: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CONJUGUE_CPF'
      ProviderFlags = [pfInUpdate]
      EditMask = '999.999.999-99;0'
      Size = 11
    end
    object CdsClientesCLI_TEMPO_RESIDENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_TEMPO_RESIDENCIA'
      ProviderFlags = [pfInUpdate]
      EditMask = '##-##;0;_'
      FixedChar = True
      Size = 4
    end
    object CdsClientesCLI_ESTADO_CIVIL: TIntegerField
      FieldName = 'CLI_ESTADO_CIVIL'
      ProviderFlags = [pfInUpdate]
    end
    object CdsClientesCLI_OBSERVACAO: TMemoField
      FieldName = 'CLI_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object CdsClientesCLI_DESC_EST_CIVIL: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_DESC_EST_CIVIL'
      LookupDataSet = cdsListaEstadoCivil
      LookupKeyFields = 'ECV_CODIGO'
      LookupResultField = 'ECV_DESCRICAO'
      KeyFields = 'CLI_ESTADO_CIVIL'
      Lookup = True
    end
    object CdsClientesCLI_CIDADE_RESIDENCIA: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_CIDADE_RESIDENCIA'
      LookupDataSet = cdsListaCidadesEndRes
      LookupKeyFields = 'CID_CODIGO'
      LookupResultField = 'CID_NOME'
      KeyFields = 'CLI_END_CIDADE'
      Size = 40
      Lookup = True
    end
    object CdsClientesCLI_NMBAIRRO_RESID: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_NMBAIRRO_RESID'
      LookupDataSet = cdsListaBairroResid
      LookupKeyFields = 'BAI_CODIGO'
      LookupResultField = 'BAI_NOME'
      KeyFields = 'CLI_END_BAIRRO'
      Size = 40
      Lookup = True
    end
    object CdsClientesBAI_NOME: TStringField
      FieldKind = fkLookup
      FieldName = 'BAI_NOME'
      LookupDataSet = cdsListaBairroCobranca
      LookupKeyFields = 'BAI_CODIGO'
      LookupResultField = 'BAI_NOME'
      KeyFields = 'BAI_CODIGO'
      Size = 40
      Lookup = True
    end
    object CdsClientesCLI_CIDADE_COBRACA: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_CIDADE_COBRACA'
      LookupDataSet = cdsListaCidadeCob
      LookupKeyFields = 'CID_CODIGO'
      LookupResultField = 'CID_NOME'
      KeyFields = 'CID_CODIGO'
      Size = 40
      Lookup = True
    end
    object CdsClientesCLI_END_LOGRADOURO: TStringField
      FieldName = 'CLI_END_LOGRADOURO'
      Size = 50
    end
  end
  object CdsContatos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'DspContatos'
    Left = 152
    Top = 277
    object CdsContatosCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      DisplayFormat = '000000'
    end
    object CdsContatosCON_CODIGO: TIntegerField
      FieldName = 'CON_CODIGO'
      DisplayFormat = '00000'
    end
    object CdsContatosCON_NOME: TStringField
      FieldName = 'CON_NOME'
      Size = 50
    end
    object CdsContatosCON_DATANASC: TDateField
      FieldName = 'CON_DATANASC'
      EditMask = '!99/99/0000;1;_'
    end
    object CdsContatosCON_FONE: TStringField
      FieldName = 'CON_FONE'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object CdsContatosCON_CELULAR: TStringField
      FieldName = 'CON_CELULAR'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object CdsContatosCAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
    end
    object CdsContatosCON_CARGO: TStringField
      FieldKind = fkLookup
      FieldName = 'CON_CARGO'
      LookupDataSet = CdsCargos
      LookupKeyFields = 'CAR_CODIGO'
      LookupResultField = 'CAR_NOME'
      KeyFields = 'CAR_CODIGO'
      Size = 40
      Lookup = True
    end
    object CdsContatosCON_OBSERVACAO: TMemoField
      FieldName = 'CON_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object CdsContatosCON_DTCADA: TDateField
      FieldName = 'CON_DTCADA'
    end
    object CdsContatosCON_HOCADA: TStringField
      FieldName = 'CON_HOCADA'
      FixedChar = True
      Size = 5
    end
    object CdsContatosCON_USUARIO_CAD: TIntegerField
      FieldName = 'CON_USUARIO_CAD'
    end
    object CdsContatosCON_DTALTE: TDateField
      FieldName = 'CON_DTALTE'
    end
    object CdsContatosCON_HOALTE: TStringField
      FieldName = 'CON_HOALTE'
      FixedChar = True
      Size = 5
    end
    object CdsContatosCON_USUARIO_ALT: TIntegerField
      FieldName = 'CON_USUARIO_ALT'
    end
  end
  object DspBairros: TDataSetProvider
    DataSet = SdsBairros
    OnGetTableName = DspBairrosGetTableName
    Left = 88
    Top = 149
  end
  object DspClientes: TDataSetProvider
    DataSet = SdsClientes
    OnGetTableName = DspClientesGetTableName
    Left = 88
    Top = 213
  end
  object DspContatos: TDataSetProvider
    DataSet = SdsContatos
    OnGetTableName = DspContatosGetTableName
    Left = 88
    Top = 277
  end
  object SdsAtividades: TSQLDataSet
    CommandText = 'select * from ATIVIDADES order by ATI_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 16
    Top = 341
    object SdsAtividadesATI_CODIGO: TIntegerField
      FieldName = 'ATI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SdsAtividadesATI_NOME: TStringField
      FieldName = 'ATI_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object DspAtividades: TDataSetProvider
    DataSet = SdsAtividades
    OnGetTableName = DspAtividadesGetTableName
    Left = 104
    Top = 332
  end
  object CdsAtividades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspAtividades'
    Left = 160
    Top = 340
    object CdsAtividadesATI_CODIGO: TIntegerField
      FieldName = 'ATI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object CdsAtividadesATI_NOME: TStringField
      FieldName = 'ATI_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object DsAtividades: TDataSource
    AutoEdit = False
    DataSet = CdsAtividades
    Left = 232
    Top = 340
  end
  object CdsConfig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspConfig'
    Left = 472
    Top = 21
    object CdsConfigCFG_EMPRESA: TIntegerField
      FieldName = 'CFG_EMPRESA'
    end
    object CdsConfigCFG_CLIENTE: TIntegerField
      FieldName = 'CFG_CLIENTE'
    end
    object CdsConfigCFG_FORNECEDOR: TIntegerField
      FieldName = 'CFG_FORNECEDOR'
    end
    object CdsConfigCFG_CIDADE: TIntegerField
      FieldName = 'CFG_CIDADE'
    end
    object CdsConfigCGF_BAIRRO: TIntegerField
      FieldName = 'CGF_BAIRRO'
    end
    object CdsConfigCFG_CARGO: TIntegerField
      FieldName = 'CFG_CARGO'
    end
    object CdsConfigCFG_SITUACAO: TIntegerField
      FieldName = 'CFG_SITUACAO'
    end
    object CdsConfigCFG_ATIVIDADE: TIntegerField
      FieldName = 'CFG_ATIVIDADE'
    end
    object CdsConfigCFG_CONTATO: TIntegerField
      FieldName = 'CFG_CONTATO'
    end
    object CdsConfigCFG_PRODUTO: TIntegerField
      FieldName = 'CFG_PRODUTO'
    end
    object CdsConfigCFG_SECAO: TIntegerField
      FieldName = 'CFG_SECAO'
    end
    object CdsConfigCFG_SUBSECAO: TIntegerField
      FieldName = 'CFG_SUBSECAO'
    end
    object CdsConfigCFG_TRIBUTACAO: TIntegerField
      FieldName = 'CFG_TRIBUTACAO'
    end
    object CdsConfigCFG_ENTRADA: TIntegerField
      FieldName = 'CFG_ENTRADA'
    end
    object CdsConfigCFG_FUNCIONARIO: TIntegerField
      FieldName = 'CFG_FUNCIONARIO'
    end
    object CdsConfigCFG_RECEBIMENTO: TIntegerField
      FieldName = 'CFG_RECEBIMENTO'
    end
    object CdsConfigCFG_MODALIDADE: TIntegerField
      FieldName = 'CFG_MODALIDADE'
    end
    object CdsConfigCFG_NATUREZA: TIntegerField
      FieldName = 'CFG_NATUREZA'
    end
    object CdsConfigCFG_CREDITO: TIntegerField
      FieldName = 'CFG_CREDITO'
    end
    object CdsConfigCFG_SEQUENCIA: TIntegerField
      FieldName = 'CFG_SEQUENCIA'
    end
    object CdsConfigCFG_CAIXA: TIntegerField
      FieldName = 'CFG_CAIXA'
    end
    object CdsConfigCFG_USUARIO: TIntegerField
      FieldName = 'CFG_USUARIO'
    end
    object CdsConfigCFG_VENDA: TIntegerField
      FieldName = 'CFG_VENDA'
    end
    object CdsConfigCFG_NATUREZAVENDA: TIntegerField
      FieldName = 'CFG_NATUREZAVENDA'
    end
    object CdsConfigCFG_IDDERIVADOS: TIntegerField
      FieldName = 'CFG_IDDERIVADOS'
    end
    object CdsConfigCFG_ABATE: TIntegerField
      FieldName = 'CFG_ABATE'
    end
    object CdsConfigCFG_PERDAS: TIntegerField
      FieldName = 'CFG_PERDAS'
    end
    object CdsConfigCFG_IDPERDA: TIntegerField
      FieldName = 'CFG_IDPERDA'
    end
    object CdsConfigCFG_HISTORICOPERDA: TIntegerField
      FieldName = 'CFG_HISTORICOPERDA'
    end
    object CdsConfigCFG_TRANSFERENCIA: TIntegerField
      FieldName = 'CFG_TRANSFERENCIA'
    end
    object CdsConfigCFG_LOJAPADRAO: TIntegerField
      FieldName = 'CFG_LOJAPADRAO'
    end
    object CdsConfigCFG_IMAGEMLOGO: TBlobField
      FieldName = 'CFG_IMAGEMLOGO'
    end
    object CdsConfigCFG_IMPRESSORA: TIntegerField
      FieldName = 'CFG_IMPRESSORA'
    end
    object CdsConfigCFG_FLVENDEDOR: TStringField
      FieldName = 'CFG_FLVENDEDOR'
      FixedChar = True
      Size = 1
    end
    object CdsConfigCFG_SEQPAGAR: TIntegerField
      FieldName = 'CFG_SEQPAGAR'
    end
    object CdsConfigCFG_DATATUAL: TDateField
      FieldName = 'CFG_DATATUAL'
    end
    object CdsConfigCFG_NMNATUREZA: TStringField
      FieldKind = fkLookup
      FieldName = 'CFG_NMNATUREZA'
      LookupDataSet = dmConsultas.cdsNatureza
      LookupKeyFields = 'NAT_CODIGO'
      LookupResultField = 'NAT_NOME'
      KeyFields = 'CFG_NATUREZAVENDA'
      Size = 40
      Lookup = True
    end
    object CdsConfigCFG_SEQRECEBER: TIntegerField
      FieldName = 'CFG_SEQRECEBER'
    end
    object CdsConfigCFG_ETIQUETAPRODUTO: TIntegerField
      FieldName = 'CFG_ETIQUETAPRODUTO'
    end
    object CdsConfigCFG_PADRAOBARRAS: TStringField
      Alignment = taRightJustify
      FieldName = 'CFG_PADRAOBARRAS'
      FixedChar = True
      Size = 1
    end
    object CdsConfigCFG_MOTIVODEVOLUCAO: TIntegerField
      FieldName = 'CFG_MOTIVODEVOLUCAO'
    end
    object CdsConfigCFG_FLVENDAESTOQUE: TStringField
      FieldName = 'CFG_FLVENDAESTOQUE'
      FixedChar = True
      Size = 1
    end
    object CdsConfigCFG_FLLOTE: TStringField
      FieldName = 'CFG_FLLOTE'
      FixedChar = True
      Size = 1
    end
    object CdsConfigCFG_FLCUPOMVENDA: TStringField
      FieldName = 'CFG_FLCUPOMVENDA'
      FixedChar = True
      Size = 1
    end
    object CdsConfigCFG_CDBARRAS: TStringField
      FieldName = 'CFG_CDBARRAS'
      FixedChar = True
      Size = 13
    end
    object CdsConfigCFG_MENSAGEM_CUPOM: TMemoField
      FieldName = 'CFG_MENSAGEM_CUPOM'
      BlobType = ftMemo
    end
    object CdsConfigCFG_EMAIL: TStringField
      FieldName = 'CFG_EMAIL'
      Size = 50
    end
    object CdsConfigCFG_SMTP_EMAIL: TStringField
      FieldName = 'CFG_SMTP_EMAIL'
      Size = 40
    end
    object CdsConfigCFG_COR: TIntegerField
      FieldName = 'CFG_COR'
    end
    object CdsConfigCFG_TABPRECO: TIntegerField
      FieldName = 'CFG_TABPRECO'
    end
    object CdsConfigCFG_TIPOCLIENTE: TIntegerField
      FieldName = 'CFG_TIPOCLIENTE'
    end
    object CdsConfigCFG_REGIAO: TIntegerField
      FieldName = 'CFG_REGIAO'
    end
    object CdsConfigCFG_ORCAMENTO: TIntegerField
      FieldName = 'CFG_ORCAMENTO'
    end
    object CdsConfigCFG_CEDENTE: TIntegerField
      FieldName = 'CFG_CEDENTE'
    end
    object CdsConfigCFG_MODELO_BOLETO: TIntegerField
      FieldName = 'CFG_MODELO_BOLETO'
    end
    object CdsConfigCFG_MENSAGEM_BOLETO: TStringField
      FieldName = 'CFG_MENSAGEM_BOLETO'
      Size = 50
    end
    object CdsConfigCFG_LOCAL_PAGAMENTO: TStringField
      FieldName = 'CFG_LOCAL_PAGAMENTO'
      Size = 50
    end
    object CdsConfigCFG_IMAGEM_BOLETO: TBlobField
      FieldName = 'CFG_IMAGEM_BOLETO'
    end
    object CdsConfigCFG_INSTRUCOES: TMemoField
      FieldName = 'CFG_INSTRUCOES'
      BlobType = ftMemo
    end
    object CdsConfigCFG_CEDENTE_ATUAL: TIntegerField
      FieldName = 'CFG_CEDENTE_ATUAL'
    end
    object CdsConfigCFG_CONTAS_SALDO: TIntegerField
      FieldName = 'CFG_CONTAS_SALDO'
    end
    object CdsConfigCFG_CONTA_CAIXA: TIntegerField
      FieldName = 'CFG_CONTA_CAIXA'
    end
    object CdsConfigCFG_NMCONTA: TStringField
      FieldKind = fkLookup
      FieldName = 'CFG_NMCONTA'
      LookupDataSet = dmRelatorios.cdsContaSaldo
      LookupKeyFields = 'CGS_CODIGO'
      LookupResultField = 'CGS_DESCRICAO'
      KeyFields = 'CFG_CONTA_CAIXA'
      Size = 30
      Lookup = True
    end
    object CdsConfigCFG_NMCEDENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'CFG_NMCEDENTE'
      LookupDataSet = dmRelatorios.cdsCedentes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CEDENTE_CODIGO'
      KeyFields = 'CFG_CEDENTE_ATUAL'
      Size = 30
      Lookup = True
    end
    object CdsConfigCFG_PECOMI: TBCDField
      FieldName = 'CFG_PECOMI'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
    object CdsConfigCFG_PERPIS: TBCDField
      FieldName = 'CFG_PERPIS'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
    object CdsConfigCFG_PECOFI: TBCDField
      FieldName = 'CFG_PECOFI'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
    object CdsConfigCFG_PEIPMF: TBCDField
      FieldName = 'CFG_PEIPMF'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
    object CdsConfigCFG_FLJURO: TIntegerField
      FieldName = 'CFG_FLJURO'
    end
    object CdsConfigCFG_TRANSPORTADORA: TIntegerField
      FieldName = 'CFG_TRANSPORTADORA'
    end
    object CdsConfigCFG_TELA_PEDIDO: TIntegerField
      FieldName = 'CFG_TELA_PEDIDO'
    end
    object CdsConfigCFG_PLANO_PG: TIntegerField
      FieldName = 'CFG_PLANO_PG'
    end
    object CdsConfigCFG_ARQUIVO_PEDIDO: TStringField
      FieldName = 'CFG_ARQUIVO_PEDIDO'
      Size = 120
    end
    object CdsConfigCFG_EMAIL_AUTENTICACAO: TStringField
      FieldName = 'CFG_EMAIL_AUTENTICACAO'
      FixedChar = True
      Size = 1
    end
    object CdsConfigCFG_EMAIL_PORTA: TIntegerField
      FieldName = 'CFG_EMAIL_PORTA'
    end
    object CdsConfigCFG_EMAIL_PASSWORD: TStringField
      FieldName = 'CFG_EMAIL_PASSWORD'
    end
    object CdsConfigCFG_MENS_RODAPE_PEDIDO: TMemoField
      FieldName = 'CFG_MENS_RODAPE_PEDIDO'
      BlobType = ftMemo
    end
    object CdsConfigCFG_MENS_RODAPE: TStringField
      FieldName = 'CFG_MENS_RODAPE'
      Size = 200
    end
    object CdsConfigCFG_VERIFICA_RAZAO: TStringField
      FieldName = 'CFG_VERIFICA_RAZAO'
      FixedChar = True
      Size = 1
    end
    object CdsConfigCFG_EMAIL_FROM: TStringField
      FieldName = 'CFG_EMAIL_FROM'
      Size = 50
    end
    object CdsConfigCFG_FLVENDEDOR_ITEM_VENDA: TStringField
      FieldName = 'CFG_FLVENDEDOR_ITEM_VENDA'
      FixedChar = True
      Size = 1
    end
    object CdsConfigCFG_FLMESA: TStringField
      FieldName = 'CFG_FLMESA'
      FixedChar = True
      Size = 1
    end
    object CdsConfigCFG_MESA: TIntegerField
      FieldName = 'CFG_MESA'
    end
    object CdsConfigCFG_QTMESAS: TIntegerField
      FieldName = 'CFG_QTMESAS'
    end
    object CdsConfigCFG_TELEENTEGA: TIntegerField
      FieldName = 'CFG_TELEENTEGA'
    end
    object CdsConfigCFG_SEQUENCIA_SERVICO: TIntegerField
      FieldName = 'CFG_SEQUENCIA_SERVICO'
    end
    object CdsConfigCFG_FLFECHAR_ORCAMENTO: TStringField
      FieldName = 'CFG_FLFECHAR_ORCAMENTO'
      FixedChar = True
      Size = 1
    end
    object CdsConfigCFG_TAXA_SERVICO: TBCDField
      FieldName = 'CFG_TAXA_SERVICO'
      DisplayFormat = '##0.#0'
      Precision = 9
      Size = 2
    end
    object CdsConfigCFG_DDD_PADRAO: TStringField
      FieldName = 'CFG_DDD_PADRAO'
      FixedChar = True
      Size = 2
    end
    object CdsConfigCFG_SCREEN_WIDTH: TIntegerField
      FieldName = 'CFG_SCREEN_WIDTH'
    end
    object CdsConfigCFG_SCREEN_HEIGTH: TIntegerField
      FieldName = 'CFG_SCREEN_HEIGTH'
    end
    object CdsConfigCFG_FLMATRICIAL: TStringField
      FieldName = 'CFG_FLMATRICIAL'
      FixedChar = True
      Size = 1
    end
    object CdsConfigCFG_LINHA_RODAPE_CUPOM: TIntegerField
      FieldName = 'CFG_LINHA_RODAPE_CUPOM'
    end
    object CdsConfigCFG_MULTA: TFMTBCDField
      FieldName = 'CFG_MULTA'
      DisplayFormat = '##0.#0'
      EditFormat = '##0.#0'
      Precision = 18
      Size = 2
    end
    object CdsConfigCFG_JUROS: TFMTBCDField
      FieldName = 'CFG_JUROS'
      DisplayFormat = '##0.#0'
      EditFormat = '##0.#0'
      Precision = 18
      Size = 2
    end
    object CdsConfigCFG_GRUPO: TIntegerField
      FieldName = 'CFG_GRUPO'
    end
    object CdsConfigCFG_PASTA_RETORNO: TStringField
      FieldName = 'CFG_PASTA_RETORNO'
      Size = 80
    end
    object CdsConfigCFG_NRFATURA: TIntegerField
      FieldName = 'CFG_NRFATURA'
    end
    object CdsConfigCFG_SEQTAREFAUSUARIOS: TIntegerField
      FieldName = 'CFG_SEQTAREFAUSUARIOS'
    end
    object CdsConfigCFG_RENEGOCIACAO: TIntegerField
      FieldName = 'CFG_RENEGOCIACAO'
    end
    object CdsConfigCFG_CODELETROS: TIntegerField
      FieldName = 'CFG_CODELETROS'
    end
    object CdsConfigCFG_CDMOVBOX: TIntegerField
      FieldName = 'CFG_CDMOVBOX'
    end
  end
  object DsConfig: TDataSource
    AutoEdit = False
    DataSet = CdsConfig
    Left = 688
    Top = 77
  end
  object DspConfig: TDataSetProvider
    DataSet = SdsConfig
    OnGetTableName = DspConfigGetTableName
    Left = 432
    Top = 37
  end
  object SdsConfig: TSQLDataSet
    CommandText = 'select * from CONFIG'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 360
    Top = 21
  end
  object DsSituacao: TDataSource
    AutoEdit = False
    DataSet = CdsSituacao
    Left = 549
    Top = 101
  end
  object CdsSituacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSituacao'
    Left = 485
    Top = 101
    object CdsSituacaoSIT_CODIGO: TIntegerField
      FieldName = 'SIT_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object CdsSituacaoSIT_NOME: TStringField
      FieldName = 'SIT_NOME'
      Size = 40
    end
  end
  object DspSituacao: TDataSetProvider
    DataSet = SdsSituacao
    OnGetTableName = DspSituacaoGetTableName
    Left = 421
    Top = 101
  end
  object SdsSituacao: TSQLDataSet
    CommandText = 'select * from SITUACAO order by SIT_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 352
    Top = 102
    object SdsSituacaoSIT_CODIGO: TIntegerField
      FieldName = 'SIT_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SdsSituacaoSIT_NOME: TStringField
      FieldName = 'SIT_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object DsCargos: TDataSource
    AutoEdit = False
    DataSet = CdsCargos
    Left = 512
    Top = 165
  end
  object CdsCargos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCargos'
    Left = 456
    Top = 165
    object CdsCargosCAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object CdsCargosCAR_NOME: TStringField
      FieldName = 'CAR_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object DspCargos: TDataSetProvider
    DataSet = SdsCargos
    OnGetTableName = DspCargosGetTableName
    Left = 400
    Top = 165
  end
  object SdsCargos: TSQLDataSet
    CommandText = 'select * from CARGOS order by CAR_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 344
    Top = 165
    object SdsCargosCAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SdsCargosCAR_NOME: TStringField
      FieldName = 'CAR_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object SqlAdmin: TSQLConnection
    ConnectionName = 'InfoFinanceiro'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      
        'Database=D:\Sistemas\ShoppingCidade\info_financeiro\dados\ADMIN.' +
        'FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet=win1252'
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'C:\Windows\System32\fbclient.dll'
    BeforeConnect = SqlAdminBeforeConnect
    Connected = True
    Left = 304
    Top = 29
  end
  object dstFornecedor: TSQLDataSet
    CommandText = 
      'Select * from FORNECEDORES Where (FOR_CODIGO = :pCODIGO)'#13#10'order ' +
      'by FOR_FANTASIA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 344
    Top = 221
    object dstFornecedorFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstFornecedorFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dstFornecedorFOR_RAZAO: TStringField
      FieldName = 'FOR_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstFornecedorFOR_CNPJ: TStringField
      FieldName = 'FOR_CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstFornecedorFOR_INSCESTADUAL: TStringField
      FieldName = 'FOR_INSCESTADUAL'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstFornecedorFOR_ENDERECO: TStringField
      FieldName = 'FOR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstFornecedorFOR_NUMERO: TIntegerField
      FieldName = 'FOR_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_CEP: TStringField
      FieldName = 'FOR_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstFornecedorFOR_BAIRRO: TStringField
      FieldName = 'FOR_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFornecedorFOR_CIDADE: TStringField
      FieldName = 'FOR_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFornecedorFOR_UF: TStringField
      FieldName = 'FOR_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFornecedorFOR_FONE1: TStringField
      FieldName = 'FOR_FONE1'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstFornecedorFOR_FONE2: TStringField
      FieldName = 'FOR_FONE2'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstFornecedorFOR_OPERACAO: TIntegerField
      FieldName = 'FOR_OPERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_CONTA: TIntegerField
      FieldName = 'FOR_CONTA'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_CONTATO1: TStringField
      FieldName = 'FOR_CONTATO1'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstFornecedorFOR_CARGO1: TStringField
      FieldName = 'FOR_CARGO1'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_FONECON1: TStringField
      FieldName = 'FOR_FONECON1'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstFornecedorFOR_CONTATO2: TStringField
      FieldName = 'FOR_CONTATO2'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstFornecedorFOR_CARGO2: TStringField
      FieldName = 'FOR_CARGO2'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_FONECON2: TStringField
      FieldName = 'FOR_FONECON2'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstFornecedorFOR_SITE: TStringField
      FieldName = 'FOR_SITE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstFornecedorFOR_EMAIL: TStringField
      FieldName = 'FOR_EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstFornecedorFOR_CDBANC: TStringField
      FieldName = 'FOR_CDBANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstFornecedorFOR_AGENCIA: TStringField
      FieldName = 'FOR_AGENCIA'
      FixedChar = True
      Size = 4
    end
    object dstFornecedorFOR_DTCADA: TDateField
      FieldName = 'FOR_DTCADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_HOCADA: TStringField
      FieldName = 'FOR_HOCADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstFornecedorFOR_USUARIO_CAD: TIntegerField
      FieldName = 'FOR_USUARIO_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_DTALTE: TDateField
      FieldName = 'FOR_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_HOALTE: TStringField
      FieldName = 'FOR_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstFornecedorFOR_USUARIO_ALT: TIntegerField
      FieldName = 'FOR_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_FAX: TStringField
      FieldName = 'FOR_FAX'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstFornecedorFOR_PERCENTUAL_IPI: TFMTBCDField
      FieldName = 'FOR_PERCENTUAL_IPI'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
  end
  object dspFornecedor: TDataSetProvider
    DataSet = dstFornecedor
    OnGetTableName = dspFornecedorGetTableName
    Left = 420
    Top = 221
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspFornecedor'
    Left = 496
    Top = 221
    object cdsFornecedorFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object cdsFornecedorFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsFornecedorFOR_RAZAO: TStringField
      FieldName = 'FOR_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsFornecedorFOR_CNPJ: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_CNPJ'
      ProviderFlags = [pfInUpdate]
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsFornecedorFOR_INSCESTADUAL: TStringField
      FieldName = 'FOR_INSCESTADUAL'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsFornecedorFOR_ENDERECO: TStringField
      FieldName = 'FOR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsFornecedorFOR_NUMERO: TIntegerField
      FieldName = 'FOR_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFornecedorFOR_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object cdsFornecedorFOR_BAIRRO: TStringField
      FieldName = 'FOR_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsFornecedorFOR_CIDADE: TStringField
      FieldName = 'FOR_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsFornecedorFOR_UF: TStringField
      FieldName = 'FOR_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsFornecedorFOR_FONE1: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_FONE1'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsFornecedorFOR_FONE2: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_FONE2'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsFornecedorFOR_OPERACAO: TIntegerField
      DisplayWidth = 3
      FieldName = 'FOR_OPERACAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
      EditFormat = '000'
    end
    object cdsFornecedorFOR_CONTA: TIntegerField
      FieldName = 'FOR_CONTA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0000000000'
    end
    object cdsFornecedorFOR_CONTATO1: TStringField
      FieldName = 'FOR_CONTATO1'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsFornecedorFOR_CARGO1: TStringField
      FieldName = 'FOR_CARGO1'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFornecedorFOR_FONECON1: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_FONECON1'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsFornecedorFOR_CONTATO2: TStringField
      FieldName = 'FOR_CONTATO2'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsFornecedorFOR_CARGO2: TStringField
      FieldName = 'FOR_CARGO2'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFornecedorFOR_FONECON2: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_FONECON2'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsFornecedorFOR_SITE: TStringField
      FieldName = 'FOR_SITE'
      Size = 60
    end
    object cdsFornecedorFOR_EMAIL: TStringField
      FieldName = 'FOR_EMAIL'
      Size = 60
    end
    object cdsFornecedorFOR_CDBANC: TStringField
      FieldName = 'FOR_CDBANC'
      FixedChar = True
      Size = 3
    end
    object cdsFornecedorFOR_NMBANC: TStringField
      FieldKind = fkLookup
      FieldName = 'FOR_NMBANC'
      LookupDataSet = cdsBancos
      LookupKeyFields = 'BAN_CODIGO'
      LookupResultField = 'BAN_NOME'
      KeyFields = 'FOR_CDBANC'
      Size = 40
      Lookup = True
    end
    object cdsFornecedorFOR_AGENCIA: TStringField
      FieldName = 'FOR_AGENCIA'
      FixedChar = True
      Size = 4
    end
    object cdsFornecedorFOR_DTCADA: TDateField
      FieldName = 'FOR_DTCADA'
    end
    object cdsFornecedorFOR_HOCADA: TStringField
      FieldName = 'FOR_HOCADA'
      FixedChar = True
      Size = 5
    end
    object cdsFornecedorFOR_USUARIO_CAD: TIntegerField
      FieldName = 'FOR_USUARIO_CAD'
    end
    object cdsFornecedorFOR_DTALTE: TDateField
      FieldName = 'FOR_DTALTE'
    end
    object cdsFornecedorFOR_HOALTE: TStringField
      FieldName = 'FOR_HOALTE'
      FixedChar = True
      Size = 5
    end
    object cdsFornecedorFOR_USUARIO_ALT: TIntegerField
      FieldName = 'FOR_USUARIO_ALT'
    end
    object cdsFornecedorFOR_FAX: TStringField
      FieldName = 'FOR_FAX'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsFornecedorFOR_PERCENTUAL_IPI: TFMTBCDField
      FieldName = 'FOR_PERCENTUAL_IPI'
      DisplayFormat = '##0.#0'
      EditFormat = '##0.#0'
      Precision = 18
      Size = 2
    end
  end
  object dsFornecedor: TDataSource
    AutoEdit = False
    DataSet = cdsFornecedor
    Left = 568
    Top = 221
  end
  object dstBancos: TSQLDataSet
    CommandText = 'Select * from BANCOS'#13#10'order by BAN_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 344
    Top = 269
    object dstBancosBAN_CODIGO: TStringField
      FieldName = 'BAN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object dstBancosBAN_NOME: TStringField
      FieldName = 'BAN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object dspBancos: TDataSetProvider
    DataSet = dstBancos
    OnGetTableName = dspBancosGetTableName
    Left = 416
    Top = 269
  end
  object cdsBancos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBancos'
    Left = 488
    Top = 269
    object cdsBancosBAN_CODIGO: TStringField
      Alignment = taRightJustify
      FieldName = 'BAN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsBancosBAN_NOME: TStringField
      FieldName = 'BAN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object dstUnidades: TSQLDataSet
    CommandText = 
      'select UNI_CODIGO, UNI_DESCRICAO from UNIDADES'#13#10'order by UNI_DES' +
      'CRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 344
    Top = 317
    object dstUnidadesUNI_CODIGO: TStringField
      FieldName = 'UNI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object dstUnidadesUNI_DESCRICAO: TStringField
      FieldName = 'UNI_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dspUnidades: TDataSetProvider
    DataSet = dstUnidades
    OnGetTableName = dspUnidadesGetTableName
    Left = 424
    Top = 317
  end
  object cdsUnidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidades'
    Left = 496
    Top = 317
    object cdsUnidadesUNI_CODIGO: TStringField
      Alignment = taRightJustify
      FieldName = 'UNI_CODIGO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsUnidadesUNI_DESCRICAO: TStringField
      FieldName = 'UNI_DESCRICAO'
      Size = 30
    end
  end
  object dsSecao: TDataSource
    AutoEdit = False
    DataSet = cdsSecao
    Left = 524
    Top = 367
  end
  object dstSecao: TSQLDataSet
    CommandText = 'select * from SECAO order by SEC_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 353
    Top = 371
    object dstSecaoSEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstSecaoSEC_DESCRICAO: TStringField
      FieldName = 'SEC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dspSecao: TDataSetProvider
    DataSet = dstSecao
    OnGetTableName = dspSecaoGetTableName
    Left = 417
    Top = 367
  end
  object cdsSecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSecao'
    Left = 473
    Top = 367
    object cdsSecaoSEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object cdsSecaoSEC_DESCRICAO: TStringField
      FieldName = 'SEC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dstSubSecao: TSQLDataSet
    CommandText = 'select * from SUBSECAO order by SUB_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 200
    Top = 381
    object dstSubSecaoSUB_CODIGO: TIntegerField
      FieldName = 'SUB_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstSubSecaoSUB_DESCRICAO: TStringField
      FieldName = 'SUB_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstSubSecaoSEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
    end
    object dstSubSecaoSUB_PEAVISTA: TBCDField
      FieldName = 'SUB_PEAVISTA'
      Precision = 9
      Size = 2
    end
    object dstSubSecaoSUB_PEAPRAZO: TBCDField
      FieldName = 'SUB_PEAPRAZO'
      Precision = 9
      Size = 2
    end
  end
  object dspSubSecao: TDataSetProvider
    DataSet = dstSubSecao
    OnGetTableName = dspSubSecaoGetTableName
    Left = 200
    Top = 421
  end
  object cdsSubSecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSubSecao'
    Left = 256
    Top = 389
    object cdsSubSecaoSUB_CODIGO: TIntegerField
      FieldName = 'SUB_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object cdsSubSecaoSUB_DESCRICAO: TStringField
      FieldName = 'SUB_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsSubSecaoSEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
    end
    object cdsSubSecaoSEC_NOME: TStringField
      FieldKind = fkLookup
      FieldName = 'SEC_NOME'
      LookupDataSet = cdsSecao
      LookupKeyFields = 'SEC_CODIGO'
      LookupResultField = 'SEC_DESCRICAO'
      KeyFields = 'SEC_CODIGO'
      Size = 30
      Lookup = True
    end
    object cdsSubSecaoSUB_PEAVISTA: TBCDField
      FieldName = 'SUB_PEAVISTA'
      Precision = 9
      Size = 2
    end
    object cdsSubSecaoSUB_PEAPRAZO: TBCDField
      FieldName = 'SUB_PEAPRAZO'
      Precision = 9
      Size = 2
    end
  end
  object dsSubSecao: TDataSource
    AutoEdit = False
    DataSet = cdsSubSecao
    Left = 296
    Top = 389
  end
  object dstTributacao: TSQLDataSet
    CommandText = 'select * from TRIBUTACAO order by TRI_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 344
    Top = 413
    object dstTributacaoTRI_CODIGO: TIntegerField
      FieldName = 'TRI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstTributacaoTRI_DESCRICAO: TStringField
      FieldName = 'TRI_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
    end
    object dstTributacaoTRI_INDICE_ECF: TStringField
      FieldName = 'TRI_INDICE_ECF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstTributacaoTRI_ICMS: TBCDField
      FieldName = 'TRI_ICMS'
      Precision = 9
      Size = 2
    end
    object dstTributacaoTRI_PERCETUAL: TBCDField
      FieldName = 'TRI_PERCETUAL'
      Precision = 9
      Size = 2
    end
  end
  object dspTributacao: TDataSetProvider
    DataSet = dstTributacao
    OnGetTableName = dspTributacaoGetTableName
    Left = 424
    Top = 413
  end
  object cdsTributacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTributacao'
    Left = 496
    Top = 413
    object cdsTributacaoTRI_CODIGO: TIntegerField
      FieldName = 'TRI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsTributacaoTRI_DESCRICAO: TStringField
      FieldName = 'TRI_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
    end
    object cdsTributacaoTRI_INDICE_ECF: TStringField
      FieldName = 'TRI_INDICE_ECF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object cdsTributacaoTRI_ICMS: TBCDField
      FieldName = 'TRI_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsTributacaoTRI_PERCETUAL: TBCDField
      FieldName = 'TRI_PERCETUAL'
      Precision = 9
      Size = 2
    end
  end
  object dstProdutos: TSQLDataSet
    CommandText = 'Select * from PRODUTOS Where (PRO_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = SqlAdmin
    Left = 8
    Top = 437
    object dstProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object dstProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstProdutosPRO_APLICACAO: TStringField
      FieldName = 'PRO_APLICACAO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstProdutosFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosPRO_FRACAO: TIntegerField
      FieldName = 'PRO_FRACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosSEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosSUB_CODIGO: TIntegerField
      FieldName = 'SUB_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosPRO_VLCOMPRA: TFMTBCDField
      FieldName = 'PRO_VLCOMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_VLCUSTO: TFMTBCDField
      FieldName = 'PRO_VLCUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_VLFRACAO: TFMTBCDField
      FieldName = 'PRO_VLFRACAO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosTRI_CODIGO: TIntegerField
      FieldName = 'TRI_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosPRO_REDUCAOICMS: TFMTBCDField
      FieldName = 'PRO_REDUCAOICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_TAXAS: TFMTBCDField
      FieldName = 'PRO_TAXAS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_IPI: TFMTBCDField
      FieldName = 'PRO_IPI'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_FRETE: TFMTBCDField
      FieldName = 'PRO_FRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_COMISSIONADO: TStringField
      FieldName = 'PRO_COMISSIONADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstProdutosPRO_DTCADASTRO: TDateField
      FieldName = 'PRO_DTCADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosPRO_DTALTERACAO: TDateField
      FieldName = 'PRO_DTALTERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosPRO_FOTO: TBlobField
      FieldName = 'PRO_FOTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosPRO_OBSERVACAO: TMemoField
      FieldName = 'PRO_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstProdutosSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosUNI_CODIGO: TStringField
      FieldName = 'UNI_CODIGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstProdutosUNI_ARMAZENAMENTO: TStringField
      FieldName = 'UNI_ARMAZENAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstProdutosPRO_LUCROBRUTO: TFMTBCDField
      FieldName = 'PRO_LUCROBRUTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_LUCROLIQUIDO: TFMTBCDField
      FieldName = 'PRO_LUCROLIQUIDO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_CONTROLELOTE: TStringField
      FieldName = 'PRO_CONTROLELOTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstProdutosPRO_CODIGOBAIXA: TStringField
      FieldName = 'PRO_CODIGOBAIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object dstProdutosPRO_HOREAJUTE: TStringField
      FieldName = 'PRO_HOREAJUTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstProdutosPRO_USUARIO_REAJUSTE: TIntegerField
      FieldName = 'PRO_USUARIO_REAJUSTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosPRO_VALOR_ANTERIOR: TFMTBCDField
      FieldName = 'PRO_VALOR_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_COR: TIntegerField
      FieldName = 'PRO_COR'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstProdutosPRO_FLPROD: TStringField
      FieldName = 'PRO_FLPROD'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstProdutosPRO_USUARIO_CAD: TIntegerField
      FieldName = 'PRO_USUARIO_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosPRO_HOCADA: TStringField
      FieldName = 'PRO_HOCADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstProdutosPRO_USUARIO_ALT: TIntegerField
      FieldName = 'PRO_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosPRO_HOALTE: TStringField
      FieldName = 'PRO_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstProdutosPRO_LIMDESCONTO: TBCDField
      FieldName = 'PRO_LIMDESCONTO'
      Precision = 9
      Size = 2
    end
    object dstProdutosPRO_ANTECIPACAO_ICMS: TBCDField
      FieldName = 'PRO_ANTECIPACAO_ICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspProdutosGetTableName
    Left = 88
    Top = 437
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspProdutos'
    Left = 160
    Top = 437
    object cdsProdutosPRO_CODIGO: TStringField
      DisplayWidth = 13
      FieldName = 'PRO_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_BARRAS: TStringField
      Alignment = taRightJustify
      FieldName = 'PRO_BARRAS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsProdutosPRO_APLICACAO: TStringField
      FieldName = 'PRO_APLICACAO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsProdutosFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '00000'
    end
    object cdsProdutosPRO_FRACAO: TIntegerField
      FieldName = 'PRO_FRACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosSEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
    end
    object cdsProdutosSUB_CODIGO: TIntegerField
      FieldName = 'SUB_CODIGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
    end
    object cdsProdutosPRO_VLCOMPRA: TFMTBCDField
      FieldName = 'PRO_VLCOMPRA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_VLCUSTO: TFMTBCDField
      FieldName = 'PRO_VLCUSTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_VLFRACAO: TFMTBCDField
      FieldName = 'PRO_VLFRACAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosTRI_CODIGO: TIntegerField
      FieldName = 'TRI_CODIGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '00'
    end
    object cdsProdutosPRO_REDUCAOICMS: TFMTBCDField
      FieldName = 'PRO_REDUCAOICMS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_TAXAS: TFMTBCDField
      FieldName = 'PRO_TAXAS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_IPI: TFMTBCDField
      FieldName = 'PRO_IPI'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_FRETE: TFMTBCDField
      FieldName = 'PRO_FRETE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_COMISSIONADO: TStringField
      FieldName = 'PRO_COMISSIONADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsProdutosPRO_DTCADASTRO: TDateField
      Alignment = taRightJustify
      FieldName = 'PRO_DTCADASTRO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsProdutosPRO_DTALTERACAO: TDateField
      Alignment = taRightJustify
      FieldName = 'PRO_DTALTERACAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsProdutosPRO_FOTO: TBlobField
      FieldName = 'PRO_FOTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosPRO_OBSERVACAO: TMemoField
      FieldName = 'PRO_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object cdsProdutosSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosSEC_NOME: TStringField
      FieldKind = fkLookup
      FieldName = 'SEC_NOME'
      LookupDataSet = cdsSecao
      LookupKeyFields = 'SEC_CODIGO'
      LookupResultField = 'SEC_DESCRICAO'
      KeyFields = 'SEC_CODIGO'
      ProviderFlags = [pfInUpdate]
      Size = 30
      Lookup = True
    end
    object cdsProdutosSUB_NOME: TStringField
      FieldKind = fkLookup
      FieldName = 'SUB_NOME'
      LookupDataSet = cdsSubSecao
      LookupKeyFields = 'SUB_CODIGO'
      LookupResultField = 'SUB_DESCRICAO'
      KeyFields = 'SUB_CODIGO'
      ProviderFlags = [pfInUpdate]
      Size = 30
      Lookup = True
    end
    object cdsProdutosTRI_NOME: TStringField
      FieldKind = fkLookup
      FieldName = 'TRI_NOME'
      LookupDataSet = cdsTributacao
      LookupKeyFields = 'TRI_CODIGO'
      LookupResultField = 'TRI_DESCRICAO'
      KeyFields = 'TRI_CODIGO'
      ProviderFlags = [pfInUpdate]
      Lookup = True
    end
    object cdsProdutosUNI_CODIGO: TStringField
      Alignment = taRightJustify
      FieldName = 'UNI_CODIGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsProdutosUNI_ARMAZENAMENTO: TStringField
      Alignment = taRightJustify
      FieldName = 'UNI_ARMAZENAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsProdutosPRO_LUCROBRUTO: TFMTBCDField
      FieldName = 'PRO_LUCROBRUTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_LUCROLIQUIDO: TFMTBCDField
      FieldName = 'PRO_LUCROLIQUIDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_CONTROLELOTE: TStringField
      FieldName = 'PRO_CONTROLELOTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsProdutosPRO_CODIGOBAIXA: TStringField
      Alignment = taRightJustify
      FieldName = 'PRO_CODIGOBAIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_HOREAJUTE: TStringField
      FieldName = 'PRO_HOREAJUTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsProdutosPRO_USUARIO_REAJUSTE: TIntegerField
      FieldName = 'PRO_USUARIO_REAJUSTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosPRO_VALOR_ANTERIOR: TFMTBCDField
      FieldName = 'PRO_VALOR_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_COR: TIntegerField
      FieldName = 'PRO_COR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosPRO_NOMCOR: TStringField
      FieldKind = fkLookup
      FieldName = 'PRO_NOMCOR'
      LookupDataSet = dmConsultas.cdsCores
      LookupKeyFields = 'COR_CODIGO'
      LookupResultField = 'COR_DESCRICAO'
      KeyFields = 'PRO_COR'
      Lookup = True
    end
    object cdsProdutosPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsProdutosPRO_FLPROD: TStringField
      FieldName = 'PRO_FLPROD'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsProdutosPRO_USUARIO_CAD: TIntegerField
      FieldName = 'PRO_USUARIO_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosPRO_HOCADA: TStringField
      FieldName = 'PRO_HOCADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsProdutosPRO_USUARIO_ALT: TIntegerField
      FieldName = 'PRO_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosPRO_HOALTE: TStringField
      FieldName = 'PRO_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsProdutosPRO_LIMDESCONTO: TBCDField
      FieldName = 'PRO_LIMDESCONTO'
      Precision = 9
      Size = 2
    end
    object cdsProdutosPRO_ANTECIPACAO_ICMS: TBCDField
      FieldName = 'PRO_ANTECIPACAO_ICMS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '##0.#0'
      EditFormat = '##0.#0'
      Precision = 9
      Size = 2
    end
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = cdsProdutos
    Left = 240
    Top = 437
  end
  object dstBusca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 345
    Top = 461
  end
  object dspBusca: TDataSetProvider
    DataSet = dstBusca
    Left = 401
    Top = 461
  end
  object cdsBusca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBusca'
    Left = 457
    Top = 461
  end
  object dsBusca: TDataSource
    DataSet = cdsBusca
    Left = 513
    Top = 461
  end
  object dstEntrada: TSQLDataSet
    CommandText = 
      'select ENT_NUMERO, ENT_LOJA, FOR_CODIGO, ENT_DTPEDIDO, ENT_DTEMI' +
      'SSAO, ENT_DTRECEBIMENTO, CFO_CODIGO, ENT_NRNOTA, ENT_SERIENOTA, ' +
      'ENT_VALORMERCADORIA, ENT_TIPOFRETE, ENT_VALORFRETE, ENT_BASEICMS' +
      ', ENT_BASESUBSTITUICAO, ENT_VALORSUBSTITUICAO, ENT_VALORIPI, ENT' +
      '_VALORSEGURO, ENT_VALORDESPESAS, ENT_VALORNOTA, ENT_VALORDESCONT' +
      'O, ENT_SITUACAO, SEN_CODIGO from MERCADORIA Where (ENT_NUMERO = ' +
      ':pNUMERO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 8
    Top = 485
    object dstEntradaENT_NUMERO: TIntegerField
      FieldName = 'ENT_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstEntradaENT_LOJA: TIntegerField
      FieldName = 'ENT_LOJA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaENT_DTPEDIDO: TDateField
      FieldName = 'ENT_DTPEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaENT_DTEMISSAO: TDateField
      FieldName = 'ENT_DTEMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaENT_DTRECEBIMENTO: TDateField
      FieldName = 'ENT_DTRECEBIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaCFO_CODIGO: TStringField
      FieldName = 'CFO_CODIGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstEntradaENT_NRNOTA: TIntegerField
      FieldName = 'ENT_NRNOTA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaENT_SERIENOTA: TStringField
      FieldName = 'ENT_SERIENOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstEntradaENT_VALORMERCADORIA: TFMTBCDField
      FieldName = 'ENT_VALORMERCADORIA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaENT_TIPOFRETE: TStringField
      FieldName = 'ENT_TIPOFRETE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstEntradaENT_VALORFRETE: TFMTBCDField
      FieldName = 'ENT_VALORFRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaENT_BASEICMS: TFMTBCDField
      FieldName = 'ENT_BASEICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaENT_BASESUBSTITUICAO: TFMTBCDField
      FieldName = 'ENT_BASESUBSTITUICAO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaENT_VALORSUBSTITUICAO: TFMTBCDField
      FieldName = 'ENT_VALORSUBSTITUICAO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaENT_VALORIPI: TFMTBCDField
      FieldName = 'ENT_VALORIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaENT_VALORSEGURO: TFMTBCDField
      FieldName = 'ENT_VALORSEGURO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaENT_VALORDESPESAS: TFMTBCDField
      FieldName = 'ENT_VALORDESPESAS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaENT_VALORNOTA: TFMTBCDField
      FieldName = 'ENT_VALORNOTA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaENT_VALORDESCONTO: TFMTBCDField
      FieldName = 'ENT_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaENT_SITUACAO: TStringField
      FieldName = 'ENT_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstEntradaSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspEntrada: TDataSetProvider
    DataSet = dstEntrada
    Options = [poAllowCommandText]
    OnGetTableName = dspEntradaGetTableName
    Left = 88
    Top = 485
  end
  object cdsEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEntrada'
    Left = 281
    Top = 446
    object cdsEntradaENT_NUMERO: TIntegerField
      FieldName = 'ENT_NUMERO'
      Required = True
      DisplayFormat = '0000000000'
    end
    object cdsEntradaENT_LOJA: TIntegerField
      FieldName = 'ENT_LOJA'
    end
    object cdsEntradaEMP_NOME: TStringField
      FieldKind = fkLookup
      FieldName = 'EMP_NOME'
      LookupDataSet = CdsEmpresas
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'ENT_LOJA'
      Size = 40
      Lookup = True
    end
    object cdsEntradaFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
    end
    object cdsEntradaFOR_NOME: TStringField
      FieldKind = fkLookup
      FieldName = 'FOR_NOME'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FOR_CODIGO'
      LookupResultField = 'FOR_FANTASIA'
      KeyFields = 'FOR_CODIGO'
      Size = 40
      Lookup = True
    end
    object cdsEntradaENT_DTPEDIDO: TDateField
      Alignment = taRightJustify
      FieldName = 'ENT_DTPEDIDO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsEntradaENT_DTEMISSAO: TDateField
      Alignment = taRightJustify
      FieldName = 'ENT_DTEMISSAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsEntradaENT_DTRECEBIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'ENT_DTRECEBIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsEntradaCFO_CODIGO: TStringField
      FieldName = 'CFO_CODIGO'
      FixedChar = True
      Size = 4
    end
    object cdsEntradaENT_NRNOTA: TIntegerField
      FieldName = 'ENT_NRNOTA'
      DisplayFormat = '0000000000'
    end
    object cdsEntradaENT_SERIENOTA: TStringField
      FieldName = 'ENT_SERIENOTA'
      FixedChar = True
      Size = 2
    end
    object cdsEntradaENT_VALORMERCADORIA: TFMTBCDField
      FieldName = 'ENT_VALORMERCADORIA'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsEntradaENT_TIPOFRETE: TStringField
      FieldName = 'ENT_TIPOFRETE'
      FixedChar = True
      Size = 1
    end
    object cdsEntradaENT_VALORFRETE: TFMTBCDField
      FieldName = 'ENT_VALORFRETE'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsEntradaENT_BASEICMS: TFMTBCDField
      FieldName = 'ENT_BASEICMS'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsEntradaENT_BASESUBSTITUICAO: TFMTBCDField
      FieldName = 'ENT_BASESUBSTITUICAO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsEntradaENT_VALORSUBSTITUICAO: TFMTBCDField
      FieldName = 'ENT_VALORSUBSTITUICAO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsEntradaENT_VALORIPI: TFMTBCDField
      FieldName = 'ENT_VALORIPI'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsEntradaENT_VALORSEGURO: TFMTBCDField
      FieldName = 'ENT_VALORSEGURO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsEntradaENT_VALORDESPESAS: TFMTBCDField
      FieldName = 'ENT_VALORDESPESAS'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsEntradaENT_VALORNOTA: TFMTBCDField
      FieldName = 'ENT_VALORNOTA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsEntradaENT_VALORDESCONTO: TFMTBCDField
      FieldName = 'ENT_VALORDESCONTO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsEntradaENT_SITUACAO: TStringField
      FieldName = 'ENT_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsEntradaSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
    end
  end
  object dsEntrada: TDataSource
    DataSet = cdsEntrada
    Left = 240
    Top = 485
  end
  object dstEntradaProduto: TSQLDataSet
    CommandText = 
      'select ENP_NUMERO, PRO_CODIGO, '#13#10'(Select PRO_DESCRICAO from PROD' +
      'UTOS Where ENTRADAPRODUTO.PRO_CODIGO = PRODUTOS.PRO_CODIGO) AS P' +
      'RO_NOME, UNI_UNIDADE, (Select UNI_DESCRICAO  from UNIDADES Where' +
      ' ENTRADAPRODUTO.UNI_UNIDADE = UNIDADES.UNI_CODIGO) AS  UNI_DESCR' +
      'ICAO, ENP_QUANTIDADE, ENP_VALOR, ENP_IPI, ENP_ICMS, ENP_SUBTOTAL' +
      ' from ENTRADAPRODUTO '#13#10'Where (ENP_NUMERO = :pNUMERO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 65216
    Top = 685
    object dstEntradaProdutoENP_NUMERO: TIntegerField
      FieldName = 'ENP_NUMERO'
    end
    object dstEntradaProdutoPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      FixedChar = True
      Size = 13
    end
    object dstEntradaProdutoPRO_NOME: TStringField
      FieldName = 'PRO_NOME'
      Size = 60
    end
    object dstEntradaProdutoUNI_UNIDADE: TStringField
      FieldName = 'UNI_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstEntradaProdutoUNI_DESCRICAO: TStringField
      FieldName = 'UNI_DESCRICAO'
      Size = 30
    end
    object dstEntradaProdutoENP_QUANTIDADE: TFMTBCDField
      FieldName = 'ENP_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstEntradaProdutoENP_VALOR: TFMTBCDField
      FieldName = 'ENP_VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object dstEntradaProdutoENP_IPI: TFMTBCDField
      FieldName = 'ENP_IPI'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaProdutoENP_ICMS: TFMTBCDField
      FieldName = 'ENP_ICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradaProdutoENP_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ENP_TOTAL'
      currency = False
      Calculated = True
    end
    object dstEntradaProdutoENP_SUBTOTAL: TFMTBCDField
      FieldName = 'ENP_SUBTOTAL'
      Precision = 15
      Size = 2
    end
  end
  object dspEntradaProduto: TDataSetProvider
    DataSet = dstEntradaProduto
    Options = [poAllowCommandText]
    OnGetTableName = dspEntradaProdutoGetTableName
    Left = 152
    Top = 389
  end
  object cdsEntradaProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEntradaProduto'
    OnCalcFields = cdsEntradaProdutoCalcFields
    Left = 175
    Top = 487
    object cdsEntradaProdutoENP_NUMERO: TIntegerField
      FieldName = 'ENP_NUMERO'
    end
    object cdsEntradaProdutoPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      FixedChar = True
      Size = 13
    end
    object cdsEntradaProdutoPRO_NOME: TStringField
      FieldName = 'PRO_NOME'
      Size = 60
    end
    object cdsEntradaProdutoUNI_UNIDADE: TStringField
      FieldName = 'UNI_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsEntradaProdutoUNI_DESCRICAO: TStringField
      FieldName = 'UNI_DESCRICAO'
      Size = 30
    end
    object cdsEntradaProdutoENP_QUANTIDADE: TFMTBCDField
      FieldName = 'ENP_QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object cdsEntradaProdutoENP_VALOR: TFMTBCDField
      FieldName = 'ENP_VALOR'
      Precision = 15
      Size = 2
    end
    object cdsEntradaProdutoENP_IPI: TFMTBCDField
      FieldName = 'ENP_IPI'
      Precision = 15
      Size = 2
    end
    object cdsEntradaProdutoENP_ICMS: TFMTBCDField
      FieldName = 'ENP_ICMS'
      Precision = 15
      Size = 2
    end
    object cdsEntradaProdutoENP_TOTAL: TCurrencyField
      FieldName = 'ENP_TOTAL'
      ReadOnly = True
    end
    object cdsEntradaProdutoENP_SUBTOTAL: TFMTBCDField
      FieldName = 'ENP_SUBTOTAL'
      Precision = 15
      Size = 2
    end
  end
  object qryEntrada: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from ENTRADAPRODUTO')
    SQLConnection = SqlAdmin
    Left = 288
    Top = 85
  end
  object dstFuncionarios: TSQLDataSet
    CommandText = 'Select * from FUNCIONARIOS Where (FUN_CODIGO = :pCODIGO)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SqlAdmin
    Left = 600
    Top = 551
    object dstFuncionariosFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstFuncionariosFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionariosFUN_ENDERECO: TStringField
      FieldName = 'FUN_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionariosFUN_BAIRRO: TStringField
      FieldName = 'FUN_BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionariosFUN_CIDADE: TStringField
      FieldName = 'FUN_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionariosFUN_UFFUNC: TStringField
      FieldName = 'FUN_UFFUNC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFuncionariosFUN_NATUREZA: TStringField
      FieldName = 'FUN_NATUREZA'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionariosFUN_CEP: TStringField
      FieldName = 'FUN_CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstFuncionariosFUN_FONE: TStringField
      FieldName = 'FUN_FONE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstFuncionariosFUN_TPFUNC: TStringField
      FieldName = 'FUN_TPFUNC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstFuncionariosFUN_PECOMI: TFMTBCDField
      FieldName = 'FUN_PECOMI'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstFuncionariosFUN_DTADMICAO: TDateField
      FieldName = 'FUN_DTADMICAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionariosFUN_DTDEMICAO: TDateField
      FieldName = 'FUN_DTDEMICAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionariosFUN_VLDEBITO: TFMTBCDField
      FieldName = 'FUN_VLDEBITO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstFuncionariosFUN_CPFCGC: TStringField
      FieldName = 'FUN_CPFCGC'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstFuncionariosFUN_IDENTIDADE: TStringField
      FieldName = 'FUN_IDENTIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 11
    end
    object dstFuncionariosFUN_ORIDEN: TStringField
      FieldName = 'FUN_ORIDEN'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object dstFuncionariosFUN_UFIDEN: TStringField
      FieldName = 'FUN_UFIDEN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFuncionariosFUN_NRCART: TStringField
      FieldName = 'FUN_NRCART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 7
    end
    object dstFuncionariosFUN_SECART: TStringField
      FieldName = 'FUN_SECART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 7
    end
    object dstFuncionariosFUN_UFCART: TStringField
      FieldName = 'FUN_UFCART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFuncionariosFUN_CAREMI: TStringField
      FieldName = 'FUN_CAREMI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstFuncionariosFUN_TITULO: TStringField
      FieldName = 'FUN_TITULO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstFuncionariosFUN_CDSECA: TStringField
      FieldName = 'FUN_CDSECA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionariosFUN_CDZONA: TStringField
      FieldName = 'FUN_CDZONA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstFuncionariosFUN_ESTCIVIL: TStringField
      FieldName = 'FUN_ESTCIVIL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstFuncionariosFUN_VLSALA: TFMTBCDField
      FieldName = 'FUN_VLSALA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstFuncionariosFUN_LIONIB: TStringField
      FieldName = 'FUN_LIONIB'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionariosFUN_HOENT1: TStringField
      FieldName = 'FUN_HOENT1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionariosFUN_HOSAI1: TStringField
      FieldName = 'FUN_HOSAI1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionariosFUN_HOENT2: TStringField
      FieldName = 'FUN_HOENT2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionariosFUN_HOSAI2: TStringField
      FieldName = 'FUN_HOSAI2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionariosFUN_NOMPAI: TStringField
      FieldName = 'FUN_NOMPAI'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionariosFUN_NOMMAE: TStringField
      FieldName = 'FUN_NOMMAE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionariosFUN_COMPO1: TStringField
      FieldName = 'FUN_COMPO1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_COMPO2: TStringField
      FieldName = 'FUN_COMPO2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_COMPO3: TStringField
      FieldName = 'FUN_COMPO3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_ASSID1: TStringField
      FieldName = 'FUN_ASSID1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_ASSID2: TStringField
      FieldName = 'FUN_ASSID2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_ASSID3: TStringField
      FieldName = 'FUN_ASSID3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_HONES1: TStringField
      FieldName = 'FUN_HONES1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_HONES2: TStringField
      FieldName = 'FUN_HONES2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_HONES3: TStringField
      FieldName = 'FUN_HONES3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_CARAT1: TStringField
      FieldName = 'FUN_CARAT1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_CARAT2: TStringField
      FieldName = 'FUN_CARAT2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_CARAT3: TStringField
      FieldName = 'FUN_CARAT3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionariosFUN_COMPR1: TMemoField
      FieldName = 'FUN_COMPR1'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object dstFuncionariosFUN_RESPO1: TMemoField
      FieldName = 'FUN_RESPO1'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object dstFuncionariosFUN_ATEST1: TMemoField
      FieldName = 'FUN_ATEST1'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object dstFuncionariosFUN_DTNASCIMENTO: TDateField
      FieldName = 'FUN_DTNASCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionariosFUN_FUNCAO: TStringField
      FieldName = 'FUN_FUNCAO'
      Size = 30
    end
    object dstFuncionariosFUN_RGEMIS: TDateField
      FieldName = 'FUN_RGEMIS'
    end
    object dstFuncionariosFUN_FOTO: TBlobField
      FieldName = 'FUN_FOTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object dstFuncionariosCAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionariosFUN_ESTADOCIVIL: TStringField
      FieldName = 'FUN_ESTADOCIVIL'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspFuncionarios: TDataSetProvider
    DataSet = dstFuncionarios2
    Options = [poAllowCommandText]
    Left = 600
    Top = 599
  end
  object cdsFuncionarios: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionarios'
    Left = 683
    Top = 378
    object cdsFuncionariosFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsFuncionariosFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object cdsFuncionariosFUN_ENDERECO: TStringField
      FieldName = 'FUN_ENDERECO'
      Size = 40
    end
    object cdsFuncionariosFUN_BAIRRO: TStringField
      FieldName = 'FUN_BAIRRO'
    end
    object cdsFuncionariosFUN_CIDADE: TStringField
      FieldName = 'FUN_CIDADE'
    end
    object cdsFuncionariosFUN_UFFUNC: TStringField
      FieldName = 'FUN_UFFUNC'
      FixedChar = True
      Size = 2
    end
    object cdsFuncionariosFUN_NATUREZA: TStringField
      FieldName = 'FUN_NATUREZA'
    end
    object cdsFuncionariosFUN_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'FUN_CEP'
      EditMask = '99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsFuncionariosFUN_FONE: TStringField
      FieldName = 'FUN_FONE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 10
    end
    object cdsFuncionariosFUN_TPFUNC: TStringField
      FieldName = 'FUN_TPFUNC'
      FixedChar = True
      Size = 1
    end
    object cdsFuncionariosFUN_DTNASCIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'FUN_DTNASCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsFuncionariosFUN_DTADMICAO: TDateField
      Alignment = taRightJustify
      FieldName = 'FUN_DTADMICAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsFuncionariosFUN_DTDEMICAO: TDateField
      Alignment = taRightJustify
      FieldName = 'FUN_DTDEMICAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsFuncionariosFUN_VLDEBITO: TFMTBCDField
      FieldName = 'FUN_VLDEBITO'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsFuncionariosFUN_CPFCGC: TStringField
      Alignment = taRightJustify
      FieldName = 'FUN_CPFCGC'
      EditMask = '999.999.999-99;0;_'
      Size = 14
    end
    object cdsFuncionariosFUN_IDENTIDADE: TStringField
      FieldName = 'FUN_IDENTIDADE'
      FixedChar = True
      Size = 11
    end
    object cdsFuncionariosFUN_ORIDEN: TStringField
      FieldName = 'FUN_ORIDEN'
      Size = 4
    end
    object cdsFuncionariosFUN_UFIDEN: TStringField
      FieldName = 'FUN_UFIDEN'
      FixedChar = True
      Size = 2
    end
    object cdsFuncionariosFUN_NRCART: TStringField
      FieldName = 'FUN_NRCART'
      FixedChar = True
      Size = 7
    end
    object cdsFuncionariosFUN_SECART: TStringField
      FieldName = 'FUN_SECART'
      FixedChar = True
      Size = 7
    end
    object cdsFuncionariosFUN_UFCART: TStringField
      FieldName = 'FUN_UFCART'
      FixedChar = True
      Size = 2
    end
    object cdsFuncionariosFUN_CAREMI: TStringField
      FieldName = 'FUN_CAREMI'
      FixedChar = True
      Size = 8
    end
    object cdsFuncionariosFUN_TITULO: TStringField
      FieldName = 'FUN_TITULO'
      FixedChar = True
      Size = 12
    end
    object cdsFuncionariosFUN_CDSECA: TStringField
      FieldName = 'FUN_CDSECA'
      FixedChar = True
      Size = 4
    end
    object cdsFuncionariosFUN_CDZONA: TStringField
      FieldName = 'FUN_CDZONA'
      FixedChar = True
      Size = 3
    end
    object cdsFuncionariosFUN_ESTCIVIL: TStringField
      FieldName = 'FUN_ESTCIVIL'
      FixedChar = True
      Size = 1
    end
    object cdsFuncionariosFUN_VLSALA: TFMTBCDField
      FieldName = 'FUN_VLSALA'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsFuncionariosFUN_LIONIB: TStringField
      FieldName = 'FUN_LIONIB'
    end
    object cdsFuncionariosFUN_HOENT1: TStringField
      Alignment = taRightJustify
      FieldName = 'FUN_HOENT1'
      EditMask = '99:99;0;_'
      FixedChar = True
      Size = 4
    end
    object cdsFuncionariosFUN_HOSAI1: TStringField
      Alignment = taRightJustify
      FieldName = 'FUN_HOSAI1'
      EditMask = '99:99;0;_'
      FixedChar = True
      Size = 4
    end
    object cdsFuncionariosFUN_HOENT2: TStringField
      Alignment = taRightJustify
      FieldName = 'FUN_HOENT2'
      EditMask = '99:99;0;_'
      FixedChar = True
      Size = 4
    end
    object cdsFuncionariosFUN_HOSAI2: TStringField
      Alignment = taRightJustify
      FieldName = 'FUN_HOSAI2'
      EditMask = '99:99;0;_'
      FixedChar = True
      Size = 4
    end
    object cdsFuncionariosFUN_NOMPAI: TStringField
      FieldName = 'FUN_NOMPAI'
      Size = 40
    end
    object cdsFuncionariosFUN_NOMMAE: TStringField
      FieldName = 'FUN_NOMMAE'
      Size = 40
    end
    object cdsFuncionariosFUN_COMPO1: TStringField
      FieldName = 'FUN_COMPO1'
      Size = 70
    end
    object cdsFuncionariosFUN_COMPO2: TStringField
      FieldName = 'FUN_COMPO2'
      Size = 70
    end
    object cdsFuncionariosFUN_COMPO3: TStringField
      FieldName = 'FUN_COMPO3'
      Size = 70
    end
    object cdsFuncionariosFUN_ASSID1: TStringField
      FieldName = 'FUN_ASSID1'
      Size = 70
    end
    object cdsFuncionariosFUN_ASSID2: TStringField
      FieldName = 'FUN_ASSID2'
      Size = 70
    end
    object cdsFuncionariosFUN_ASSID3: TStringField
      FieldName = 'FUN_ASSID3'
      Size = 70
    end
    object cdsFuncionariosFUN_HONES1: TStringField
      FieldName = 'FUN_HONES1'
      Size = 70
    end
    object cdsFuncionariosFUN_HONES2: TStringField
      FieldName = 'FUN_HONES2'
      Size = 70
    end
    object cdsFuncionariosFUN_HONES3: TStringField
      FieldName = 'FUN_HONES3'
      Size = 70
    end
    object cdsFuncionariosFUN_CARAT1: TStringField
      FieldName = 'FUN_CARAT1'
      Size = 70
    end
    object cdsFuncionariosFUN_CARAT2: TStringField
      FieldName = 'FUN_CARAT2'
      Size = 70
    end
    object cdsFuncionariosFUN_CARAT3: TStringField
      FieldName = 'FUN_CARAT3'
      Size = 70
    end
    object cdsFuncionariosFUN_COMPR1: TMemoField
      FieldName = 'FUN_COMPR1'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFuncionariosFUN_RESPO1: TMemoField
      FieldName = 'FUN_RESPO1'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFuncionariosFUN_ATEST1: TMemoField
      FieldName = 'FUN_ATEST1'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFuncionariosFUN_FUNCAO: TStringField
      FieldName = 'FUN_FUNCAO'
      Size = 30
    end
    object cdsFuncionariosFUN_RGEMIS: TDateField
      Alignment = taRightJustify
      FieldName = 'FUN_RGEMIS'
      EditMask = '99/99/9999;1;_'
    end
    object cdsFuncionariosFUN_FOTO: TBlobField
      FieldName = 'FUN_FOTO'
      Size = 1
    end
    object cdsFuncionariosCAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
    end
    object cdsFuncionariosFUN_ESTADOCIVIL: TStringField
      FieldName = 'FUN_ESTADOCIVIL'
    end
    object cdsFuncionariosFUN_DTCADA: TDateField
      FieldName = 'FUN_DTCADA'
    end
    object cdsFuncionariosFUN_HOCADA: TStringField
      FieldName = 'FUN_HOCADA'
      FixedChar = True
      Size = 5
    end
    object cdsFuncionariosFUN_USUARIO_CAD: TIntegerField
      FieldName = 'FUN_USUARIO_CAD'
    end
    object cdsFuncionariosFUN_DTALTE: TDateField
      FieldName = 'FUN_DTALTE'
    end
    object cdsFuncionariosFUN_HOALTE: TStringField
      FieldName = 'FUN_HOALTE'
      FixedChar = True
      Size = 5
    end
    object cdsFuncionariosFUN_USUARIO_ALT: TIntegerField
      FieldName = 'FUN_USUARIO_ALT'
    end
    object cdsFuncionariosFUN_PECOMI: TBCDField
      FieldName = 'FUN_PECOMI'
      Precision = 9
      Size = 2
    end
    object cdsFuncionariosFUN_CARGO: TStringField
      FieldKind = fkLookup
      FieldName = 'FUN_CARGO'
      LookupDataSet = cdsListaCargos
      LookupKeyFields = 'CAR_CODIGO'
      LookupResultField = 'CAR_NOME'
      KeyFields = 'CAR_CODIGO'
      Size = 40
      Lookup = True
    end
  end
  object dsFuncionarios: TDataSource
    AutoEdit = False
    DataSet = cdsFuncionarios
    Left = 755
    Top = 130
  end
  object dstDebito: TSQLDataSet
    CommandText = 
      'Select * from DEBITO Where (DEB_LOJA = :pLOJA)'#13#10'AND (DEB_NRCREDI' +
      'TO = :pNRCREDITO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pNRCREDITO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 280
    Top = 149
    object dstDebitoDEB_LOJA: TIntegerField
      FieldName = 'DEB_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstDebitoDEB_NRCREDITO: TIntegerField
      FieldName = 'DEB_NRCREDITO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstDebitoCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_MATRICULA: TStringField
      FieldName = 'DEB_MATRICULA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstDebitoDEB_VENDA: TIntegerField
      FieldName = 'DEB_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_PARCELA: TStringField
      FieldName = 'DEB_PARCELA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstDebitoDEB_QTPARCELA: TIntegerField
      FieldName = 'DEB_QTPARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_DESCRICAO: TStringField
      FieldName = 'DEB_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstDebitoDEB_NRNOTA: TStringField
      FieldName = 'DEB_NRNOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstDebitoDEB_SERIENOTA: TStringField
      FieldName = 'DEB_SERIENOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstDebitoMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_DTMOVIMENTO: TDateField
      FieldName = 'DEB_DTMOVIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_DTVENCIMENTO: TDateField
      FieldName = 'DEB_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_DTPAGAMENTO: TDateField
      FieldName = 'DEB_DTPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_PEJUROS: TFMTBCDField
      FieldName = 'DEB_PEJUROS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstDebitoDEB_VLJUROS: TFMTBCDField
      FieldName = 'DEB_VLJUROS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstDebitoDEB_VLDESCONTO: TFMTBCDField
      FieldName = 'DEB_VLDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstDebitoDEB_VLPARCELA: TFMTBCDField
      FieldName = 'DEB_VLPARCELA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstDebitoDEB_VLPAGO: TFMTBCDField
      FieldName = 'DEB_VLPAGO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstDebitoDEB_VLRESTANTE: TFMTBCDField
      FieldName = 'DEB_VLRESTANTE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstDebitoDEB_TOVENDA: TFMTBCDField
      FieldName = 'DEB_TOVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstDebitoDEB_SITUACAO: TStringField
      FieldName = 'DEB_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstDebitoSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_FLCHEQUE: TStringField
      FieldName = 'DEB_FLCHEQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstDebitoDEB_NRCHEQUE: TStringField
      FieldName = 'DEB_NRCHEQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstDebitoBAN_COGIGO: TStringField
      FieldName = 'BAN_COGIGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstDebitoDEB_NRAGENCIA: TStringField
      FieldName = 'DEB_NRAGENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstDebitoDEB_NRBOLETO: TStringField
      FieldName = 'DEB_NRBOLETO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstDebitoDEB_NRCONC: TStringField
      FieldName = 'DEB_NRCONC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 7
    end
    object dstDebitoDEB_FLEXCLUSAO: TStringField
      FieldName = 'DEB_FLEXCLUSAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstDebitoDEB_DTEXCLUSAO: TDateField
      FieldName = 'DEB_DTEXCLUSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_USUAEXCLUIO: TIntegerField
      FieldName = 'DEB_USUAEXCLUIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_DTALTERACAO: TDateField
      FieldName = 'DEB_DTALTERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_MOTIVOEXCLUSAO: TStringField
      FieldName = 'DEB_MOTIVOEXCLUSAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstDebitoDEB_NRRENE: TIntegerField
      FieldName = 'DEB_NRRENE'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_DTRENE: TDateField
      FieldName = 'DEB_DTRENE'
      ProviderFlags = [pfInUpdate]
    end
    object dstDebitoDEB_RENACR: TFMTBCDField
      FieldName = 'DEB_RENACR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstDebitoDEB_RENDES: TFMTBCDField
      FieldName = 'DEB_RENDES'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
  end
  object dspDebito: TDataSetProvider
    DataSet = dstDebito
    Left = 287
    Top = 197
  end
  object cdsDebito: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDebito'
    OnCalcFields = cdsDebitoCalcFields
    Left = 287
    Top = 253
    object cdsDebitoDEB_LOJA: TIntegerField
      FieldName = 'DEB_LOJA'
      Required = True
      DisplayFormat = '000'
    end
    object cdsDebitoDEB_NRCREDITO: TIntegerField
      FieldName = 'DEB_NRCREDITO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsDebitoCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      DisplayFormat = '0000000'
    end
    object cdsDebitoDEB_MATRICULA: TStringField
      FieldName = 'DEB_MATRICULA'
      Size = 10
    end
    object cdsDebitoDEB_VENDA: TIntegerField
      FieldName = 'DEB_VENDA'
      DisplayFormat = '0000000'
    end
    object cdsDebitoDEB_PARCELA: TStringField
      FieldName = 'DEB_PARCELA'
      FixedChar = True
      Size = 2
    end
    object cdsDebitoDEB_QTPARCELA: TIntegerField
      FieldName = 'DEB_QTPARCELA'
    end
    object cdsDebitoDEB_DESCRICAO: TStringField
      FieldName = 'DEB_DESCRICAO'
      Size = 50
    end
    object cdsDebitoDEB_NRNOTA: TStringField
      FieldName = 'DEB_NRNOTA'
      FixedChar = True
      Size = 10
    end
    object cdsDebitoDEB_SERIENOTA: TStringField
      FieldName = 'DEB_SERIENOTA'
      FixedChar = True
      Size = 2
    end
    object cdsDebitoMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
    end
    object cdsDebitoDEB_DTMOVIMENTO: TDateField
      FieldName = 'DEB_DTMOVIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsDebitoDEB_DTVENCIMENTO: TDateField
      FieldName = 'DEB_DTVENCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsDebitoDEB_DTPAGAMENTO: TDateField
      FieldName = 'DEB_DTPAGAMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsDebitoDEB_PEJUROS: TFMTBCDField
      FieldName = 'DEB_PEJUROS'
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsDebitoDEB_VLJUROS: TFMTBCDField
      FieldName = 'DEB_VLJUROS'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsDebitoDEB_VLDESCONTO: TFMTBCDField
      FieldName = 'DEB_VLDESCONTO'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsDebitoDEB_VLPARCELA: TFMTBCDField
      FieldName = 'DEB_VLPARCELA'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsDebitoDEB_VLPAGO: TFMTBCDField
      FieldName = 'DEB_VLPAGO'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsDebitoDEB_VLRESTANTE: TFMTBCDField
      FieldName = 'DEB_VLRESTANTE'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsDebitoDEB_TOVENDA: TFMTBCDField
      FieldName = 'DEB_TOVENDA'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsDebitoDEB_SITUACAO: TStringField
      FieldName = 'DEB_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsDebitoSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
    end
    object cdsDebitoDEB_FLCHEQUE: TStringField
      FieldName = 'DEB_FLCHEQUE'
      FixedChar = True
      Size = 1
    end
    object cdsDebitoDEB_NRCHEQUE: TStringField
      FieldName = 'DEB_NRCHEQUE'
      FixedChar = True
      Size = 8
    end
    object cdsDebitoBAN_COGIGO: TStringField
      FieldName = 'BAN_COGIGO'
      FixedChar = True
      Size = 3
    end
    object cdsDebitoDEB_NRAGENCIA: TStringField
      FieldName = 'DEB_NRAGENCIA'
      FixedChar = True
      Size = 5
    end
    object cdsDebitoDEB_NRBOLETO: TStringField
      FieldName = 'DEB_NRBOLETO'
      FixedChar = True
      Size = 12
    end
    object cdsDebitoDEB_NRCONC: TStringField
      FieldName = 'DEB_NRCONC'
      FixedChar = True
      Size = 7
    end
    object cdsDebitoDEB_FLEXCLUSAO: TStringField
      FieldName = 'DEB_FLEXCLUSAO'
      FixedChar = True
      Size = 1
    end
    object cdsDebitoDEB_DTEXCLUSAO: TDateField
      Alignment = taRightJustify
      FieldName = 'DEB_DTEXCLUSAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsDebitoDEB_USUAEXCLUIO: TIntegerField
      FieldName = 'DEB_USUAEXCLUIO'
    end
    object cdsDebitoDEB_DTALTERACAO: TDateField
      Alignment = taRightJustify
      FieldName = 'DEB_DTALTERACAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsDebitoDEB_MOTIVOEXCLUSAO: TStringField
      FieldName = 'DEB_MOTIVOEXCLUSAO'
      Size = 50
    end
    object cdsDebitoDEB_NRRENE: TIntegerField
      FieldName = 'DEB_NRRENE'
    end
    object cdsDebitoDEB_DTRENE: TDateField
      Alignment = taRightJustify
      FieldName = 'DEB_DTRENE'
      EditMask = '99/99/9999;1;_'
    end
    object cdsDebitoDEB_RENACR: TFMTBCDField
      FieldName = 'DEB_RENACR'
      Precision = 15
      Size = 2
    end
    object cdsDebitoDEB_RENDES: TFMTBCDField
      FieldName = 'DEB_RENDES'
      Precision = 15
      Size = 2
    end
    object cdsDebitoDEB_ATRASO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DEB_ATRASO'
      Calculated = True
    end
    object cdsDebitoDEB_NMSITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DEB_NMSITUACAO'
      Calculated = True
    end
  end
  object dsDebito: TDataSource
    AutoEdit = False
    DataSet = cdsDebito
    Left = 284
    Top = 309
  end
  object dstCheques: TSQLDataSet
    CommandText = 
      'select * from CHEQUES Where (CHE_DOCUMENTO = :pDOCUMENTO) and (C' +
      'HE_CPFCGC = :pCPFCGC)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pDOCUMENTO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCPFCGC'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = SqlAdmin
    Left = 656
    Top = 253
    object dstChequesCHE_DOCUMENTO: TStringField
      FieldName = 'CHE_DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 8
    end
    object dstChequesCHE_CPFCGC: TStringField
      FieldName = 'CHE_CPFCGC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 14
    end
    object dstChequesCHE_LOJA: TIntegerField
      FieldName = 'CHE_LOJA'
      ProviderFlags = [pfInUpdate]
    end
    object dstChequesCHE_VENDA: TIntegerField
      FieldName = 'CHE_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstChequesBAN_CODIGO: TStringField
      FieldName = 'BAN_CODIGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstChequesCHE_AGENCIA: TStringField
      FieldName = 'CHE_AGENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstChequesCHE_CONTA: TStringField
      FieldName = 'CHE_CONTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstChequesCHE_VALORDOCUMENTO: TFMTBCDField
      FieldName = 'CHE_VALORDOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstChequesCHE_VALORDESCONTO: TFMTBCDField
      FieldName = 'CHE_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstChequesCHE_VALORACRESIMO: TFMTBCDField
      FieldName = 'CHE_VALORACRESIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstChequesCHE_VALORJURO: TFMTBCDField
      FieldName = 'CHE_VALORJURO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstChequesCHE_SACADO: TStringField
      FieldName = 'CHE_SACADO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstChequesCHE_DTRECEBIMENTO: TDateField
      FieldName = 'CHE_DTRECEBIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstChequesCHE_DTVENCIMENTO: TDateField
      FieldName = 'CHE_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstChequesCHE_DTPAGAMENTO: TDateField
      FieldName = 'CHE_DTPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstChequesCHE_QTDIAS: TFMTBCDField
      FieldName = 'CHE_QTDIAS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 0
    end
    object dstChequesCHE_SITUACAO: TStringField
      FieldName = 'CHE_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstChequesCHE_BLOQUEIO: TStringField
      FieldName = 'CHE_BLOQUEIO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstChequesCHE_DTDEVOLUCAO1: TDateField
      FieldName = 'CHE_DTDEVOLUCAO1'
      ProviderFlags = [pfInUpdate]
    end
    object dstChequesCHE_CDDEVOLUCAO1: TIntegerField
      FieldName = 'CHE_CDDEVOLUCAO1'
      ProviderFlags = [pfInUpdate]
    end
    object dstChequesCHE_DTDEVOLUCAO2: TDateField
      FieldName = 'CHE_DTDEVOLUCAO2'
      ProviderFlags = [pfInUpdate]
    end
    object dstChequesCHE_CDDEVOLUCAO2: TIntegerField
      FieldName = 'CHE_CDDEVOLUCAO2'
      ProviderFlags = [pfInUpdate]
    end
    object dstChequesCHE_DTPROR: TStringField
      FieldName = 'CHE_DTPROR'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object dstChequesCHE_DTALTERACAO: TDateField
      FieldName = 'CHE_DTALTERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstChequesCHE_FLEXCLUSAO: TStringField
      FieldName = 'CHE_FLEXCLUSAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstChequesCHE_FLORCAMENTO: TStringField
      FieldName = 'CHE_FLORCAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstChequesSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspCheques: TDataSetProvider
    DataSet = dstCheques
    Options = [poAllowCommandText]
    OnGetTableName = dspChequesGetTableName
    Left = 656
    Top = 301
  end
  object cdsCheques: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCheques'
    Left = 656
    Top = 357
    object cdsChequesCHE_DOCUMENTO: TStringField
      FieldName = 'CHE_DOCUMENTO'
      Required = True
      FixedChar = True
      Size = 8
    end
    object cdsChequesCHE_CPFCGC: TStringField
      FieldName = 'CHE_CPFCGC'
      Required = True
      FixedChar = True
      Size = 14
    end
    object cdsChequesCHE_LOJA: TIntegerField
      FieldName = 'CHE_LOJA'
    end
    object cdsChequesCHE_VENDA: TIntegerField
      FieldName = 'CHE_VENDA'
    end
    object cdsChequesBAN_CODIGO: TStringField
      FieldName = 'BAN_CODIGO'
      FixedChar = True
      Size = 3
    end
    object cdsChequesCHE_AGENCIA: TStringField
      FieldName = 'CHE_AGENCIA'
      FixedChar = True
      Size = 5
    end
    object cdsChequesCHE_CONTA: TStringField
      FieldName = 'CHE_CONTA'
      FixedChar = True
      Size = 12
    end
    object cdsChequesCHE_VALORDOCUMENTO: TFMTBCDField
      FieldName = 'CHE_VALORDOCUMENTO'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsChequesCHE_VALORDESCONTO: TFMTBCDField
      FieldName = 'CHE_VALORDESCONTO'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsChequesCHE_VALORACRESIMO: TFMTBCDField
      FieldName = 'CHE_VALORACRESIMO'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsChequesCHE_VALORJURO: TFMTBCDField
      FieldName = 'CHE_VALORJURO'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsChequesCHE_SACADO: TStringField
      FieldName = 'CHE_SACADO'
      Size = 40
    end
    object cdsChequesCHE_DTRECEBIMENTO: TDateField
      FieldName = 'CHE_DTRECEBIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsChequesCHE_DTVENCIMENTO: TDateField
      FieldName = 'CHE_DTVENCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsChequesCHE_DTPAGAMENTO: TDateField
      FieldName = 'CHE_DTPAGAMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsChequesCHE_QTDIAS: TFMTBCDField
      FieldName = 'CHE_QTDIAS'
      Precision = 15
      Size = 0
    end
    object cdsChequesCHE_SITUACAO: TStringField
      FieldName = 'CHE_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsChequesCHE_BLOQUEIO: TStringField
      FieldName = 'CHE_BLOQUEIO'
      FixedChar = True
      Size = 1
    end
    object cdsChequesCHE_DTDEVOLUCAO1: TDateField
      FieldName = 'CHE_DTDEVOLUCAO1'
      EditMask = '99/99/9999;1;_'
    end
    object cdsChequesCHE_CDDEVOLUCAO1: TIntegerField
      FieldName = 'CHE_CDDEVOLUCAO1'
    end
    object cdsChequesCHE_DTDEVOLUCAO2: TDateField
      FieldName = 'CHE_DTDEVOLUCAO2'
      EditMask = '99/99/9999;1;_'
    end
    object cdsChequesCHE_CDDEVOLUCAO2: TIntegerField
      FieldName = 'CHE_CDDEVOLUCAO2'
    end
    object cdsChequesCHE_DTPROR: TStringField
      FieldName = 'CHE_DTPROR'
      Size = 80
    end
    object cdsChequesCHE_DTALTERACAO: TDateField
      FieldName = 'CHE_DTALTERACAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsChequesCHE_FLEXCLUSAO: TStringField
      FieldName = 'CHE_FLEXCLUSAO'
      FixedChar = True
      Size = 1
    end
    object cdsChequesCHE_FLORCAMENTO: TStringField
      FieldName = 'CHE_FLORCAMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsChequesSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
    end
  end
  object dsCheques: TDataSource
    DataSet = cdsCheques
    Left = 656
    Top = 204
  end
  object dstClientesCheques: TSQLDataSet
    CommandText = 'select * from CHEQUE_CLIENTES '#13#10'Where (CLC_CPFCGC = :pCPFCGC)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCPFCGC'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = SqlAdmin
    Left = 744
    Top = 37
    object dstClientesChequesCLC_CPFCGC: TStringField
      FieldName = 'CLC_CPFCGC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 14
    end
    object dstClientesChequesCLC_NOME: TStringField
      FieldName = 'CLC_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object dstClientesChequesCLC_ENDERECO: TStringField
      FieldName = 'CLC_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstClientesChequesCLC_CEP: TStringField
      FieldName = 'CLC_CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstClientesChequesCLC_BAIRRO: TStringField
      FieldName = 'CLC_BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesChequesCLC_CIDADE: TStringField
      FieldName = 'CLC_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesChequesCLC_FONE: TStringField
      FieldName = 'CLC_FONE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstClientesChequesCLC_IDENTIDADE: TStringField
      FieldName = 'CLC_IDENTIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 11
    end
    object dstClientesChequesCLC_ORGAOEMISSO: TStringField
      FieldName = 'CLC_ORGAOEMISSO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstClientesChequesCLC_UFEMISSO: TStringField
      FieldName = 'CLC_UFEMISSO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstClientesChequesCLC_DTNASCIMENTO: TDateField
      FieldName = 'CLC_DTNASCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesChequesCLC_SITUACAO: TStringField
      FieldName = 'CLC_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesChequesCLC_QTDEVOLUCAO: TFMTBCDField
      FieldName = 'CLC_QTDEVOLUCAO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 0
    end
    object dstClientesChequesBAN_CODIGO: TStringField
      FieldName = 'BAN_CODIGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstClientesChequesCLC_AGENCIA: TStringField
      FieldName = 'CLC_AGENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstClientesChequesCLC_CONTA: TStringField
      FieldName = 'CLC_CONTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstClientesChequesCLC_FLPREF: TStringField
      FieldName = 'CLC_FLPREF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesChequesCLC_NOMEPAI: TStringField
      FieldName = 'CLC_NOMEPAI'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstClientesChequesCLC_NOMEMAE: TStringField
      FieldName = 'CLC_NOMEMAE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstClientesChequesCLC_DTALTERACAO: TDateField
      FieldName = 'CLC_DTALTERACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspClientesCheques: TDataSetProvider
    DataSet = dstClientesCheques
    Options = [poAllowCommandText]
    OnGetTableName = dspClientesChequesGetTableName
    Left = 824
    Top = 101
  end
  object cdsClientesCheques: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientesCheques'
    Left = 824
    Top = 149
    object cdsClientesChequesCLC_CPFCGC: TStringField
      Alignment = taRightJustify
      FieldName = 'CLC_CPFCGC'
      Required = True
      FixedChar = True
      Size = 14
    end
    object cdsClientesChequesCLC_NOME: TStringField
      FieldName = 'CLC_NOME'
      Required = True
      Size = 40
    end
    object cdsClientesChequesCLC_ENDERECO: TStringField
      FieldName = 'CLC_ENDERECO'
      Size = 40
    end
    object cdsClientesChequesCLC_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'CLC_CEP'
      EditMask = '99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsClientesChequesCLC_BAIRRO: TStringField
      FieldName = 'CLC_BAIRRO'
    end
    object cdsClientesChequesCLC_CIDADE: TStringField
      FieldName = 'CLC_CIDADE'
    end
    object cdsClientesChequesCLC_FONE: TStringField
      FieldName = 'CLC_FONE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 10
    end
    object cdsClientesChequesCLC_IDENTIDADE: TStringField
      FieldName = 'CLC_IDENTIDADE'
      FixedChar = True
      Size = 11
    end
    object cdsClientesChequesCLC_ORGAOEMISSO: TStringField
      FieldName = 'CLC_ORGAOEMISSO'
      FixedChar = True
      Size = 4
    end
    object cdsClientesChequesCLC_UFEMISSO: TStringField
      FieldName = 'CLC_UFEMISSO'
      FixedChar = True
      Size = 2
    end
    object cdsClientesChequesCLC_DTNASCIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'CLC_DTNASCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsClientesChequesCLC_SITUACAO: TStringField
      FieldName = 'CLC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsClientesChequesCLC_QTDEVOLUCAO: TFMTBCDField
      FieldName = 'CLC_QTDEVOLUCAO'
      Precision = 15
      Size = 0
    end
    object cdsClientesChequesBAN_CODIGO: TStringField
      FieldName = 'BAN_CODIGO'
      FixedChar = True
      Size = 3
    end
    object cdsClientesChequesCLC_AGENCIA: TStringField
      FieldName = 'CLC_AGENCIA'
      FixedChar = True
      Size = 5
    end
    object cdsClientesChequesCLC_CONTA: TStringField
      FieldName = 'CLC_CONTA'
      FixedChar = True
      Size = 12
    end
    object cdsClientesChequesCLC_FLPREF: TStringField
      FieldName = 'CLC_FLPREF'
      FixedChar = True
      Size = 1
    end
    object cdsClientesChequesCLC_NOMEPAI: TStringField
      FieldName = 'CLC_NOMEPAI'
      Size = 40
    end
    object cdsClientesChequesCLC_NOMEMAE: TStringField
      FieldName = 'CLC_NOMEMAE'
      Size = 40
    end
    object cdsClientesChequesCLC_DTALTERACAO: TDateField
      FieldName = 'CLC_DTALTERACAO'
      EditMask = '99/99/9999;1;_'
    end
  end
  object dsClientesCheque: TDataSource
    DataSet = cdsClientesCheques
    Left = 720
    Top = 197
  end
  object dstCaixa: TSQLDataSet
    CommandText = 
      'Select * from CAIXA Where (CAI_LOJA = :pLOJA)'#13#10'and (CAI_NUMERO =' +
      ' :pNUMERO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 712
    Top = 245
    object dstCaixaCAI_NUMERO: TIntegerField
      FieldName = 'CAI_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstCaixaCAI_LOJA: TIntegerField
      FieldName = 'CAI_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstCaixaCAI_DTABERTURA: TDateField
      FieldName = 'CAI_DTABERTURA'
      ProviderFlags = [pfInUpdate]
    end
    object dstCaixaCAI_DTFECHAMENTO: TDateField
      FieldName = 'CAI_DTFECHAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCaixaCAI_HOABERTURA: TStringField
      FieldName = 'CAI_HOABERTURA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstCaixaCAI_HOFECHAMENTO: TStringField
      FieldName = 'CAI_HOFECHAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstCaixaCAI_RGINICIAL: TIntegerField
      FieldName = 'CAI_RGINICIAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstCaixaCAI_RGFINAL: TIntegerField
      FieldName = 'CAI_RGFINAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstCaixaCAI_CAIXA: TIntegerField
      FieldName = 'CAI_CAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object dstCaixaCAI_SITUACAO: TStringField
      FieldName = 'CAI_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dspCaixa: TDataSetProvider
    DataSet = dstCaixa
    Options = [poAllowCommandText]
    OnGetTableName = dspCaixaGetTableName
    Left = 720
    Top = 293
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 736
    Top = 341
    object cdsCaixaCAI_NUMERO: TIntegerField
      FieldName = 'CAI_NUMERO'
      Required = True
      DisplayFormat = '0000000000'
    end
    object cdsCaixaCAI_LOJA: TIntegerField
      FieldName = 'CAI_LOJA'
      Required = True
      DisplayFormat = '000'
    end
    object cdsCaixaCAI_DTABERTURA: TDateField
      FieldName = 'CAI_DTABERTURA'
      EditMask = '99/99/9999;1;_'
    end
    object cdsCaixaCAI_DTFECHAMENTO: TDateField
      FieldName = 'CAI_DTFECHAMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsCaixaCAI_HOABERTURA: TStringField
      FieldName = 'CAI_HOABERTURA'
      EditMask = '99:99;1;_'
      FixedChar = True
      Size = 5
    end
    object cdsCaixaCAI_HOFECHAMENTO: TStringField
      FieldName = 'CAI_HOFECHAMENTO'
      EditMask = '99:99;1;_'
      FixedChar = True
      Size = 5
    end
    object cdsCaixaCAI_RGINICIAL: TIntegerField
      FieldName = 'CAI_RGINICIAL'
      DisplayFormat = '0000000000'
    end
    object cdsCaixaCAI_RGFINAL: TIntegerField
      FieldName = 'CAI_RGFINAL'
      DisplayFormat = '0000000000'
    end
    object cdsCaixaCAI_CAIXA: TIntegerField
      FieldName = 'CAI_CAIXA'
    end
    object cdsCaixaCAI_SITUACAO: TStringField
      FieldName = 'CAI_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsCaixaCAI_NOMELOJA: TStringField
      FieldKind = fkLookup
      FieldName = 'CAI_NOMELOJA'
      LookupDataSet = cdsLoja
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'CAI_LOJA'
      Size = 30
      Lookup = True
    end
  end
  object dsCaixa: TDataSource
    DataSet = cdsCaixa
    Left = 720
    Top = 389
  end
  object dstMovimentoCaixa: TSQLDataSet
    CommandText = 
      'select * from MOVIMENTO_CAIXA'#13#10'Where (MCA_SEQUENCIA = :pSEQUENCI' +
      'A)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 592
    Top = 445
    object dstMovimentoCaixaMCA_SEQUENCIA: TIntegerField
      FieldName = 'MCA_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstMovimentoCaixaMCA_LOJA: TIntegerField
      FieldName = 'MCA_LOJA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoCaixaMCA_VENDA: TIntegerField
      FieldName = 'MCA_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoCaixaMCA_TIPOMOV: TStringField
      FieldName = 'MCA_TIPOMOV'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstMovimentoCaixaMCA_DTMOVIMENTO: TDateField
      FieldName = 'MCA_DTMOVIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoCaixaMCA_HRMOVIMENTO: TStringField
      FieldName = 'MCA_HRMOVIMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstMovimentoCaixaMCA_VLMODALIDADE: TFMTBCDField
      FieldName = 'MCA_VLMODALIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstMovimentoCaixaMCA_TOVENDA: TFMTBCDField
      FieldName = 'MCA_TOVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstMovimentoCaixaMCA_VLTROCO: TFMTBCDField
      FieldName = 'MCA_VLTROCO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstMovimentoCaixaMCA_OBSEVACAO: TStringField
      FieldName = 'MCA_OBSEVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstMovimentoCaixaMCA_SITUACAO: TStringField
      FieldName = 'MCA_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstMovimentoCaixaMCA_CAIXA: TIntegerField
      FieldName = 'MCA_CAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoCaixaMCA_MODALIDADE: TStringField
      FieldName = 'MCA_MODALIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstMovimentoCaixaMCA_NATUREZA: TIntegerField
      FieldName = 'MCA_NATUREZA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoCaixaMCA_FUNCIONARIO: TIntegerField
      FieldName = 'MCA_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsMovimentoCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovimentoCaixa'
    Left = 584
    Top = 275
    object cdsMovimentoCaixaMCA_SEQUENCIA: TIntegerField
      FieldName = 'MCA_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000000'
    end
    object cdsMovimentoCaixaMCA_LOJA: TIntegerField
      FieldName = 'MCA_LOJA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
    end
    object cdsMovimentoCaixaMCA_VENDA: TIntegerField
      FieldName = 'MCA_VENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0000000'
    end
    object cdsMovimentoCaixaMCA_TIPOMOV: TStringField
      FieldName = 'MCA_TIPOMOV'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsMovimentoCaixaMCA_DTMOVIMENTO: TDateField
      FieldName = 'MCA_DTMOVIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsMovimentoCaixaMCA_HRMOVIMENTO: TStringField
      Alignment = taRightJustify
      FieldName = 'MCA_HRMOVIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99:99;1;_'
      FixedChar = True
      Size = 5
    end
    object cdsMovimentoCaixaMCA_VLMODALIDADE: TFMTBCDField
      FieldName = 'MCA_VLMODALIDADE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsMovimentoCaixaMCA_TOVENDA: TFMTBCDField
      FieldName = 'MCA_TOVENDA'
      ProviderFlags = [pfInUpdate]
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsMovimentoCaixaMCA_VLTROCO: TFMTBCDField
      FieldName = 'MCA_VLTROCO'
      ProviderFlags = [pfInUpdate]
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsMovimentoCaixaMCA_OBSEVACAO: TStringField
      FieldName = 'MCA_OBSEVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsMovimentoCaixaMCA_SITUACAO: TStringField
      FieldName = 'MCA_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsMovimentoCaixaMCA_CAIXA: TIntegerField
      FieldName = 'MCA_CAIXA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
    end
    object cdsMovimentoCaixaMCA_NATUREZA: TIntegerField
      FieldName = 'MCA_NATUREZA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '00'
    end
    object cdsMovimentoCaixaMCA_MODALIDADE: TStringField
      FieldName = 'MCA_MODALIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsMovimentoCaixaMCA_NOMELOJA: TStringField
      FieldKind = fkLookup
      FieldName = 'MCA_NOMELOJA'
      LookupDataSet = DM2.cdsOrigem
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'MCA_LOJA'
      Size = 40
      Lookup = True
    end
    object cdsMovimentoCaixaMCA_NOMEMODA: TStringField
      FieldKind = fkLookup
      FieldName = 'MCA_NOMEMODA'
      LookupDataSet = DM2.cdsModalidades
      LookupKeyFields = 'MOD_CODIGO'
      LookupResultField = 'MOD_NOME'
      KeyFields = 'MCA_MODALIDADE'
      Size = 30
      Lookup = True
    end
    object cdsMovimentoCaixaMCA_NMNATUREZA: TStringField
      FieldKind = fkLookup
      FieldName = 'MCA_NMNATUREZA'
      LookupDataSet = dmConsultas.cdsNatureza
      LookupKeyFields = 'NAT_CODIGO'
      LookupResultField = 'NAT_NOME'
      KeyFields = 'MCA_NATUREZA'
      Size = 30
      Lookup = True
    end
    object cdsMovimentoCaixaMCA_FUNCIONARIO: TIntegerField
      FieldName = 'MCA_FUNCIONARIO'
    end
  end
  object dspMovimentoCaixa: TDataSetProvider
    DataSet = dstMovimentoCaixa
    Options = [poAllowCommandText]
    OnGetTableName = dspMovimentoCaixaGetTableName
    Left = 592
    Top = 332
  end
  object dsMovimentoCaixa: TDataSource
    DataSet = cdsMovimentoCaixa
    Left = 552
    Top = 405
  end
  object qryLoja: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO, EMP_LIMCAIXA from EM' +
        'PRESAS '
      'order by EMP_FANTASIA'
      '    ')
    SQLConnection = SqlAdmin
    Left = 896
    Top = 29
  end
  object dspLoja: TDataSetProvider
    DataSet = qryLoja
    Options = [poAllowCommandText]
    Left = 896
    Top = 77
  end
  object cdsLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLoja'
    Left = 904
    Top = 125
    object cdsLojaEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
    end
    object cdsLojaEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object cdsLojaEMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      Size = 50
    end
    object cdsLojaEMP_LIMCAIXA: TIntegerField
      FieldName = 'EMP_LIMCAIXA'
    end
  end
  object dstUsuarios: TSQLDataSet
    CommandText = 'select * from USUARIOS Where (SEN_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 341
    Top = 516
    object dstUsuariosSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstUsuariosSEN_NOME: TStringField
      FieldName = 'SEN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstUsuariosSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object dstUsuariosSEN_CARGO: TStringField
      FieldName = 'SEN_CARGO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstUsuariosSEN_TERMINAL: TStringField
      FieldName = 'SEN_TERMINAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuariosSEN_LOJA: TIntegerField
      FieldName = 'SEN_LOJA'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuariosSEN_FLSUPER: TStringField
      FieldName = 'SEN_FLSUPER'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstUsuariosSEN_FLCAIXA: TStringField
      FieldName = 'SEN_FLCAIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstUsuariosSEN_GRUPO: TIntegerField
      FieldName = 'SEN_GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuariosSEN_DTATUAL: TDateField
      FieldName = 'SEN_DTATUAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuariosSEN_FLEXCLUSAO: TStringField
      FieldName = 'SEN_FLEXCLUSAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstUsuariosSEN_ECF: TIntegerField
      FieldName = 'SEN_ECF'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuariosSEN_PASTA_CUPOM: TStringField
      FieldName = 'SEN_PASTA_CUPOM'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstUsuariosSEN_FLIMPRESSORA: TStringField
      FieldName = 'SEN_FLIMPRESSORA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstUsuariosUSU_ADMIN: TStringField
      FieldName = 'USU_ADMIN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstUsuariosSEN_LIMITEDESCONTO: TBCDField
      FieldName = 'SEN_LIMITEDESCONTO'
      Precision = 9
      Size = 2
    end
    object dstUsuariosSEN_LICHEQ: TBCDField
      FieldName = 'SEN_LICHEQ'
      Precision = 9
      Size = 2
    end
    object dstUsuariosSEN_PASTA_ECF: TStringField
      FieldName = 'SEN_PASTA_ECF'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = dstUsuarios
    Options = [poAllowCommandText]
    OnGetTableName = dspUsuariosGetTableName
    Left = 405
    Top = 516
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspUsuarios'
    Left = 469
    Top = 516
    object cdsUsuariosSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object cdsUsuariosSEN_NOME: TStringField
      FieldName = 'SEN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsUsuariosSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object cdsUsuariosSEN_CARGO: TStringField
      FieldName = 'SEN_CARGO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsUsuariosSEN_TERMINAL: TStringField
      FieldName = 'SEN_TERMINAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsUsuariosSEN_LOJA: TIntegerField
      FieldName = 'SEN_LOJA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsUsuariosSEN_FLSUPER: TStringField
      FieldName = 'SEN_FLSUPER'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsUsuariosSEN_FLCAIXA: TStringField
      FieldName = 'SEN_FLCAIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsUsuariosSEN_GRUPO: TIntegerField
      FieldName = 'SEN_GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsUsuariosSEN_DTATUAL: TDateField
      FieldName = 'SEN_DTATUAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsUsuariosSEN_FLEXCLUSAO: TStringField
      FieldName = 'SEN_FLEXCLUSAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsUsuariosSEN_ECF: TIntegerField
      FieldName = 'SEN_ECF'
      ProviderFlags = [pfInUpdate]
    end
    object cdsUsuariosSEN_IMPRESSORA: TStringField
      FieldKind = fkLookup
      FieldName = 'SEN_IMPRESSORA'
      LookupDataSet = DM2.cdsImpressora
      LookupKeyFields = 'IMP_CODIGO'
      LookupResultField = 'IMP_DESCRICAO'
      KeyFields = 'SEN_ECF'
      Size = 15
      Lookup = True
    end
    object cdsUsuariosSEN_PASTA_CUPOM: TStringField
      FieldName = 'SEN_PASTA_CUPOM'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsUsuariosSEN_FLIMPRESSORA: TStringField
      FieldName = 'SEN_FLIMPRESSORA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsUsuariosUSU_ADMIN: TStringField
      FieldName = 'USU_ADMIN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsUsuariosSEN_LIMITEDESCONTO: TBCDField
      FieldName = 'SEN_LIMITEDESCONTO'
      Precision = 9
      Size = 2
    end
    object cdsUsuariosSEN_LICHEQ: TBCDField
      FieldName = 'SEN_LICHEQ'
      Precision = 9
      Size = 2
    end
    object cdsUsuariosSEN_PASTA_ECF: TStringField
      FieldName = 'SEN_PASTA_ECF'
      Size = 60
    end
  end
  object dsUsuarios: TDataSource
    AutoEdit = False
    DataSet = cdsUsuarios
    Left = 528
    Top = 516
  end
  object dstModalidades: TSQLDataSet
    CommandText = 'select * from MODALIDADE Where (MOD_CODIGO = :pCODIGO) '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 624
    Top = 304
    object dstModalidadesMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstModalidadesMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstModalidadesMOD_ABREVIACAO: TStringField
      FieldName = 'MOD_ABREVIACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstModalidadesMOD_NRPARCELA: TIntegerField
      FieldName = 'MOD_NRPARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object dstModalidadesMOD_FLFIXA: TStringField
      FieldName = 'MOD_FLFIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstModalidadesMOD_AVISTA: TStringField
      FieldName = 'MOD_AVISTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstModalidadesMOD_CAIXA_GERAL: TIntegerField
      FieldName = 'MOD_CAIXA_GERAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstModalidadesMOD_PECOMISSAO: TBCDField
      FieldName = 'MOD_PECOMISSAO'
      Precision = 9
      Size = 2
    end
    object dstModalidadesMOD_FLXTEF: TStringField
      FieldName = 'MOD_FLXTEF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstModalidadesMOD_PASTA_ENVIA_TEF: TStringField
      FieldName = 'MOD_PASTA_ENVIA_TEF'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstModalidadesMOD_PASTA_RECEBE_TEF: TStringField
      FieldName = 'MOD_PASTA_RECEBE_TEF'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
  object dspModalidades: TDataSetProvider
    DataSet = dstModalidades
    Options = [poAllowCommandText]
    OnGetTableName = dspModalidadesGetTableName
    Left = 696
    Top = 437
  end
  object cdsModalidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModalidades'
    Left = 736
    Top = 99
    object cdsModalidadeMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsModalidadeMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsModalidadeMOD_ABREVIACAO: TStringField
      FieldName = 'MOD_ABREVIACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object cdsModalidadeMOD_NRPARCELA: TIntegerField
      FieldName = 'MOD_NRPARCELA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '00'
    end
    object cdsModalidadeMOD_FLFIXA: TStringField
      FieldName = 'MOD_FLFIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsModalidadeMOD_AVISTA: TStringField
      FieldName = 'MOD_AVISTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsModalidadeMOD_CAIXA_GERAL: TIntegerField
      FieldName = 'MOD_CAIXA_GERAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsModalidadeMOD_PECOMISSAO: TBCDField
      FieldName = 'MOD_PECOMISSAO'
      Precision = 9
      Size = 2
    end
    object cdsModalidadeMOD_NM_CONTA: TStringField
      FieldKind = fkLookup
      FieldName = 'MOD_NM_CONTA'
      LookupDataSet = cdsContaSaldo
      LookupKeyFields = 'CGS_CODIGO'
      LookupResultField = 'CGS_DESCRICAO'
      KeyFields = 'MOD_CAIXA_GERAL'
      Lookup = True
    end
    object cdsModalidadeMOD_FLXTEF: TStringField
      FieldName = 'MOD_FLXTEF'
      FixedChar = True
      Size = 1
    end
    object cdsModalidadeMOD_PASTA_ENVIA_TEF: TStringField
      FieldName = 'MOD_PASTA_ENVIA_TEF'
      Size = 60
    end
    object cdsModalidadeMOD_PASTA_RECEBE_TEF: TStringField
      FieldName = 'MOD_PASTA_RECEBE_TEF'
      Size = 60
    end
  end
  object dsModalidades: TDataSource
    AutoEdit = False
    DataSet = cdsModalidade
    Left = 688
    Top = 485
  end
  object dstMovimento: TSQLDataSet
    CommandText = 'Select * from VENDAS Where (MOV_PEDIDO = :pPEDIDO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 8
    Top = 390
    object dstMovimentoMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
    end
    object dstMovimentoMOV_CUPOM: TIntegerField
      FieldName = 'MOV_CUPOM'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_SEQUENCIA: TIntegerField
      FieldName = 'MOV_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_HORAVENDA: TStringField
      FieldName = 'MOV_HORAVENDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstMovimentoMOV_DATACANC: TDateField
      FieldName = 'MOV_DATACANC'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_HORACANC: TStringField
      FieldName = 'MOV_HORACANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstMovimentoMOV_MOTCANC: TStringField
      FieldName = 'MOV_MOTCANC'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstMovimentoMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstMovimentoMOV_ENTRADA: TFMTBCDField
      FieldName = 'MOV_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstMovimentoMOV_DESCONTO: TFMTBCDField
      FieldName = 'MOV_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstMovimentoMOV_ACRESCIMO: TFMTBCDField
      FieldName = 'MOV_ACRESCIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstMovimentoMOV_DEVOLUSAO: TFMTBCDField
      FieldName = 'MOV_DEVOLUSAO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstMovimentoMOV_TROCO: TFMTBCDField
      FieldName = 'MOV_TROCO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstMovimentoMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstMovimentoDOM_ENDERECO: TStringField
      FieldName = 'DOM_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstMovimentoDOM_NUMERO: TStringField
      FieldName = 'DOM_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstMovimentoDOM_BAIRRO: TStringField
      FieldName = 'DOM_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstMovimentoDOM_CIDADE: TStringField
      FieldName = 'DOM_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoDOM_REFERE: TStringField
      FieldName = 'DOM_REFERE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstMovimentoMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstMovimentoMOV_TABELA: TIntegerField
      FieldName = 'MOV_TABELA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_TIPO_FRETE: TStringField
      FieldName = 'MOV_TIPO_FRETE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstMovimentoMOV_PERC_FRETE: TFMTBCDField
      FieldName = 'MOV_PERC_FRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstMovimentoMOV_IDTRANSPORTADORA: TIntegerField
      FieldName = 'MOV_IDTRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_TABELA_PLANO: TIntegerField
      FieldName = 'MOV_TABELA_PLANO'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_OBSERVACAO: TMemoField
      FieldName = 'MOV_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstMovimentoMOV_MODALIDADE_PEDIDO: TIntegerField
      FieldName = 'MOV_MODALIDADE_PEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_OBS1: TMemoField
      FieldName = 'MOV_OBS1'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstMovimentoMOV_OBS2: TMemoField
      FieldName = 'MOV_OBS2'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstMovimentoMOV_NRMESA: TStringField
      FieldName = 'MOV_NRMESA'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object dstMovimentoDOM_COMPLEMENTO: TStringField
      FieldName = 'DOM_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstMovimentoDOM_NRFONE: TStringField
      FieldName = 'DOM_NRFONE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstMovimentoMOV_TAXA_SERVICO: TBCDField
      FieldName = 'MOV_TAXA_SERVICO'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
  end
  object dspMovimento: TDataSetProvider
    DataSet = dstMovimento
    Options = [poAllowCommandText]
    OnGetTableName = dspMovimentoGetTableName
    Left = 48
    Top = 380
  end
  object cdsMovimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovimento'
    Left = 96
    Top = 385
    object cdsMovimentoMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsMovimentoMOV_CUPOM: TIntegerField
      FieldName = 'MOV_CUPOM'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000000'
    end
    object cdsMovimentoMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
    end
    object cdsMovimentoMOV_SEQUENCIA: TIntegerField
      FieldName = 'MOV_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '9999999999'
    end
    object cdsMovimentoMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0000000'
    end
    object cdsMovimentoMOV_DATAVENDA: TDateField
      Alignment = taRightJustify
      FieldName = 'MOV_DATAVENDA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsMovimentoMOV_HORAVENDA: TStringField
      Alignment = taRightJustify
      FieldName = 'MOV_HORAVENDA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99:99;1;_'
      FixedChar = True
      Size = 5
    end
    object cdsMovimentoMOV_DATACANC: TDateField
      Alignment = taRightJustify
      FieldName = 'MOV_DATACANC'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsMovimentoMOV_HORACANC: TStringField
      Alignment = taRightJustify
      FieldName = 'MOV_HORACANC'
      ProviderFlags = [pfInUpdate]
      EditMask = '99:99;1;_'
      FixedChar = True
      Size = 5
    end
    object cdsMovimentoMOV_MOTCANC: TStringField
      FieldName = 'MOV_MOTCANC'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsMovimentoMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000000'
    end
    object cdsMovimentoMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsMovimentoMOV_ENTRADA: TFMTBCDField
      FieldName = 'MOV_ENTRADA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsMovimentoMOV_DESCONTO: TFMTBCDField
      FieldName = 'MOV_DESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsMovimentoMOV_ACRESCIMO: TFMTBCDField
      FieldName = 'MOV_ACRESCIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsMovimentoMOV_DEVOLUSAO: TFMTBCDField
      FieldName = 'MOV_DEVOLUSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsMovimentoMOV_TROCO: TFMTBCDField
      FieldName = 'MOV_TROCO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsMovimentoMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsMovimentoDOM_ENDERECO: TStringField
      FieldName = 'DOM_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsMovimentoDOM_NUMERO: TStringField
      FieldName = 'DOM_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsMovimentoDOM_BAIRRO: TStringField
      FieldName = 'DOM_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsMovimentoDOM_CIDADE: TStringField
      FieldName = 'DOM_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentoDOM_REFERE: TStringField
      FieldName = 'DOM_REFERE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsMovimentoMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsMovimentoMOV_TABELA: TIntegerField
      FieldName = 'MOV_TABELA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentoMOV_TIPO_FRETE: TStringField
      FieldName = 'MOV_TIPO_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsMovimentoMOV_PERC_FRETE: TFMTBCDField
      FieldName = 'MOV_PERC_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsMovimentoMOV_IDTRANSPORTADORA: TIntegerField
      FieldName = 'MOV_IDTRANSPORTADORA'
    end
    object cdsMovimentoMOV_TABELA_PLANO: TIntegerField
      FieldName = 'MOV_TABELA_PLANO'
    end
    object cdsMovimentoMOV_OBSERVACAO: TMemoField
      FieldName = 'MOV_OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsMovimentoMOV_MODALIDADE_PEDIDO: TIntegerField
      FieldName = 'MOV_MODALIDADE_PEDIDO'
    end
    object cdsMovimentoMOV_OBS1: TMemoField
      FieldName = 'MOV_OBS1'
      BlobType = ftMemo
    end
    object cdsMovimentoMOV_OBS2: TMemoField
      FieldName = 'MOV_OBS2'
      BlobType = ftMemo
    end
    object cdsMovimentoMOV_NRMESA: TStringField
      FieldName = 'MOV_NRMESA'
      Size = 6
    end
    object cdsMovimentoDOM_COMPLEMENTO: TStringField
      FieldName = 'DOM_COMPLEMENTO'
      Size = 30
    end
    object cdsMovimentoDOM_NRFONE: TStringField
      Alignment = taRightJustify
      FieldName = 'DOM_NRFONE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 10
    end
    object cdsMovimentoMOV_TAXA_SERVICO: TBCDField
      FieldName = 'MOV_TAXA_SERVICO'
      Precision = 9
      Size = 2
    end
  end
  object dsMovimento: TDataSource
    DataSet = cdsMovimento
    Left = 264
    Top = 335
  end
  object dstEstoque: TSQLDataSet
    CommandText = 
      'select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA)'#13#10'and' +
      ' (PRO_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGOLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = SqlAdmin
    Left = 608
    Top = 13
    object dstEstoqueEST_CODIGOLOJA: TIntegerField
      FieldName = 'EST_CODIGOLOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dstEstoquePRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 13
    end
    object dstEstoqueUNI_CODIGO: TStringField
      FieldName = 'UNI_CODIGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstEstoqueEST_DTENTRADA: TDateField
      FieldName = 'EST_DTENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEstoqueEST_QUANTENTRADA: TFMTBCDField
      FieldName = 'EST_QUANTENTRADA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEstoqueEST_DTSAIDA: TDateField
      FieldName = 'EST_DTSAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEstoqueEST_QUANTSAIDA: TFMTBCDField
      FieldName = 'EST_QUANTSAIDA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEstoqueEST_CUSTOANTERIOR: TFMTBCDField
      FieldName = 'EST_CUSTOANTERIOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEstoqueEST_CUSTOMEDIO: TFMTBCDField
      FieldName = 'EST_CUSTOMEDIO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEstoqueEST_MAIORCUSTO: TFMTBCDField
      FieldName = 'EST_MAIORCUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstEstoqueEST_MINIMO: TFMTBCDField
      FieldName = 'EST_MINIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstEstoqueULTREAJUST: TDateField
      FieldName = 'ULTREAJUST'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspEstoque: TDataSetProvider
    DataSet = dstEstoque
    Options = [poAllowCommandText]
    Left = 760
    Top = 13
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoque'
    Left = 824
    Top = 29
    object cdsEstoqueEST_CODIGOLOJA: TIntegerField
      FieldName = 'EST_CODIGOLOJA'
    end
    object cdsEstoquePRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      FixedChar = True
      Size = 13
    end
    object cdsEstoqueUNI_CODIGO: TStringField
      FieldName = 'UNI_CODIGO'
      FixedChar = True
      Size = 2
    end
    object cdsEstoqueEST_DTENTRADA: TDateField
      FieldName = 'EST_DTENTRADA'
    end
    object cdsEstoqueEST_QUANTENTRADA: TFMTBCDField
      FieldName = 'EST_QUANTENTRADA'
      Precision = 15
      Size = 2
    end
    object cdsEstoqueEST_DTSAIDA: TDateField
      FieldName = 'EST_DTSAIDA'
    end
    object cdsEstoqueEST_QUANTSAIDA: TFMTBCDField
      FieldName = 'EST_QUANTSAIDA'
      Precision = 15
      Size = 2
    end
    object cdsEstoqueEST_CUSTOANTERIOR: TFMTBCDField
      FieldName = 'EST_CUSTOANTERIOR'
      Precision = 15
      Size = 2
    end
    object cdsEstoqueEST_CUSTOMEDIO: TFMTBCDField
      FieldName = 'EST_CUSTOMEDIO'
      Precision = 15
      Size = 2
    end
    object cdsEstoqueEST_MAIORCUSTO: TFMTBCDField
      FieldName = 'EST_MAIORCUSTO'
      Precision = 15
      Size = 2
    end
    object cdsEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      DisplayFormat = '#,##0.#00'
      Precision = 15
      Size = 3
    end
    object cdsEstoqueEST_MINIMO: TFMTBCDField
      FieldName = 'EST_MINIMO'
      Precision = 15
      Size = 3
    end
    object cdsEstoqueULTREAJUST: TDateField
      FieldName = 'ULTREAJUST'
    end
  end
  object dsEstoque: TDataSource
    DataSet = cdsEstoque
    Left = 840
    Top = 69
  end
  object dstHistorico: TSQLDataSet
    CommandText = 
      'select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA)'#13#10'And' +
      ' (HIS_LOJA = :pLOJA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 592
    Top = 388
    object dstHistoricoHIS_SEQUENCIA: TIntegerField
      FieldName = 'HIS_SEQUENCIA'
    end
    object dstHistoricoHIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
    end
    object dstHistoricoHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object dstHistoricoHIS_UNIDADE: TStringField
      FieldName = 'HIS_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstHistoricoHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
      ProviderFlags = [pfInUpdate]
    end
    object dstHistoricoHIS_HORA: TStringField
      FieldName = 'HIS_HORA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstHistoricoHIS_TIPO: TStringField
      FieldName = 'HIS_TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstHistoricoHIS_DOCUMENTO: TIntegerField
      FieldName = 'HIS_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstHistoricoHIS_ANTERIOR: TFMTBCDField
      FieldName = 'HIS_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstHistoricoHIS_MOVIMENTO: TFMTBCDField
      FieldName = 'HIS_MOVIMENTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstHistoricoHIS_ATUAL: TFMTBCDField
      FieldName = 'HIS_ATUAL'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstHistoricoHIS_USUARIO: TIntegerField
      FieldName = 'HIS_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstHistoricoHIS_MOTIVO: TIntegerField
      FieldName = 'HIS_MOTIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstHistoricoHIS_VLCUSTO: TFMTBCDField
      FieldName = 'HIS_VLCUSTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object dstHistoricoHIS_VLCOMPRA: TFMTBCDField
      FieldName = 'HIS_VLCOMPRA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object dstHistoricoHIS_VLVENDA: TFMTBCDField
      FieldName = 'HIS_VLVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object dstHistoricoHIS_CODIGOBAIXA: TStringField
      FieldName = 'HIS_CODIGOBAIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object dstHistoricoHIS_VENDEDOR: TIntegerField
      FieldName = 'HIS_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspHistorico: TDataSetProvider
    DataSet = dstHistorico
    Options = [poAllowCommandText]
    OnGetTableName = dspHistoricoGetTableName
    Left = 672
    Top = 293
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistorico'
    Left = 656
    Top = 319
    object cdsHistoricoHIS_SEQUENCIA: TIntegerField
      FieldName = 'HIS_SEQUENCIA'
    end
    object cdsHistoricoHIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
    end
    object cdsHistoricoHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsHistoricoHIS_UNIDADE: TStringField
      FieldName = 'HIS_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsHistoricoHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object cdsHistoricoHIS_HORA: TStringField
      FieldName = 'HIS_HORA'
      FixedChar = True
      Size = 5
    end
    object cdsHistoricoHIS_TIPO: TStringField
      FieldName = 'HIS_TIPO'
      FixedChar = True
      Size = 2
    end
    object cdsHistoricoHIS_DOCUMENTO: TIntegerField
      FieldName = 'HIS_DOCUMENTO'
    end
    object cdsHistoricoHIS_ANTERIOR: TFMTBCDField
      FieldName = 'HIS_ANTERIOR'
      Precision = 15
      Size = 3
    end
    object cdsHistoricoHIS_MOVIMENTO: TFMTBCDField
      FieldName = 'HIS_MOVIMENTO'
      Precision = 15
      Size = 3
    end
    object cdsHistoricoHIS_ATUAL: TFMTBCDField
      FieldName = 'HIS_ATUAL'
      Precision = 15
      Size = 3
    end
    object cdsHistoricoHIS_USUARIO: TIntegerField
      FieldName = 'HIS_USUARIO'
    end
    object cdsHistoricoHIS_MOTIVO: TIntegerField
      FieldName = 'HIS_MOTIVO'
    end
    object cdsHistoricoHIS_VLCUSTO: TFMTBCDField
      FieldName = 'HIS_VLCUSTO'
      DisplayFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsHistoricoHIS_VLCOMPRA: TFMTBCDField
      FieldName = 'HIS_VLCOMPRA'
      DisplayFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsHistoricoHIS_VLVENDA: TFMTBCDField
      FieldName = 'HIS_VLVENDA'
      DisplayFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsHistoricoHIS_CODIGOBAIXA: TStringField
      FieldName = 'HIS_CODIGOBAIXA'
      FixedChar = True
      Size = 13
    end
    object cdsHistoricoHIS_VENDEDOR: TIntegerField
      FieldName = 'HIS_VENDEDOR'
      DisplayFormat = '000000'
    end
  end
  object dsHistorico: TDataSource
    DataSet = cdsHistorico
    Left = 696
    Top = 333
  end
  object cdsItensVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsItensVendasCalcFields
    Left = 424
    Top = 133
    object cdsItensVendasITE_NRITEN: TStringField
      FieldName = 'ITE_NRITEN'
    end
    object cdsItensVendasITE_CDITEN: TStringField
      FieldName = 'ITE_CDITEN'
    end
    object cdsItensVendasITE_NMDESC: TStringField
      FieldName = 'ITE_NMDESC'
      Size = 40
    end
    object cdsItensVendasITE_QTITEN: TFloatField
      FieldName = 'ITE_QTITEN'
    end
    object cdsItensVendasITE_CDUNID: TStringField
      FieldName = 'ITE_CDUNID'
    end
    object cdsItensVendasITE_VLUNIT: TCurrencyField
      FieldName = 'ITE_VLUNIT'
      DisplayFormat = '###,###,##0.#0'
      currency = False
    end
    object cdsItensVendasITE_VLSUBT: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ITE_VLSUBT'
      DisplayFormat = '###,###,##0.#0'
      currency = False
      Calculated = True
    end
    object cdsItensVendasITE_FLCANC: TStringField
      FieldName = 'ITE_FLCANC'
    end
    object cdsItensVendasITE_VLCOMP: TCurrencyField
      FieldName = 'ITE_VLCOMP'
    end
    object cdsItensVendasITE_VLCUST: TCurrencyField
      FieldName = 'ITE_VLCUST'
    end
    object cdsItensVendasITE_NRLOTE: TStringField
      FieldName = 'ITE_NRLOTE'
    end
    object cdsItensVendasITE_CDBAIX: TStringField
      FieldName = 'ITE_CDBAIX'
      Size = 13
    end
    object cdsItensVendasITE_VLDESC: TFloatField
      FieldName = 'ITE_VLDESC'
    end
    object cdsItensVendasITE_VLACRE: TFloatField
      FieldName = 'ITE_VLACRE'
    end
    object cdsItensVendasITE_VENDEDOR: TIntegerField
      FieldName = 'ITE_VENDEDOR'
      DisplayFormat = '000000'
    end
    object cdsItensVendasITE_CODCOR: TIntegerField
      FieldName = 'ITE_CODCOR'
    end
    object cdsItensVendasITE_VALIPI: TFloatField
      FieldName = 'ITE_VALIPI'
    end
    object cdsItensVendasITE_NMFUNC: TStringField
      FieldKind = fkLookup
      FieldName = 'ITE_NMFUNC'
      LookupDataSet = cdsListaFuncionarios
      LookupKeyFields = 'FUN_CODIGO'
      LookupResultField = 'FUN_NOME'
      KeyFields = 'ITE_VENDEDOR'
      Lookup = True
    end
  end
  object dsItensVendas: TDataSource
    DataSet = cdsItensVendas
    Left = 456
    Top = 133
  end
  object dstItensVendas: TSQLDataSet
    CommandText = 'Select * from PROVENDAS Where (MOP_PEDIDO = :pPEDIDO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 552
    Top = 165
    object dstItensVendasMOP_PEDIDO: TIntegerField
      FieldName = 'MOP_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dstItensVendasMOP_PRODUTO: TStringField
      FieldName = 'MOP_PRODUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object dstItensVendasMOP_QUANTIDADE: TFMTBCDField
      FieldName = 'MOP_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstItensVendasMOP_UNIDADE: TStringField
      FieldName = 'MOP_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstItensVendasMOP_VALOR: TFMTBCDField
      FieldName = 'MOP_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstItensVendasMOP_DESCONTO: TFMTBCDField
      FieldName = 'MOP_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstItensVendasMOP_SERIE: TStringField
      FieldName = 'MOP_SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstItensVendasMOP_CUSTO: TFMTBCDField
      FieldName = 'MOP_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstItensVendasMOP_COMPRA: TFMTBCDField
      FieldName = 'MOP_COMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstItensVendasMOP_CODCOR: TIntegerField
      FieldName = 'MOP_CODCOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstItensVendasMOP_VALIPI: TFMTBCDField
      FieldName = 'MOP_VALIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
  end
  object dspItensVenda: TDataSetProvider
    DataSet = dstItensVendas
    Options = [poAllowCommandText]
    Left = 600
    Top = 173
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItensVenda'
    Left = 608
    Top = 216
    object cdsItensVendaMOP_PEDIDO: TIntegerField
      FieldName = 'MOP_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '9999999'
    end
    object cdsItensVendaMOP_PRODUTO: TStringField
      FieldName = 'MOP_PRODUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object cdsItensVendaMOP_QUANTIDADE: TFMTBCDField
      FieldName = 'MOP_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object cdsItensVendaMOP_UNIDADE: TStringField
      FieldName = 'MOP_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsItensVendaMOP_VALOR: TFMTBCDField
      FieldName = 'MOP_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsItensVendaMOP_DESCONTO: TFMTBCDField
      FieldName = 'MOP_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsItensVendaMOP_SERIE: TStringField
      FieldName = 'MOP_SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsItensVendaMOP_CUSTO: TFMTBCDField
      FieldName = 'MOP_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsItensVendaMOP_COMPRA: TFMTBCDField
      FieldName = 'MOP_COMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsItensVendaMOP_CODCOR: TIntegerField
      FieldName = 'MOP_CODCOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensVendaMOP_VALIPI: TFMTBCDField
      FieldName = 'MOP_VALIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
  end
  object dsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 680
    Top = 189
  end
  object dstDerivados: TSQLDataSet
    CommandText = 'select * from DERIVADOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 32
    Top = 13
    object dstDerivadosDER_ID: TIntegerField
      FieldName = 'DER_ID'
    end
    object dstDerivadosDER_DESCRICAO: TStringField
      FieldName = 'DER_DESCRICAO'
      Size = 40
    end
    object dstDerivadosDER_PRODUTO: TStringField
      FieldName = 'DER_PRODUTO'
      Size = 13
    end
    object dstDerivadosDER_QUANTIDADE: TFMTBCDField
      FieldName = 'DER_QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object dstDerivadosDER_PECENTUAL: TFMTBCDField
      FieldName = 'DER_PECENTUAL'
      Precision = 15
      Size = 2
    end
  end
  object dspDerivados: TDataSetProvider
    DataSet = dstDerivados
    Options = [poAllowCommandText]
    OnGetTableName = dspDerivadosGetTableName
    Left = 96
    Top = 13
  end
  object cdsDerivados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDerivados'
    Left = 168
    Top = 13
    object cdsDerivadosDER_ID: TIntegerField
      FieldName = 'DER_ID'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
    end
    object cdsDerivadosDER_DESCRICAO: TStringField
      FieldName = 'DER_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsDerivadosDER_PRODUTO: TStringField
      FieldName = 'DER_PRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object cdsDerivadosDER_QUANTIDADE: TFMTBCDField
      FieldName = 'DER_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object cdsDerivadosDER_PECENTUAL: TFMTBCDField
      FieldName = 'DER_PECENTUAL'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsDerivadosDER_PRONOME: TStringField
      FieldKind = fkLookup
      FieldName = 'DER_PRONOME'
      LookupDataSet = qryProdutos
      LookupKeyFields = 'PRO_CODIGO'
      LookupResultField = 'PRO_DESCRICAO'
      KeyFields = 'DER_PRODUTO'
      Size = 40
      Lookup = True
    end
  end
  object dsDerivados: TDataSource
    AutoEdit = False
    DataSet = cdsDerivados
    Left = 232
    Top = 13
  end
  object qryProdutos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select PRO_CODIGO, PRO_DESCRICAO from PRODUTOS '
      'order by PRO_DESCRICAO')
    SQLConnection = SqlAdmin
    Left = 328
    Top = 69
  end
  object dstAbate: TSQLDataSet
    CommandText = 'select * from ABATE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 48
    Top = 189
    object dstAbateABT_SEQUENCIA: TIntegerField
      FieldName = 'ABT_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstAbateABT_ID: TIntegerField
      FieldName = 'ABT_ID'
      ProviderFlags = [pfInUpdate]
    end
    object dstAbateABT_TIPO: TIntegerField
      FieldName = 'ABT_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object dstAbateABT_PESO: TFMTBCDField
      FieldName = 'ABT_PESO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstAbateABT_PESOAPOSABATE: TFMTBCDField
      FieldName = 'ABT_PESOAPOSABATE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstAbateABT_PESOMEDIO: TFMTBCDField
      FieldName = 'ABT_PESOMEDIO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstAbateABT_PRODUTO: TStringField
      FieldName = 'ABT_PRODUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object dstAbateABT_QUANTIDADE: TFMTBCDField
      FieldName = 'ABT_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstAbateABT_PESOPRODUTO: TFMTBCDField
      FieldName = 'ABT_PESOPRODUTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
  end
  object dsAbate: TDataSource
    AutoEdit = False
    DataSet = cdsAbate
    Left = 256
    Top = 189
  end
  object dspAbate: TDataSetProvider
    DataSet = dstAbate
    Options = [poAllowCommandText]
    OnGetTableName = dspAbateGetTableName
    Left = 120
    Top = 189
  end
  object cdsAbate: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAbate'
    Left = 184
    Top = 181
    object cdsAbateABT_SEQUENCIA: TIntegerField
      FieldName = 'ABT_SEQUENCIA'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsAbateABT_ID: TIntegerField
      FieldName = 'ABT_ID'
      DisplayFormat = '000'
    end
    object cdsAbateABT_TIPO: TIntegerField
      FieldName = 'ABT_TIPO'
    end
    object cdsAbateABT_PESO: TFMTBCDField
      FieldName = 'ABT_PESO'
      DisplayFormat = '###,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsAbateABT_PESOAPOSABATE: TFMTBCDField
      FieldName = 'ABT_PESOAPOSABATE'
      DisplayFormat = '###,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsAbateABT_PESOMEDIO: TFMTBCDField
      FieldName = 'ABT_PESOMEDIO'
      DisplayFormat = '###,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsAbateABT_PRODUTO: TStringField
      FieldName = 'ABT_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsAbateABT_QUANTIDADE: TFMTBCDField
      FieldName = 'ABT_QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object cdsAbateABT_PESOPRODUTO: TFMTBCDField
      FieldName = 'ABT_PESOPRODUTO'
      Precision = 15
      Size = 3
    end
    object cdsAbateABT_TPDESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'ABT_TPDESCRICAO'
      LookupDataSet = DM2.cdsDerivados
      LookupKeyFields = 'DER_ID'
      LookupResultField = 'DER_DESCRICAO'
      KeyFields = 'ABT_TIPO'
      Size = 40
      Lookup = True
    end
  end
  object dstPerda: TSQLDataSet
    CommandText = 
      'select * from HISTORICO_PERDA '#13#10'Where (HPD_SEQUENCIA = :pSEQUENC' +
      'IA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = SqlAdmin
    Left = 56
    Top = 261
    object dstPerdaHPD_SEQUENCIA: TIntegerField
      FieldName = 'HPD_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstPerdaHPD_TIPOABATE: TIntegerField
      FieldName = 'HPD_TIPOABATE'
      ProviderFlags = [pfInUpdate]
    end
    object dstPerdaHPD_PRODUTO: TStringField
      FieldName = 'HPD_PRODUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object dstPerdaHPD_IDPERDA: TIntegerField
      FieldName = 'HPD_IDPERDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstPerdaHPD_QUANTIDADE: TFMTBCDField
      FieldName = 'HPD_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstPerdaHPD_DATA: TDateField
      FieldName = 'HPD_DATA'
      ProviderFlags = [pfInUpdate]
    end
    object dstPerdaHPD_HORA: TStringField
      FieldName = 'HPD_HORA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstPerdaHPD_USUARIO: TIntegerField
      FieldName = 'HPD_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspPerda: TDataSetProvider
    DataSet = dstPerda
    Options = [poAllowCommandText]
    Left = 120
    Top = 261
  end
  object cdsPerda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerda'
    Left = 192
    Top = 253
    object cdsPerdaHPD_SEQUENCIA: TIntegerField
      FieldName = 'HPD_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsPerdaHPD_TIPOABATE: TIntegerField
      FieldName = 'HPD_TIPOABATE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerdaHPD_PRODUTO: TStringField
      FieldName = 'HPD_PRODUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object cdsPerdaHPD_IDPERDA: TIntegerField
      FieldName = 'HPD_IDPERDA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerdaHPD_QUANTIDADE: TFMTBCDField
      FieldName = 'HPD_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.##0'
      EditFormat = '###,##0.##0'
      Precision = 15
      Size = 3
    end
    object cdsPerdaHPD_DATA: TDateField
      FieldName = 'HPD_DATA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsPerdaHPD_HORA: TStringField
      FieldName = 'HPD_HORA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99:99;1;_'
      FixedChar = True
      Size = 5
    end
    object cdsPerdaHPD_USUARIO: TIntegerField
      FieldName = 'HPD_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerdaHPD_DESCPERDA: TStringField
      FieldKind = fkLookup
      FieldName = 'HPD_DESCPERDA'
      LookupDataSet = dmConsultas.cdsPerda
      LookupKeyFields = 'PER_ID'
      LookupResultField = 'PER_DESCRICAO'
      KeyFields = 'HPD_IDPERDA'
      Size = 40
      Lookup = True
    end
    object cdsPerdaHPD_DESCABATE: TStringField
      FieldKind = fkLookup
      FieldName = 'HPD_DESCABATE'
      LookupDataSet = DM2.cdsDerivados
      LookupKeyFields = 'DER_ID'
      LookupResultField = 'DER_DESCRICAO'
      KeyFields = 'HPD_TIPOABATE'
      Size = 40
      Lookup = True
    end
    object cdsPerdaHPD_NMPRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'HPD_NMPRODUTO'
      LookupDataSet = DM2.cdsProdutos2
      LookupKeyFields = 'PRO_CODIGO'
      LookupResultField = 'PRO_DESCRICAO'
      KeyFields = 'HPD_PRODUTO'
      Size = 40
      Lookup = True
    end
  end
  object dsPerda: TDataSource
    AutoEdit = False
    DataSet = cdsPerda
    Left = 248
    Top = 261
  end
  object ppDBParametros: TppDBPipeline
    DataSource = DsConfig
    UserName = 'DBParametros'
    Left = 384
    Top = 69
    object ppDBParametrosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_EMPRESA'
      FieldName = 'CFG_EMPRESA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBParametrosppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_CLIENTE'
      FieldName = 'CFG_CLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBParametrosppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_FORNECEDOR'
      FieldName = 'CFG_FORNECEDOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBParametrosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_CIDADE'
      FieldName = 'CFG_CIDADE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBParametrosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CGF_BAIRRO'
      FieldName = 'CGF_BAIRRO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBParametrosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_CARGO'
      FieldName = 'CFG_CARGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDBParametrosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_SITUACAO'
      FieldName = 'CFG_SITUACAO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBParametrosppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_ATIVIDADE'
      FieldName = 'CFG_ATIVIDADE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBParametrosppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_CONTATO'
      FieldName = 'CFG_CONTATO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDBParametrosppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_PRODUTO'
      FieldName = 'CFG_PRODUTO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object ppDBParametrosppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_SECAO'
      FieldName = 'CFG_SECAO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppDBParametrosppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_SUBSECAO'
      FieldName = 'CFG_SUBSECAO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object ppDBParametrosppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_TRIBUTACAO'
      FieldName = 'CFG_TRIBUTACAO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
    object ppDBParametrosppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_ENTRADA'
      FieldName = 'CFG_ENTRADA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object ppDBParametrosppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_FUNCIONARIO'
      FieldName = 'CFG_FUNCIONARIO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object ppDBParametrosppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_RECEBIMENTO'
      FieldName = 'CFG_RECEBIMENTO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 15
    end
    object ppDBParametrosppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_MODALIDADE'
      FieldName = 'CFG_MODALIDADE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object ppDBParametrosppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_NATUREZA'
      FieldName = 'CFG_NATUREZA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object ppDBParametrosppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_CREDITO'
      FieldName = 'CFG_CREDITO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object ppDBParametrosppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_SEQUENCIA'
      FieldName = 'CFG_SEQUENCIA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 19
    end
    object ppDBParametrosppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_CAIXA'
      FieldName = 'CFG_CAIXA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 20
    end
    object ppDBParametrosppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_USUARIO'
      FieldName = 'CFG_USUARIO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 21
    end
    object ppDBParametrosppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_VENDA'
      FieldName = 'CFG_VENDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 22
    end
    object ppDBParametrosppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_NATUREZAVENDA'
      FieldName = 'CFG_NATUREZAVENDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 23
    end
    object ppDBParametrosppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_IDDERIVADOS'
      FieldName = 'CFG_IDDERIVADOS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
    object ppDBParametrosppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_ABATE'
      FieldName = 'CFG_ABATE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 25
    end
    object ppDBParametrosppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_PERDAS'
      FieldName = 'CFG_PERDAS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 26
    end
    object ppDBParametrosppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_IDPERDA'
      FieldName = 'CFG_IDPERDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 27
    end
    object ppDBParametrosppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_HISTORICOPERDA'
      FieldName = 'CFG_HISTORICOPERDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 28
    end
    object ppDBParametrosppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_TRANSFERENCIA'
      FieldName = 'CFG_TRANSFERENCIA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 29
    end
    object ppDBParametrosppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_LOJAPADRAO'
      FieldName = 'CFG_LOJAPADRAO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 30
    end
    object ppDBParametrosppField32: TppField
      FieldAlias = 'CFG_IMAGEMLOGO'
      FieldName = 'CFG_IMAGEMLOGO'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDBParametrosppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_IMPRESSORA'
      FieldName = 'CFG_IMPRESSORA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 32
    end
    object ppDBParametrosppField34: TppField
      FieldAlias = 'CFG_FLVENDEDOR'
      FieldName = 'CFG_FLVENDEDOR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 33
    end
    object ppDBParametrosppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_SEQPAGAR'
      FieldName = 'CFG_SEQPAGAR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 34
    end
    object ppDBParametrosppField36: TppField
      FieldAlias = 'CFG_DATATUAL'
      FieldName = 'CFG_DATATUAL'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 35
    end
    object ppDBParametrosppField37: TppField
      FieldAlias = 'CFG_NMNATUREZA'
      FieldName = 'CFG_NMNATUREZA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 36
    end
    object ppDBParametrosppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_SEQRECEBER'
      FieldName = 'CFG_SEQRECEBER'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 37
    end
    object ppDBParametrosppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_ETIQUETAPRODUTO'
      FieldName = 'CFG_ETIQUETAPRODUTO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 38
    end
    object ppDBParametrosppField40: TppField
      FieldAlias = 'CFG_PADRAOBARRAS'
      FieldName = 'CFG_PADRAOBARRAS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 39
    end
    object ppDBParametrosppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_MOTIVODEVOLUCAO'
      FieldName = 'CFG_MOTIVODEVOLUCAO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 40
    end
    object ppDBParametrosppField42: TppField
      FieldAlias = 'CFG_FLVENDAESTOQUE'
      FieldName = 'CFG_FLVENDAESTOQUE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 41
    end
    object ppDBParametrosppField43: TppField
      FieldAlias = 'CFG_FLLOTE'
      FieldName = 'CFG_FLLOTE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 42
    end
    object ppDBParametrosppField44: TppField
      FieldAlias = 'CFG_FLCUPOMVENDA'
      FieldName = 'CFG_FLCUPOMVENDA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 43
    end
    object ppDBParametrosppField45: TppField
      FieldAlias = 'CFG_CDBARRAS'
      FieldName = 'CFG_CDBARRAS'
      FieldLength = 13
      DisplayWidth = 13
      Position = 44
    end
    object ppDBParametrosppField46: TppField
      FieldAlias = 'CFG_MENSAGEM_CUPOM'
      FieldName = 'CFG_MENSAGEM_CUPOM'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppDBParametrosppField47: TppField
      FieldAlias = 'CFG_EMAIL'
      FieldName = 'CFG_EMAIL'
      FieldLength = 50
      DisplayWidth = 50
      Position = 46
    end
    object ppDBParametrosppField48: TppField
      FieldAlias = 'CFG_SMTP_EMAIL'
      FieldName = 'CFG_SMTP_EMAIL'
      FieldLength = 40
      DisplayWidth = 40
      Position = 47
    end
    object ppDBParametrosppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_COR'
      FieldName = 'CFG_COR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 48
    end
    object ppDBParametrosppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_TABPRECO'
      FieldName = 'CFG_TABPRECO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 49
    end
    object ppDBParametrosppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_TIPOCLIENTE'
      FieldName = 'CFG_TIPOCLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 50
    end
    object ppDBParametrosppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_REGIAO'
      FieldName = 'CFG_REGIAO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 51
    end
    object ppDBParametrosppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_ORCAMENTO'
      FieldName = 'CFG_ORCAMENTO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 52
    end
    object ppDBParametrosppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_CEDENTE'
      FieldName = 'CFG_CEDENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 53
    end
    object ppDBParametrosppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_MODELO_BOLETO'
      FieldName = 'CFG_MODELO_BOLETO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 54
    end
    object ppDBParametrosppField56: TppField
      FieldAlias = 'CFG_MENSAGEM_BOLETO'
      FieldName = 'CFG_MENSAGEM_BOLETO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 55
    end
    object ppDBParametrosppField57: TppField
      FieldAlias = 'CFG_LOCAL_PAGAMENTO'
      FieldName = 'CFG_LOCAL_PAGAMENTO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 56
    end
    object ppDBParametrosppField58: TppField
      FieldAlias = 'CFG_IMAGEM_BOLETO'
      FieldName = 'CFG_IMAGEM_BOLETO'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppDBParametrosppField59: TppField
      FieldAlias = 'CFG_INSTRUCOES'
      FieldName = 'CFG_INSTRUCOES'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppDBParametrosppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_CEDENTE_ATUAL'
      FieldName = 'CFG_CEDENTE_ATUAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 59
    end
    object ppDBParametrosppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_CONTAS_SALDO'
      FieldName = 'CFG_CONTAS_SALDO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 60
    end
    object ppDBParametrosppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_CONTA_CAIXA'
      FieldName = 'CFG_CONTA_CAIXA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 61
    end
    object ppDBParametrosppField63: TppField
      FieldAlias = 'CFG_NMCONTA'
      FieldName = 'CFG_NMCONTA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 62
    end
    object ppDBParametrosppField64: TppField
      FieldAlias = 'CFG_NMCEDENTE'
      FieldName = 'CFG_NMCEDENTE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 63
    end
    object ppDBParametrosppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_PECOMI'
      FieldName = 'CFG_PECOMI'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object ppDBParametrosppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_PERPIS'
      FieldName = 'CFG_PERPIS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object ppDBParametrosppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_PECOFI'
      FieldName = 'CFG_PECOFI'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object ppDBParametrosppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_PEIPMF'
      FieldName = 'CFG_PEIPMF'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 67
    end
    object ppDBParametrosppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_FLJURO'
      FieldName = 'CFG_FLJURO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 68
    end
    object ppDBParametrosppField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_TRANSPORTADORA'
      FieldName = 'CFG_TRANSPORTADORA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 69
    end
    object ppDBParametrosppField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_TELA_PEDIDO'
      FieldName = 'CFG_TELA_PEDIDO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 70
    end
    object ppDBParametrosppField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_PLANO_PG'
      FieldName = 'CFG_PLANO_PG'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 71
    end
    object ppDBParametrosppField73: TppField
      FieldAlias = 'CFG_ARQUIVO_PEDIDO'
      FieldName = 'CFG_ARQUIVO_PEDIDO'
      FieldLength = 120
      DisplayWidth = 120
      Position = 72
    end
    object ppDBParametrosppField74: TppField
      FieldAlias = 'CFG_EMAIL_AUTENTICACAO'
      FieldName = 'CFG_EMAIL_AUTENTICACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 73
    end
    object ppDBParametrosppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_EMAIL_PORTA'
      FieldName = 'CFG_EMAIL_PORTA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 74
    end
    object ppDBParametrosppField76: TppField
      FieldAlias = 'CFG_EMAIL_PASSWORD'
      FieldName = 'CFG_EMAIL_PASSWORD'
      FieldLength = 20
      DisplayWidth = 20
      Position = 75
    end
    object ppDBParametrosppField77: TppField
      FieldAlias = 'CFG_MENS_RODAPE_PEDIDO'
      FieldName = 'CFG_MENS_RODAPE_PEDIDO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 76
      Searchable = False
      Sortable = False
    end
    object ppDBParametrosppField78: TppField
      FieldAlias = 'CFG_MENS_RODAPE'
      FieldName = 'CFG_MENS_RODAPE'
      FieldLength = 200
      DisplayWidth = 200
      Position = 77
    end
    object ppDBParametrosppField79: TppField
      FieldAlias = 'CFG_VERIFICA_RAZAO'
      FieldName = 'CFG_VERIFICA_RAZAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 78
    end
    object ppDBParametrosppField80: TppField
      FieldAlias = 'CFG_EMAIL_FROM'
      FieldName = 'CFG_EMAIL_FROM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 79
    end
    object ppDBParametrosppField81: TppField
      FieldAlias = 'CFG_FLVENDEDOR_ITEM_VENDA'
      FieldName = 'CFG_FLVENDEDOR_ITEM_VENDA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 80
    end
    object ppDBParametrosppField82: TppField
      FieldAlias = 'CFG_FLMESA'
      FieldName = 'CFG_FLMESA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 81
    end
    object ppDBParametrosppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'CFG_MESA'
      FieldName = 'CFG_MESA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 82
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = '*.txt|Arquivo Texto'
    Left = 184
    Top = 14
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 400
    Top = 21
  end
  object qryUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 528
    Top = 69
  end
  object cdsTpClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTpClientes'
    Left = 448
    Top = 493
    object cdsTpClientesTPC_CODIGO: TIntegerField
      FieldName = 'TPC_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsTpClientesTPC_DESCRICAO: TStringField
      FieldName = 'TPC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspTpClientes: TDataSetProvider
    DataSet = dstTipoClientes
    Options = [poAllowCommandText]
    Left = 360
    Top = 493
  end
  object dstTipoClientes: TSQLDataSet
    CommandText = 
      'Select TPC_CODIGO, TPC_DESCRICAO from TIPOCLIENTE order by TPC_D' +
      'ESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 288
    Top = 493
    object dstTipoClientesTPC_CODIGO: TIntegerField
      FieldName = 'TPC_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstTipoClientesTPC_DESCRICAO: TStringField
      FieldName = 'TPC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dstFuncionarios2: TSQLDataSet
    CommandText = 'Select * from FUNCIONARIOS Where (FUN_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SqlAdmin
    Left = 584
    Top = 116
    object dstFuncionarios2FUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstFuncionarios2FUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionarios2FUN_ENDERECO: TStringField
      FieldName = 'FUN_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionarios2FUN_BAIRRO: TStringField
      FieldName = 'FUN_BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_CIDADE: TStringField
      FieldName = 'FUN_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_UFFUNC: TStringField
      FieldName = 'FUN_UFFUNC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFuncionarios2FUN_NATUREZA: TStringField
      FieldName = 'FUN_NATUREZA'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_CEP: TStringField
      FieldName = 'FUN_CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstFuncionarios2FUN_FONE: TStringField
      FieldName = 'FUN_FONE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstFuncionarios2FUN_TPFUNC: TStringField
      FieldName = 'FUN_TPFUNC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstFuncionarios2FUN_DTNASCIMENTO: TDateField
      FieldName = 'FUN_DTNASCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_DTADMICAO: TDateField
      FieldName = 'FUN_DTADMICAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_DTDEMICAO: TDateField
      FieldName = 'FUN_DTDEMICAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_VLDEBITO: TFMTBCDField
      FieldName = 'FUN_VLDEBITO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstFuncionarios2FUN_CPFCGC: TStringField
      FieldName = 'FUN_CPFCGC'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstFuncionarios2FUN_IDENTIDADE: TStringField
      FieldName = 'FUN_IDENTIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 11
    end
    object dstFuncionarios2FUN_ORIDEN: TStringField
      FieldName = 'FUN_ORIDEN'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object dstFuncionarios2FUN_UFIDEN: TStringField
      FieldName = 'FUN_UFIDEN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFuncionarios2FUN_NRCART: TStringField
      FieldName = 'FUN_NRCART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 7
    end
    object dstFuncionarios2FUN_SECART: TStringField
      FieldName = 'FUN_SECART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 7
    end
    object dstFuncionarios2FUN_UFCART: TStringField
      FieldName = 'FUN_UFCART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFuncionarios2FUN_CAREMI: TStringField
      FieldName = 'FUN_CAREMI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstFuncionarios2FUN_TITULO: TStringField
      FieldName = 'FUN_TITULO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstFuncionarios2FUN_CDSECA: TStringField
      FieldName = 'FUN_CDSECA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionarios2FUN_CDZONA: TStringField
      FieldName = 'FUN_CDZONA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstFuncionarios2FUN_ESTCIVIL: TStringField
      FieldName = 'FUN_ESTCIVIL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstFuncionarios2FUN_VLSALA: TFMTBCDField
      FieldName = 'FUN_VLSALA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstFuncionarios2FUN_LIONIB: TStringField
      FieldName = 'FUN_LIONIB'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_HOENT1: TStringField
      FieldName = 'FUN_HOENT1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionarios2FUN_HOSAI1: TStringField
      FieldName = 'FUN_HOSAI1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionarios2FUN_HOENT2: TStringField
      FieldName = 'FUN_HOENT2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionarios2FUN_HOSAI2: TStringField
      FieldName = 'FUN_HOSAI2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionarios2FUN_NOMPAI: TStringField
      FieldName = 'FUN_NOMPAI'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionarios2FUN_NOMMAE: TStringField
      FieldName = 'FUN_NOMMAE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionarios2FUN_COMPO1: TStringField
      FieldName = 'FUN_COMPO1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_COMPO2: TStringField
      FieldName = 'FUN_COMPO2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_COMPO3: TStringField
      FieldName = 'FUN_COMPO3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_ASSID1: TStringField
      FieldName = 'FUN_ASSID1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_ASSID2: TStringField
      FieldName = 'FUN_ASSID2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_ASSID3: TStringField
      FieldName = 'FUN_ASSID3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_HONES1: TStringField
      FieldName = 'FUN_HONES1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_HONES2: TStringField
      FieldName = 'FUN_HONES2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_HONES3: TStringField
      FieldName = 'FUN_HONES3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_CARAT1: TStringField
      FieldName = 'FUN_CARAT1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_CARAT2: TStringField
      FieldName = 'FUN_CARAT2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_CARAT3: TStringField
      FieldName = 'FUN_CARAT3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarios2FUN_COMPR1: TMemoField
      FieldName = 'FUN_COMPR1'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstFuncionarios2FUN_RESPO1: TMemoField
      FieldName = 'FUN_RESPO1'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstFuncionarios2FUN_ATEST1: TMemoField
      FieldName = 'FUN_ATEST1'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstFuncionarios2FUN_FUNCAO: TStringField
      FieldName = 'FUN_FUNCAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstFuncionarios2FUN_RGEMIS: TDateField
      FieldName = 'FUN_RGEMIS'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_FOTO: TBlobField
      FieldName = 'FUN_FOTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2CAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_ESTADOCIVIL: TStringField
      FieldName = 'FUN_ESTADOCIVIL'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_DTCADA: TDateField
      FieldName = 'FUN_DTCADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_HOCADA: TStringField
      FieldName = 'FUN_HOCADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstFuncionarios2FUN_USUARIO_CAD: TIntegerField
      FieldName = 'FUN_USUARIO_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_DTALTE: TDateField
      FieldName = 'FUN_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_HOALTE: TStringField
      FieldName = 'FUN_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstFuncionarios2FUN_USUARIO_ALT: TIntegerField
      FieldName = 'FUN_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarios2FUN_PECOMI: TBCDField
      FieldName = 'FUN_PECOMI'
      Precision = 9
      Size = 2
    end
  end
  object cdsContaSaldo: TClientDataSet
    Aggregates = <>
    CommandText = 'Select CGS_CODIGO, CGS_DESCRICAO from CONTAS_SALDOS'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 600
    Top = 332
    object cdsContaSaldoCGS_CODIGO: TIntegerField
      FieldName = 'CGS_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContaSaldoCGS_DESCRICAO: TStringField
      FieldName = 'CGS_DESCRICAO'
      Size = 30
    end
  end
  object dstPadrao: TSQLDataSet
    CommandText = 'Select CAR_CODIGO, CAR_NOME from CARGOS order by CAR_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 56
    Top = 333
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 88
    Top = 349
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 200
    Top = 325
  end
  object cdsAcessoMenu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao2'
    Left = 536
    Top = 21
  end
  object dstPadrao2: TSQLDataSet
    CommandText = 'Select * from GRUPOS ORDER BY GRU_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SqlAdmin
    Left = 456
    Top = 269
  end
  object dspPadrao2: TDataSetProvider
    DataSet = dstPadrao2
    Options = [poAllowCommandText]
    Left = 528
    Top = 269
  end
  object cdsGetNomeMenu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao2'
    Left = 328
    Top = 149
  end
  object cdsListaAtividades: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from ATIVIDADES order by ATI_NOME'
    Params = <>
    ProviderName = 'dspPadrao2'
    Left = 552
    Top = 231
    object cdsListaAtividadesATI_CODIGO: TIntegerField
      FieldName = 'ATI_CODIGO'
      Required = True
    end
    object cdsListaAtividadesATI_NOME: TStringField
      FieldName = 'ATI_NOME'
      Size = 40
    end
  end
  object cdsListaMesas: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from mesas'
    Params = <>
    ProviderName = 'dspPadrao2'
    Left = 128
    Top = 402
    object cdsListaMesasMES_CODIGO: TIntegerField
      FieldName = 'MES_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaMesasMES_DESCRICAO: TStringField
      FieldName = 'MES_DESCRICAO'
    end
  end
  object cdsListaFuncionarios: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select f.fun_codigo, f.fun_nome, f.fun_tpfunc from funcionarios ' +
      'F Order by f.fun_nome'
    Params = <>
    ProviderName = 'dspPadrao2'
    Left = 712
    Top = 536
    object cdsListaFuncionariosFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaFuncionariosFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object cdsListaFuncionariosFUN_TPFUNC: TStringField
      FieldName = 'FUN_TPFUNC'
      FixedChar = True
      Size = 1
    end
  end
  object cdsListaCargos: TClientDataSet
    Aggregates = <>
    CommandText = 'Select CAR_CODIGO, CAR_NOME from CARGOS order by CAR_NOME'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 592
    Top = 504
    object cdsListaCargosCAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
      Required = True
    end
    object cdsListaCargosCAR_NOME: TStringField
      FieldName = 'CAR_NOME'
      Size = 40
    end
  end
  object cdsListaSituacao: TClientDataSet
    Aggregates = <>
    CommandText = 'Select SIT_CODIGO, SIT_NOME from SITUACAO order by SIT_NOME'
    Params = <>
    ProviderName = 'dspPadrao2'
    Left = 176
    Top = 536
    object cdsListaSituacaoSIT_CODIGO: TIntegerField
      FieldName = 'SIT_CODIGO'
      Required = True
    end
    object cdsListaSituacaoSIT_NOME: TStringField
      FieldName = 'SIT_NOME'
      Size = 40
    end
  end
  object cdsListaGrupos: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from GRUPOS ORDER BY GRU_DESCRICAO'
    Params = <>
    ProviderName = 'dspPadrao2'
    Left = 72
    Top = 536
    object cdsListaGruposGRU_CODIGO: TIntegerField
      FieldName = 'GRU_CODIGO'
      Required = True
    end
    object cdsListaGruposGRU_DESCRICAO: TStringField
      FieldName = 'GRU_DESCRICAO'
      Required = True
      Size = 30
    end
  end
  object dstListaTabelas: TSQLDataSet
    CommandText = 
      'Select B.BAI_CODIGO, B.BAI_NOME from BAIRROS B Where (B.cid_codi' +
      'go = :pCIDADE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCIDADE'
        ParamType = ptInput
      end>
    SQLConnection = SqlAdmin
    Left = 640
    Top = 424
  end
  object dspListaTabelas: TDataSetProvider
    DataSet = dstListaTabelas
    Options = [poAllowCommandText]
    Left = 640
    Top = 488
  end
  object cdsListaBairroResid: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select B.BAI_CODIGO, B.BAI_NOME from BAIRROS B Where (B.cid_codi' +
      'go = :pCIDADE)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pCIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaTabelas'
    Left = 672
    Top = 496
  end
  object cdsListaEstadoCivil: TClientDataSet
    Aggregates = <>
    CommandText = 'Select EC.ecv_codigo, EC.ecv_descricao from ESTADO_CIVIL EC'
    Params = <>
    ProviderName = 'dspListaTabelas'
    Left = 704
    Top = 481
    object cdsListaEstadoCivilECV_CODIGO: TIntegerField
      FieldName = 'ECV_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaEstadoCivilECV_DESCRICAO: TStringField
      FieldName = 'ECV_DESCRICAO'
    end
  end
  object cdsListaCidadesEndRes: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select c.cid_codigo, c.cid_nome, c.cid_uf from CIDADES C Order b' +
      'y c.cid_codigo'
    Params = <>
    ProviderName = 'dspListaTabelas'
    Left = 744
    Top = 440
    object cdsListaCidadesEndResCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaCidadesEndResCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Size = 40
    end
    object cdsListaCidadesEndResCID_UF: TStringField
      FieldName = 'CID_UF'
      FixedChar = True
      Size = 2
    end
  end
  object cdsListaCidadeCob: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select c.cid_codigo, c.cid_nome, c.cid_uf from CIDADES C Order b' +
      'y c.cid_codigo'
    Params = <>
    ProviderName = 'dspListaTabelas'
    Left = 744
    Top = 488
    object cdsListaCidadeCobCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaCidadeCobCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Size = 40
    end
    object cdsListaCidadeCobCID_UF: TStringField
      FieldName = 'CID_UF'
      FixedChar = True
      Size = 2
    end
  end
  object cdsListaBairroCobranca: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select B.BAI_CODIGO, B.BAI_NOME from BAIRROS B Where (B.cid_codi' +
      'go = :pCIDADE)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pCIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaTabelas'
    Left = 688
    Top = 487
  end
end
