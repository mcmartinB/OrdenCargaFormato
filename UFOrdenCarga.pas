unit UFOrdenCarga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, ExtCtrls, Buttons, ActnList, Grids, DBGrids, BGrid, BDEdit,
  BSpeedButton, Menus, ComCtrls, BCalendario, BEdit, BCalendarButton, BGridButton,
  QRPrntr, DBTables, DBCtrls, bDialogs, bSQLUtils, bTimeUtils, StrUtils,
  ToolWin, ImgList, UDOrdenCarga, AFQuickMail, QRPDFFilt, QRExport;

//ESTADOS
const
   kVisualizar = 0;
   kNuevaCabecera = 1;
   kEditarCabecera = 2;
   kNuevoDetalle = 3;
   kEditarDetalle = 4;

type
  TFOrdenCarga = class( TForm )
    PMaestro: TPanel;
    DSMaestro: TDataSource;
    LEmpresa_p: TLabel;
    empresa_occ: TBDEdit;
    Label13: TLabel;
    Label1: TLabel;
    BGBCentro_occ: TBGridButton;
    centro_salida_occ: TBDEdit;
    STCentro_salida_occ: TStaticText;
    Label5: TLabel;
    vehiculo_occ: TBDEdit;
    transporte_occ: TBDEdit;
    DSDetalle: TDataSource;
    Bevel1: TBevel;
    LAno_semana_p: TLabel;
    STTransporte_occ: TStaticText;
    BGBtransporte_occ: TBGridButton;
    BGBEmpresa_occ: TBGridButton;
    STEmpresa_occ: TStaticText;
    Label11: TLabel;
    fecha_occ: TBDEdit;
    hora_occ: TBDEdit;
    BCBFecha_occ: TBCalendarButton;
    QOrdenCargaC: TQuery;
    nota_occ: TDBMemo;
    QOrdenCargaL: TQuery;
    ToolBar1: TToolBar;
    btnAlta: TToolButton;
    sep4: TToolButton;
    btnEditarC: TToolButton;
    btnBorrar: TToolButton;
    btnLocalizar: TToolButton;
    sep2: TToolButton;
    btnAltaD: TToolButton;
    btnEditarD: TToolButton;
    btnBorrarD: TToolButton;
    sep3: TToolButton;
    btnPrimero: TToolButton;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    btnUltimo: TToolButton;
    sep1: TToolButton;
    btnAceptar: TToolButton;
    btnCancelar: TToolButton;
    QOrdenCargaCorden_occ: TIntegerField;
    QOrdenCargaCempresa_occ: TStringField;
    QOrdenCargaCcentro_salida_occ: TStringField;
    QOrdenCargaCn_albaran_occ: TIntegerField;
    QOrdenCargaCfecha_occ: TDateField;
    QOrdenCargaChora_occ: TStringField;
    QOrdenCargaCcliente_sal_occ: TStringField;
    QOrdenCargaCdir_sum_occ: TStringField;
    QOrdenCargaCcliente_fac_occ: TStringField;
    QOrdenCargaCn_pedido_occ: TStringField;
    QOrdenCargaCtransporte_occ: TSmallintField;
    QOrdenCargaCvehiculo_occ: TStringField;
    QOrdenCargaCnota_occ: TMemoField;
    QOrdenCargaCstatus_occ: TIntegerField;
    QOrdenCargaLorden_ocl: TIntegerField;
    QOrdenCargaLlinea_ocl: TIntegerField;
    QOrdenCargaLempresa_ocl: TStringField;
    QOrdenCargaLcentro_salida_ocl: TStringField;
    QOrdenCargaLn_albaran_ocl: TIntegerField;
    QOrdenCargaLfecha_ocl: TDateField;
    QOrdenCargaLcentro_origen_ocl: TStringField;
    QOrdenCargaLproducto_ocl: TStringField;
    QOrdenCargaLenvase_ocl: TStringField;
    QOrdenCargaLmarca_ocl: TStringField;
    QOrdenCargaLcategoria_ocl: TStringField;
    QOrdenCargaLcalibre_ocl: TStringField;
    QOrdenCargaLcolor_ocl: TStringField;
    QOrdenCargaLref_transitos_ocl: TIntegerField;
    QOrdenCargaLunidades_caja_ocl: TIntegerField;
    QOrdenCargaLcajas_ocl: TIntegerField;
    QOrdenCargaLkilos_ocl: TFloatField;
    QOrdenCargaLprecio_ocl: TFloatField;
    QOrdenCargaLunidad_precio_ocl: TStringField;
    QOrdenCargaLimporte_neto_ocl: TFloatField;
    QOrdenCargaLporc_iva_ocl: TFloatField;
    QOrdenCargaLiva_ocl: TFloatField;
    QOrdenCargaLimporte_total_ocl: TFloatField;
    QOrdenCargaLn_palets_ocl: TSmallintField;
    QOrdenCargaLtipo_palets_ocl: TStringField;
    QOrdenCargaLtipo_iva_ocl: TStringField;
    QOrdenCargaLfederacion_ocl: TStringField;
    QOrdenCargaLcliente_ocl: TStringField;
    QOrdenCargaLemp_procede_ocl: TStringField;
    ImageList: TImageList;
    btnImprimir: TToolButton;
    Label3: TLabel;
    orden_occ: TBDEdit;
    Label4: TLabel;
    Bevel2: TBevel;
    btnCrearAlbaran: TToolButton;
    sep5: TToolButton;
    PopupMenuImprimir: TPopupMenu;
    mnuImprimirOrdenCarga: TMenuItem;
    mnuImprimirPackingList: TMenuItem;
    btnActivar: TToolButton;
    PopupMenuFiltro: TPopupMenu;
    mnuCreadas: TMenuItem;
    mnuActivas: TMenuItem;
    mnuInicializadas: TMenuItem;
    mnuFinalizadas: TMenuItem;
    btnFinalizar: TToolButton;
    QOrdenCargaCtraspasada_occ: TIntegerField;
    PageControl1: TPageControl;
    tsLineas: TTabSheet;
    RVisualizacion: TDBGrid;
    PDetalle: TPanel;
    Label2: TLabel;
    BGBProducto_ocl: TBGridButton;
    Label6: TLabel;
    BGBFormato_cliente_ocl: TBGridButton;
    Label15: TLabel;
    BGBMarca_ocl: TBGridButton;
    Label16: TLabel;
    BGBCategoria_ocl: TBGridButton;
    Label17: TLabel;
    BGBColor_ocl: TBGridButton;
    Label30: TLabel;
    BGBCalibre_ocl: TBGridButton;
    Label31: TLabel;
    STProducto_ocl: TStaticText;
    producto_ocl: TBDEdit;
    formato_cliente_ocl: TBDEdit;
    STFormato_Cliente_ocl: TStaticText;
    marca_ocl: TBDEdit;
    STMarca_ocl: TStaticText;
    categoria_ocl: TBDEdit;
    STCategoria_ocl: TStaticText;
    color_ocl: TBDEdit;
    STcolor_ocl: TStaticText;
    calibre_ocl: TBDEdit;
    kilos_ocl: TBDEdit;
    Shape1: TShape;
    ToolButton1: TToolButton;
    QOrdenCargaLfecha_transito_ocl: TDateField;
    QOrdenCargaCcentro_destino_occ: TStringField;
    EnvaseCalibreyColor1: TMenuItem;
    EnvasesLogifruit1: TMenuItem;
    ipoPalets1: TMenuItem;
    Label22: TLabel;
    n_palets_occ: TBDEdit;
    QOrdenCargaCn_palets_occ: TIntegerField;
    btnResumen: TToolButton;
    QPalets: TQuery;
    Label24: TLabel;
    lblNotasAlbaran: TLabel;
    lblPortes: TLabel;
    porte_bonny_occ: TDBCheckBox;
    QOrdenCargaCporte_bonny_occ: TIntegerField;
    N1: TMenuItem;
    mnuEnviarCorreo: TMenuItem;
    AFQuickMail: TAFQuickMail;
    lblHigiene_occ: TLabel;
    higiene_occ: TDBCheckBox;
    QOrdenCargaChigiene_occ: TIntegerField;
    Label9: TLabel;
    lblPalets: TLabel;
    n_palets_ocl: TBDEdit;
    Label10: TLabel;
    tipo_palets_ocl: TBDEdit;
    stTipoPalet: TStaticText;
    Label12: TLabel;
    nota_interna_occ: TDBMemo;
    QOrdenCargaCnota_interna_occ: TStringField;
    QOrdenCargaLproducto_base_ocl: TSmallintField;
    QOrdenCargaLformato_cliente_ocl: TStringField;
    QOrdenCargaLunidades_ocl: TIntegerField;
    unidades_ocl: TBDEdit;
    Label23: TLabel;
    Label26: TLabel;
    envase_ocl: TBDEdit;
    stEnvase: TStaticText;
    Label27: TLabel;
    QOrdenCargaCfecha_pedido_occ: TDateField;
    QOrdenCargaCoperador_transporte_occ: TSmallintField;
    QOrdenCargaCmuelle_occ: TStringField;
    lblNombre2: TLabel;
    operador_transporte_occ: TBDEdit;
    btnOperador_transporte_occ: TBGridButton;
    stOperador_transporte_occ: TStaticText;
    mnuPackingSimple: TMenuItem;
    mnuSepPackingSimple: TMenuItem;
    qrxclfltr1: TQRExcelFilter;
    qrpdfltr1: TQRPDFFilter;
    pgcDestino: TPageControl;
    tsSalida: TTabSheet;
    lblCliente: TLabel;
    cliente_sal_occ: TBDEdit;
    BGBCliente_sal_occ: TBGridButton;
    STCliente_sal_occ: TStaticText;
    lblNombre3: TLabel;
    dir_sum_occ: TBDEdit;
    BGBDir_sum_occ: TBGridButton;
    STDir_sum_occ: TStaticText;
    lblPedido: TLabel;
    n_pedido_occ: TBDEdit;
    BGBn_pedido_occ: TBGridButton;
    lblNombre1: TLabel;
    fecha_pedido_occ: TBDEdit;
    BGBFecha_pedido_occ: TBCalendarButton;
    QOrdenCargaCplanta_origen_occ: TStringField;
    QOrdenCargaCplanta_destino_occ: TStringField;
    QOrdenCargaCoperador_occ: TSmallintField;
    OrdenCompleta1: TMenuItem;
    cajas_ocl: TBDEdit;
    lblunidades_caja: TLabel;
    unidades_caja_ocl: TBDEdit;
    pnl1: TPanel;
    lblTranspasada: TLabel;
    lblStatus: TLabel;
    lblCargadados: TLabel;
    lblComercial: TLabel;
    comercial_ocl: TBDEdit;
    btnComercial: TBGridButton;
    txtComercial: TStaticText;
    strngfldQOrdenCargaLcomercial_ocl: TStringField;
    lbl3: TLabel;
    edtentrega_sl: TBDEdit;
    strngfldQOrdenCargaLnotas_ocl: TStringField;
    lblFechaDescarga: TLabel;
    fecha_descarga_occ: TBDEdit;
    btnEntradaFechaDescarga: TBCalendarButton;
    QOrdenCargaCfecha_descarga_occ: TDateField;
    es_peso_real_ocl: TDBCheckBox;
    Label7: TLabel;
    QOrdenCargaLes_peso_real_ocl: TIntegerField;
    QOrdenCargaLkilos_reales_ocl: TFloatField;
    qryPesoReal: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAltaClick(Sender: TObject);
    procedure btnEditarCClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnAltaDClick(Sender: TObject);
    procedure btnEditarDClick(Sender: TObject);
    procedure btnBorrarDClick(Sender: TObject);
    procedure btnPrimeroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QOrdenCargaCNewRecord(DataSet: TDataSet);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BCBFecha_occClick(Sender: TObject);
    procedure empresa_occChange(Sender: TObject);
    procedure centro_salida_occChange(Sender: TObject);
    procedure cliente_sal_occChange(Sender: TObject);
    procedure dir_sum_occChange(Sender: TObject);
    procedure transporte_occChange(Sender: TObject);
    procedure producto_oclChange(Sender: TObject);
    procedure formato_cliente_oclChange(Sender: TObject);
    procedure marca_oclChange(Sender: TObject);
    procedure categoria_oclChange(Sender: TObject);
    procedure color_oclChange(Sender: TObject);
    procedure BGBEmpresa_occClick(Sender: TObject);
    procedure BGBCentro_occClick(Sender: TObject);
    procedure BGBCliente_sal_occClick(Sender: TObject);
    procedure BGBDir_sum_occClick(Sender: TObject);
    procedure BGBtransporte_occClick(Sender: TObject);
    procedure QOrdenCargaCAfterEdit(DataSet: TDataSet);
    procedure QOrdenCargaCBeforePost(DataSet: TDataSet);
    procedure QOrdenCargaLBeforePost(DataSet: TDataSet);
    procedure QOrdenCargaLAfterEdit(DataSet: TDataSet);
    procedure BGBProducto_oclClick(Sender: TObject);
    procedure BGBFormato_cliente_oclClick(Sender: TObject);
    procedure BGBMarca_oclClick(Sender: TObject);
    procedure BGBCalibre_oclClick(Sender: TObject);
    procedure BGBCategoria_oclClick(Sender: TObject);
    procedure BGBColor_oclClick(Sender: TObject);
    procedure QOrdenCargaLAfterInsert(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QOrdenCargaCAfterPost(DataSet: TDataSet);
    procedure mnuImprimirOrdenClick(Sender: TObject);
    procedure mnuImprimirPackingListClick(Sender: TObject);
    procedure mnuFiltroClick(Sender: TObject);
    procedure btnActivarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure BGBn_pedido_occClick(Sender: TObject);
    procedure btnCrearAlbaranClick(Sender: TObject);
    //procedure TimerTimer(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure EnvaseCalibreyColor1Click(Sender: TObject);
    procedure EnvasesLogifruit1Click(Sender: TObject);
    procedure ipoPalets1Click(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnResumenClick(Sender: TObject);
    procedure porte_bonny_occEnter(Sender: TObject);
    procedure porte_bonny_occExit(Sender: TObject);
    procedure mnuEnviarCorreoClick(Sender: TObject);
    procedure QOrdenCargaLAfterPost(DataSet: TDataSet);
    procedure BGBTipo_Palet_oclClick(Sender: TObject);
    procedure tipo_palets_oclChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RVisualizacionDblClick(Sender: TObject);
    procedure envase_oclChange(Sender: TObject);
    procedure btnFecha_pedido_occ(Sender: TObject);
    procedure btnOperador_transporte_occClick(Sender: TObject);
    procedure operador_transporte_occChange(Sender: TObject);
    procedure btnEnvase_oclClick(Sender: TObject);
    procedure mnuPackingSimpleClick(Sender: TObject);
    procedure dir_sum_occExit(Sender: TObject);
    procedure OrdenCompleta1Click(Sender: TObject);
    procedure cajas_oclChange(Sender: TObject);
    procedure unidades_caja_oclChange(Sender: TObject);
    procedure orden_occChange(Sender: TObject);
    procedure comercial_oclChange(Sender: TObject);
    procedure btnComercialClick(Sender: TObject);
    procedure btnEntradaFechaDescargaClick(Sender: TObject);
    procedure PDetalleEnter(Sender: TObject);
    procedure QOrdenCargaLBeforeEdit(DataSet: TDataSet);
    procedure QOrdenCargaLBeforeInsert(DataSet: TDataSet);
    procedure hora_occExit(Sender: TObject);

  private
    { Private declarations }
    sFiltro: string;

    EstadoAnterior: integer;
    EstadoActual: integer;

    bEscape: boolean;

    sEmpresaActual, sCentroActual, sFechaActual, sClienteActual: string;
    rImpuestosActual: TImpuesto;
    rKilosAnterior: Real;


    //Valores sacados del formato
    iProductoBase: integer;
    sProductocontrol : string;
    iCajasPalet, iUnidadesCaja: integer;
    sUnidadPrecioLinea: string;
    rPesoCaja: Real;
    bPesoVariableLinea, bUnidadesVariableLinea, bFlagCambios: Boolean;
    rImpuestoLinea: real;


    //Valores calculados
    iPalets, iCajas, iUnidades: integer;
    rKilos, rPrecio, rImporte, rIva, rTotal: real;

    bPedidoExiste:Boolean;

    procedure RecalcularUnidades( const ASender: TObject );

    procedure ActualizarEstado( const AEstado: integer );
    procedure HabilitarBarra;
    procedure DesHabilitarBarra;
    procedure Visualizar;
    procedure EditarC;
    procedure EditarD;
    procedure VisualizarOrden( const AOrden: string );
    procedure RefrescarOrden( const AOrden: string );
    procedure RefrescarDetalle;
    procedure PonStatus;
    procedure PonPalets;

    procedure PonInicializada;
    procedure PonFinalizada;
    procedure CrearAlbaran;

    procedure BorrarOrdenActual( const APreguntar: Boolean );
    procedure BorrarDetalleActual( const APreguntar: Boolean );
    procedure FiltrarOrdenes;

    procedure ConstruirFiltro;

    procedure DesplegarRejilla( const AControl: TControl );

    procedure Aceptar;

    procedure Observaciones;

    function NumVersion: string;

    function  EsPesoReal( const AEmpresa, ACentro, AProducto: string ): Boolean;

  public

  end;

var
  FOrdenCarga: TFOrdenCarga;
  bCalcular: boolean;

implementation

{$R *.DFM}

uses UFFiltro, UFCalendario, UFRejilla, UFTransportistas,  UFClientes,
     UDDescripciones, UQOrdenCompleta, bMath, UFResumen, bCalculadora,
     UFSuministros, UFPedidos, DPCrearAlbaran, UQOrdenPackingSimple,
     UDOrden2Albaran, CGlobal;

procedure SoloLectura( const AComponent: TBDEdit; const ASoloLectura: boolean );
begin
  AComponent.ReadOnly:= ASoloLectura;
  if ASoloLectura then
  begin
    AComponent.ColorEdit:= clSilver;
    AComponent.ColorNormal:= clSilver;
    AComponent.ColorDisable:= clSilver;
  end
  else
  begin
    AComponent.ColorEdit:= clMoneyGreen;
    AComponent.ColorNormal:= clWhite;
    AComponent.ColorDisable:= clSilver;
  end;
end;

function TFOrdenCarga.NumVersion: string;
var
  sFileIni: string;
  slAux: TStringList;
begin
  sFileIni:= StringReplace( ParamStr(0), '.exe', '.ver', [] );
  if FileExists(sFileIni) then
  begin
    slAux:= TStringList.Create;
    try
      slAux.LoadFromFile( sFileINi );
      Result:= 'V' + Trim( slAux.Text );
    finally
      FreeAndNil( slAux );
    end;
  end;
end;


procedure TFOrdenCarga.FormCreate(Sender: TObject);
begin

  Caption:= Caption + ' - '  + NumVersion;
  bEscape:= false;
  UDDescripciones.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFRejilla.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFTransportistas.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFClientes.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFSuministros.InicializaModulo( DOrdenCarga.Database.DatabaseName );

  with QOrdenCargaC do
  begin
    SQL.Clear;
    SQL.Add(' select * from frf_orden_carga_c ');
    SQL.Add(' where fecha_occ = :fecha ');
    SQL.Add(' order by fecha_occ desc, status_occ, orden_occ desc ');
    ParamByName('fecha').asDateTime:= Date;
    sFiltro:= ' where fecha_occ = ' + QuotedStr( DateToStr( Date ) );
    Open;
  end;
  with QOrdenCargaL do
  begin
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_orden_carga_l ');
    SQL.Add(' where orden_ocl = :orden_occ ');
    Prepare;
    Open;
  end;
  ActualizarEstado( kVisualizar );

  QPalets.Prepare;


  Top:= ( Screen.Height - Height ) div 2;
  Left:= ( Screen.Width - Width ) div 2;
  bCalcular:= True;

  bFlagCambios:= True;
  bPesoVariableLinea:= True;
  bUnidadesVariableLinea:= True;
  iUnidadesCaja:= 0;
  rPesoCaja:= 0;
  rImpuestoLinea:= 0;
  sUnidadPrecioLinea:='';

  SoloLectura( unidades_caja_ocl, not bUnidadesVariableLinea );
  SoloLectura( kilos_ocl, not bPesoVariableLinea );

  Height:= Constraints.MinHeight;
  Width:= Constraints.MinWidth;
end;

procedure TFOrdenCarga.FormShow(Sender: TObject);
begin
  (*
  //SOLO SI ES UN WINDOWS XP
  AnimateWindow( Handle, 400, AW_ACTIVATE or AW_SLIDE or AW_VER_POSITIVE ); //AW_CENTER );
  RedrawWindow( Handle, nil, 0, RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN );
  *)
end;

procedure TFOrdenCarga.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=
    (Application.MessageBox('?Seguro que desea cerrar la aplicaci?n?', 'CERRAR APLICACI?N', MB_YESNO ) = IDYES );
end;

procedure TFOrdenCarga.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QOrdenCargaL.Close;
  QOrdenCargaC.Close;

  UDDescripciones.FinalizaModulo;
  UFRejilla.FinalizaModulo;
  UFTransportistas.FinalizaModulo;
  UFClientes.FinalizaModulo;
  UFSuministros.FinalizaModulo;

  QOrdenCargaL.UnPrepare;
  QPalets.UnPrepare;
end;

procedure TFOrdenCarga.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EstadoActual = kVisualizar then
  begin
    case Key of
      VK_ADD:
            if ssShift in Shift then
            begin
              if btnAltaD.Enabled then
                btnAltaD.Click;
            end
            else
            begin
              if btnAlta.Enabled then
                btnAlta.Click;
            end;
      VK_SUBTRACT:
            if ssShift in Shift then
            begin
              if btnBorrarD.Enabled then
                btnBorrarD.Click;
            end
            else
            begin
              if btnBorrar.Enabled then
                btnBorrar.Click;
            end;
      Ord('M'):
            if ssShift in Shift then
            begin
              if btnEditarD.Enabled then
                btnEditarD.Click;
            end
            else
            begin
              if btnEditarC.Enabled then
                btnEditarC.Click;
            end;
      Ord('L'):
            if btnLocalizar.Enabled then
              btnLocalizar.Click;
      vk_f1:
            if btnAceptar.Enabled then
              btnAceptar.Click;
      vk_escape:
            if btnCancelar.Enabled then
              btnCancelar.Click;
      vk_left:
            if btnAnterior.Enabled then
              btnAnterior.Click;
      vk_up:
            if btnPrimero.Enabled then
              btnPrimero.Click;
      vk_right:
            if btnProximo.Enabled then
              btnProximo.Click;
      vk_down:
            if btnUltimo.Enabled then
              btnUltimo.Click;
      Ord('I'):
            if btnImprimir.Enabled then
              btnImprimir.Click;
      Ord('A'):
            if ssShift in Shift then
            begin
              if btnActivar.Enabled then
                btnActivar.Click;
            end;
      Ord('F'):
            if ssShift in Shift then
            begin
              if btnFinalizar.Enabled then
                btnFinalizar.Click;
            end;
      Ord('C'):
            if ssShift in Shift then
            begin
              if btnCrearAlbaran.Enabled then
                btnCrearAlbaran.Click;
            end;
    end;
  end
  else
  begin
    case Key of
      vk_f1:
            btnAceptar.Click;
      vk_escape:
            btnCancelar.Click;
    end;
  end;
end;

procedure TFOrdenCarga.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EstadoActual <> kVisualizar then
  begin
    case Key of
      vk_return, vk_down:
        if not nota_occ.Focused then
            PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      vk_up:
        if not nota_occ.Focused then
            PostMessage(Handle, WM_NEXTDLGCTL, 1, 0);
      vk_f2:
        DesplegarRejilla( self.ActiveControl );
      vk_f5:
        if kilos_ocl.Focused then
        begin
          bCalculadora.CalculadoraExecute( kilos_ocl );
        end;
    end;
  end;
end;

procedure TFOrdenCarga.DesplegarRejilla( const AControl: TControl );
var
  sAux: string;
  dFecha: TDateTime;
  sEmpresa, sCentro, sCliente, sSuministro, sPedido, sFecha: String;
begin
  sAux:= TEdit( AControl ).Text;

  if AControl.Name = fecha_occ.Name then
  begin
    if PonFecha( self, fecha_occ, fecha_occ.Text, sAux ) then
      fecha_occ.Text:= sAux;
  end
  else
  if AControl.Name = fecha_pedido_occ.Name then
  begin
    if PonFecha( self, fecha_pedido_occ, fecha_pedido_occ.Text, sAux ) then
      fecha_pedido_occ.Text:= sAux;
  end
  else
  if AControl.Name = n_pedido_occ.Name then
  begin
    sEmpresa:= empresa_occ.Text;
    sCentro:= centro_salida_occ.Text;
    dFecha:= StrToDateDef( fecha_pedido_occ.Text, Date );
    sFecha:= DateToStr( dFecha );
    sCliente:= cliente_sal_occ.Text;
    sSuministro:= dir_sum_occ.Text;

    if SeleccionaPedido( self, n_pedido_occ, sEmpresa, sCentro, sCliente, sSuministro, sPedido, sFecha ) then
    begin
      if cliente_sal_occ.Text <> sCliente then
        cliente_sal_occ.Text:= sCliente;
      if dir_sum_occ.Text <> sSuministro then
        dir_sum_occ.Text:= sSuministro;
      if n_pedido_occ.Text <> sPedido then
        sAux:= sPedido;
      if fecha_pedido_occ.Text <> sFecha then
        fecha_pedido_occ.Text:=  sFecha;
    end;
  end
  else
  if AControl.Name = operador_transporte_occ.Name then
  begin
  if SeleccionaTransportista( self, operador_transporte_occ, empresa_occ.text, sAux ) then
    operador_transporte_occ.Text:= sAux;
  end
  else
  if AControl.Name = empresa_occ.Name then
  begin
    SeleccionaEmpresa( self, AControl, SAux );
  end
  else
  if ( AControl.Name = centro_salida_occ.Name ) then
  begin
    SeleccionaCentro( self, AControl, empresa_occ.Text, SAux );
  end
  else
  if ( AControl.Name = cliente_sal_occ.Name ) then
  begin
    UFClientes.SeleccionaClientes( self, AControl, empresa_occ.Text, SAux );
  end
  else
  if ( AControl.Name = dir_sum_occ.Name ) then
  begin
    UFSuministros.SeleccionaSuministros( self, AControl, empresa_occ.Text, cliente_sal_occ.Text, SAux );
    //SeleccionaSuministro( self, AControl, empresa_occ.Text, cliente_sal_occ.Text, SAux );
  end
  else
  if ( AControl.Name = transporte_occ.Name ) then
  begin
    UFTransportistas.SeleccionaTransportista( self, AControl, empresa_occ.Text, SAux );
  end
  else
  if ( AControl.Name = producto_ocl.Name ) then
  begin
    if bPedidoExiste then
    begin
      SeleccionaProductoPedido( self, Producto_ocl, empresa_occ.Text, centro_salida_occ.Text, cliente_sal_occ.Text,
                              dir_sum_occ.Text, n_pedido_occ.Text, fecha_pedido_occ.Text,  sAux );
    end
    else
    begin
      SeleccionaProducto( self, AControl, empresa_occ.Text, SAux );
    end;

    //
  end
  else
  if ( AControl.Name = formato_cliente_ocl.Name ) then
  begin
    if bPedidoExiste then
    begin
      SeleccionaFormatoPedido( self,formato_cliente_ocl, empresa_occ.Text, centro_salida_occ.Text, cliente_sal_occ.Text,
                              dir_sum_occ.Text, n_pedido_occ.Text, fecha_pedido_occ.Text, producto_ocl.Text, sAux );
    end
    else
    begin
      SeleccionaFormatoCliente( self, AControl, empresa_occ.Text, producto_ocl.Text,
        cliente_sal_occ.Text, dir_sum_occ.Text, SAux );
    end;
  end
  else
  if ( AControl.Name = marca_ocl.Name ) then
  begin
    SeleccionaMarca( self, AControl, SAux );
  end
  else
  if ( AControl.Name = calibre_ocl.Name ) then
  begin
    SeleccionaCalibre( self, AControl, empresa_occ.Text, producto_ocl.Text, SAux );
  end
  else
  if ( AControl.Name = color_ocl.Name ) then
  begin
    SeleccionaColor( self, AControl, empresa_occ.Text, producto_ocl.Text, SAux );
  end
  else
  if ( AControl.Name = comercial_ocl.Name ) then
  begin
    SeleccionaComercial( self, comercial_ocl,  sAux );
  end
  else
  if ( AControl.Name = categoria_ocl.Name ) then
  begin
    SeleccionaCategoria( self, AControl, empresa_occ.Text, producto_ocl.Text, SAux );
  end;

  TEdit( AControl ).Text:= sAux;
end;

procedure TFOrdenCarga.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFOrdenCarga.btnRefrescarClick(Sender: TObject);
begin
  if QOrdenCargaC.Active then
  begin
    if not QOrdenCargaC.IsEmpty then
    begin
      RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    end;
  end;
end;

procedure TFOrdenCarga.Aceptar;
begin
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    QOrdenCargaC.Post;
    ActualizarEstado( kVisualizar );
    if EstadoAnterior = kNuevaCabecera then
    begin
      btnAltaD.Click;
    end;
  end
  else
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    (*TODO*)
    (*
    if sFacturar = '' then
    begin
      ShowMessage('Envase selccionado no valido para el cliente actual.' + #10 + #10 +
                  'Si es correcto, por favor darlo de alta en el mantenimento de clientes.');
      Exit;
    end;
    *)
    QOrdenCargaL.Post;
    ActualizarEstado( kVisualizar );
    if EstadoAnterior = kNuevoDetalle then
    begin
      btnAltaD.Click;
    end;
  end;
end;


procedure TFOrdenCarga.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
  (*
  if not DOrdenCarga.Database.InTransaction then
  begin
    DOrdenCarga.Database.StartTransaction;
    try
      Aceptar;
      DOrdenCarga.Database.Commit;
    except
      DOrdenCarga.Database.Rollback;
      btnCancelar.Click;
      RefrescarOrden( QOrdenCargaCorden_occ.AsString );
      Raise;
    end;
  end;
  *)
end;

procedure TFOrdenCarga.btnCancelarClick(Sender: TObject);
begin
  bEscape:= True;
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    if QOrdenCargaC.State in [dsInsert] then
    begin
      //Obtener y actualizar contador de ordenes
     if gProgramVersion = pvBAG then
        DOrdenCarga.QGetNumeroOrden.ParamByName('empresa').AsString := 'BAG'
      else
        DOrdenCarga.QGetNumeroOrden.ParamByName('empresa').AsString := 'SAT';
      DOrdenCarga.QGetNumeroOrden.Open;
      if QOrdenCargaCorden_occ.AsInteger = DOrdenCarga.QGetNumeroOrden.FieldByName('contador_oc').AsInteger - 1 then
      begin
        DOrdenCarga.QUpdateNumeroOrden.ParamByName('contador').AsInteger:= QOrdenCargaCorden_occ.AsInteger;
        DOrdenCarga.QUpdateNumeroOrden.ExecSQL;
      end;
      DOrdenCarga.QGetNumeroOrden.Close;
    end;
    QOrdenCargaC.Cancel;
  end
  else
  begin
    if QOrdenCargaL.State in [dsInsert, dsEdit] then
    begin
      QOrdenCargaL.Cancel;
    end;
  end;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnAltaClick(Sender: TObject);
begin
  QOrdenCargaC.Insert;
  ActualizarEstado( kNuevaCabecera );
end;

procedure TFOrdenCarga.btnEditarCClick(Sender: TObject);
begin
  QOrdenCargaC.Edit;
  ActualizarEstado( kEditarCabecera );
end;

procedure TFOrdenCarga.btnBorrarClick(Sender: TObject);
begin
  if DOrdenCarga.ComprobarIntegridadOrden( QOrdenCargaCorden_occ.AsInteger ) then
  begin
    BorrarOrdenActual( true );
    ActualizarEstado( kVisualizar );
  end
  else
  begin
    if Application.MessageBox( PCHAR( 'La orden "' + IntToStr( QOrdenCargaCorden_occ.AsInteger ) + '" tiene datos de Packing List asociados.' +
      #13 + #10 + '?Esta seguro que desea borrar la orden seleccionada?   ' + #13 + #10 +
      'NOTA: El Packing List no se borrara.' ), 'AVISO PACKING LIST', mb_yesno ) = idyes then
    begin
      BorrarOrdenActual( false );
      ActualizarEstado( kVisualizar );
    end;
  end;
end;

procedure TFOrdenCarga.btnLocalizarClick(Sender: TObject);
begin
  FiltrarOrdenes;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnPrimeroClick(Sender: TObject);
begin
  QOrdenCargaC.First;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnAnteriorClick(Sender: TObject);
begin
  QOrdenCargaC.Prior;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnProximoClick(Sender: TObject);
begin
  QOrdenCargaC.Next;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnUltimoClick(Sender: TObject);
begin
  QOrdenCargaC.Last;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnAltaDClick(Sender: TObject);
begin
  bPedidoExiste:= DOrdenCarga.ExistePedido( empresa_occ.Text, centro_salida_occ.Text, cliente_sal_occ.Text,
                                            dir_sum_occ.Text, n_pedido_occ.Text, fecha_pedido_occ.Text );
  QOrdenCargaL.Insert;
  ActualizarEstado( kNuevoDetalle );
end;

procedure TFOrdenCarga.btnEditarDClick(Sender: TObject);
begin
  bPedidoExiste:= DOrdenCarga.ExistePedido( empresa_occ.Text, centro_salida_occ.Text, cliente_sal_occ.Text,
                                            dir_sum_occ.Text, n_pedido_occ.Text, fecha_pedido_occ.Text );
  QOrdenCargaL.Edit;
  ActualizarEstado( kEditarDetalle );
end;

procedure TFOrdenCarga.RVisualizacionDblClick(Sender: TObject);
begin
  if btnEditarD.Enabled then
    btnEditarD.Click;
end;

procedure TFOrdenCarga.btnBorrarDClick(Sender: TObject);
begin
  //Integridad con el packing list
  if DOrdenCarga.ComprobarIntegridadLinea( QOrdenCargaLorden_ocl.AsInteger, QOrdenCargaLlinea_ocl.AsInteger,
    QOrdenCargaLempresa_ocl.AsString, QOrdenCargaLformato_cliente_ocl.AsString, 0 ) then
  begin
    BorrarDetalleActual( True );
    ActualizarEstado( kVisualizar );
  end
  else
  begin
    if Application.MessageBox('Integridad con el Packing List rota, hay mas cajas en el cami?n que en la orden de carga.' + #13 + #10 +
                              '?Esta seguro de querer continuar con el borrado?      ', 'AVISO PACKING LIST', mb_yesno) = idyes then
    begin
      BorrarDetalleActual( False );
    end;
  end;
end;

procedure TFOrdenCarga.btnImprimirClick(Sender: TObject);
begin
  UQOrdenPackingSimple.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) );
