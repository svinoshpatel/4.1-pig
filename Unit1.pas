unit Unit1;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls;

type
  // Абстрактний клас TPig
  TPig = class
    function Speak: String; virtual; abstract;
  end;

  // Клас-нащадок TPetPig (домашня свинка)
  TPetPig = class(TPig)
    function Speak: String; override;
  end;

  // Клас-нащадок TFarmPig (фермерська свиня)
  TFarmPig = class(TPig)
    function Speak: String; override;
  end;

  TForm1 = class(TForm)
    Label1: TLabel;
    ButtonPetPig: TButton;
    ButtonFarmPig: TButton;
    procedure ButtonPetPigClick(Sender: TObject);
    procedure ButtonFarmPigClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// Реалізація методу Speak для домашньої свинки
function TPetPig.Speak: String;
begin
  Result := 'Хрю-хрю! Я домашня свинка!';
end;

// Реалізація методу Speak для фермерської свині
function TFarmPig.Speak: String;
begin
  Result := 'Гррр-хрю! Я велика фермерська свиня!';
end;

// Обробник натискання кнопки для домашньої свинки
procedure TForm1.ButtonPetPigClick(Sender: TObject);
var
  Pig: TPig;
  PetPig: TPetPig;
begin
  Pig := TPig.Create;
  PetPig := TPetPig.Create;
  try
    Label1.Caption := PetPig.Speak;
  finally
    PetPig.Free;
  end;
end;

// Обробник натискання кнопки для фермерської свині
procedure TForm1.ButtonFarmPigClick(Sender: TObject);
var
  FarmPig: TFarmPig;
begin
  FarmPig := TFarmPig.Create;
  try
    Label1.Caption := FarmPig.Speak;
  finally
    FarmPig.Free;
  end;
end;

end.

