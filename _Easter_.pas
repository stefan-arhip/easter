unit _Easter_;

interface

uses
  LCLIntf, LCLType, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Spin, DateUtils, Types;

type

  { TfMain }

  TfMain = class(TForm)
    mmMain: TMainMenu;
    File1: TMenuItem;
    View1: TMenuItem;
    Exportintextfile1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    seYearStart: TSpinEdit;
    seYearStop: TSpinEdit;
    Options1: TMenuItem;
    Language1: TMenuItem;
    English1: TMenuItem;
    Romanian1: TMenuItem;
    GroupBox2: TGroupBox;
    lbResult: TListBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Italy1: TMenuItem;
    French1: TMenuItem;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Search1: TMenuItem;
    N2: TMenuItem;
    Year1: TMenuItem;
    Date1: TMenuItem;
    GroupBox3: TGroupBox;
    lbSearchResult: TListBox;
    Label3: TLabel;
    Longsentences1: TMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure View1Click(Sender: TObject);
    procedure Exportintextfile1Click(Sender: TObject);
    procedure Romanian1Click(Sender: TObject);
    procedure English1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure seYearStartChange(Sender: TObject);
    procedure Italy1Click(Sender: TObject);
    procedure French1Click(Sender: TObject);
    procedure Year1Click(Sender: TObject);
    procedure Date1Click(Sender: TObject);
    procedure Longsentences1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;
  t1, t2: string;

implementation

uses _About_;

  {$R *.lfm}

const
  luna: string = 'aprilie';

var
  an, zi: integer;

procedure TfMain.Exit1Click(Sender: TObject);
begin
  application.terminate;
end;

procedure TfMain.View1Click(Sender: TObject);
begin
  if opendialog1.Execute then lbResult.Items.LoadFromFile(opendialog1.filename);
end;

procedure TfMain.Exportintextfile1Click(Sender: TObject);
begin
  if savedialog1.Execute then lbResult.items.SaveToFile(savedialog1.filename + '.txt');
end;

procedure TfMain.Romanian1Click(Sender: TObject);
begin
  english1.Checked := False;
  romanian1.Checked := True;
  italy1.Checked := False;
  french1.Checked := False;
  fMain.Caption := 'Sarbatorile de Pasti';
  file1.Caption := '&Fisier';
  view1.Caption := '&Vizualizare fisier';
  exportintextfile1.Caption := 'E&xport in fisier';
  exit1.Caption := 'I&esire';
  options1.Caption := '&Optiuni';
  search1.Caption := '&Cautare';
  year1.Caption := '&An...';
  date1.Caption := '&Data...';
  language1.Caption := '&Limbaj';
  english1.Caption := '&Engleza';
  romanian1.Caption := '&Romana';
  italy1.Caption := '&Italiana';
  french1.Caption := '&Franceza';
  help1.Caption := '&Ajutor';
  about1.Caption := '&Despre...';
  groupbox1.Caption := 'Comenzi';
  label1.Caption := 'Anul de start';
  label2.Caption := 'Anul final';
  label3.Caption := 'Articolele cautate';
  groupbox2.Caption := 'Zilele de Pasti';
  seYearStartChange(Sender);
  groupbox3.Caption := 'Rezultate';
  longsentences1.Caption := '&Fraze lungi';
end;

procedure TfMain.English1Click(Sender: TObject);
begin
  romanian1.Checked := False;
  english1.Checked := True;
  italy1.Checked := False;
  french1.Checked := False;
  fMain.Caption := 'Easter';
  file1.Caption := '&File';
  view1.Caption := '&View text file';
  exportintextfile1.Caption := 'E&xport in text file';
  exit1.Caption := 'E&xit';
  options1.Caption := '&Options';
  search1.Caption := '&Search';
  year1.Caption := '&Year...';
  date1.Caption := '&Date...';
  language1.Caption := '&Language';
  english1.Caption := '&English';
  romanian1.Caption := '&Romanian';
  italy1.Caption := '&Italy';
  french1.Caption := '&France';
  help1.Caption := '&Help';
  about1.Caption := '&About...';
  groupbox1.Caption := 'Commands';
  label1.Caption := 'Start year';
  label2.Caption := 'Stop year';
  label3.Caption := 'Searched articles';
  groupbox2.Caption := 'Day of Easter';
  seYearStartChange(Sender);
  groupbox3.Caption := 'Results';
  longsentences1.Caption := '&Long sentences';
