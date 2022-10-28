//
// Created by the DataSnap proxy generator.
// 27/10/2022 20:49:03
//

unit ClientClassesUnit3;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, FireDAC.Comp.DataSet, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FFDQPessoaBeforeApplyUpdatesCommand: TDSRestCommand;
    FFDQEnderecoPessoaBeforeApplyUpdatesCommand: TDSRestCommand;
    FFDQEnderecoIntegracaoPessoaBeforeApplyUpdatesCommand: TDSRestCommand;
    FFDQNovaPessoaAfterScrollCommand: TDSRestCommand;
    FFDQNovoEnderecoAfterScrollCommand: TDSRestCommand;
    FNextIdPessoaCommand: TDSRestCommand;
    FNextIdPessoaCommand_Cache: TDSRestCommand;
    FNextIdEnderecoCommand: TDSRestCommand;
    FNextIdEnderecoCommand_Cache: TDSRestCommand;
    FNovaPessoaCommand: TDSRestCommand;
    FNovaPessoaCommand_Cache: TDSRestCommand;
    FGetPessoaCommand: TDSRestCommand;
    FGetPessoaCommand_Cache: TDSRestCommand;
    FGetEnderecoPessoaCommand: TDSRestCommand;
    FGetEnderecoPessoaCommand_Cache: TDSRestCommand;
    FGetEnderecoIntegracaoPessoaCommand: TDSRestCommand;
    FGetEnderecoIntegracaoPessoaCommand_Cache: TDSRestCommand;
    FPesquisaPessoaCommand: TDSRestCommand;
    FPesquisaPessoaCommand_Cache: TDSRestCommand;
    FGravaPessoaCompletaCommand: TDSRestCommand;
    FGravaPessoaCommand: TDSRestCommand;
    FGravaEnderecoCommand: TDSRestCommand;
    FGravaEnderecoIntegracaoCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure FDQPessoaBeforeApplyUpdates(DataSet: TFDDataSet);
    procedure FDQEnderecoPessoaBeforeApplyUpdates(DataSet: TFDDataSet);
    procedure FDQEnderecoIntegracaoPessoaBeforeApplyUpdates(DataSet: TFDDataSet);
    procedure FDQNovaPessoaAfterScroll(DataSet: TDataSet);
    procedure FDQNovoEnderecoAfterScroll(DataSet: TDataSet);
    function NextIdPessoa(const ARequestFilter: string = ''): TFDJSONDataSets;
    function NextIdPessoa_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function NextIdEndereco(const ARequestFilter: string = ''): TFDJSONDataSets;
    function NextIdEndereco_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function NovaPessoa(const ARequestFilter: string = ''): TFDJSONDataSets;
    function NovaPessoa_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetPessoa(idpessoa: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetPessoa_Cache(idpessoa: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetEnderecoPessoa(idpessoa: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetEnderecoPessoa_Cache(idpessoa: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetEnderecoIntegracaoPessoa(idendereco: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetEnderecoIntegracaoPessoa_Cache(idendereco: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function PesquisaPessoa(nome: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PesquisaPessoa_Cache(nome: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure GravaPessoaCompleta(ADeltaList: TFDJSONDeltas);
    procedure GravaPessoa(ADeltaList: TFDJSONDeltas);
    procedure GravaEndereco(ADeltaList: TFDJSONDeltas);
    procedure GravaEnderecoIntegracao(ADeltaList: TFDJSONDeltas);
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods1_FDQPessoaBeforeApplyUpdates: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'DataSet'; Direction: 1; DBXType: 37; TypeName: 'TFDDataSet')
  );

  TServerMethods1_FDQEnderecoPessoaBeforeApplyUpdates: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'DataSet'; Direction: 1; DBXType: 37; TypeName: 'TFDDataSet')
  );

  TServerMethods1_FDQEnderecoIntegracaoPessoaBeforeApplyUpdates: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'DataSet'; Direction: 1; DBXType: 37; TypeName: 'TFDDataSet')
  );

  TServerMethods1_FDQNovaPessoaAfterScroll: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'DataSet'; Direction: 1; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerMethods1_FDQNovoEnderecoAfterScroll: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'DataSet'; Direction: 1; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerMethods1_NextIdPessoa: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_NextIdPessoa_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_NextIdEndereco: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_NextIdEndereco_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_NovaPessoa: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_NovaPessoa_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_GetPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idpessoa'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetPessoa_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idpessoa'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_GetEnderecoPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idpessoa'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetEnderecoPessoa_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idpessoa'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_GetEnderecoIntegracaoPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idendereco'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetEnderecoIntegracaoPessoa_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idendereco'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_PesquisaPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'nome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_PesquisaPessoa_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'nome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_GravaPessoaCompleta: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TServerMethods1_GravaPessoa: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TServerMethods1_GravaEndereco: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TServerMethods1_GravaEnderecoIntegracao: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

implementation

procedure TServerMethods1Client.FDQPessoaBeforeApplyUpdates(DataSet: TFDDataSet);
begin
  if FFDQPessoaBeforeApplyUpdatesCommand = nil then
  begin
    FFDQPessoaBeforeApplyUpdatesCommand := FConnection.CreateCommand;
    FFDQPessoaBeforeApplyUpdatesCommand.RequestType := 'POST';
    FFDQPessoaBeforeApplyUpdatesCommand.Text := 'TServerMethods1."FDQPessoaBeforeApplyUpdates"';
    FFDQPessoaBeforeApplyUpdatesCommand.Prepare(TServerMethods1_FDQPessoaBeforeApplyUpdates);
  end;
  if not Assigned(DataSet) then
    FFDQPessoaBeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FFDQPessoaBeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDQPessoaBeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(DataSet), True);
      if FInstanceOwner then
        DataSet.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FFDQPessoaBeforeApplyUpdatesCommand.Execute;
end;

procedure TServerMethods1Client.FDQEnderecoPessoaBeforeApplyUpdates(DataSet: TFDDataSet);
begin
  if FFDQEnderecoPessoaBeforeApplyUpdatesCommand = nil then
  begin
    FFDQEnderecoPessoaBeforeApplyUpdatesCommand := FConnection.CreateCommand;
    FFDQEnderecoPessoaBeforeApplyUpdatesCommand.RequestType := 'POST';
    FFDQEnderecoPessoaBeforeApplyUpdatesCommand.Text := 'TServerMethods1."FDQEnderecoPessoaBeforeApplyUpdates"';
    FFDQEnderecoPessoaBeforeApplyUpdatesCommand.Prepare(TServerMethods1_FDQEnderecoPessoaBeforeApplyUpdates);
  end;
  if not Assigned(DataSet) then
    FFDQEnderecoPessoaBeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FFDQEnderecoPessoaBeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDQEnderecoPessoaBeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(DataSet), True);
      if FInstanceOwner then
        DataSet.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FFDQEnderecoPessoaBeforeApplyUpdatesCommand.Execute;
