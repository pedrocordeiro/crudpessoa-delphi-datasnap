object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 466
  Width = 418
  object FDCPostgresWK: TFDConnection
    Params.Strings = (
      'Server=babar.db.elephantsql.com'
      'User_Name=hzrqiqkn'
      'Database=hzrqiqkn'
      'Password=v5_x9m-56n_oUls8-T19Ru8l0HLgJD_V'
      'DriverID=PG')
    Connected = True
    Left = 56
    Top = 32
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 56
    Top = 320
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 96
  end
  object FDQPessoa: TFDQuery
    BeforeApplyUpdates = FDQPessoaBeforeApplyUpdates
    Connection = FDCPostgresWK
    SQL.Strings = (
      'select idpessoa, flnatureza, dsdocumento, '
      '  nmprimeiro, nmsegundo '
      'from pessoa'
      'where idpessoa = :idpessoa')
    Left = 176
    Top = 32
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQPessoaidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQPessoaflnatureza: TSmallintField
      FieldName = 'flnatureza'
      Origin = 'flnatureza'
    end
    object FDQPessoadsdocumento: TWideStringField
      FieldName = 'dsdocumento'
      Origin = 'dsdocumento'
    end
    object FDQPessoanmprimeiro: TWideStringField
      FieldName = 'nmprimeiro'
      Origin = 'nmprimeiro'
      Size = 100
    end
    object FDQPessoanmsegundo: TWideStringField
      FieldName = 'nmsegundo'
      Origin = 'nmsegundo'
      Size = 100
    end
  end
  object FDQNextIdPessoa: TFDQuery
    Connection = FDCPostgresWK
    SQL.Strings = (
      'SELECT nextval('#39'seqpessoa'#39') as nextidpessoa;')
    Left = 176
    Top = 96
    object FDQNextIdPessoanextidpessoa: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'nextidpessoa'
      Origin = 'nextidpessoa'
      ReadOnly = True
    end
  end
  object FDQPesquisaPessoa: TFDQuery
    Connection = FDCPostgresWK
    SQL.Strings = (
      'select idpessoa, nmprimeiro || '#39' '#39' || nmsegundo as nmpessoa'
      'from pessoa'
      'where nmprimeiro like :nmprimeiro'
      '  or nmsegundo like :nmsegundo')
    Left = 176
    Top = 168
    ParamData = <
      item
        Name = 'NMPRIMEIRO'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'NMSEGUNDO'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 56
    Top = 168
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 56
    Top = 248
  end
  object FDQNextIdEndereco: TFDQuery
    Connection = FDCPostgresWK
    SQL.Strings = (
      'SELECT nextval('#39'seqendereco'#39') as nextidendereco;')
    Left = 176
    Top = 312
    object FDQNextIdEndereconextidendereco: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'nextidendereco'
      Origin = 'nextidendereco'
      ReadOnly = True
    end
  end
  object FDQEnderecoPessoa: TFDQuery
    BeforeApplyUpdates = FDQEnderecoPessoaBeforeApplyUpdates
    Connection = FDCPostgresWK
    SQL.Strings = (
      'select idendereco, idpessoa, dscep'
      'from endereco'
      'where idpessoa = :idpessoa')
    Left = 176
    Top = 248
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQEnderecoPessoaidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQEnderecoPessoaidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
    end
    object FDQEnderecoPessoadscep: TWideStringField
      FieldName = 'dscep'
      Origin = 'dscep'
      Size = 15
    end
  end
  object FDQEnderecoIntegracaoPessoa: TFDQuery
    BeforeApplyUpdates = FDQEnderecoIntegracaoPessoaBeforeApplyUpdates
    Connection = FDCPostgresWK
    SQL.Strings = (
      
        '--select idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dsc' +
        'omplemento'
      'select * '
      'from endereco_integracao'
      'where idendereco = :idendereco')
    Left = 176
    Top = 384
    ParamData = <
      item
        Name = 'IDENDERECO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQEnderecoIntegracaoPessoaidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQEnderecoIntegracaoPessoadsuf: TWideStringField
      FieldName = 'dsuf'
      Origin = 'dsuf'
      Size = 50
    end
    object FDQEnderecoIntegracaoPessoanmcidade: TWideStringField
      FieldName = 'nmcidade'
      Origin = 'nmcidade'
      Size = 100
    end
    object FDQEnderecoIntegracaoPessoanmbairro: TWideStringField
      FieldName = 'nmbairro'
      Origin = 'nmbairro'
      Size = 50
    end
    object FDQEnderecoIntegracaoPessoanmlogradouro: TWideStringField
      FieldName = 'nmlogradouro'
      Origin = 'nmlogradouro'
      Size = 100
    end
    object FDQEnderecoIntegracaoPessoadscomplemento: TWideStringField
      FieldName = 'dscomplemento'
      Origin = 'dscomplemento'
      Size = 100
    end
  end
  object FDQNovaPessoa: TFDQuery
    AfterScroll = FDQNovaPessoaAfterScroll
    Connection = FDCPostgresWK
    SQL.Strings = (
      
        'select nextval('#39'seqpessoa'#39') as idpessoa, 0 as flnatureza, cast('#39 +
        #39' as varchar(20)) as dsdocumento, cast('#39#39' as varchar(100)) as nm' +
        'primeiro, cast('#39#39' as varchar(100)) as nmsegundo, now() as dtregi' +
        'stro'
      'from pessoa'
      'limit 1')
    Left = 312
    Top = 32
    object FDQNovaPessoaidpessoa: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQNovaPessoaflnatureza: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'flnatureza'
      Origin = 'flnatureza'
    end
    object FDQNovaPessoadsdocumento: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dsdocumento'
      Origin = 'dsdocumento'
    end
    object FDQNovaPessoanmprimeiro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmprimeiro'
      Origin = 'nmprimeiro'
      Size = 100
    end
    object FDQNovaPessoanmsegundo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmsegundo'
      Origin = 'nmsegundo'
      Size = 100
    end
    object FDQNovaPessoadtregistro: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'dtregistro'
      Origin = 'dtregistro'
      ReadOnly = True
    end
  end
  object FDQNovoEndereco: TFDQuery
    AfterScroll = FDQNovoEnderecoAfterScroll
    Connection = FDCPostgresWK
    SQL.Strings = (
      
        'select nextval('#39'seqendereco'#39') as idendereco, :idpessoa as idpess' +
        'oa, cast('#39#39' as varchar) as dscep'
      'from endereco'
      'limit 1')
    Left = 312
    Top = 96
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQNovoEnderecoidendereco: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ReadOnly = True
    end
    object FDQNovoEnderecoidpessoa: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
      ReadOnly = True
    end
    object FDQNovoEnderecodscep: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dscep'
      Origin = 'dscep'
      Size = 8190
    end
  end
  object FDQNovoEnderecoIntegracao: TFDQuery
    Connection = FDCPostgresWK
    SQL.Strings = (
      
        'select :idendereco as idendereco, cast('#39#39' as varchar(50)) as dsu' +
        'f, cast('#39#39' as varchar(100)) as nmcidade, cast('#39#39' as varchar(50))' +
        ' as nmbairro, cast('#39#39' as varchar(100)) as nmlogradouro, cast('#39#39' ' +
        'as varchar(100)) as dscomplemento'
      'from endereco_integracao'
      'limit 1')
    Left = 312
    Top = 160
    ParamData = <
      item
        Name = 'IDENDERECO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQNovoEnderecoIntegracaoidendereco: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ReadOnly = True
    end
    object FDQNovoEnderecoIntegracaodsuf: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dsuf'
      Origin = 'dsuf'
      Size = 50
    end
    object FDQNovoEnderecoIntegracaonmcidade: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmcidade'
      Origin = 'nmcidade'
      Size = 100
    end
    object FDQNovoEnderecoIntegracaonmbairro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmbairro'
      Origin = 'nmbairro'
      Size = 50
    end
    object FDQNovoEnderecoIntegracaonmlogradouro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmlogradouro'
      Origin = 'nmlogradouro'
      Size = 100
    end
    object FDQNovoEnderecoIntegracaodscomplemento: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dscomplemento'
      Origin = 'dscomplemento'
      Size = 100
    end
  end
end