end;

procedure TFOrdenCarga.OrdenCompleta1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , True, True, True, True, True );
end;

procedure TFOrdenCarga.mnuImprimirOrdenClick(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , True, False, False, False, False );
end;

procedure TFOrdenCarga.mnuImprimirPackingListClick(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, True, False, False, False );
end;

procedure TFOrdenCarga.EnvaseCalibreyColor1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, False, False, True, False );
end;

procedure TFOrdenCarga.EnvasesLogifruit1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, False, True, False, False );
end;

procedure TFOrdenCarga.ipoPalets1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, False, False, False, True );
end;

procedure TFOrdenCarga.CrearAlbaran;
var
  //DTraspasar: TDTraspasar;
  bTraspasar: boolean;
  sMessage: string;
  APacking: Boolean;
begin
  if QOrdenCargaCtraspasada_occ.AsInteger = 0 then
  begin
    bTraspasar:= Application.MessageBox('?Seguro que quiere generar el ALBAR?N DE SALIDA?   ',
         'GENERAR ALBAR?N.', mb_yesno ) = idyes;
  end
  else
  begin
    bTraspasar:= Application.MessageBox('La orden ya ha sido traspasada.' + #13 + #10 +
      '?Seguro que quiere volver a generar el ALBAR?N DE SALIDA?   ', 'GENERAR ALBAR?N.', mb_yesno ) = idyes;
  end;

  if bTraspasar then
  begin
    if ( cliente_sal_occ.Text = 'GOM' ) or ( cliente_sal_occ.Text = 'THA' ) or
       ( cliente_sal_occ.Text = 'M&W' ) or ( cliente_sal_occ.Text = 'APS' ) or
       ( cliente_sal_occ.Text = 'EEN' ) or ( cliente_sal_occ.Text = 'WIG' ) or (
        cliente_sal_occ.Text = 'P' )then
    begin
      ShowMessage('Para los clientes ''GOM'', ''THA'', ''M&W'', ''APS'' y ''EEN'' la base del albaran final son las lineas de la orden y no el paking list como al resto de clientes.' + #13 + #10 +
                  'Por favor revise los calibres del albar?n final.' );
      APacking:= True;
      UDOrden2Albaran.CrearAlbaran( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCcentro_salida_occ.AsString,
                                    QOrdenCargaCfecha_occ.AsDateTime, QOrdenCargaCorden_occ.AsInteger, APacking );
    end
    else
    begin
      if not DPCrearAlbaran.CrearAlbaran( self, QOrdenCargaCorden_occ.AsInteger, sMessage ) then
      begin
        ShowMessage('ERROR AL CREAR EL ALBAR?N.' + #13 + #10 + sMessage );
      end;
    end;
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  end;
end;

procedure TFOrdenCarga.btnActivarClick(Sender: TObject);
begin
  if Application.MessageBox('?Esta seguro que quiere activar la orden?, a partir de ese momento se inicializara la carga.','ACTIVAR ORDEN', MB_YESNO ) = IDYES then
  begin
    DOrdenCarga.CambiarEstado( QOrdenCargaCorden_occ.AsInteger, 1);
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  end;
end;

procedure TFOrdenCarga.btnFinalizarClick(Sender: TObject);
var
  sAux: string;
begin
  if ( QOrdenCargaCstatus_occ.AsInteger = 1 ) or ( QOrdenCargaCstatus_occ.AsInteger = 2 ) then
  begin
    if not DOrdenCarga.ComprobarIntegridad( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCorden_occ.AsInteger, sAux ) then
    begin
      Application.MessageBox(Pchar( 'No se puede finalizar la orden, no concuerda lo pedido con lo cargado. ' +
                                  #13 + #10 + sAux ), 'FINALIZAR ORDEN.', mb_ok );
    end
    else
    begin
      PonFinalizada;
    end;
  end
  else
  if ( QOrdenCargaCstatus_occ.AsInteger = 3) then
  begin
    if QOrdenCargaCtraspasada_occ.AsInteger <> 0 then
    begin
      if Application.MessageBox(Pchar( 'El albar?n de salida/tr?nsito ya ha sido creado.' + #13 + #10 +
                                       '?Esta seguro que quiere desfinalizar la orden?   '),
                                       'DESFINALIZAR ORDEN.', mb_yesno ) = idyes then
      begin
        PonInicializada;
      end;
    end
    else
    begin
      if DOrdenCarga.ComprobarIntegridad( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCorden_occ.AsInteger, sAux ) then
      begin
        if Application.MessageBox(Pchar( 'La orden de carga coincide con el packing creado.' + #13 + #10 +
                                         '?Esta seguro que quiere desfinalizar la orden?   '),
                                         'DESFINALIZAR ORDEN.', mb_yesno ) = idyes then
        begin
          PonInicializada;
        end
      end
      else
      begin
        PonInicializada;
      end;
    end;
  end;
end;

procedure TFOrdenCarga.btnCrearAlbaranClick(Sender: TObject);
var
  sAux: string;
begin

    //No se podr? generar un albaran, si ya existe
    with DOrdenCarga.QAux do
    try
      SQL.Clear;
      SQL.Add(' select* from frf_salidas_c ');
      SQL.Add('   where empresa_sc = :empresa ');
      SQL.Add('     and n_orden_sc = :orden ');

      ParamByName('orden').AsString := QOrdenCargaCorden_occ.AsString;
      ParamByName('empresa').AsString := QOrdenCargaCempresa_occ.AsString;
      Open;

      if not DOrdenCarga.QAux.IsEmpty  then
      begin
        ShowMessage( 'ATENCION! YA existe un Albaran de Salida con esta Orden Carga ( Albaran: ' + DOrdenCarga.QAux.FieldByName('n_albaran_sc').AsString + ' Fecha: '
                                                                                                 + DOrdenCarga.QAux.FieldByName('fecha_sc').AsString + ' )' );
        Exit;
      end;

    finally
      Close;
    end;


    //No se podr? generar un transito, si ya existe
    with DOrdenCarga.QAux do
    try
      SQL.Clear;
      SQL.Add(' select* from frf_transitos_c ');
      SQL.Add('   where empresa_tc = :empresa ');
      SQL.Add('     and n_orden_tc = :orden ');

      ParamByName('orden').AsString := QOrdenCargaCorden_occ.AsString;
      ParamByName('empresa').AsString := QOrdenCargaCempresa_occ.AsString;
      Open;

      if not DOrdenCarga.QAux.IsEmpty  then
      begin
        ShowMessage( 'ATENCION! YA existe un Tr?nsito con esta Orden Carga ( Transito: ' + DOrdenCarga.QAux.FieldByName('referencia_tc').AsString + ' Fecha: '
                                                                                         + DOrdenCarga.QAux.FieldByName('fecha_tc').AsString + ' )' );
        Exit;
      end;

    finally
      Close;
    end;

  if not DOrdenCarga.ComprobarIntegridad( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCorden_occ.AsInteger, sAux ) then
  begin
    Application.MessageBox(Pchar( 'No se puede finalizar la orden, no concuerda lo pedido con lo cargado. ' +
                                  #13 + #10 + sAux ), 'ATENCION: Orden <> Packing.', mb_ok );
  end
  else
  begin
    CrearAlbaran;
  end;
end;

procedure TFOrdenCarga.PonInicializada;
begin
  //if Application.MessageBox('?Esta seguro que quiere desfinalizar la orden?','DESFINALIZAR ORDEN', MB_YESNO ) = IDYES then
  //begin
    DOrdenCarga.DesfinalizarOrden( QOrdenCargaCorden_occ.AsInteger );
    //DOrdenCarga.CambiarEstado( QOrdenCargaCorden_occ.AsInteger, 2);
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  //end;
end;

procedure TFOrdenCarga.PDetalleEnter(Sender: TObject);
begin
  if comercial_ocl.Text = '' then
  begin
    with DOrdenCarga.QAux do
    try
      SQL.Clear;
      SQL.Add(' select * from frf_clientes_comercial    ');
      SQL.Add('   where cod_empresa_cc = :empresa ');
      SQL.Add('     and cod_cliente_cc = :cliente   ');

      ParamByName('empresa').AsString := QOrdenCargaCempresa_occ.AsString;
      ParamByName('cliente').AsString := QOrdenCargaCCliente_sal_occ.AsString;
      Open;

      comercial_ocl.Text := FieldByName('cod_comercial_cc').AsString;

     finally
      close;
    end;
  end;
end;

procedure TFOrdenCarga.PonFinalizada;
begin
  //if Application.MessageBox('?Esta seguro que quiere finalizar la orden?','FINALIZAR ORDEN', MB_YESNO ) = IDYES then
  //begin
    DOrdenCarga.CambiarEstado( QOrdenCargaCorden_occ.AsInteger, 3);
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  //end;
end;

procedure TFOrdenCarga.mnuFiltroClick(Sender: TObject);
begin
  TMenuItem( Sender ).Checked:= not TMenuItem( Sender ).Checked;
  ConstruirFiltro;
end;

procedure TFOrdenCarga.ActualizarEstado( const AEstado: integer );
var
  sOrden: string;
begin
  EstadoAnterior:= EstadoActual;
  EstadoActual:= AEstado;
  sOrden:= orden_occ.Text;

  case AEstado of
    kVisualizar:
    begin
      Visualizar;
      if not bEscape then
      begin
        if ( EstadoAnterior = kNuevaCabecera ) then
        begin
          VisualizarOrden( sOrden );
        end
        else
        if ( EstadoAnterior = kEditarCabecera )  then
        begin
          RefrescarOrden( sOrden );
        end
        else
        if ( EstadoAnterior = kEditarDetalle ) or ( EstadoAnterior = kNuevoDetalle ) then
        begin
          RefrescarDetalle;
        end;
      end
      else
      begin
        bEscape:= false;
      end;
    end;
    kNuevaCabecera: EditarC;
    kEditarCabecera: EditarC;
    kNuevoDetalle: EditarD;
    kEditarDetalle: EditarD;
  end;
end;

procedure TFOrdenCarga.HabilitarBarra;
begin
  btnAlta.Enabled:= QOrdenCargaC.Active;
  btnEditarC.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );
  btnBorrar.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2,3] )
    and ( QOrdenCargaCtraspasada_occ.AsInteger = 0 );
  btnLocalizar.Enabled:= True;

  btnAltaD.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );
  btnBorrarD.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty ) and ( not QOrdenCargaL.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );
  btnEditarD.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty ) and ( not QOrdenCargaL.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );

  btnPrimero.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Bof );
  btnAnterior.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Bof );
  btnProximo.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Eof );
  btnUltimo.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Eof );

  btnResumen.Enabled:= not QOrdenCargaC.IsEmpty;
  btnImprimir.Enabled:= not QOrdenCargaC.IsEmpty;
  btnCrearAlbaran.Enabled:= ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger = 3 ) and
                            ( QOrdenCargaCtraspasada_occ.AsInteger = 0 );

  btnActivar.Enabled:= ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger = 0 );
  btnFinalizar.Enabled:= ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger in [1,2,3] );
  case QOrdenCargaCstatus_occ.AsInteger of
    1,2:
    begin
      btnFinalizar.ImageIndex:= 18;
      btnFinalizar.Hint:= 'Finalizar Orden (Mayus F)';
    end;
    3:
    begin
      btnFinalizar.ImageIndex:= 17;
      btnFinalizar.Hint:= 'Desfinalizar Orden (Mayus F)';
    end;
  end;