end;

procedure TServerMethods1Client.FDQEnderecoIntegracaoPessoaBeforeApplyUpdates(DataSet: TFDDataSet);
begin
  if FFDQEnderecoIntegracaoPessoaBeforeApplyUpdatesCommand = nil then
  begin
    FFDQEnderecoIntegracaoPessoaBeforeApplyUpdatesCommand := FConnection.CreateCommand;
    FFDQEnderecoIntegracaoPessoaBeforeApplyUpdatesCommand.RequestType := 'POST';
    FFDQEnderecoIntegracaoPessoaBeforeApplyUpdatesCommand.Text := 'TServerMethods1."FDQEnderecoIntegracaoPessoaBeforeApplyUpdates"';
    FFDQEnderecoIntegracaoPessoaBeforeApplyUpdatesCommand.Prepare(TServerMethods1_FDQEnderecoIntegracaoPessoaBeforeApplyUpdates);
  end;
  if not Assigned(DataSet) then
    FFDQEnderecoIntegracaoPessoaBeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FFDQEnderecoIntegracaoPessoaBeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDQEnderecoIntegracaoPessoaBeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(DataSet), True);
      if FInstanceOwner then
        DataSet.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FFDQEnderecoIntegracaoPessoaBeforeApplyUpdatesCommand.Execute;