end;

procedure TfMain.About1Click(Sender: TObject);
begin
  fMain.Enabled := False;
  fAbout.Show;
end;

procedure TfMain.seYearStartChange(Sender: TObject);
var
  d, e: real;
begin
  if seYearStart.Tag = 100 then
    exit;
  if seYearStart.Value > seYearStop.Value then
  begin
    if english1.Checked then
      ShowMessage('Invalid year interval!');
    if romanian1.Checked then
      ShowMessage('Interval de ani invalid!');
    if italy1.Checked then
      ShowMessage('L''intervallo di invalido');
  end;
  lbResult.Clear;
  listbox2.Clear;
  listbox3.Clear;
  for an := seYearStart.Value to seYearStop.Value do
  begin
    if english1.Checked then luna := 'april';
    if romanian1.Checked then luna := 'aprilie';
    if italy1.Checked then luna := 'aprile';
    if french1.Checked then luna := 'Avril';
    d := (((an mod 19) * 19) + 15) mod 30;
    e := ROUND(((an mod 4) * 2 + (an mod 7) * 4) + 6 * d + 6) mod 7;
    zi := 4 + ROUND(d + e);
    if zi > 30 then
    begin
      zi := zi - 30;
      if english1.Checked then luna := 'may';
      if romanian1.Checked then luna := 'mai';
      if italy1.Checked then luna := 'maggio';
      if french1.Checked then luna := 'Pouvoir';
    end;
    case longsentences1.Checked of
      True:
      begin
        if english1.Checked then
          lbResult.items.add('in ' + IntToStr(an) + ' year Easter day is on ' +
            IntToStr(zi) + ' ' + luna);
        if romanian1.Checked then
          lbResult.items.add('in anul ' + IntToStr(an) +
            ' Pastele cade in ziua de ' + IntToStr(zi) + ' ' + luna);
        if italy1.Checked then
          lbResult.items.add('in ' + IntToStr(an) + ' anno il giorno di Pasqua è su ' +
            IntToStr(zi) + ' ' + luna);
        if french1.Checked then
          lbResult.items.add('dans d''année ' + IntToStr(an) +
            ' jour de Pâques day est sur ' + IntToStr(zi) + ' ' + luna);
      end;
      False:
        lbResult.items.add(IntToStr(zi) + ' ' + luna + ' ' + IntToStr(an));
    end;
    listbox2.items.add(IntToStr(zi) + ' ' + luna);
    listbox3.items.add(IntToStr(an));
  end;
end;

procedure TfMain.Italy1Click(Sender: TObject);
begin
  english1.Checked := False;
  romanian1.Checked := False;
  italy1.Checked := True;
  french1.Checked := False;
  fMain.Caption := 'La pasqua';
  file1.Caption := 'Il &file';
  view1.Caption := '&Osservare il file di testo';
  exportintextfile1.Caption := '&Esportare nel file di testo';
  exit1.Caption := 'L''&uscita';
  options1.Caption := 'Le &opzioni';
  search1.Caption := '&Ricerca';
  year1.Caption := 'L''&anno...';
  date1.Caption := 'La &data...';
  language1.Caption := 'La &lingua';
  english1.Caption := '&Inglese';
  romanian1.Caption := '&Romana';
  italy1.Caption := '&Italia';
  french1.Caption := '&France';
  help1.Caption := 'L''&aiuto';
  about1.Caption := '&Circa...';
  groupbox1.Caption := 'I &comandi';
  label1.Caption := '&Cominciare l''anno';
  label2.Caption := '&Fermare l''anno';
  label3.Caption := 'Gli articoli ricercati';
  groupbox2.Caption := 'Il giorno di Pasqua';
  seYearStartChange(Sender);
  groupbox3.Caption := 'I risultati';
  longsentences1.Caption := 'La &frase lunga';
end;

