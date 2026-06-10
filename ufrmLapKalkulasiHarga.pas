unit ufrmLapKalkulasiHarga;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, SqlExpr,  cxGraphics,
  cxControls, dxStatusBar, te_controls, Menus, cxLookAndFeelPainters,
  cxButtons, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid ,
  Grids, BaseGrid, AdvGrid, AdvCGrid, ComCtrls, Mask, ImgList, FMTBcd,
  Provider, DB, DBClient, DBGrids, cxLookAndFeels, cxDBData,
  cxGridBandedTableView, cxGridDBTableView,
  cxGridChartView, cxCustomPivotGrid, cxDBPivotGrid, cxPC,
  cxPivotGridChartConnection, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns,  cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPScxPageControlProducer,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxCommon, dxPSCore,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxPScxGrid6Lnk,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  MemDS, DBAccess, MyAccess;


type
  TfrmLapKalkulasiHarga = class(TForm)
    tscrlbx1: TTeScrollBox;
    TePanel4: TTePanel;
    ilMenu: TImageList;
    TePanel1: TTePanel;
    ilToolbar: TImageList;
    TePanel2: TTePanel;
    TeLabel1: TTeLabel;
    SaveDialog1: TSaveDialog;
    TePanel3: TTePanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxstyl1: TcxStyle;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    cxChart: TcxGrid;
    cxGrdChart: TcxGridChartView;
    lvlChart: TcxGridLevel;
    cxPivot: TcxDBPivotGrid;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrdDetail: TcxGridDBTableView;
    cxGrid11Level1: TcxGridLevel;
    cxVCLPrinter: TdxComponentPrinter;
    cxVCLPrinterChart: TdxGridReportLink;
    btnRefresh: TcxButton;
    Label1: TLabel;
    startdate: TDateTimePicker;
    Label2: TLabel;
    enddate: TDateTimePicker;
    TePanel5: TTePanel;
    cxButton8: TcxButton;
    cxButton7: TcxButton;
    cxButton3: TcxButton;
    cxButton1: TcxButton;
    dtstprvdr1: TDataSetProvider;
    sqlqry2: TSQLQuery;
    sqlqry1: TMyQuery;
    ds3: TClientDataSet;
    ds2: TDataSource;
    procedure FormDblClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure sbNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure sbPrintClick(Sender: TObject);
    procedure btnTampilClick(Sender: TObject);
    procedure cxPageControl1Click(Sender: TObject);
    procedure TeSpeedButton1Click(Sender: TObject);
    procedure dttanggalChange(Sender: TObject);
    procedure TeSpeedButton2Click(Sender: TObject);
    procedure SetPivotColumns(ColumnSets: Array Of String);
    procedure SetPivotData(ColumnSets: Array Of String);
    procedure SetPivotRow(ColumnSets: Array Of String);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);

  private
    flagedit : Boolean;
    fid : integer;
    fnomorjual : string ;
    FPivotChartLink: TcxPivotGridChartConnection;
    xtotal,xhpp : Double;
    iskupon : Integer;
    ntotalpremium , ntotalsolar , ntotalpertamax, ntotalpertamaxplus , ntotalpenjualan : double;
    ntotaljpremium , ntotaljsolar , ntotaljpertamax, ntotaljpertamaxplus  : double;
    ntotalbayar : double;
    xhppPremium,xhppsolar,xhpppertamaxplus,xhpppertamax : double ;
    function GetPivotChartLink: TcxPivotGridChartConnection;
  public

    procedure loaddata;
    procedure refreshdata;
    property PivotChartLink: TcxPivotGridChartConnection read GetPivotChartLink
        write FPivotChartLink;

    { Public declarations }
  end;

var

  frmLapKalkulasiHarga: TfrmLapKalkulasiHarga;

implementation
   uses Ulib, MAIN, uModuleConnection, cxgridExportlink,uReport;
{$R *.dfm}



procedure TfrmLapKalkulasiHarga.FormDblClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmLapKalkulasiHarga.btnExitClick(Sender: TObject);
begin
      Release;
end;

procedure TfrmLapKalkulasiHarga.refreshdata;
begin
  startdate.DateTime := Date;
  startdate.setfocus;

end;

procedure TfrmLapKalkulasiHarga.sbNewClick(Sender: TObject);
begin
   refreshdata;
   startdate.SetFocus;
//   sbdelete.Enabled := False;
end;