end;

procedure TServerMethods1Client.FDQNovaPessoaAfterScroll(DataSet: TDataSet);
begin
  if FFDQNovaPessoaAfterScrollCommand = nil then
  begin
    FFDQNovaPessoaAfterScrollCommand := FConnection.CreateCommand;
    FFDQNovaPessoaAfterScrollCommand.RequestType := 'POST';
    FFDQNovaPessoaAfterScrollCommand.Text := 'TServerMethods1."FDQNovaPessoaAfterScroll"';
    FFDQNovaPessoaAfterScrollCommand.Prepare(TServerMethods1_FDQNovaPessoaAfterScroll);
  end;
  FFDQNovaPessoaAfterScrollCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FFDQNovaPessoaAfterScrollCommand.Execute;
end;

procedure TServerMethods1Client.FDQNovoEnderecoAfterScroll(DataSet: TDataSet);
begin
  if FFDQNovoEnderecoAfterScrollCommand = nil then
  begin
    FFDQNovoEnderecoAfterScrollCommand := FConnection.CreateCommand;
    FFDQNovoEnderecoAfterScrollCommand.RequestType := 'POST';
    FFDQNovoEnderecoAfterScrollCommand.Text := 'TServerMethods1."FDQNovoEnderecoAfterScroll"';
    FFDQNovoEnderecoAfterScrollCommand.Prepare(TServerMethods1_FDQNovoEnderecoAfterScroll);
  end;
  FFDQNovoEnderecoAfterScrollCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FFDQNovoEnderecoAfterScrollCommand.Execute;
end;