(*
  btnCancelar.Enabled:= False;
  btnAceptar.Enabled:= False;
  btnCerrar.Enabled:= True;
*)
  btnCancelar.OnClick:= btnCerrarClick;
  btnAceptar.OnClick:= btnRefrescarClick;
  btnAceptar.Enabled:= ( not QOrdenCargaC.IsEmpty );
  btnCancelar.hint:= 'Cerrar (Esc)';
  btnAceptar.hint:= 'Refrescar (F1)';
  btnCancelar.ImageIndex:= 14;
  btnAceptar.ImageIndex:= 19;
end;

procedure TFOrdenCarga.hora_occExit(Sender: TObject);
begin
  if Length(hora_occ.Text) = 4 then
    hora_occ.Text := '0' + hora_occ.Text;
end;

procedure TFOrdenCarga.DesHabilitarBarra;
begin
  btnAlta.Enabled:= False;
  btnEditarC.Enabled:= False;
  btnBorrar.Enabled:= False;
  btnLocalizar.Enabled:= False;

  btnAltaD.Enabled:= False;
  btnBorrarD.Enabled:= False;
  btnEditarD.Enabled:= False;

  btnPrimero.Enabled:= False;
  btnAnterior.Enabled:= False;
  btnProximo.Enabled:= False;
  btnUltimo.Enabled:= False;

  btnResumen.Enabled:= False;
  btnImprimir.Enabled:= False;
  btnCrearAlbaran.Enabled:= False;
  btnActivar.Enabled:= False;
  btnFinalizar.Enabled:= False;