procedure TfMain.French1Click(Sender: TObject);
begin
  english1.Checked := False;
  romanian1.Checked := False;
  italy1.Checked := False;
  french1.Checked := True;
  fMain.Caption := 'Pâques';
  file1.Caption := '&Fichier';
  view1.Caption := '&Regarder le fichier texte';
  exportintextfile1.Caption := 'E&xporter dans le fichier texte';
  exit1.Caption := 'Sortie';
  options1.Caption := '&Options';
  search1.Caption := '&Recherche';
  year1.Caption := '&Année';
  date1.Caption := '&Date';
  language1.Caption := '&Langage';
  english1.Caption := '&Anglais';
  romanian1.Caption := '&Romanian';
  italy1.Caption := '&Italie';
  french1.Caption := '&France';
  help1.Caption := '&Aide';
  about1.Caption := '&De...';
  groupbox1.Caption := '&Ordres';
  label1.Caption := '&Commencer l''année';
  label2.Caption := '&Arrêter l''année. ';
  label3.Caption := 'Articles cherchés';
  groupbox2.Caption := 'Le jour de Pâques';
  seYearStartChange(Sender);
  groupbox3.Caption := 'Résultats';
  longsentences1.Caption := 'Phrase &longue';
end;

procedure TfMain.Year1Click(Sender: TObject);
var
  i: integer;
begin
(*year1.checked:=not year1.checked;
if date1.checked=year1.checked
  then
    date1.checked:=not date1.checked;
if year1.checked
  then*)
  begin
    if lbResult.ItemIndex = -1 then
      t1 := listbox3.items[0]
    else
      t1 := listbox3.items[lbResult.ItemIndex];//inttostr (an);
    InputQuery('Input Box', 'Prompt', t1);
    lbSearchResult.Clear;
    if t1 <> '' then
      for i := 0 to pred(ListBox3.Items.Count) do
        if ListBox3.Items[i] = t1 then
          lbSearchResult.items.Add(listbox2.Items[i] + ' ' + listbox3.items[i])
        else
    else
    begin
      for i := 0 to pred(ListBox3.Items.Count) do
        lbSearchResult.items.Add(listbox2.Items[i] + ' ' + listbox3.items[i]);
      if english1.Checked then
        ShowMessage('Found ' + IntToStr(lbSearchResult.items.Count) + ' articles');
      if romanian1.Checked then
        ShowMessage('Am gasit ' + IntToStr(lbSearchResult.items.Count) + ' articole');
      if italy1.Checked then
        ShowMessage('Ha trovato ' + IntToStr(lbSearchResult.items.Count) + ' articoli');
      if french1.Checked then
        ShowMessage('A trouvé ' + IntToStr(lbSearchResult.items.Count) + ' articles');
    end;
  end;
end;

procedure TfMain.Date1Click(Sender: TObject);
var
  i: integer;
begin
(*date1.checked:=not date1.checked;
if date1.checked=year1.checked
  then
    year1.checked:=not year1.checked;
if date1.checked
  then*)
  begin
    if lbResult.ItemIndex = -1 then
      t2 := listbox2.items[0]
    else
      t2 := listbox2.items[lbResult.ItemIndex];//inttostr (zi)+' '+luna;
    InputQuery('Input Box', 'Prompt', t2);
    lbSearchResult.Clear;
    if t2 <> '' then
      for i := 0 to pred(ListBox2.Items.Count) do
        if ListBox2.Items[i] = t2 then
          lbSearchResult.items.Add(listbox2.items[i] + ' ' + listbox3.Items[i])
        else
    else
      for i := 0 to pred(ListBox2.Items.Count) do
        lbSearchResult.items.Add(listbox2.items[i] + ' ' + listbox3.Items[i]);
    if english1.Checked then
      ShowMessage('Found ' + IntToStr(lbSearchResult.items.Count) + ' articles');
    if romanian1.Checked then
      ShowMessage('Am gasit ' + IntToStr(lbSearchResult.items.Count) + ' articole');
    if italy1.Checked then
      ShowMessage('Ha trovato ' + IntToStr(lbSearchResult.items.Count) + ' articoli');
    if french1.Checked then
      ShowMessage('A trouvé ' + IntToStr(lbSearchResult.items.Count) + ' articles');
  end;
end;

procedure TfMain.Longsentences1Click(Sender: TObject);
begin
  longsentences1.Checked := not longsentences1.Checked;
  seYearStartChange(Sender);
end;

procedure TfMain.FormCreate(Sender: TObject);
var
  y, m, d, h, n, s, z: word;
  y1, y2: integer;
begin
  DecodeDateTime(Now(), y, m, d, h, n, s, z);
  seYearStart.Tag := 100;
  y1 := y - 10;
  y2 := y + 10;
  seYearStart.Value := y1;
  seYearStop.Value := y2;

  seYearStart.Tag := 0;
  seYearStartChange(Sender);
  romanian1.onclick(Sender);
end;

end.
