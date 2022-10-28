unit ClientUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.ListView, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.Edit, Data.FireDACJSONReflect, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Controls, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  FMX.Layouts, Fmx.Bind.Navigator, Data.Bind.DBScope, ClientModuleUnit3,
  FMX.ListBox, Fmx.Bind.Grid, Data.Bind.Grid, FireDAC.Comp.BatchMove.DataSet,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.Text, FireDAC.UI.Intf,
  FireDAC.FMXUI.Wait, FireDAC.Comp.UI;

type
  TFrmCliente = class(TForm)
    Panel1: TPanel;
    BtnGravar: TButton;
    BtnApagar: TButton;
    BtnNovo: TButton;
    BtnPesquisar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EdtDocumento: TEdit;
    EdtNome: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtSobrenome: TEdit;
    FDMemTablePessoa: TFDMemTable;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToFieldnmprimeiro: TLinkControlToField;
    LinkControlToFieldnmsegundo: TLinkControlToField;
    LinkControlToFielddsdocumento: TLinkControlToField;
    CBNaturezaPessoa: TComboBox;
    Panel2: TPanel;
    Label5: TLabel;
    EdtPequisa: TEdit;
    Button1: TButton;
    BtnSelecionar: TButton;
    BtnVoltar: TButton;
    FDMemTablePesquisa: TFDMemTable;
    BindSourceDB2: TBindSourceDB;
    ListView1: TListView;
    LinkFillControlToField1: TLinkFillControlToField;
    Label6: TLabel;
    EdtCEP: TEdit;
    Label7: TLabel;
    EdtUF: TEdit;
    Label8: TLabel;
    EdtLogradouro: TEdit;
    Label9: TLabel;
    EdtCidade: TEdit;
    Label10: TLabel;
    EdtBairro: TEdit;
    Label11: TLabel;
    EdtComplemento: TEdit;
    FDMemTableEndereco: TFDMemTable;
    FDMemTableEnderecoIntegracao: TFDMemTable;
    BindSourceDB3: TBindSourceDB;
    LinkControlToFielddscep: TLinkControlToField;
    BindSourceDB4: TBindSourceDB;
    LinkControlToFielddsuf: TLinkControlToField;
    LinkControlToFieldnmcidade: TLinkControlToField;
    LinkControlToFieldnmbairro: TLinkControlToField;
    LinkControlToFieldnmlogradouro: TLinkControlToField;
    LinkControlToFielddscomplemento: TLinkControlToField;
    FDMemTableNextIdPessoa: TFDMemTable;
    FDMemTableNextIdEndereco: TFDMemTable;
    LinkPropertyToFieldflnatureza: TLinkPropertyToField;
    Panel3: TPanel;
    BtnAbrirCSV: TButton;
    BtnVoltar2: TButton;
    Button2: TButton;
    FDBatchMoveTextReader1: TFDBatchMoveTextReader;
    FDMemTableCSV: TFDMemTable;
    FDBatchMoveDataSetWriter1: TFDBatchMoveDataSetWriter;
    DataSource1: TDataSource;
    BindSourceDB5: TBindSourceDB;
    FDBatchMove1: TFDBatchMove;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    GridBindSourceDB5: TGrid;
    LinkGridToDataSourceBindSourceDB5: TLinkGridToDataSource;
    BtnEnviarCSV: TButton;
    procedure BtnListarPessoasClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnApagarClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure HabilitaCampos(habilita: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure BtnAbrirCSVClick(Sender: TObject);
    procedure BtnEnviarCSVClick(Sender: TObject);
    procedure FDMemTablePessoaAfterInsert(DataSet: TDataSet);
    procedure FDMemTableEnderecoAfterInsert(DataSet: TDataSet);
    procedure FDMemTableEnderecoIntegracaoAfterInsert(DataSet: TDataSet);
  private
    IdPessoaAtual: Integer;
    { Private declarations }
    function GetNextIdPessoa: Integer;
    function GetNextIdEndereco: Integer;
    function GetDeltas: TFDJSONDeltas;
    function GetDeltasEndereco: TFDJSONDeltas;
    function GetDeltasEnderecoIntegracao: TFDJSONDeltas;
    function GetDeltasCompletos: TFDJSONDeltas;
    procedure GetPessoas;
    procedure NovaPessoa;
    procedure NovaPessoa2;
    procedure ApplyUpdates;
    procedure ApplyUpdates2;
    procedure SelecionarPessoa(idpessoa: Integer);
    procedure CopiaCSVPessoa;
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.fmx}