(*
  btnCancelar.Enabled:= True;
  btnAceptar.Enabled:= True;
  btnCerrar.Enabled:= False;
*)
  btnCancelar.OnClick:= btnCancelarClick;
  btnAceptar.OnClick:= btnAceptarClick;
  btnCancelar.hint:= 'Cancelar (Esc)';
  btnAceptar.Enabled:= True;
  btnAceptar.hint:= 'Aceptar (F1)';
  btnCancelar.ImageIndex:= 13;
  btnAceptar.ImageIndex:= 12;
end;

procedure TFOrdenCarga.Visualizar;
begin
  PMaestro.Enabled:= False;

  lblNotasAlbaran.Visible:= True;
  nota_occ.Visible:= True;
  lblHigiene_occ.Visible:= True;
  higiene_occ.Visible:= True;
  PMaestro.Height:= 392;

  PDetalle.Enabled:= False;
  PDetalle.Height:= 0;
  RVisualizacion.Enabled:= True;

  HabilitarBarra;
end;

procedure TFOrdenCarga.EditarC;
begin
  PMaestro.Enabled:= True;
  PDetalle.Enabled:= False;
  PDetalle.Height:= 0;
  RVisualizacion.Enabled:= False;

  DesHabilitarBarra;

  cliente_sal_occ.SetFocus;
end;

procedure TFOrdenCarga.EditarD;
begin
  PMaestro.Enabled:= False;

  PMaestro.Height:= 226;
  lblNotasAlbaran.Visible:= False;
  nota_occ.Visible:= False;
  lblHigiene_occ.Visible:= false;
  higiene_occ.Visible:= false;

  PDetalle.Enabled:= True;
  PDetalle.Height:= 177;
  //PDetalle.Height:= 225;
  RVisualizacion.Enabled:= False;

  formato_cliente_ocl.Enabled:= True;
  BGBFormato_cliente_ocl.Enabled:= True;

  DesHabilitarBarra;

  if EstadoActual = kNuevoDetalle then
  begin
    producto_ocl.SetFocus;
    rKilosAnterior:= 0;
  end
  else
  begin
    cajas_ocl.SetFocus;
    rKilosAnterior:= QOrdenCargaLkilos_ocl.AsFloat;
    //formato_cliente_ocl.Change;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaCNewRecord(DataSet: TDataSet);
var sEmpresa: String;
begin
  with DOrdenCarga do
  begin
    //Obtener y actualizar contador de ordenes
    if gProgramVersion = pvBAG then
      sEmpresa := 'BAG'
    else
      sEmpresa := 'SAT';
    QGetNumeroOrden.ParamByName('empresa').AsString := sEmpresa;
    QGetNumeroOrden.Open;
    QOrdenCargaCorden_occ.AsInteger:= QGetNumeroOrden.FieldByName('contador_oc').AsInteger;
    orden_occ.Text:= QOrdenCargaCorden_occ.AsString;
    QGetNumeroOrden.Close;
    QUpdateNumeroOrden.ParamByName('empresa').AsString:= sEmpresa;
    QUpdateNumeroOrden.ParamByName('contador').AsInteger:= QOrdenCargaCorden_occ.AsInteger + 1;
    QUpdateNumeroOrden.ExecSQL;


    //Datos por defecto
    QOrdenCargaCstatus_occ.AsInteger:= 0;
    QOrdenCargaCtraspasada_occ.AsInteger:= 0;
    QOrdenCargaCempresa_occ.AsString:= gsEmpresa;
    QOrdenCargaCplanta_origen_occ.AsString:= gsEmpresa;
    QOrdenCargaCcentro_salida_occ.AsString:= gsCentro;
    QOrdenCargaCn_albaran_occ.AsInteger:= QOrdenCargaCorden_occ.AsInteger;
    QOrdenCargaCfecha_occ.AsDateTime:= Date;
    QOrdenCargaChora_occ.AsString:= FormatDateTime('hh:nn', Time );
    QOrdenCargaCporte_bonny_occ.AsInteger:= 0;
    porte_bonny_occ.Checked:= False;
    QOrdenCargaChigiene_occ.AsInteger:= 1;
    higiene_occ.Checked:= True;
    QOrdenCargaCn_palets_occ.AsInteger:= 0;

    cliente_sal_occ.TabStop:= True;
    dir_sum_occ.TabStop:= True;
    n_pedido_occ.TabStop:= True;
    fecha_pedido_occ.TabStop:=True;
    fecha_descarga_occ.TabStop:= True;
  end;
