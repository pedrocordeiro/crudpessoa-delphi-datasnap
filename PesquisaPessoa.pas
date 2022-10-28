unit PesquisaPessoa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.FireDACJSONReflect,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFrmPesquisaPessoa = class(TForm)
    Label1: TLabel;
    EdtPequisa: TEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Button2: TButton;
    FDMemTablePesquisa: TFDMemTable;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
  private
    { Private declarations }
    procedure PesquisaPessoas;
  public
    { Public declarations }
  end;

var
  FrmPesquisaPessoa: TFrmPesquisaPessoa;

implementation

{$R *.fmx}

uses ClientModuleUnit3;

{ TFrmPesquisaPessoa }

procedure TFrmPesquisaPessoa.PesquisaPessoas;
var
    LDataSetList: TFDJSONDataSets;
    LDataSet: TFDDataSet;
begin
    LDataSetList := ClientModule3.ServerMethods1Client.PesquisaPessoa(EdtPequisa.Text);
    LDataSet := TFDJSONDataSetsReader.GetListValueByName(LDataSetList,'Pessoas');

    FDMemTablePesquisa.Active := False;

    FDMemTablePesquisa.AppendData(LDataSet);
end;

end.
