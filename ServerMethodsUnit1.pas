unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON, FireDAC.Comp.DataSet, FireDAC.Comp.UI,
  Data.FireDACJSONReflect;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDCPostgresWK: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQPessoa: TFDQuery;
    FDQNextIdPessoa: TFDQuery;
    FDQPesquisaPessoa: TFDQuery;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDQPessoaidpessoa: TLargeintField;
    FDQPessoaflnatureza: TSmallintField;
    FDQPessoadsdocumento: TWideStringField;
    FDQPessoanmprimeiro: TWideStringField;
    FDQPessoanmsegundo: TWideStringField;
    FDQNextIdPessoanextidpessoa: TLargeintField;
    FDQNextIdEndereco: TFDQuery;
    FDQNextIdEndereconextidendereco: TLargeintField;
    FDQEnderecoPessoa: TFDQuery;
    FDQEnderecoIntegracaoPessoa: TFDQuery;
    FDQEnderecoPessoaidendereco: TLargeintField;
    FDQEnderecoPessoaidpessoa: TLargeintField;
    FDQEnderecoPessoadscep: TWideStringField;
    FDQNovaPessoa: TFDQuery;
    FDQNovoEndereco: TFDQuery;
    FDQNovoEnderecoIntegracao: TFDQuery;
    FDQNovaPessoaidpessoa: TLargeintField;
    FDQNovaPessoaflnatureza: TIntegerField;
    FDQNovaPessoadsdocumento: TWideStringField;
    FDQNovaPessoanmprimeiro: TWideStringField;
    FDQNovaPessoanmsegundo: TWideStringField;
    FDQNovaPessoadtregistro: TSQLTimeStampField;
    FDQNovoEnderecoidendereco: TLargeintField;
    FDQNovoEnderecoidpessoa: TIntegerField;
    FDQNovoEnderecodscep: TWideStringField;
    FDQNovoEnderecoIntegracaoidendereco: TIntegerField;
    FDQNovoEnderecoIntegracaodsuf: TWideStringField;
    FDQNovoEnderecoIntegracaonmcidade: TWideStringField;
    FDQNovoEnderecoIntegracaonmbairro: TWideStringField;
    FDQNovoEnderecoIntegracaonmlogradouro: TWideStringField;
    FDQNovoEnderecoIntegracaodscomplemento: TWideStringField;
    FDQEnderecoIntegracaoPessoaidendereco: TLargeintField;
    FDQEnderecoIntegracaoPessoadsuf: TWideStringField;
    FDQEnderecoIntegracaoPessoanmcidade: TWideStringField;
    FDQEnderecoIntegracaoPessoanmbairro: TWideStringField;
    FDQEnderecoIntegracaoPessoanmlogradouro: TWideStringField;
    FDQEnderecoIntegracaoPessoadscomplemento: TWideStringField;
    procedure FDQPessoaBeforeApplyUpdates(DataSet: TFDDataSet);
    procedure FDQEnderecoPessoaBeforeApplyUpdates(DataSet: TFDDataSet);
    procedure FDQEnderecoIntegracaoPessoaBeforeApplyUpdates(
      DataSet: TFDDataSet);
    procedure FDQNovaPessoaAfterScroll(DataSet: TDataSet);
    procedure FDQNovoEnderecoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function NextIdPessoa(): TFDJSONDataSets;
    function NextIdEndereco(): TFDJSONDataSets;
    function NovaPessoa: TFDJSONDataSets;
    function GetPessoa(idpessoa: Integer): TFDJSONDataSets;
    function GetEnderecoPessoa(idpessoa: Integer): TFDJSONDataSets;
    function GetEnderecoIntegracaoPessoa(idendereco: Integer): TFDJSONDataSets;
    function PesquisaPessoa(nome: String): TFDJSONDataSets;
    procedure GravaPessoaCompleta(const ADeltaList: TFDJSONDeltas);
    procedure GravaPessoa(const ADeltaList: TFDJSONDeltas);
    procedure GravaEndereco(const ADeltaList: TFDJSONDeltas);
    procedure GravaEnderecoIntegracao(const ADeltaList: TFDJSONDeltas);
  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}

uses System.StrUtils;

// Recupera a lista de pessoas
procedure TServerMethods1.FDQEnderecoIntegracaoPessoaBeforeApplyUpdates(
  DataSet: TFDDataSet);
begin
{  if not FDQEnderecoIntegracaoPessoa.FieldByName('idendereco').IsNull then
  begin
    FDQEnderecoIntegracaoPessoa.FieldByName('idendereco').AsInteger :=
        FDQEnderecoPessoa.FieldByName('idendereco').AsInteger;
  end;}
end;

procedure TServerMethods1.FDQEnderecoPessoaBeforeApplyUpdates(
  DataSet: TFDDataSet);
begin
{  //if not FDQPessoa.FieldByName('idpessoa').IsNull then
  if FDQEnderecoPessoa.FieldByName('idendereco').IsNull then
  begin
    FDQEnderecoPessoa.FieldByName('idpessoa').AsInteger :=
        FDQPessoa.FieldByName('idpessoa').AsInteger;

    FDQNextIdEndereco.Open();
    FDQEnderecoPessoa.FieldByName('idendereco').AsInteger :=
        FDQNextIdEndereco.FieldByName('nextidendereco').AsInteger;
    FDQNextIdPessoa.Close();
  end;}