end;

procedure TFOrdenCarga.BorrarOrdenActual( const APreguntar: Boolean );
begin
  //Borrar detalle
  if ( not APreguntar ) or ( Application.MessageBox(PCHAR( 'Seguro que quiere borrar la orden n?. ' + QOrdenCargaCorden_occ.AsString ),
                            'BORRAR ORDEN', MB_YESNO ) = IDYES ) then
  begin
    with DOrdenCarga.QBorrarDetalle do
    begin
      ParamByName('contador').AsInteger:= QOrdenCargaCorden_occ.AsInteger;
      ExecSQL;
    end;
    with DOrdenCarga.QBorrarPacking do
    begin
      ParamByName('contador').AsInteger:= QOrdenCargaCorden_occ.AsInteger;
      ExecSQL;
    end;
    //Borrar cabecera activa
    QOrdenCargaC.Delete;
  end;
end;

procedure TFOrdenCarga.BorrarDetalleActual( const APreguntar: Boolean );
begin
  if ( not APreguntar  ) or ( Application.MessageBox(PCHAR( 'Seguro que quiere borrar la linea activa.' ),
                            'BORRAR ORDEN', MB_YESNO ) = IDYES ) then
  begin
    //Borrar detalle activo
    QOrdenCargaL.Delete;
  end;
end;

procedure TFOrdenCarga.FiltrarOrdenes;
var
  FFIltro: TFFiltro;
begin
  FFIltro:= TFFiltro.Create( self );

  try
    if FFiltro.ShowModal = mrOk then
    begin
      sFiltro := FFiltro.GetFiltro;
      with QOrdenCargaC do
      begin
        Close;
        SQL.Clear;
        SQL.Add(' select * ');
        SQL.Add(' from frf_orden_carga_c ');
        SQL.Add(sFiltro);
        SQL.Add(' order by fecha_occ desc, status_occ, orden_occ desc ');
        try
          //Timer.Enabled:= False;
          QOrdenCargaC.DisableControls;
          Open;
        finally
          //Timer.Enabled:= True;
          QOrdenCargaC.EnableControls;
        end;
      end;
    end;
  finally
    FreeAndNil( FFiltro );
  end;
end;

procedure TFOrdenCarga.VisualizarOrden( const AOrden: string );
begin
  with QOrdenCargaC do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_orden_carga_c ');
    if AOrden <> '' then
    begin
      sFiltro:=  ' where orden_occ = ' + AOrden;
      SQL.Add( sFiltro );
    end;

    try
      //Timer.Enabled:= False;
      QOrdenCargaC.DisableControls;
      Open;
    finally
      //Timer.Enabled:= True;
      QOrdenCargaC.EnableControls;
    end;
  end;
end;

procedure TFOrdenCarga.RefrescarOrden( const AOrden: string );
begin
  with QOrdenCargaC do
  begin
    Close;
    try
      //Timer.Enabled:= False;
      QOrdenCargaL.DisableControls;
      QOrdenCargaC.DisableControls;
      Open;
      Locate('orden_occ', AOrden, []);
      HabilitarBarra;
      PonStatus;
      PonPalets;
    finally
      //Timer.Enabled:= True;
      QOrdenCargaC.EnableControls;
      QOrdenCargaL.EnableControls;
    end;
  end;
end;

procedure TFOrdenCarga.RefrescarDetalle;
begin
  with QOrdenCargaL do
  begin
    Close;
    Open;
  end;
end;

procedure TFOrdenCarga.empresa_occChange(Sender: TObject);
begin
  STempresa_occ.Caption:= DDescripciones.desEmpresa( empresa_occ.Text );
  STcentro_salida_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_salida_occ.Text );

  //STcliente_sal_occ.Caption:= DDescripciones.desCliente( empresa_occ.Text, cliente_sal_occ.Text );
  cliente_sal_occChange( cliente_sal_occ );
  STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );

  STtransporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, transporte_occ.Text );
  SToperador_transporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, operador_transporte_occ.Text );
end;

procedure TFOrdenCarga.centro_salida_occChange(Sender: TObject);
begin
  STcentro_salida_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_salida_occ.Text );
end;

procedure TFOrdenCarga.cliente_sal_occChange(Sender: TObject);
begin
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    STcliente_sal_occ.Caption:= DDescripciones.desCliente( empresa_occ.Text, cliente_sal_occ.Text );
    QOrdenCargaCcliente_fac_occ.Value:= cliente_sal_occ.Text;


    if ( QOrdenCargaC.State = dsInsert ) and ( STcliente_sal_occ.Caption <> '' ) then
    begin
         porte_bonny_occ.Checked:= DDescripciones.PorteCliente( empresa_occ.Text, cliente_sal_occ.Text ) = 0;
         if porte_bonny_occ.Checked then
           QOrdenCargaC.FieldByName('porte_bonny_occ').AsInteger:= 1
         else
           QOrdenCargaC.FieldByName('porte_bonny_occ').AsInteger:= 0;
    end;

    if ( STcliente_sal_occ.Caption <> '' ) and ( dir_sum_occ.Text = '' ) then
    begin
      dir_sum_occ.Text:= cliente_sal_occ.Text;
    end;

    dir_sum_occ.Change;
    STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );

  end
  else
  begin
    STcliente_sal_occ.Caption:= DDescripciones.desCliente( empresa_occ.Text, cliente_sal_occ.Text );
    dir_sum_occ.Change;
  end;
end;

procedure TFOrdenCarga.Observaciones;
begin
    if ( Trim(nota_occ.Text) = '' )  then
    begin
      if (( empresa_occ.Text = 'F18' ) or (empresa_occ.Text = '050')) then
      begin
        if (cliente_sal_occ.Text = 'SOC') OR
           (cliente_sal_occ.Text = 'MON') OR
           (cliente_sal_occ.Text = 'ECI') OR
           (cliente_sal_occ.Text = 'IDR') OR
           (cliente_sal_occ.Text = 'LID') then
        begin
          nota_occ.Lines.Add('TEMPERATURA ENTRE 1? y 6? C');
          if cliente_sal_occ.Text = 'SOC' then
            nota_occ.Lines.Add('TEMPERATURA SALIDA PRODUCTO INFERIOR A +4? C');
        end
        else
        if (cliente_sal_occ.Text = 'DIA') OR
           (cliente_sal_occ.Text = 'SEM') OR
           (cliente_sal_occ.Text = 'ALP') OR
           (cliente_sal_occ.Text = 'AMA') OR
           (cliente_sal_occ.Text = 'UND') OR
           (cliente_sal_occ.Text = 'IND') OR
           (cliente_sal_occ.Text = 'VEG') OR
           (cliente_sal_occ.Text = 'PRX') then
        begin
          nota_occ.Lines.Add('TEMPERATURA ENTRE 1? y 8? C');
          nota_occ.Lines.Add('TEMPERATURA SALIDA PRODUCTO INFERIOR A +4? C');
        end
        else
        begin
          nota_occ.Lines.Add('TEMPERATURA ENTRE 1? y 4? C');
          nota_occ.Lines.Add('TEMPERATURA SALIDA PRODUCTO INFERIOR A +4? C');
        end;
      end
      else
      begin
        if ( empresa_occ.Text = 'F21' ) then
        begin
          if ( centro_salida_occ.Text = '4' ) and
             ( cliente_sal_occ.Text = 'MER' ) and
             ( dir_sum_occ.Text = '927' ) then
          begin
            nota_occ.Lines.Add('TEMPERATURA OPTIMA DE +2 A +4 GRADOS.');
            nota_occ.Lines.Add('FURGON PRE-ENFRIADO : SI');
          end
          else
          begin
            nota_occ.Lines.Add('TEMPERATURA OPTIMA DE +8 A +12 GRADOS.');
            nota_occ.Lines.Add('FURGON PRE-ENFRIADO : SI');
          end;
        end
        else
        if ( empresa_occ.Text = 'F17' ) and ( centro_salida_occ.Text = '2' ) then
        begin
          if ( cliente_sal_occ.Text = 'GOM' ) then
            nota_occ.Lines.Add('TEMPERATURA DEL PRODUCTO A LA CARGA ENTRE 7 Y 11?C.')
          else
          if ( cliente_sal_occ.Text = 'M&W' ) then
            nota_occ.Lines.Add('TEMPERATURA DEL PRODUCTO A LA CARGA ENTRE 7 Y 10?C.')
          else
          if ( cliente_sal_occ.Text = 'EEN' ) then
            nota_occ.Lines.Add('TEMPERATURA DEL PRODUCTO A LA CARGA ENTRE 6 Y 10?C.');
          nota_occ.Lines.Add('MANTENER TEMPERATURA ENTRE 8 Y 10 GRADOS.');
          //nota_occ.Lines.Add('TEMPERATURA ?PTIMA 8 GRADOS.');
          nota_occ.Lines.Add('EQUIPO FR?O EN FUNCIONAMIENTO: SI.');
        end
        else
        begin
          //if cliente_sal_occ.Text = 'MER' then
          begin
            nota_occ.Lines.Add('TEMPERATURA ?PTIMA 12 GRADOS.');
            nota_occ.Lines.Add('EQUIPO FR?O EN FUNCIONAMIENTO: SI.');
          end;
        end;
      end;
      if ( empresa_occ.Text = '050' ) and ( cliente_sal_occ.Text = 'MER' ) and ( dir_sum_occ.Text = '2MN' ) then
      begin
        nota_occ.Lines.Add(UpperCase('La mercanc?a transportada realiza tr?fico mar?timo entre islas'));
      end;
      nota_occ.Lines.Add('-" EL CONDUCTOR CONFIRMA QUE LA MERCANC?A VA SUJETA POR BARRAS".');
    end;
end;

procedure TFOrdenCarga.dir_sum_occChange(Sender: TObject);
begin
  STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );
  if QOrdenCargaC.State in [dsInsert] then
  begin
    if STDir_sum_occ.Caption <> '' then
    begin
      if nota_occ.Lines.Count = 2 then
        nota_occ.Lines.Clear;
      Observaciones;
    end;
  end;
end;

procedure TFOrdenCarga.transporte_occChange(Sender: TObject);
begin
  STtransporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, transporte_occ.Text );
end;

procedure TFOrdenCarga.operador_transporte_occChange(Sender: TObject);
begin
  stOperador_transporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, operador_transporte_occ.Text );
end;

procedure TFOrdenCarga.producto_oclChange(Sender: TObject);
var bEsPesoReal: boolean;
begin
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    STProducto_ocl.Caption:= DDescripciones.desProductoVenta( producto_ocl.Text );
    STCategoria_ocl.Caption:= DDescripciones.desCategoria( empresa_occ.Text, producto_ocl.Text, categoria_ocl.Text );
    STColor_ocl.Caption:= DDescripciones.desColor( empresa_occ.Text, producto_ocl.Text, color_ocl.Text );
    envase_oclChange( envase_ocl );
//    if bFlagCambios then
//      formato_cliente_oclChange( formato_cliente_ocl );
    if producto_ocl.Text <> '' then
    begin
      bEsPesoReal := EsPesoReal (  empresa_occ.Text, centro_salida_occ.Text, producto_ocl.Text );
      es_peso_real_ocl.Enabled := bEsPesoReal;
      es_peso_real_ocl.checked := bEsPesoReal;
      Label7.Enabled := bEsPesoReal;
      if ( QOrdenCargaL.State = dsInsert ) then
      begin
      if es_peso_real_ocl.Checked then
        QOrdenCargaL.FieldByName('es_peso_real_ocl').AsInteger:= 1
      else
        QOrdenCargaL.FieldByName('es_peso_real_ocl').AsInteger:= 0;
      end;
    end;
  end;
end;


procedure TFOrdenCarga.marca_oclChange(Sender: TObject);
begin
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    STMarca_ocl.Caption:= DDescripciones.desMarca( marca_ocl.Text );
  end;
end;

procedure TFOrdenCarga.categoria_oclChange(Sender: TObject);
begin
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    STCategoria_ocl.Caption:= DDescripciones.desCategoria( empresa_occ.Text, producto_ocl.Text, categoria_ocl.Text );
  end;
end;

procedure TFOrdenCarga.color_oclChange(Sender: TObject);
begin
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    STColor_ocl.Caption:= DDescripciones.desColor( empresa_occ.Text, producto_ocl.Text, color_ocl.Text );
  end;
end;

procedure TFOrdenCarga.tipo_palets_oclChange(Sender: TObject);
begin
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    stTipoPalet.Caption:= DDescripciones.desTipoPalet( tipo_palets_ocl.Text );
  end;
end;

function desUnidad( const AUnidad: string ): string;
begin
  if AUnidad = 'U' then
    Result:= 'UND'
  else
  if AUnidad = 'C' then
    Result:= 'CAJ'
  else
    Result:= 'KGS';
end;

procedure TFOrdenCarga.envase_oclChange(Sender: TObject);
begin
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    stEnvase.Caption:= DDescripciones.desEnvaseCliente( empresa_occ.Text, producto_ocl.Text, envase_ocl.Text, cliente_sal_occ.Text );
  end;
