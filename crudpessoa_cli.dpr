program crudpessoa_cli;

uses
  System.StartUpCopy,
  FMX.Forms,
  ClientUnit in 'ClientUnit.pas' {FrmCliente},
  ClientClassesUnit3 in 'ClientClassesUnit3.pas',
  ClientModuleUnit3 in 'ClientModuleUnit3.pas' {ClientModule3: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCliente, FrmCliente);
  Application.CreateForm(TClientModule3, ClientModule3);
  Application.Run;
end.