procedure TfrmLapKalkulasiHarga.FormShow(Sender: TObject);
begin
  flagedit := False;
  startdate.DateTime := Date;
  enddate.DateTime := Date;
  refreshdata;
end;





procedure TfrmLapKalkulasiHarga.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
      SelectNext(ActiveControl,True,True);

end;


procedure TfrmLapKalkulasiHarga.sbPrintClick(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmLapKalkulasiHarga.loaddata;
var
  skolom,s,smargin: string ;
  afilter : string ;
  i,jmlkolom:integer;
begin
s := 'WITH '
   + 'bulan_list AS ( '
   + '    SELECT ' + QuotD(StartDate.DateTime) + ' AS tgl_awal, ' + QuotD(EndDate.DateTime) + ' AS tgl_akhir '
   + '), '
   + 'koreksi_filter AS ( '
   + '    SELECT '
   + '        h.KORH_NOMOR, '
   + '        h.KORH_TANGGAL, '
   + '        h.DATE_CREATE, '
   + '        d.KORD_BRG_KODE, '
   + '        d.KORD_GDG_KODE '
   + '    FROM tkor_hdr h '
   + '    INNER JOIN tkor_dtl d ON h.KORH_NOMOR = d.KORD_KORH_NOMOR '
   + '    WHERE d.KORD_QTY > 0 '
   + '      AND d.KORD_GDG_KODE LIKE ''%GJ%'' '
   + '), '
   + 'koreksi_terakhir_perbulan AS ( '
   + '    SELECT '
   + '        kf.KORD_BRG_KODE, '
   + '        DATE_FORMAT(kf.KORH_TANGGAL, ''%Y-%m'') AS bulan, '
   + '        DATE_FORMAT(kf.KORH_TANGGAL, ''%m'') AS bulan_only, '
   + '        MAX(kf.DATE_CREATE) AS max_date_create '
   + '    FROM koreksi_filter kf '
   + '    GROUP BY kf.KORD_BRG_KODE, DATE_FORMAT(kf.KORH_TANGGAL, ''%Y-%m''), DATE_FORMAT(kf.KORH_TANGGAL, ''%m'') '
   + '), '
   + 'koreksi_hpp_perbulan AS ( '
   + '    SELECT '
   + '        kf.KORD_BRG_KODE, '
   + '        DATE_FORMAT(kf.KORH_TANGGAL, ''%Y-%m'') AS bulan, '
   + '        DATE_FORMAT(kf.KORH_TANGGAL, ''%m'') AS bulan_only, '
   + '        kf.KORH_NOMOR '
   + '    FROM koreksi_filter kf '
   + '    INNER JOIN koreksi_terakhir_perbulan kt '
   + '        ON kf.KORD_BRG_KODE = kt.KORD_BRG_KODE '
   + '       AND DATE_FORMAT(kf.KORH_TANGGAL, ''%Y-%m'') = kt.bulan '
   + '       AND kf.DATE_CREATE = kt.max_date_create '
   + '), '
   + 'hpp_bahan_perbulan AS ( '
   + '    SELECT '
   + '        kh.KORD_BRG_KODE, '
   + '        kh.bulan, '
   + '        kh.bulan_only, '
   + '        kh.KORH_NOMOR, '
   + '        ms.MST_HARGABELI '
   + '    FROM koreksi_hpp_perbulan kh '
   + '    INNER JOIN tmasterstok ms '
   + '        ON kh.KORD_BRG_KODE = ms.MST_BRG_KODE '
   + '       AND kh.KORH_NOMOR = ms.MST_NOREFERENSI '
   + '       AND ms.MST_GDG_KODE LIKE ''%GJ%'' '
   + '), '
   + 'hpp_nonbahan_perbulan AS ( '
   + '    SELECT '
   + '        kh.KORD_BRG_KODE, '
   + '        kh.bulan, '
   + '        kh.bulan_only, '
   + '        kh.KORH_NOMOR, '
   + '        SUM(d2.KORD_HARGA) AS total_nonbahan '
   + '    FROM koreksi_hpp_perbulan kh '
   + '    INNER JOIN tkor_dtl2 d2 ON kh.KORH_NOMOR = d2.KORD_KORH_NOMOR '
   + '    GROUP BY kh.KORD_BRG_KODE, kh.bulan, kh.bulan_only, kh.KORH_NOMOR '
   + '), '
   + 'penjualan_perbulan AS ( '
   + '    SELECT '
   + '        fd.FPD_BRG_KODE, '
   + '        DATE_FORMAT(fh.FP_TANGGAL, ''%Y-%m'') AS bulan, '
   + '        DATE_FORMAT(fh.FP_TANGGAL, ''%m'') AS bulan_only '
   + '    FROM tfp_dtl fd '
   + '    INNER JOIN tfp_hdr fh ON fd.FPD_FP_NOMOR = fh.FP_NOMOR '
   + '    GROUP BY fd.FPD_BRG_KODE, DATE_FORMAT(fh.FP_TANGGAL, ''%Y-%m''), DATE_FORMAT(fh.FP_TANGGAL, ''%m'') '
   + '), '
   + 'barang_bulan_aktif AS ( '
   + '    SELECT KORD_BRG_KODE AS BRG_KODE, bulan, bulan_only FROM koreksi_hpp_perbulan '
   + '    UNION '
   + '    SELECT FPD_BRG_KODE AS BRG_KODE, bulan, bulan_only FROM penjualan_perbulan '
   + '), '
   + 'faktur_jual AS ( '
   + '    SELECT '
   + '        fd.FPD_BRG_KODE, '
   + '        fd.FPD_HARGA, '
   + '        DATE_FORMAT(fh.FP_TANGGAL, ''%Y-%m'') AS bulan, '
   + '        ROW_NUMBER() OVER ( '
   + '            PARTITION BY fd.FPD_BRG_KODE, DATE_FORMAT(fh.FP_TANGGAL, ''%Y-%m'') '
   + '            ORDER BY fd.FPD_FP_NOMOR DESC '
   + '        ) AS rn '
   + '    FROM tfp_dtl fd '
   + '    INNER JOIN tfp_hdr fh ON fd.FPD_FP_NOMOR = fh.FP_NOMOR '
   + '), '
   + 'harga_jual_perbulan AS ( '
   + '    SELECT '
   + '        FPD_BRG_KODE, '
   + '        bulan, '
   + '        FPD_HARGA '
   + '    FROM faktur_jual '
   + '    WHERE rn = 1 '
   + '), '
   + 'semua_bulan_hpp AS ( '
   + '    SELECT '
   + '        bba.BRG_KODE, '
   + '        bba.bulan, '
   + '        bba.bulan_only, '
   + '        hb.MST_HARGABELI, '
   + '        hnb.total_nonbahan, '
   + '        ( '
   + '            SELECT hb2.MST_HARGABELI '
   + '            FROM hpp_bahan_perbulan hb2 '
   + '            WHERE hb2.KORD_BRG_KODE = bba.BRG_KODE '
   + '              AND hb2.bulan <= bba.bulan '
   + '              AND hb2.MST_HARGABELI IS NOT NULL '
   + '            ORDER BY hb2.bulan DESC '
   + '            LIMIT 1 '
   + '        ) AS hpp_bahan_final, '
   + '        ( '
   + '            SELECT hnb2.total_nonbahan '
   + '            FROM hpp_nonbahan_perbulan hnb2 '
   + '            WHERE hnb2.KORD_BRG_KODE = bba.BRG_KODE '
   + '              AND hnb2.bulan <= bba.bulan '
   + '              AND hnb2.total_nonbahan IS NOT NULL '
   + '            ORDER BY hnb2.bulan DESC '
   + '            LIMIT 1 '
   + '        ) AS hpp_nonbahan_final '
   + '    FROM barang_bulan_aktif bba '
   + '    LEFT JOIN hpp_bahan_perbulan hb '
   + '        ON bba.BRG_KODE = hb.KORD_BRG_KODE '
   + '       AND bba.bulan = hb.bulan '
   + '    LEFT JOIN hpp_nonbahan_perbulan hnb '
   + '        ON bba.BRG_KODE = hnb.KORD_BRG_KODE '
   + '       AND bba.bulan = hnb.bulan '
   + '), '
   + 'final_data AS ( '
   + '    SELECT '
   + '        sb.bulan, '
   + '        sb.bulan_only, '
   + '        sb.BRG_KODE, '
   + '        b.BRG_NAMA, '
   + '        k.KTG_NAMA, '
   + '        COALESCE(sb.hpp_bahan_final, 0) AS hpp_bahan_final, '
   + '        COALESCE(sb.hpp_nonbahan_final, 0) AS hpp_non_bahan, '
   + '        COALESCE(hj.FPD_HARGA, 0) AS harga_jual '
   + '    FROM semua_bulan_hpp sb '
   + '    INNER JOIN tbarang b ON sb.BRG_KODE = b.BRG_KODE '
   + '    LEFT JOIN tkategori k ON b.BRG_KTG_KODE = k.KTG_KODE '
   + '    LEFT JOIN harga_jual_perbulan hj '
   + '        ON sb.BRG_KODE = hj.FPD_BRG_KODE '
   + '       AND sb.bulan = hj.bulan '
   + ') '
   + 'SELECT '
   + '    bulan_only AS Bulan, '
   + '    BRG_KODE, '
   + '    BRG_NAMA AS Nama, '
   + '    KTG_NAMA AS Kategori, '
   + '    hpp_bahan_final AS HPPBahan, '
   + '    hpp_non_bahan AS HPPNonBahan, '
   + '    hpp_bahan_final + hpp_non_bahan AS Total, '
   + '    harga_jual AS HargaJual, '
   + '    CASE '
   + '        WHEN harga_jual > 0 '
   + '        THEN ROUND(((hpp_bahan_final + hpp_non_bahan) / harga_jual) * 100, 2) '
   + '        ELSE NULL '
   + '    END AS Ratio '
   + 'FROM final_data '
   + 'WHERE bulan BETWEEN DATE_FORMAT(' + QuotD(StartDate.DateTime) + ', ''%Y-%m'') '
   + '                AND DATE_FORMAT(' + QuotD(EndDate.DateTime) + ', ''%Y-%m'') '
   + 'ORDER BY BRG_KODE, bulan';

      ds3.Close;
      sqlqry1.Connection := frmmenu.conn;
      sqlqry1.SQL.Text := s;
       sqlqry1.Open;
        ds3.open;


       Skolom :='Bulan,Nama,Kategori,HPPBahan,HPPNonBahan,Total,HargaJual,Ratio';
       QueryToDBGrid(cxGrid1DBTableView1, s,skolom ,ds2);

       cxGrid1DBTableView1.Columns[0].MinWidth := 100;
       cxGrid1DBTableView1.Columns[1].MinWidth := 170;
       cxGrid1DBTableView1.Columns[2].MinWidth := 150;
       cxGrid1DBTableView1.Columns[3].MinWidth := 100;
       cxGrid1DBTableView1.Columns[4].MinWidth := 100;
       cxGrid1DBTableView1.Columns[5].MinWidth := 100;
       cxGrid1DBTableView1.Columns[6].MinWidth := 100;
       cxGrid1DBTableView1.Columns[7].MinWidth := 100;

           jmlkolom :=cxGrid1DBTableView1.ColumnCount-1;

        for i:=0 To jmlkolom do
        begin
          if ds3.Fields[i].DataType = ftFloat then
          begin
             ds3.Fields[i].Alignment := taRightJustify;
             TFloatField(ds3.Fields[i]).DisplayFormat := '###,###,###';
          end;

        end;
//
//        cxGrid1DBTableView1.Columns[9].Summary.FooterKind:=skSum;
//        cxGrid1DBTableView1.Columns[9].Summary.FooterFormat:='###,###,###,###';
//        cxGrid1DBTableView1.Columns[10].Summary.FooterKind:=skSum;
//        cxGrid1DBTableView1.Columns[10].Summary.FooterFormat:='###,###,###,###';
//        cxGrid1DBTableView1.Columns[11].Summary.FooterKind:=skSum;
//        cxGrid1DBTableView1.Columns[11].Summary.FooterFormat:='###,###,###,###';

        //  hitung;

       TcxDBPivotHelper(cxPivot).LoadFromCDS(ds3);
       SetPivotColumns(['Bulan']);
       SetPivotRow (['Nama']);
       SetPivotData(['Total']);

end;

procedure TfrmLapKalkulasiHarga.btnTampilClick(Sender: TObject);
begin
    loaddata;

end;

procedure TfrmLapKalkulasiHarga.cxPageControl1Click(Sender: TObject);
begin
IF PageControl1.Pages[2].Visible  then
begin
  PivotChartLink.GridChartView := cxGrdChart;
  PivotChartLink.PivotGrid := cxPivot;
end;
end;

procedure TfrmLapKalkulasiHarga.TeSpeedButton1Click(Sender: TObject);
begin

  IF PageControl1.Pages[1].Visible  then
     TcxDBPivotHelper(cxPivot).ExportToXLS
  else
  begin
     if SaveDialog1.Execute then
     begin
       ExportGridToExcel(SaveDialog1.FileName, cxGrid1);
     end;
 end;


end;


procedure TfrmLapKalkulasiHarga.dttanggalChange(Sender: TObject);
begin
  enddate.DateTime := startdate.DateTime;
end;

function TfrmLapKalkulasiHarga.GetPivotChartLink: TcxPivotGridChartConnection;
begin
  If not Assigned(FPivotChartLink) then
    FPivotChartLink := TcxPivotGridChartConnection.Create(Self);
  Result := FPivotChartLink;
end;

procedure TfrmLapKalkulasiHarga.TeSpeedButton2Click(Sender: TObject);
begin
//  IF PageControl1.Pages[1].Visible  then
//     cxVCLPrinterPivot.Preview
//  else
//  if PageControl1.Pages[2].Visible  then
//    cxVCLPrinterChart.Preview;
end;

procedure TfrmLapKalkulasiHarga.SetPivotRow(ColumnSets: Array Of String);
begin
  TcxDBPivotHelper(cxPivot).SetRowColumns(ColumnSets);
end;

procedure TfrmLapKalkulasiHarga.SetPivotColumns(ColumnSets: Array Of String);
begin

  TcxDBPivotHelper(cxPivot).SetColColumns(ColumnSets);
end;

procedure TfrmLapKalkulasiHarga.SetPivotData(ColumnSets: Array Of String);
begin

  TcxDBPivotHelper(cxPivot).SetDataColumns(ColumnSets);
end;


procedure TfrmLapKalkulasiHarga.cxButton3Click(Sender: TObject);
var
  s:string;
  ftsreport : TTSReport;
begin

  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'kontrak';

          s:= ' SELECT fp_nomor Nomor,fp_tanggal Tanggal,month(fp_tanggal) Bulan,year(fp_tanggal) Tahun,'
          + ' sls_nama Salesman,cus_nama Outlet,brg_kode Kode,brg_nama Nama,brg_merk Merk,KTG_NAMA KATEGORI,BRG_DIVISI Divisi, fpd_brg_satuan Satuan,fpd_cn ,'
          + ' sum((fpd_qty-ifnull(retjd_qty,0))) Qty,sum((100-fpd_discpr)*(fpd_harga*(fpd_qty-ifnull(retjd_qty,0)))/100*if(fp_istax=1,if(fp_tanggal<"2022/04/01",1.1,1.11),1)) Nilai,'
          + ' sum(mst_stok_out*mst_hargabeli) hpp, '
          + ' sum((fpd_qty-ifnull(retjd_qty,0))) Qty,sum((100-fpd_discpr)*(fpd_harga*(fpd_qty-retjd_qty))/100*if(fp_istax=1,if(fp_tanggal<"2022/04/01",1.1,1.11),1)) -'
          + ' sum(mst_stok_out*mst_hargabeli) Margin, '
          + ' sum(fpd_cn*((100-fpd_discpr)*fpd_harga/100)*(fpd_qty-retjd_qty)/100) Kontrak FROM tfp_dtl inner join'
          + ' tfp_hdr on fpd_fp_nomor=fp_nomor'
          + ' inner join tbarang on fpd_brg_kode=brg_kode'
          + ' inner join tcustomer on fp_cus_kode=cus_kode'
          + ' LEFT JOIN tretj_hdr on retj_fp_nomor=fp_nomor '
          + ' left join tretj_dtl on retjd_retj_nomor=retj_nomor '          
          + ' left join tdo_hdr on fp_do_nomor=do_nomor '
          + ' left join tso_hdr on do_so_nomor=so_nomor '
          + ' left join tmasterstok on mst_noreferensi=do_nomor and fpd_brg_kode=mst_brg_kode and fpd_expired=mst_expired_date '
          + ' left join tsalesman on sls_kode = so_sls_kode'
          + ' lEFT join tkategori on ktg_kode=brg_ktg_kode '
          + ' where fpd_cn > 0 and fp_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
          + 'group by  cus_nama ,brg_kode '
          + ' having ' + cxGrid1DBTableView1.DataController.Filter.FilterText ;
    ftsreport.AddSQL(s);
    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;

end;

procedure TfrmLapKalkulasiHarga.cxButton1Click(Sender: TObject);
begin
  With cxPivot.GetFieldByName('Nama') do
  begin
    if SortBySummaryInfo.Field = nil then
      SortBySummaryInfo.Field := cxPivot.GetFieldByName('Qty')
    else
      SortBySummaryInfo.Field := nil;
  end;
end;

end.