end;

procedure TServerMethods1.FDQNovaPessoaAfterScroll(DataSet: TDataSet);
begin
  FDQNovoEndereco.Params[0].AsInteger :=
    FDQNovaPessoa.FieldByName('idpessoa').AsInteger;
end;

procedure TServerMethods1.FDQNovoEnderecoAfterScroll(DataSet: TDataSet);
begin
  FDQNovoEnderecoIntegracao.Params[0].AsInteger :=
    FDQNovoEndereco.FieldByName('idendereco').AsInteger;
end;

procedure TServerMethods1.FDQPessoaBeforeApplyUpdates(DataSet: TFDDataSet);
begin
{  if FDQPessoa.FieldByName('idpessoa').IsNull then
  begin
    FDQNextIdPessoa.Open();
    FDQPessoa.FieldByName('idpessoa').AsInteger :=
        FDQNextIdPessoa.FieldByName('nextidpessoa').AsInteger;
    FDQNextIdPessoa.Close();
  end;}
end;

function TServerMethods1.GetEnderecoIntegracaoPessoa(
  idendereco: Integer): TFDJSONDataSets;
begin
  FDQEnderecoIntegracaoPessoa.Active := False;
  FDQEnderecoIntegracaoPessoa.Params[0].Value := idendereco;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, 'EnderecoIntegracao', FDQEnderecoIntegracaoPessoa);
end;

function TServerMethods1.GetEnderecoPessoa(idpessoa: Integer): TFDJSONDataSets;
begin
  FDQEnderecoPessoa.Active := False;
  FDQEnderecoPessoa.Params[0].Value := idpessoa;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, 'Endereco', FDQEnderecoPessoa);
end;

function TServerMethods1.GetPessoa(idpessoa: Integer): TFDJSONDataSets;
begin
  FDQPessoa.Active := False;
  FDQPessoa.Params[0].Value := idpessoa;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, 'Pessoa', FDQPessoa);
end;

procedure TServerMethods1.GravaEndereco(const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);

  //LApply.ApplyUpdates('Enderecos', FDQEnderecoPessoa.Command);
  LApply.ApplyUpdates('Endereco', FDQEnderecoPessoa.Command);
  if LApply.Errors.Count > 0 then
    raise Exception.Create(LApply.Errors.Strings.Text);
end;

procedure TServerMethods1.GravaEnderecoIntegracao(
  const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);

  //LApply.ApplyUpdates('EnderecosIntegracao', FDQEnderecoIntegracaoPessoa.Command);
  LApply.ApplyUpdates('EnderecoIntegracao', FDQEnderecoIntegracaoPessoa.Command);
  if LApply.Errors.Count > 0 then
    raise Exception.Create(LApply.Errors.Strings.Text);
end;

procedure TServerMethods1.GravaPessoa(const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);

  //LApply.ApplyUpdates('Pessoas', FDQPessoa.Command);
  LApply.ApplyUpdates('Pessoa', FDQPessoa.Command);
  if LApply.Errors.Count > 0 then
    raise Exception.Create(LApply.Errors.Strings.Text);
end;

procedure TServerMethods1.GravaPessoaCompleta(const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);

  LApply.ApplyUpdates('Pessoa', FDQNovaPessoa.Command);
  if LApply.Errors.Count > 0 then
    raise Exception.Create(LApply.Errors.Strings.Text);

  LApply.ApplyUpdates('Endereco', FDQNovoEndereco.Command);
  if LApply.Errors.Count > 0 then
    raise Exception.Create(LApply.Errors.Strings.Text);

  LApply.ApplyUpdates('EnderecoIntegracao', FDQNovoEnderecoIntegracao.Command);
  if LApply.Errors.Count > 0 then
    raise Exception.Create(LApply.Errors.Strings.Text);
end;

function TServerMethods1.NextIdEndereco: TFDJSONDataSets;
begin
  FDQNextIdEndereco.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, FDQNextIdEndereco);
end;

function TServerMethods1.NextIdPessoa: TFDJSONDataSets;
begin
  FDQNextIdPessoa.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, FDQNextIdPessoa);
end;

function TServerMethods1.NovaPessoa: TFDJSONDataSets;
begin
  FDQNovaPessoa.Active := False;
  FDQNovoEndereco.Active := False;
  FDQNovoEnderecoIntegracao.Active := False;

  Result := TFDJSONDataSets.Create;

  TFDJSONDataSetsWriter.ListAdd(Result, 'Pessoa', FDQNovaPessoa);
  TFDJSONDataSetsWriter.ListAdd(Result, 'Endereco', FDQNovoEndereco);
  TFDJSONDataSetsWriter.ListAdd(Result, 'EnderecoIntegracao', FDQNovoEnderecoIntegracao);
end;

function TServerMethods1.PesquisaPessoa(nome: String): TFDJSONDataSets;
begin
  FDQPesquisaPessoa.Active := False;
  FDQPesquisaPessoa.ParamByName('nmprimeiro').Value := nome;
  FDQPesquisaPessoa.ParamByName('nmsegundo').Value := nome;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, 'Pessoas', FDQPesquisaPessoa);
end;

end.