end;

function TFOrdenCarga.EsPesoReal(const AEmpresa, ACentro,
  AProducto: string): Boolean;
begin
  if cliente_sal_occ.Text <> '' then
    result := false
  else
  begin
    with qryPesoReal do
    begin
      SQL.Clear;
      SQL.Add(' select * from frf_transito_peso_real ');
      SQL.Add('  where empresa_tp = :empresa ');
      SQL.Add('    and centro_tp = :centro ');
      SQL.Add('    and producto_tp = :producto ');
      ParamByName('empresa').AsString:= AEmpresa;
      ParamByName('centro').AsString:= ACentro;
      ParamByName('producto').AsString:= AProducto;
      Open;
      try
        if not IsEmpty then
          result := true
        else
          result := false;

      finally
        Close;
      end;
    end;
  end;
end;

procedure TFOrdenCarga.BGBEmpresa_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= empresa_occ.Text;
  if SeleccionaEmpresa( self, empresa_occ, sAux ) then
    empresa_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCentro_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= centro_salida_occ.Text;
  if SeleccionaCentro( self, centro_salida_occ, empresa_occ.text, sAux ) then
    centro_salida_occ.Text:= sAux;
end;


procedure TFOrdenCarga.BGBn_pedido_occClick(Sender: TObject);
var
  sEmpresa, sCentro, sCliente, sSuministro, sPedido, sFecha: String;
  dFecha: TDateTime;
begin
  sEmpresa:= empresa_occ.Text;
  sCentro:= centro_salida_occ.Text;
  dFecha:= StrToDateDef( fecha_pedido_occ.Text, Date );
  sFecha:= DateToStr( dFecha );
  sCliente:= cliente_sal_occ.Text;
  sSuministro:= dir_sum_occ.Text;

  if SeleccionaPedido( self, n_pedido_occ, sEmpresa, sCentro, sCliente, sSuministro, sPedido, sFecha ) then
  begin
    if cliente_sal_occ.Text <> sCliente then
      cliente_sal_occ.Text:= sCliente;
    if dir_sum_occ.Text <> sSuministro then
      dir_sum_occ.Text:= sSuministro;
    if n_pedido_occ.Text <> sPedido then
      n_pedido_occ.Text:= sPedido;
    if fecha_pedido_occ.Text <> sFecha then
      fecha_pedido_occ.Text:= sFecha;
  end;
end;

procedure TFOrdenCarga.BCBFecha_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= fecha_occ.Text;
  if PonFecha( self, fecha_occ, fecha_occ.Text, sAux ) then
    fecha_occ.Text:= sAux;
end;

procedure TFOrdenCarga.btnFecha_pedido_occ(Sender: TObject);
var
  sAux: String;
begin
  sAux:= fecha_pedido_occ.Text;
  if PonFecha( self, fecha_pedido_occ, fecha_pedido_occ.Text, sAux ) then
    fecha_pedido_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCliente_sal_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= cliente_sal_occ.Text;
  if UFClientes.SeleccionaClientes( self, cliente_sal_occ, empresa_occ.text, sAux ) then
    cliente_sal_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBDir_sum_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= dir_sum_occ.Text;
  if UFSuministros.SeleccionaSuministros( self, dir_sum_occ, empresa_occ.text, cliente_sal_occ.text, sAux ) then
    dir_sum_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBtransporte_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= transporte_occ.Text;
  if SeleccionaTransportista( self, transporte_occ, empresa_occ.text, sAux ) then
    transporte_occ.Text:= sAux;
end;

procedure TFOrdenCarga.btnOperador_transporte_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= operador_transporte_occ.Text;
  if SeleccionaTransportista( self, operador_transporte_occ, empresa_occ.text, sAux ) then
    operador_transporte_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBProducto_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Producto_ocl.Text;
  if bPedidoExiste then
  begin
    if SeleccionaProductoPedido( self, Producto_ocl, empresa_occ.Text, centro_salida_occ.Text, cliente_sal_occ.Text,
                              dir_sum_occ.Text, n_pedido_occ.Text, fecha_pedido_occ.Text,  sAux ) then
      Producto_ocl.Text:= sAux;
  end
  else
  begin
    if SeleccionaProducto( self, Producto_ocl, empresa_occ.text, sAux ) then
      Producto_ocl.Text:= sAux;
  end;
end;

procedure TFOrdenCarga.BGBFormato_cliente_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= formato_cliente_ocl.Text;
  if bPedidoExiste then
  begin
    if SeleccionaFormatoPedido( self,formato_cliente_ocl, empresa_occ.Text, centro_salida_occ.Text, cliente_sal_occ.Text,
                                dir_sum_occ.Text, n_pedido_occ.Text, fecha_pedido_occ.Text, producto_ocl.Text, sAux ) then
      formato_cliente_ocl.Text:= sAux;
  end
  else
  begin
    if SeleccionaFormatoCliente( self,formato_cliente_ocl, empresa_occ.Text, producto_ocl.Text,
                               cliente_sal_occ.Text, dir_sum_occ.Text, sAux ) then
      formato_cliente_ocl.Text:= sAux;
  end;
end;

procedure TFOrdenCarga.BGBMarca_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Marca_ocl.Text;
  if SeleccionaMarca( self, Marca_ocl, sAux ) then
    Marca_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCalibre_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Calibre_ocl.Text;
  if SeleccionaCalibre( self, Calibre_ocl, empresa_occ.text, producto_ocl.text, sAux ) then
    Calibre_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCategoria_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Categoria_ocl.Text;
  if SeleccionaCategoria( self, Categoria_ocl, empresa_occ.text, producto_ocl.text, sAux ) then
    Categoria_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBTipo_Palet_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= tipo_palets_ocl.Text;
  if SeleccionaPalet( self, tipo_palets_ocl, sAux ) then
    tipo_palets_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBColor_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Color_ocl.Text;
  if SeleccionaColor( self, Color_ocl, empresa_occ.text, producto_ocl.text, sAux ) then
    Color_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.QOrdenCargaCAfterEdit(DataSet: TDataSet);
begin
  //Guardar datos cabecera
  sEmpresaActual:= empresa_occ.Text;
  sCentroActual:= centro_salida_occ.Text;
  sFechaActual:= fecha_occ.Text;
  sClienteActual:= cliente_sal_occ.Text;
  rImpuestosActual:= DOrdenCarga.ImpuestosCliente( sEmpresaActual, sCentroActual, sClienteActual, dir_sum_occ.Text,
                                                   StrToDateTimeDef( fecha_occ.Text, Now ) );
end;

procedure TFOrdenCarga.QOrdenCargaCBeforePost(DataSet: TDataSet);
var
  dAuxDate, dDescarga, dFecPedido: TDateTime;
begin
  //Comprobar que la fecha se correcta
  if not TryStrTodate( fecha_occ.Text, dAuxDate ) then
  begin
    ShowMessage('Fecha incorrecta.');
    if fecha_occ.CanFocus then
      fecha_occ.SetFocus;
    Abort;
  end;

  //fecha pedido
  //Fecha de pedido obligatoria para el cliente Sainsbury - Campo obligatorio en ficheros EDI 13/11/2018
  if (cliente_sal_occ.Text = 'JS') and (fecha_pedido_occ.Text = '') then
  begin
    ShowMessage('Para el cliente ' + cliente_sal_occ.Text + ' es obligatorio la fecha de pedido.');
    if fecha_pedido_occ.CanFocus then
        fecha_pedido_occ.SetFocus;
    Abort;
  end;
  if fecha_pedido_occ.Text <> '' then
  begin
    if TryStrTodate( fecha_pedido_occ.Text, dFecPedido ) then
    begin
      if dFecPedido > dAuxDate then
      begin
        ShowMessage('Fecha de pedido debe de ser menor o igual a la fecha del albaran.');
        if fecha_pedido_occ.CanFocus then
          fecha_pedido_occ.SetFocus;
        Abort;
      end;
    end
    else
    begin
      ShowMessage('Fecha pedido incorrecta.');
      if fecha_pedido_occ.CanFocus then
        fecha_pedido_occ.SetFocus;
      Abort;
    end;
  end;

  //fecha descarga
  if fecha_descarga_occ.Text <> '' then
  begin
    if TryStrTodate( fecha_descarga_occ.Text, dDescarga ) then
    begin
      if dDescarga < dAuxDate then
      begin
        ShowMessage('Fecha de descarga debe de ser superior o igual a la de descarga.');
        if fecha_descarga_occ.CanFocus then
          fecha_descarga_occ.SetFocus;
        Abort;
      end;
    end
    else
    begin
      ShowMessage('Fecha descarga incorrecta.');
      if fecha_descarga_occ.CanFocus then
        fecha_descarga_occ.SetFocus;
      Abort;
    end;
  end;

  if pgcDestino.ActivePage = tsSalida then
  begin
    //Comprobar que la direccion de suministro sea correcta
      if Trim( cliente_sal_occ.Text ) = '' then
      begin
        ShowMessage('Tanto el c?digo del cliente, la direccion de suministro y a quien facturamos son de obligada inserci?n.');
        if cliente_sal_occ.CanFocus then
          cliente_sal_occ.SetFocus;
        Abort;
      end;
      if Trim( dir_sum_occ.Text ) = '' then
      begin
        ShowMessage('Tanto el c?digo del cliente, la direccion de suministro y a quien facturamos son de obligada inserci?n.');
        if dir_sum_occ.CanFocus then
          dir_sum_occ.SetFocus;
        Abort;
      end;
      if not DOrdenCarga.EsDirSuministroValida( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text ) then
      begin
        ShowMessage('Direccion de suministro incorrecta.');
        if dir_sum_occ.CanFocus then
          dir_sum_occ.SetFocus;
        Abort;
      end;
      if ( QOrdenCargaC.Active ) and ( QOrdenCargaC.state in [ dsInsert, dsEdit ] ) then
      begin
        QOrdenCargaCcentro_destino_occ.Clear;
      end;

     //Comprobar que el pedido sea correcto
     if Trim(n_pedido_occ.Text) <> '' then
     begin
      if not DOrdenCarga.ExistePedido( empresa_occ.Text, centro_salida_occ.Text,
         cliente_sal_occ.Text, dir_sum_occ.Text, n_pedido_occ.Text, fecha_pedido_occ.Text  ) then
      begin
        if Application.MessageBox('El pedido seleccionado no esta grabado, ?seguro que desea continuar?.', 'PEDIDO INEXISTENTE', MB_YESNO	) = IDNO then
        begin
          Abort;
        end;
      end;
    end;
  end
  else
  begin

    cliente_sal_occ.Text:= '';
    dir_sum_occ.Text:= '';
    n_pedido_occ.Text:= '';
    fecha_pedido_occ.Text:= '';
    fecha_descarga_occ.Text:= '';
  end;

  //El transporte es obligatorio
  if Trim( transporte_occ.Text ) = '' then
  begin
    ShowMessage('Falta transporte.');
    if transporte_occ.CanFocus then
      transporte_occ.SetFocus;
    Abort;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaCAfterPost(DataSet: TDataSet);
var
  rImpuestosAux: TImpuesto;
begin
  //Ver si hay que hacer cambios en los detalles
  if EstadoActual = kEditarCabecera then
  begin
    if sEmpresaActual <> empresa_occ.Text then
    begin
      DOrdenCarga.CambiarEmpresaDetalle( StrToInt( orden_occ.Text ), empresa_occ.Text );
    end;
    if sCentroActual <> centro_salida_occ.Text then
    begin
      DOrdenCarga.CambiarCentroDetalle( StrToInt( orden_occ.Text ), centro_salida_occ.Text );
    end;
    if sFechaActual <> fecha_occ.Text then
    begin
      DOrdenCarga.CambiarFechaDetalle( StrToInt( orden_occ.Text ), StrToDate( fecha_occ.Text ) );
    end;
    if sClienteActual <> cliente_sal_occ.Text then
    begin
      DOrdenCarga.CambiarClienteDetalle( StrToInt( orden_occ.Text ), cliente_sal_occ.Text );
    end;
    rImpuestosAux:= DOrdenCarga.ImpuestosCliente( empresa_occ.Text, centro_salida_occ.Text,
                                                  cliente_sal_occ.Text, dir_sum_occ.Text,
                                                  StrToDateTimeDef( fecha_occ.Text, Now ) );
    if ( rImpuestosActual.sCodigo <> rImpuestosAux.sCodigo ) or
       ( rImpuestosActual.sTipo <> rImpuestosAux.sTipo )  then
    begin
      DOrdenCarga.CambiarImpuestoDetalle( StrToInt( orden_occ.Text ), rImpuestosAux );
    end;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaLBeforeEdit(DataSet: TDataSet);
begin
  es_peso_real_ocl.enabled := EsPesoReal (  empresa_occ.Text, centro_salida_occ.Text, producto_ocl.Text );
  Label7.enabled := EsPesoReal (  empresa_occ.Text, centro_salida_occ.Text, producto_ocl.Text );
end;

procedure TFOrdenCarga.QOrdenCargaLBeforeInsert(DataSet: TDataSet);
begin
  es_peso_real_ocl.Enabled := false;
  es_peso_real_ocl.Checked := false;
  Label7.Enabled := false;