{ TFrmCliente }

procedure TFrmCliente.ApplyUpdates;
var
  LDeltaList: TFDJSONDeltas;
begin
  LDeltaList := GetDeltas;
  ClientModule3.ServerMethods1Client.GravaPessoa(LDeltaList);

  LDeltaList := GetDeltasEndereco;
  ClientModule3.ServerMethods1Client.GravaEndereco(LDeltaList);

  LDeltaList := GetDeltasEnderecoIntegracao;
  ClientModule3.ServerMethods1Client.GravaEnderecoIntegracao(LDeltaList);
end;

procedure TFrmCliente.ApplyUpdates2;
var
  LDeltaList: TFDJSONDeltas;
begin
  LDeltaList := GetDeltasCompletos;
  ClientModule3.ServerMethods1Client.GravaPessoaCompleta(LDeltaList);
end;

procedure TFrmCliente.BtnAbrirCSVClick(Sender: TObject);
var
  selectedFile: string;
  dlg: TOpenDialog;
begin
  selectedFile := '';
  dlg := TOpenDialog.Create(nil);
  try
    //dlg.InitialDir := 'C:\';
    dlg.Filter := 'All files (*.csv)|*.CSV';
    if dlg.Execute then
      selectedFile := dlg.FileName;
  finally
    dlg.Free;
  end;

  if selectedFile <> '' then
  begin
    FDBatchMoveTextReader1.FileName := selectedFile;
    FDBatchMove1.Execute;
  end;
end;