function TServerMethods1Client.NextIdPessoa(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FNextIdPessoaCommand = nil then
  begin
    FNextIdPessoaCommand := FConnection.CreateCommand;
    FNextIdPessoaCommand.RequestType := 'GET';
    FNextIdPessoaCommand.Text := 'TServerMethods1.NextIdPessoa';
    FNextIdPessoaCommand.Prepare(TServerMethods1_NextIdPessoa);
  end;
  FNextIdPessoaCommand.Execute(ARequestFilter);
  if not FNextIdPessoaCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FNextIdPessoaCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FNextIdPessoaCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FNextIdPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.NextIdPessoa_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FNextIdPessoaCommand_Cache = nil then
  begin
    FNextIdPessoaCommand_Cache := FConnection.CreateCommand;
    FNextIdPessoaCommand_Cache.RequestType := 'GET';
    FNextIdPessoaCommand_Cache.Text := 'TServerMethods1.NextIdPessoa';
    FNextIdPessoaCommand_Cache.Prepare(TServerMethods1_NextIdPessoa_Cache);
  end;
  FNextIdPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FNextIdPessoaCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.NextIdEndereco(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FNextIdEnderecoCommand = nil then
  begin
    FNextIdEnderecoCommand := FConnection.CreateCommand;
    FNextIdEnderecoCommand.RequestType := 'GET';
    FNextIdEnderecoCommand.Text := 'TServerMethods1.NextIdEndereco';
    FNextIdEnderecoCommand.Prepare(TServerMethods1_NextIdEndereco);
  end;
  FNextIdEnderecoCommand.Execute(ARequestFilter);
  if not FNextIdEnderecoCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FNextIdEnderecoCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FNextIdEnderecoCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FNextIdEnderecoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.NextIdEndereco_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FNextIdEnderecoCommand_Cache = nil then
  begin
    FNextIdEnderecoCommand_Cache := FConnection.CreateCommand;
    FNextIdEnderecoCommand_Cache.RequestType := 'GET';
    FNextIdEnderecoCommand_Cache.Text := 'TServerMethods1.NextIdEndereco';
    FNextIdEnderecoCommand_Cache.Prepare(TServerMethods1_NextIdEndereco_Cache);
  end;
  FNextIdEnderecoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FNextIdEnderecoCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.NovaPessoa(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FNovaPessoaCommand = nil then
  begin
    FNovaPessoaCommand := FConnection.CreateCommand;
    FNovaPessoaCommand.RequestType := 'GET';
    FNovaPessoaCommand.Text := 'TServerMethods1.NovaPessoa';
    FNovaPessoaCommand.Prepare(TServerMethods1_NovaPessoa);
  end;
  FNovaPessoaCommand.Execute(ARequestFilter);
  if not FNovaPessoaCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FNovaPessoaCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FNovaPessoaCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FNovaPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.NovaPessoa_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FNovaPessoaCommand_Cache = nil then
  begin
    FNovaPessoaCommand_Cache := FConnection.CreateCommand;
    FNovaPessoaCommand_Cache.RequestType := 'GET';
    FNovaPessoaCommand_Cache.Text := 'TServerMethods1.NovaPessoa';
    FNovaPessoaCommand_Cache.Prepare(TServerMethods1_NovaPessoa_Cache);
  end;
  FNovaPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FNovaPessoaCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.GetPessoa(idpessoa: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetPessoaCommand = nil then
  begin
    FGetPessoaCommand := FConnection.CreateCommand;
    FGetPessoaCommand.RequestType := 'GET';
    FGetPessoaCommand.Text := 'TServerMethods1.GetPessoa';
    FGetPessoaCommand.Prepare(TServerMethods1_GetPessoa);
  end;
  FGetPessoaCommand.Parameters[0].Value.SetInt32(idpessoa);
  FGetPessoaCommand.Execute(ARequestFilter);
  if not FGetPessoaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetPessoaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetPessoaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetPessoa_Cache(idpessoa: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetPessoaCommand_Cache = nil then
  begin
    FGetPessoaCommand_Cache := FConnection.CreateCommand;
    FGetPessoaCommand_Cache.RequestType := 'GET';
    FGetPessoaCommand_Cache.Text := 'TServerMethods1.GetPessoa';
    FGetPessoaCommand_Cache.Prepare(TServerMethods1_GetPessoa_Cache);
  end;
  FGetPessoaCommand_Cache.Parameters[0].Value.SetInt32(idpessoa);
  FGetPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetPessoaCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethods1Client.GetEnderecoPessoa(idpessoa: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetEnderecoPessoaCommand = nil then
  begin
    FGetEnderecoPessoaCommand := FConnection.CreateCommand;
    FGetEnderecoPessoaCommand.RequestType := 'GET';
    FGetEnderecoPessoaCommand.Text := 'TServerMethods1.GetEnderecoPessoa';
    FGetEnderecoPessoaCommand.Prepare(TServerMethods1_GetEnderecoPessoa);
  end;
  FGetEnderecoPessoaCommand.Parameters[0].Value.SetInt32(idpessoa);
  FGetEnderecoPessoaCommand.Execute(ARequestFilter);
  if not FGetEnderecoPessoaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetEnderecoPessoaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetEnderecoPessoaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetEnderecoPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetEnderecoPessoa_Cache(idpessoa: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetEnderecoPessoaCommand_Cache = nil then
  begin
    FGetEnderecoPessoaCommand_Cache := FConnection.CreateCommand;
    FGetEnderecoPessoaCommand_Cache.RequestType := 'GET';
    FGetEnderecoPessoaCommand_Cache.Text := 'TServerMethods1.GetEnderecoPessoa';
    FGetEnderecoPessoaCommand_Cache.Prepare(TServerMethods1_GetEnderecoPessoa_Cache);
  end;
  FGetEnderecoPessoaCommand_Cache.Parameters[0].Value.SetInt32(idpessoa);
  FGetEnderecoPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetEnderecoPessoaCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethods1Client.GetEnderecoIntegracaoPessoa(idendereco: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetEnderecoIntegracaoPessoaCommand = nil then
  begin
    FGetEnderecoIntegracaoPessoaCommand := FConnection.CreateCommand;
    FGetEnderecoIntegracaoPessoaCommand.RequestType := 'GET';
    FGetEnderecoIntegracaoPessoaCommand.Text := 'TServerMethods1.GetEnderecoIntegracaoPessoa';
    FGetEnderecoIntegracaoPessoaCommand.Prepare(TServerMethods1_GetEnderecoIntegracaoPessoa);
  end;
  FGetEnderecoIntegracaoPessoaCommand.Parameters[0].Value.SetInt32(idendereco);
  FGetEnderecoIntegracaoPessoaCommand.Execute(ARequestFilter);
  if not FGetEnderecoIntegracaoPessoaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetEnderecoIntegracaoPessoaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetEnderecoIntegracaoPessoaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetEnderecoIntegracaoPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetEnderecoIntegracaoPessoa_Cache(idendereco: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetEnderecoIntegracaoPessoaCommand_Cache = nil then
  begin
    FGetEnderecoIntegracaoPessoaCommand_Cache := FConnection.CreateCommand;
    FGetEnderecoIntegracaoPessoaCommand_Cache.RequestType := 'GET';
    FGetEnderecoIntegracaoPessoaCommand_Cache.Text := 'TServerMethods1.GetEnderecoIntegracaoPessoa';
    FGetEnderecoIntegracaoPessoaCommand_Cache.Prepare(TServerMethods1_GetEnderecoIntegracaoPessoa_Cache);
  end;
  FGetEnderecoIntegracaoPessoaCommand_Cache.Parameters[0].Value.SetInt32(idendereco);
  FGetEnderecoIntegracaoPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetEnderecoIntegracaoPessoaCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethods1Client.PesquisaPessoa(nome: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPesquisaPessoaCommand = nil then
  begin
    FPesquisaPessoaCommand := FConnection.CreateCommand;
    FPesquisaPessoaCommand.RequestType := 'GET';
    FPesquisaPessoaCommand.Text := 'TServerMethods1.PesquisaPessoa';
    FPesquisaPessoaCommand.Prepare(TServerMethods1_PesquisaPessoa);
  end;
  FPesquisaPessoaCommand.Parameters[0].Value.SetWideString(nome);
  FPesquisaPessoaCommand.Execute(ARequestFilter);
  if not FPesquisaPessoaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPesquisaPessoaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPesquisaPessoaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPesquisaPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.PesquisaPessoa_Cache(nome: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPesquisaPessoaCommand_Cache = nil then
  begin
    FPesquisaPessoaCommand_Cache := FConnection.CreateCommand;
    FPesquisaPessoaCommand_Cache.RequestType := 'GET';
    FPesquisaPessoaCommand_Cache.Text := 'TServerMethods1.PesquisaPessoa';
    FPesquisaPessoaCommand_Cache.Prepare(TServerMethods1_PesquisaPessoa_Cache);
  end;
  FPesquisaPessoaCommand_Cache.Parameters[0].Value.SetWideString(nome);
  FPesquisaPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPesquisaPessoaCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TServerMethods1Client.GravaPessoaCompleta(ADeltaList: TFDJSONDeltas);
begin
  if FGravaPessoaCompletaCommand = nil then
  begin
    FGravaPessoaCompletaCommand := FConnection.CreateCommand;
    FGravaPessoaCompletaCommand.RequestType := 'POST';
    FGravaPessoaCompletaCommand.Text := 'TServerMethods1."GravaPessoaCompleta"';
    FGravaPessoaCompletaCommand.Prepare(TServerMethods1_GravaPessoaCompleta);
  end;
  if not Assigned(ADeltaList) then
    FGravaPessoaCompletaCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FGravaPessoaCompletaCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FGravaPessoaCompletaCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FGravaPessoaCompletaCommand.Execute;
end;

procedure TServerMethods1Client.GravaPessoa(ADeltaList: TFDJSONDeltas);
begin
  if FGravaPessoaCommand = nil then
  begin
    FGravaPessoaCommand := FConnection.CreateCommand;
    FGravaPessoaCommand.RequestType := 'POST';
    FGravaPessoaCommand.Text := 'TServerMethods1."GravaPessoa"';
    FGravaPessoaCommand.Prepare(TServerMethods1_GravaPessoa);
  end;
  if not Assigned(ADeltaList) then
    FGravaPessoaCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FGravaPessoaCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FGravaPessoaCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FGravaPessoaCommand.Execute;
end;

procedure TServerMethods1Client.GravaEndereco(ADeltaList: TFDJSONDeltas);
begin
  if FGravaEnderecoCommand = nil then
  begin
    FGravaEnderecoCommand := FConnection.CreateCommand;
    FGravaEnderecoCommand.RequestType := 'POST';
    FGravaEnderecoCommand.Text := 'TServerMethods1."GravaEndereco"';
    FGravaEnderecoCommand.Prepare(TServerMethods1_GravaEndereco);
  end;
  if not Assigned(ADeltaList) then
    FGravaEnderecoCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FGravaEnderecoCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FGravaEnderecoCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FGravaEnderecoCommand.Execute;
end;

procedure TServerMethods1Client.GravaEnderecoIntegracao(ADeltaList: TFDJSONDeltas);
begin
  if FGravaEnderecoIntegracaoCommand = nil then
  begin
    FGravaEnderecoIntegracaoCommand := FConnection.CreateCommand;
    FGravaEnderecoIntegracaoCommand.RequestType := 'POST';
    FGravaEnderecoIntegracaoCommand.Text := 'TServerMethods1."GravaEnderecoIntegracao"';
    FGravaEnderecoIntegracaoCommand.Prepare(TServerMethods1_GravaEnderecoIntegracao);
  end;
  if not Assigned(ADeltaList) then
    FGravaEnderecoIntegracaoCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FGravaEnderecoIntegracaoCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FGravaEnderecoIntegracaoCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FGravaEnderecoIntegracaoCommand.Execute;
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FFDQPessoaBeforeApplyUpdatesCommand.DisposeOf;
  FFDQEnderecoPessoaBeforeApplyUpdatesCommand.DisposeOf;
  FFDQEnderecoIntegracaoPessoaBeforeApplyUpdatesCommand.DisposeOf;
  FFDQNovaPessoaAfterScrollCommand.DisposeOf;
  FFDQNovoEnderecoAfterScrollCommand.DisposeOf;
  FNextIdPessoaCommand.DisposeOf;
  FNextIdPessoaCommand_Cache.DisposeOf;
  FNextIdEnderecoCommand.DisposeOf;
  FNextIdEnderecoCommand_Cache.DisposeOf;
  FNovaPessoaCommand.DisposeOf;
  FNovaPessoaCommand_Cache.DisposeOf;
  FGetPessoaCommand.DisposeOf;
  FGetPessoaCommand_Cache.DisposeOf;
  FGetEnderecoPessoaCommand.DisposeOf;
  FGetEnderecoPessoaCommand_Cache.DisposeOf;
  FGetEnderecoIntegracaoPessoaCommand.DisposeOf;
  FGetEnderecoIntegracaoPessoaCommand_Cache.DisposeOf;
  FPesquisaPessoaCommand.DisposeOf;
  FPesquisaPessoaCommand_Cache.DisposeOf;
  FGravaPessoaCompletaCommand.DisposeOf;
  FGravaPessoaCommand.DisposeOf;
  FGravaEnderecoCommand.DisposeOf;
  FGravaEnderecoIntegracaoCommand.DisposeOf;
  inherited;
end;

end.

