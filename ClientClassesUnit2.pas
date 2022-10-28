// 
// Created by the DataSnap proxy generator.
// 27/10/2022 07:36:20
// 

unit ClientClassesUnit2;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FGetPessoasCommand: TDSRestCommand;
    FGetPessoasCommand_Cache: TDSRestCommand;
    FGravaPessoaCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetPessoas(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetPessoas_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure GravaPessoa(ADeltaList: TFDJSONDeltas);
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods1_GetPessoas: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetPessoas_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_GravaPessoa: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

implementation

function TServerMethods1Client.GetPessoas(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetPessoasCommand = nil then
  begin
    FGetPessoasCommand := FConnection.CreateCommand;
    FGetPessoasCommand.RequestType := 'GET';
    FGetPessoasCommand.Text := 'TServerMethods1.GetPessoas';
    FGetPessoasCommand.Prepare(TServerMethods1_GetPessoas);
  end;
  FGetPessoasCommand.Execute(ARequestFilter);
  if not FGetPessoasCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetPessoasCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetPessoasCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetPessoasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetPessoas_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetPessoasCommand_Cache = nil then
  begin
    FGetPessoasCommand_Cache := FConnection.CreateCommand;
    FGetPessoasCommand_Cache.RequestType := 'GET';
    FGetPessoasCommand_Cache.Text := 'TServerMethods1.GetPessoas';
    FGetPessoasCommand_Cache.Prepare(TServerMethods1_GetPessoas_Cache);
  end;
  FGetPessoasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetPessoasCommand_Cache.Parameters[0].Value.GetString);
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
  FGetPessoasCommand.DisposeOf;
  FGetPessoasCommand_Cache.DisposeOf;
  FGravaPessoaCommand.DisposeOf;
  inherited;
end;

end.