procedure TFrmCliente.BtnApagarClick(Sender: TObject);
begin
  MessageDlg('TODO.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
{  if (FDMemTablePessoa.State in [dsBrowse])
      and (MessageDlg('Confirma deleção?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOk) then
  begin
    FDMemTablePessoa.ApplyUpdates();
    FDMemTablePessoa.CachedUpdates := False;
    FDMemTablePessoa.Delete;
    FDMemTablePessoa.Post;
    ApplyUpdates;
  end;}
end;

procedure TFrmCliente.BtnGravarClick(Sender: TObject);
begin
  if MessageDlg('Confirma gravação?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOk then
  begin
    ApplyUpdates;
    //ApplyUpdates2;
    //SelecionarPessoa(IdPessoaAtual);
    MessageDlg('Registro salvo.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  end;
end;

procedure TFrmCliente.BtnListarPessoasClick(Sender: TObject);
begin
  GetPessoas;
end;

procedure TFrmCliente.BtnNovoClick(Sender: TObject);
begin
  NovaPessoa;
  //NovaPessoa2;
  FDMemTablePessoa.Insert;
  HabilitaCampos(True);
  EdtDocumento.SetFocus;
end;

procedure TFrmCliente.BtnPesquisarClick(Sender: TObject);
begin
  Panel1.Visible := False;
  Panel2.Visible := True;
end;

procedure TFrmCliente.Button1Click(Sender: TObject);
var
    LDataSetList: TFDJSONDataSets;
begin
  FDMemTablePesquisa.Close;
  LDataSetList := ClientModule3.ServerMethods1Client.PesquisaPessoa(
      '%' + EdtPequisa.Text + '%');
  FDMemTablePesquisa.AppendData(
      TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  FDMemTablePesquisa.Open;
end;

procedure TFrmCliente.Button2Click(Sender: TObject);
begin
  Panel3.Visible := True;
  Panel2.Visible := False;
  Panel1.Visible := False;
end;

procedure TFrmCliente.BtnEnviarCSVClick(Sender: TObject);
begin
  NovaPessoa;
  FDMemTablePessoa.Append;
  FDMemTableEndereco.Append;
  FDMemTableEnderecoIntegracao.Append;

  FDMemTableCSV.First;

  CopiaCSVPessoa;

  FDMemTablePessoa.Post;
  FDMemTableEndereco.Post;
  FDMemTableEnderecoIntegracao.Post;

  while not FDMemTableCSV.Eof do
  begin
    FDMemTablePessoa.Append;
    FDMemTableEndereco.Append;
    FDMemTableEnderecoIntegracao.Append;

    CopiaCSVPessoa;

    FDMemTablePessoa.Post;
    FDMemTableEndereco.Post;
    FDMemTableEnderecoIntegracao.Post;

    FDMemTableCSV.Next;
  end;

  ApplyUpdates;
  MessageDlg('CSV Enviado.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);

end;

procedure TFrmCliente.CopiaCSVPessoa;
begin
  FDMemTablePessoa.FieldByName('flnatureza').Value :=
    FDMemTableCSV.FieldByName('flnatureza').Value;
  FDMemTablePessoa.FieldByName('dsdocumento').Value :=
    FDMemTableCSV.FieldByName('dsdocumento').Value;
  FDMemTablePessoa.FieldByName('nmprimeiro').Value :=
    FDMemTableCSV.FieldByName('nmprimeiro').Value;
  FDMemTablePessoa.FieldByName('nmsegundo').Value :=
    FDMemTableCSV.FieldByName('nmsegundo').Value;

  FDMemTableEndereco.FieldByName('dscep').Value :=
    FDMemTableCSV.FieldByName('dscep').Value;

  FDMemTableEnderecoIntegracao.FieldByName('dsuf').Value :=
    FDMemTableCSV.FieldByName('dsuf').Value;
  FDMemTableEnderecoIntegracao.FieldByName('nmcidade').Value :=
    FDMemTableCSV.FieldByName('nmcidade').Value;
  FDMemTableEnderecoIntegracao.FieldByName('nmbairro').Value :=
    FDMemTableCSV.FieldByName('nmbairro').Value;
  FDMemTableEnderecoIntegracao.FieldByName('nmlogradouro').Value :=
    FDMemTableCSV.FieldByName('nmlogradouro').Value;
  FDMemTableEnderecoIntegracao.FieldByName('dscomplemento').Value :=
    FDMemTableCSV.FieldByName('dscomplemento').Value;
end;

procedure TFrmCliente.BtnSelecionarClick(Sender: TObject);
var
  idpessoa: Integer;
begin
  idpessoa := StrToInt(TListViewItem(ListView1.Selected).Detail);
  SelecionarPessoa(idpessoa);
  Panel2.Visible := False;
  Panel1.Visible := True;
end;

procedure TFrmCliente.BtnVoltarClick(Sender: TObject);
begin
  Panel3.Visible := False;
  Panel2.Visible := False;
  Panel1.Visible := True;
end;

procedure TFrmCliente.FDMemTableEnderecoAfterInsert(DataSet: TDataSet);
begin
  FDMemTableEndereco.FieldByName('idendereco').AsInteger := GetNextIdEndereco;
  FDMemTableEndereco.FieldByName('idpessoa').AsInteger :=
      FDMemTablePessoa.FieldByName('idpessoa').AsInteger;
end;

procedure TFrmCliente.FDMemTableEnderecoIntegracaoAfterInsert(
  DataSet: TDataSet);
begin
  FDMemTableEnderecoIntegracao.FieldByName('idendereco').AsInteger :=
      FDMemTableEndereco.FieldByName('idendereco').AsInteger;
end;

procedure TFrmCliente.FDMemTablePessoaAfterInsert(DataSet: TDataSet);
begin
  FDMemTablePessoa.FieldByName('idpessoa').AsInteger := GetNextIdPessoa;
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  Panel3.Visible := False;
  Panel2.Visible := False;
  Panel1.Visible := True;
  HabilitaCampos(False);
end;

function TFrmCliente.GetDeltas: TFDJSONDeltas;
begin

  if FDMemTablePessoa.State in dsEditModes then
  begin
    //if FDMemTablePessoa.FieldByName('idpessoa').IsNull then
    //  FDMemTablePessoa.FieldByName('idpessoa').value := GetNextIdPessoa;
    FDMemTablePessoa.Post;
  end;

  Result := TFDJSONDeltas.Create;
  //TFDJSONDeltasWriter.ListAdd(Result, 'Pessoas', FDMemTablePessoa);
  TFDJSONDeltasWriter.ListAdd(Result, 'Pessoa', FDMemTablePessoa);
end;

function TFrmCliente.GetDeltasCompletos: TFDJSONDeltas;
begin
  if FDMemTablePessoa.State in dsEditModes then
  begin
    FDMemTablePessoa.Post;
    //FDMemTablePessoa.ApplyUpdates;
    //FDMemTablePessoa.CommitUpdates;
  end;

  if FDMemTableEndereco.State in dsEditModes then
  begin
    FDMemTableEndereco.Post;
    //FDMemTableEndereco.ApplyUpdates;
    //FDMemTableEndereco.CommitUpdates;
  end;

  if FDMemTableEnderecoIntegracao.State in dsEditModes then
  begin
    FDMemTableEnderecoIntegracao.Post;
    //FDMemTableEnderecoIntegracao.ApplyUpdates;
    //FDMemTableEnderecoIntegracao.CommitUpdates;
  end;

  Result := TFDJSONDeltas.Create;
  TFDJSONDeltasWriter.ListAdd(Result, 'Pessoa', FDMemTablePessoa);
  TFDJSONDeltasWriter.ListAdd(Result, 'Endereco', FDMemTablePessoa);
  TFDJSONDeltasWriter.ListAdd(Result, 'EnderecoIntegracao', FDMemTablePessoa);
end;

function TFrmCliente.GetDeltasEndereco: TFDJSONDeltas;
begin
  if FDMemTableEndereco.State in dsEditModes then
  begin
    //if FDMemTableEndereco.FieldByName('idendereco').IsNull then
    //  FDMemTableEndereco.FieldByName('idendereco').value := GetNextIdEndereco;
    //if FDMemTableEndereco.FieldByName('idpessoa').IsNull then
    //  FDMemTableEndereco.FieldByName('idpessoa').value :=
    //      FDMemTablePessoa.FieldByName('idpessoa').value;
    FDMemTableEndereco.Post;
  end;

  Result := TFDJSONDeltas.Create;
  //TFDJSONDeltasWriter.ListAdd(Result, 'Enderecos', FDMemTableEndereco);
  TFDJSONDeltasWriter.ListAdd(Result, 'Endereco', FDMemTableEndereco);
end;

function TFrmCliente.GetDeltasEnderecoIntegracao: TFDJSONDeltas;
begin
  if FDMemTableEnderecoIntegracao.State in dsEditModes then
  begin
    if FDMemTableEnderecoIntegracao.FieldByName('idendereco').IsNull then
      FDMemTableEnderecoIntegracao.FieldByName('idendereco').value :=
          FDMemTableEndereco.FieldByName('idendereco').value;
    FDMemTableEnderecoIntegracao.Post;
  end;

  Result := TFDJSONDeltas.Create;
  //TFDJSONDeltasWriter.ListAdd(Result, 'EnderecosIntegracao', FDMemTableEnderecoIntegracao);
  TFDJSONDeltasWriter.ListAdd(Result, 'EnderecoIntegracao', FDMemTableEnderecoIntegracao);
end;

function TFrmCliente.GetNextIdEndereco: Integer;
var
    LDataSetList: TFDJSONDataSets;
begin
    FDMemTableNextIdEndereco.Close;
    LDataSetList := ClientModule3.ServerMethods1Client.NextIdEndereco;
    FDMemTableNextIdEndereco.AppendData(
      TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
    FDMemTableNextIdEndereco.Open;
    Result := FDMemTableNextIdEndereco.FieldByName('nextidendereco').AsInteger;
end;

function TFrmCliente.GetNextIdPessoa: Integer;
var
    LDataSetList: TFDJSONDataSets;
begin
    FDMemTableNextIdPessoa.Close;
    LDataSetList := ClientModule3.ServerMethods1Client.NextIdPessoa;
    FDMemTableNextIdPessoa.AppendData(
      TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
    FDMemTableNextIdPessoa.Open;
    IdPessoaAtual := FDMemTableNextIdPessoa.FieldByName('nextidpessoa').AsInteger;
    Result := IdPessoaAtual;
end;

procedure TFrmCliente.GetPessoas;
var
    LDataSetList: TFDJSONDataSets;
begin
    {FDMemTablePessoa.Close;
    LDataSetList := ClientModule3.ServerMethods1Client.GetPessoas;
    FDMemTablePessoa.AppendData(
      TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
    FDMemTablePessoa.Open;}
end;

procedure TFrmCliente.HabilitaCampos(habilita: Boolean);
begin
  EdtDocumento.Enabled := habilita;
  EdtNome.Enabled := habilita;
  EdtSobrenome.Enabled := habilita;
  CBNaturezaPessoa.Enabled := habilita;
  EdtCEP.Enabled := habilita;
  EdtUF.Enabled := habilita;
  EdtCidade.Enabled := habilita;
  EdtBairro.Enabled := habilita;
  EdtLogradouro.Enabled := habilita;
  EdtComplemento.Enabled := habilita;
end;

procedure TFrmCliente.NovaPessoa;
var
    LDataSetList: TFDJSONDataSets;
    LDataSet: TFDDataSet;
begin
  FDMemTablePessoa.Close;
  LDataSetList := ClientModule3.ServerMethods1Client.GetPessoa(-1);
  FDMemTablePessoa.AppendData(
    TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  FDMemTablePessoa.Open;

  FDMemTableEndereco.Close;
  LDataSetList := ClientModule3.ServerMethods1Client.GetEnderecoPessoa(-1);
  FDMemTableEndereco.AppendData(
    TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  FDMemTableEndereco.Open;

  FDMemTableEnderecoIntegracao.Close;
  LDataSetList := ClientModule3.ServerMethods1Client.GetEnderecoIntegracaoPessoa(-1);
  FDMemTableEnderecoIntegracao.AppendData(
    TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  FDMemTableEnderecoIntegracao.Open;

  IdPessoaAtual := -1;
end;

procedure TFrmCliente.NovaPessoa2;
var
    LDataSetList: TFDJSONDataSets;
    LDataSet: TFDDataSet;
begin
  LDataSetList := ClientModule3.ServerMethods1Client.NovaPessoa;

  LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'Pessoa');
  //FDMemTablePessoa.Close;
  FDMemTablePessoa.Active := False;
  FDMemTablePessoa.AppendData(LDataSet);
  //FDMemTablePessoa.Open;

  LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'Endereco');
  //FDMemTableEndereco.Close;
  FDMemTableEndereco.Active := False;
  FDMemTableEndereco.AppendData(LDataSet);
  //FDMemTableEndereco.Open;

  LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'EnderecoIntegracao');
  //FDMemTableEnderecoIntegracao.Close;
  FDMemTableEnderecoIntegracao.Active := False;
  FDMemTableEnderecoIntegracao.AppendData(LDataSet);
  //FDMemTableEnderecoIntegracao.Open;
end;

procedure TFrmCliente.SelecionarPessoa(idpessoa: Integer);
var
  idendereco: Integer;
  LDataSetList: TFDJSONDataSets;
begin
  FDMemTablePessoa.Close;
  LDataSetList := ClientModule3.ServerMethods1Client.GetPessoa(idpessoa);
  FDMemTablePessoa.AppendData(
    TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  FDMemTablePessoa.Open;

  FDMemTableEndereco.Close;
  LDataSetList := ClientModule3.ServerMethods1Client.GetEnderecoPessoa(idpessoa);
  FDMemTableEndereco.AppendData(
    TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  FDMemTableEndereco.Open;

  FDMemTableEnderecoIntegracao.Close;

  if not FDMemTableEndereco.FieldByName('idendereco').IsNull then
  begin
    idendereco := FDMemTableEndereco.FieldByName('idendereco').Value;
    LDataSetList := ClientModule3.ServerMethods1Client.GetEnderecoIntegracaoPessoa(idendereco);
    FDMemTableEnderecoIntegracao.AppendData(
      TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  end;

  FDMemTableEnderecoIntegracao.Open;

  IdPessoaAtual := idpessoa;

  HabilitaCampos(True);
end;

end.