end;

procedure TFOrdenCarga.QOrdenCargaLBeforePost(DataSet: TDataSet);
var
  iAux: integer;
begin
  if Trim( STProducto_ocl.Caption ) = '' then
  begin
    if not DDescripciones.EsProductoAlta( producto_ocl.Text) then
      ShowMessage(' ATENCI?N: Error al grabar la linea, el producto est? dado de BAJA. ')
    else if not DDescripciones.EsProductoVenta(producto_ocl.Text) then
      ShowMessage(' ATENCI?N: Error al grabar la linea, el producto NO est? marcado como Producto de Venta. ')
    else
      ShowMessage('Falta el c?digo del producto o este es incorrecto.');

    if producto_ocl.CanFocus then
      producto_ocl.SetFocus;
    Abort;
  end;

    if Trim( STFormato_Cliente_ocl.Caption ) = '' then
    begin
      ShowMessage('Falta el c?digo del formato del cliente o este es incorrecto.');
      if formato_cliente_ocl.CanFocus then
        formato_cliente_ocl.SetFocus;
      Abort;
    end;

    if (sProductoControl <> producto_ocl.Text) then
    begin
      if Application.MessageBox(PCHAR('No coincide el producto seleccionado con el del formato, si continua se aplicara el producto del formato.'),
                    PCHAR('Producto inconsistente con el formato'),MB_OKCANCEL) = IDOK then
      begin
        QOrdenCargaLproducto_ocl.AsString:= sProductoControl;
        producto_ocl.Text:= sProductoControl;
      end
      else
      begin
        if formato_cliente_ocl.CanFocus then
          formato_cliente_ocl.SetFocus;
        Abort;
      end;
    end;

  if Trim( stMarca_ocl.Caption ) = '' then
  begin
    ShowMessage('Falta el c?digo de la marca o este es incorrecto.');
    if marca_ocl.CanFocus then
      marca_ocl.SetFocus;
    Abort;
  end;

  if Trim( calibre_ocl.Text ) = '' then
  begin
    ShowMessage('Falta el c?digo del calibre.');
    if calibre_ocl.CanFocus then
      calibre_ocl.SetFocus;
    Abort;
  end;

  if Trim( stCategoria_ocl.Caption ) = '' then
  begin
    ShowMessage('Falta el c?digo de la categoria o este es incorrecto.');
    if categoria_ocl.CanFocus then
      categoria_ocl.SetFocus;
    Abort;
  end;

  if Trim( stColor_ocl.Caption ) = '' then
  begin
    ShowMessage('Falta el c?digo del color o este es incorrecto.');
    if color_ocl.CanFocus then
      color_ocl.SetFocus;
    Abort;
  end;

  if Trim( stEnvase.Caption ) = '' then
  begin
    ShowMessage('Falta el c?digo del envase o este es incorrecto.');
    if formato_cliente_ocl.CanFocus then
      formato_cliente_ocl.SetFocus;
    Abort;
  end;

  if Trim( txtComercial.Caption ) = '' then
  begin
    ShowMessage('Falta el c?digo del comercial o es incorrecto.');
    if comercial_ocl.CanFocus then
      comercial_ocl.SetFocus;
    Abort;
  end;  

  if Trim( stTipoPalet.Caption ) = '' then
  begin
    ShowMessage('Falta el c?digo del palet o este es incorrecto.');
    if formato_cliente_ocl.CanFocus then
      formato_cliente_ocl.SetFocus;
    Abort;
  end;

  if Trim( cajas_ocl.Text ) = '' then
  begin
    ShowMessage('Es necesario una cantidad de cajas.');
    if cajas_ocl.CanFocus then
      cajas_ocl.SetFocus;
    Abort;
  end;

  if Trim( unidades_caja_ocl.Text ) = '' then
  begin
    ShowMessage('Es necesario una cantidad de unidades por caja.');
    if unidades_caja_ocl.CanFocus then
      unidades_caja_ocl.SetFocus;
    Abort;
  end;
  if not unidades_caja_ocl.ReadOnly and ( StrToIntDef( unidades_caja_ocl.Text, 0 ) = 0 ) then
  begin
    //Unidades variables, informar si la cantidad de cajas = 0
    if MessageDlg('El envase seleccionado es de unidades variable y la unidades por cajas son 0, ?es correcto?.',
                  mtWarning,[mbYes, mbNo],0 ) = mrNO then
    begin
      if unidades_caja_ocl.CanFocus then
        unidades_caja_ocl.SetFocus;
      Abort;
    end;
  end;

  if Trim( kilos_ocl.Text ) = '' then
  begin
    ShowMessage('Es necesario una cantidad de kilos.');
    if kilos_ocl.CanFocus then
      kilos_ocl.SetFocus;
    Abort;
  end;


  QOrdenCargaLemp_procede_ocl.AsString:= DOrdenCarga.EmpProcedencia(QOrdenCargaCempresa_occ.AsString,
    QOrdenCargaCcliente_sal_occ.AsString, QOrdenCargaLproducto_ocl.AsString, QOrdenCargaCcentro_salida_occ.AsString);

  //Integridad con el packing list
  if QOrdenCargaL.State = dsEdit then
  if not DOrdenCarga.ComprobarIntegridadLinea( QOrdenCargaLorden_ocl.AsInteger, QOrdenCargaLlinea_ocl.AsInteger,
    QOrdenCargaLempresa_ocl.AsString, QOrdenCargaLformato_cliente_ocl.AsString,
    QOrdenCargaLcajas_ocl.AsInteger ) then
  begin
    if Application.MessageBox('Integridad con el Packing List rota, hay mas cajas en el cami?n que en la orden de carga.' + #13 + #10 +
                              '?Esta seguro de querer continuar con la grabaci?n?      ', 'AVISO PACKING LIST', mb_yesno) = idno then
      Abort;
  end;

  (*TODO*)
  //Si el pedido existe el el formato debe estar en el pedido y no debemos de superar la cantidad de cajas a sevir
  if DOrdenCarga.ExistePedido( empresa_occ.Text, centro_salida_occ.Text, cliente_sal_occ.Text,
       dir_sum_occ.Text, n_pedido_occ.Text, fecha_pedido_occ.Text ) then
  begin
    iAux:= DOrdenCarga.ComprobarIntegridadPedido( QOrdenCargaLorden_ocl.AsInteger, QOrdenCargaLlinea_ocl.AsInteger,
             empresa_occ.Text, centro_salida_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text, n_pedido_occ.Text,
             fecha_pedido_occ.Text, formato_cliente_ocl.Text, QOrdenCargaLcajas_ocl.AsInteger );
    if iAux < 0 then
    begin
      (*
      if Application.MessageBox(Pchar( 'Integridad con el pedido rota, hay mas cajas en la orden/es que en pedido(' +
                                IntToStr( Abs( iAux ) ) + ').' + #13 + #10 + '?Esta seguro de querer continuar con la grabaci?n?      '),
                                'AVISO PEDIDO', mb_yesno) = idno then
      *)
      ShowMessage('Se ha superado con esta orden la cantidad de cajas pedidas del formato "' +
                  formato_cliente_ocl.Text + '" en un total de ' + IntToStr( Abs( iAux ) ) + '.' );
      Abort;
    end;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaLAfterPost(DataSet: TDataSet);
begin
  //Actualizar numero de palets
  DOrdenCarga.UpdatePaletsCab( DataSet.FieldByName('orden_ocl').AsInteger );
  RefrescarOrden( DataSet.FieldByName('orden_ocl').AsString );
end;

procedure TFOrdenCarga.QOrdenCargaLAfterInsert(DataSet: TDataSet);
begin
  QOrdenCargaLorden_ocl.AsInteger:= QOrdenCargaCorden_occ.AsInteger;
  QOrdenCargaLlinea_ocl.AsInteger:= DOrdenCarga.GetLineaOrden( QOrdenCargaCorden_occ.AsInteger ) + 1;

  QOrdenCargaLempresa_ocl.AsString:= QOrdenCargaCempresa_occ.AsString;
  QOrdenCargaLcentro_salida_ocl.AsString:= QOrdenCargaCcentro_salida_occ.AsString;
  QOrdenCargaLn_albaran_ocl.AsInteger:= QOrdenCargaCn_albaran_occ.AsInteger;
  QOrdenCargaLfecha_ocl.AsDateTime:= QOrdenCargaCfecha_occ.AsDateTime;

  QOrdenCargaLcliente_ocl.AsString:= QOrdenCargaCcliente_sal_occ.AsString;
  QOrdenCargaLcentro_origen_ocl.AsString:= QOrdenCargaCcentro_salida_occ.AsString;

  rImpuestosActual:= DOrdenCarga.ImpuestosCliente( empresa_occ.Text, centro_salida_occ.Text,
                                                  cliente_sal_occ.Text, dir_sum_occ.Text,
                                                  StrToDateTimeDef( fecha_occ.Text, Now ) );
  QOrdenCargaLporc_iva_ocl.AsFloat:= rImpuestosActual.rSuper;
  QOrdenCargaLtipo_iva_ocl.AsString:= rImpuestosActual.sCodigo;


  //Valores sacados del formato
  iProductoBase:= 0;
  sProductoControl:= '';
  bPesoVariableLinea:= false;
  bUnidadesVariableLinea:= false;
  sUnidadPrecioLinea:= 'K';
  iCajasPalet:= 0;
  iUnidadesCaja:= 0;
  rPesoCaja:= 0;


  //Valores calculados
  iPalets:= 0;
  iCajas:= 0;
  iUnidades:= 0;
  rKilos:= 0;
  rPrecio:= 0;
  rImporte:= 0;
  rIva:= 0;
  rTotal:= 0;

  STProducto_ocl.Caption:= '';
  STFormato_Cliente_ocl.Caption:= '';
  stMarca_ocl.Caption:= '';
  stCategoria_ocl.Caption:= '';
  stColor_ocl.Caption:= '';
  stTipoPalet.Caption:= '';
end;

procedure TFOrdenCarga.QOrdenCargaLAfterEdit(DataSet: TDataSet);
var
  sNombreFormato, sTipoPalet, sTipoEnvase, sUnidadPedidoFormato, sUnidadFacturaEnvase, sProducto: string;
  sMarca, sCategoria, sCalibre, sColor: string;
  sDescripcion: string;
  bAux: boolean;
begin
  rImpuestosActual:= DOrdenCarga.ImpuestosCliente( empresa_occ.Text, centro_salida_occ.Text,
                                                  cliente_sal_occ.Text, dir_sum_occ.Text,
                                                  StrToDateTimeDef( fecha_occ.Text, Now ) );

  DOrdenCarga.DatosFormatoCliente( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ .Text, formato_cliente_ocl.Text,
      sNombreFormato, sTipoPalet, sTipoEnvase, sUnidadPedidoFormato, sUnidadFacturaEnvase, sProducto,
      sMarca, sCategoria, sCalibre, sColor, sProductoControl, iCajasPalet, iUnidadesCaja, bPesoVariableLinea, rPesoCaja );

  STFormato_Cliente_ocl.Caption:= sNombreFormato;

  //Descripciones
  STMarca_ocl.Caption:= DDescripciones.desMarca( marca_ocl.Text );
  STProducto_ocl.Caption:= DDescripciones.desProductoVenta( producto_ocl.Text );
  stEnvase.Caption:= DDescripciones.desEnvaseCliente( empresa_occ.Text, producto_ocl.Text, envase_ocl.Text, cliente_sal_occ.Text );
  STCategoria_ocl.Caption:= DDescripciones.desCategoria( empresa_occ.Text, producto_ocl.Text, categoria_ocl.Text );
  STColor_ocl.Caption:= DDescripciones.desColor( empresa_occ.Text, producto_ocl.Text, color_ocl.Text );
  stTipoPalet.Caption:= DDescripciones.desTipoPalet( tipo_palets_ocl.Text );

  //if Length( envase_ocl.Text ) >= 3 then
  begin

    DOrdenCarga.DatosEnvaseCliente( empresa_occ.Text, producto_ocl.Text,  cliente_sal_occ.Text, envase_ocl.Text,
      sDescripcion, iUnidadesCaja, bUnidadesVariableLinea, rPesoCaja, bPesoVariableLinea, sUnidadPrecioLinea );
    (*
    if sUnidadPrecioLinea = '' then
    begin
      sUnidadPrecioLinea:= 'K';
    end;
    QOrdenCargaLunidad_precio_ocl.AsString:= desUnidad( sUnidadPrecioLinea );
    *)
    sUnidadPrecioLinea:= Copy( QOrdenCargaLunidad_precio_ocl.AsString, 1, 1);
    SoloLectura( unidades_caja_ocl, not bUnidadesVariableLinea );
    SoloLectura( kilos_ocl, not bPesoVariableLinea );

    if not bUnidadesVariableLinea or ( unidades_caja_ocl.Text = '' ) then
    begin
      bAux:= bFlagCambios;
      bFlagCambios:= False;
      unidades_caja_ocl.Text:= IntToStr( iUnidadesCaja );
      bFlagCambios:= bAux;
    end;

    case DOrdenCarga.TipoIvaEnvase( empresa_occ.Text, envase_ocl.Text, producto_ocl.Text ) of
      0: rImpuestoLinea:= rImpuestosActual.rSuper;
      1: rImpuestoLinea:= rImpuestosActual.rReducido;
      else rImpuestoLinea:= rImpuestosActual.rGeneral;
    end;

    //if bFlagCambios then
    //  RecalcularUnidades( envase_ocl );
  end;
end;

procedure TFOrdenCarga.ConstruirFiltro;
var
  sAux: string;
begin
  sAux:= '';
  if mnuCreadas.Checked then
  begin
    sAux:= ' ( status_occ = 0 ) ';
  end;
  if mnuActivas.Checked then
  begin
    if sAux <> '' then
      sAux:= sAux + ' or ';
    sAux:= sAux + ' ( status_occ = 1 ) ';
  end;
  if mnuInicializadas.Checked then
  begin
    if sAux <> '' then
      sAux:= sAux + ' or ';
    sAux:= sAux + ' ( status_occ = 2 ) ';
  end;
  if mnuFinalizadas.Checked then
  begin
    if sAux <> '' then
      sAux:= sAux + ' or ';
    sAux:= sAux + ' ( status_occ = 3 ) ';
  end;
  if sAux <> '' then
  begin
    QOrdenCargaC.Filtered:= True;
    QOrdenCargaC.Filter:= sAux;
  end
  else
  begin
    QOrdenCargaC.Filtered:= False;
  end;
  HabilitarBarra;
end;

procedure TFOrdenCarga.btnResumenClick(Sender: TObject);
var
  iOrden: Integer;
begin
  iOrden:= UFResumen.VerResumenOrdenes( Self, sFiltro );
  QOrdenCargaL.DisableControls;
  QOrdenCargaC.DisableControls;
  QOrdenCargaC.First;
  while ( QOrdenCargaC.FieldByName('orden_occ').AsInteger <> iOrden ) and not QOrdenCargaC.Eof do
     QOrdenCargaC.Next;
  QOrdenCargaC.EnableControls;
  QOrdenCargaL.EnableControls;

  if QOrdenCargaC.Active then
  begin
    if not QOrdenCargaC.IsEmpty then
    begin
      RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    end;
  end;
end;

procedure TFOrdenCarga.porte_bonny_occEnter(Sender: TObject);
begin
  TDBCheckBox(Sender).Color:= clMoneyGreen;
end;

procedure TFOrdenCarga.porte_bonny_occExit(Sender: TObject);
begin
  TDBCheckBox(Sender).Color:= clBtnFace;
end;

procedure TFOrdenCarga.mnuEnviarCorreoClick(Sender: TObject);
var
  sFileName: string;
begin
  sFileName:= DOrdenCarga.sDirTemp + 'Orden' + orden_occ.Text + '.pdf';

  GuardarOrden( self, StrToInt( orden_occ.Text ), sFileName );
  if FileExists( sFileName ) then
  begin
    AFQuickMail.TextToSend.Clear;
    AFQuickMail.TextToSend.Add('Env?o como adjunto la orden n? ' + orden_occ.Text + '.');
    AFQuickMail.Subject:= 'Orden de carga N? ' + orden_occ.Text;
    AFQuickMail.FileNames.Clear;
    AFQuickMail.FileNames.Add( sFileName );
    try
      AFQuickMail.Execute;
    finally
      if FileExists( sFileName ) then
       DeleteFile( sFileName );
    end;
  end
  else
  begin
    ShowMessage('Problemas al generar el ficheo PDF.');
  end;
end;

procedure TFOrdenCarga.mnuPackingSimpleClick(Sender: TObject);
begin
  UQOrdenPackingSimple.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) );
end;

procedure TFOrdenCarga.formato_cliente_oclChange(Sender: TObject);
var
  sNombreFormato, sTipoPalet, sTipoEnvase, sUnidadPedidoFormato, sUnidadFacturaEnvase, sProducto: string;
  sMarca, sCategoria, sCalibre, sColor: string;
  sDescripcion: string;
  bAux: Boolean;
begin
  if ( QOrdenCargaL.State in [dsInsert, dsEdit] ) then
  begin
    if DOrdenCarga.DatosFormatoCliente( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text, formato_cliente_ocl.Text,
      sNombreFormato, sTipoPalet, sTipoEnvase, sUnidadPedidoFormato, sUnidadFacturaEnvase, sProducto,
      sMarca, sCategoria, sCalibre, sColor, sProductoControl, iCajasPalet, iUnidadesCaja, bPesoVariableLinea, rPesoCaja ) then
    begin
      tipo_palets_ocl.Text:= sTipoPalet;
      QOrdenCargaLproducto_ocl.AsString:= sProducto;
      STFormato_Cliente_ocl.caption:= sNombreFormato;

      if sMarca <> '' then
        QOrdenCargaLmarca_ocl.AsString:= sMarca;
        //marca_ocl.Text:= sMarca;
      if sCategoria <> '' then
        QOrdenCargaLcategoria_ocl.AsString:= sCategoria;
        //categoria_ocl.Text:= sCategoria;
      if sCalibre <> '' then
        QOrdenCargaLcalibre_ocl.AsString:= sCalibre;
        //calibre_ocl.Text:= sCalibre;
      if sColor <> '' then
        QOrdenCargaLcolor_ocl.AsString:= sColor;
        //color_ocl.Text:= sColor;

      (*PARCHE*)
      (* SIEMPRE PEDIMOS CAJAS*)
      sUnidadPedidoFormato:= 'C';
      //envase_ocl.Text:= sTipoEnvase;
      QOrdenCargaLenvase_ocl.AsString:= sTipoEnvase;
    end
    else
    begin
      tipo_palets_ocl.Text:= '';
      envase_ocl.Text:= '';
      QOrdenCargaLproducto_ocl.AsString:= '';
      STFormato_Cliente_ocl.caption:= '';
    end;


    if Length( envase_ocl.Text ) >= 9 then
    begin

      DOrdenCarga.DatosEnvaseCliente( empresa_occ.Text, producto_ocl.Text,  cliente_sal_occ.Text, envase_ocl.Text,
        sDescripcion, iUnidadesCaja, bUnidadesVariableLinea, rPesoCaja, bPesoVariableLinea, sUnidadPrecioLinea );
      if sUnidadPrecioLinea = '' then
      begin
        sUnidadPrecioLinea:= 'K';
      end;
      QOrdenCargaLunidad_precio_ocl.AsString:= desUnidad( sUnidadPrecioLinea );
      SoloLectura( unidades_caja_ocl, not bUnidadesVariableLinea );
      SoloLectura( kilos_ocl, not bPesoVariableLinea );

      if not bUnidadesVariableLinea or ( unidades_caja_ocl.Text = '' ) then
      begin
        bAux:= bFlagCambios;
        bFlagCambios:= False;
        unidades_caja_ocl.Text:= IntToStr( iUnidadesCaja );
        bFlagCambios:= bAux;
      end;

      case DOrdenCarga.TipoIvaEnvase( empresa_occ.Text, envase_ocl.Text, producto_ocl.Text ) of
        0: rImpuestoLinea:= rImpuestosActual.rSuper;
        1: rImpuestoLinea:= rImpuestosActual.rReducido;
        else rImpuestoLinea:= rImpuestosActual.rGeneral;
      end;

      if bFlagCambios then
        RecalcularUnidades( sender );
    end;
  end;
end;



procedure TFOrdenCarga.btnEnvase_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= envase_ocl.Text;
  if SeleccionaEnvase( self, envase_ocl, empresa_occ.Text, producto_ocl.Text, sAux ) then
    envase_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.dir_sum_occExit(Sender: TObject);
begin
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    if STDir_sum_occ.Caption <> '' then
    begin
      if nota_occ.Lines.Count = 2 then
        nota_occ.Lines.Clear;
      Observaciones;
    end;
  end;
end;

procedure TFOrdenCarga.RecalcularUnidades( const ASender: TObject );
var
  iUnidadesLinea, iCajasLinea, iPaletsLinea: Integer;
  rKilosLinea : Real;
begin
  //S?LO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;
  if not bFlagCambios then
    Exit;

  bFlagCambios:= False;

  iUnidadesCaja:= StrToIntDef( unidades_caja_ocl.Text, 1);
  iCajasLinea:= StrToIntDef( cajas_ocl.Text, 0);

  iUnidadesLinea:= iCajasLinea * iUnidadesCaja;
  if rPesoCaja <> 0 then
    rKilosLinea:= bRoundTo( rPesoCaja * iCajasLinea, 2 )
  else
    rKilosLinea:= QOrdenCargaLkilos_ocl.AsFloat;

  if iCajasPalet <> 0 then
  begin
    iPaletsLinea:= iCajasLinea div iCajasPalet;
    if iCajasLinea mod iCajasPalet <> 0 then
      iPaletsLinea:= iPaletsLinea + 1;
  end
  else
  begin
    iPaletsLinea:= 0
  end;


  if TComponent( ASender ).Name <> 'cajas_ocl' then
    cajas_ocl.Text:= FormatFloat('#0',iCajasLinea );
  if TComponent( ASender ).Name <> 'unidades_caja_ocl' then
    unidades_caja_ocl.Text:= FormatFloat('#0',iUnidadesCaja );

  QOrdenCargaLunidades_ocl.AsInteger:= iUnidadesLinea;
  QOrdenCargaLkilos_ocl.AsFloat:= rKilosLinea;
  QOrdenCargaLn_palets_ocl.AsInteger:= iPaletsLinea;

  QOrdenCargaLporc_iva_ocl.AsFloat:= rImpuestoLinea;  
  QOrdenCargaLimporte_neto_ocl.AsFloat:= 0;
  QOrdenCargaLiva_ocl.AsFloat:= 0;
  QOrdenCargaLimporte_total_ocl.AsFloat:= 0;


  bFlagCambios:= True;
end;

procedure TFOrdenCarga.cajas_oclChange(Sender: TObject);
begin
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    if bFlagCambios then
      RecalcularUnidades( cajas_ocl );
  end;
end;

procedure TFOrdenCarga.unidades_caja_oclChange(Sender: TObject);
begin
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    if bFlagCambios then
      RecalcularUnidades( unidades_caja_ocl );
  end;
end;

procedure TFOrdenCarga.PonStatus;
begin
  case QOrdenCargaCtraspasada_occ.AsInteger of
    1:
    begin
      lblTranspasada.Caption:= 'ALBAR?N CREADO N? ' + QOrdenCargaCn_albaran_occ.AsString;
    end;
    2:
    begin
      lblTranspasada.Caption:= 'TR?NSITO CREADO N? ' + QOrdenCargaCn_albaran_occ.AsString;
    end;
    else
    begin
      lblTranspasada.Caption:= '';
    end;
  end;
  case QOrdenCargaCstatus_occ.AsInteger of
    0:
    begin
      Shape1.Pen.Color:= clBlack;
      lblStatus.Caption:= 'CREADA';
      //QOrdenCargaCdes2_status_occ.AsString:= 'CREA';
      lblStatus.Font.Color:= clBlack;
    end;
    1:
    begin
       Shape1.Pen.Color:= clGreen;
       lblStatus.Caption:= 'ACTIVA';
       lblStatus.Font.Color:= clGreen;
    end;
    2:
    begin
      Shape1.Pen.Color:= clBlue;
      lblStatus.Caption:= 'INICIALIZADA';
      lblStatus.Font.Color:= clBlue;
    end;
    3:
    begin
      Shape1.Pen.Color:= clRed;
      lblStatus.Caption:= 'FINALIZADA';
      lblStatus.Font.Color:= clRed;
    end;
    else
    begin
      Shape1.Pen.Color:= clWhite;
      lblStatus.Caption:= '';
      lblStatus.Font.Color:= clWhite;
    end;
  end;
end;

procedure TFOrdenCarga.PonPalets;
begin
  if QOrdenCargaCorden_occ.DataSet.State = dsBrowse then
  begin
    try
      if QOrdenCargaCstatus_occ.AsInteger > 1 then
      begin
        QPalets.ParamByName('orden').AsInteger:= QOrdenCargaCorden_occ.AsInteger;
        QPalets.Open;
        lblCargadados.Caption:= QPalets.Fields[0].AsString;
        QPalets.Close;
      end
      else
      begin
        lblCargadados.Caption:= '';
      end;
    finally
      QPalets.Close;
    end;
  end
  else
  begin
    lblCargadados.Caption:= '';
  end;
end;

procedure TFOrdenCarga.orden_occChange(Sender: TObject);
begin
  //Transpasada
  //status
  PonStatus;

  //Palets cargados
  PonPalets;
end;

procedure TFOrdenCarga.comercial_oclChange(Sender: TObject);
begin
  txtComercial.Caption:= DDescripciones.desComercial( comercial_ocl.Text );
end;

procedure TFOrdenCarga.btnComercialClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= comercial_ocl.Text;
  if SeleccionaComercial( self, comercial_ocl,  sAux ) then
    comercial_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.btnEntradaFechaDescargaClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= fecha_descarga_occ.Text;
  if PonFecha( self, fecha_descarga_occ, fecha_descarga_occ.Text, sAux ) then
    fecha_descarga_occ.Text:= sAux;
end;

End.

