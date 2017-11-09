unit DecodeTest;

interface
uses
  TestFramework;


type
  THTMLEntitiesDecodeTest = class(TTestCase)
  published
    procedure TestNumericEntity;
    procedure TestHexadecimalEntity;
    procedure TestNamedEntity;
    procedure TestInvalidEntity;
    procedure TestInvalidCharacters;
    procedure TestMultipleEntities;
  end;


implementation
uses
  HTMLEntities;


{ THTMLEntitiesDecodeTest }
procedure THTMLEntitiesDecodeTest.TestNamedEntity;
begin
  CheckEquals('&', HTMLEntityDecode('&amp;'));
end;


procedure THTMLEntitiesDecodeTest.TestNumericEntity;
begin
  CheckEquals(' ', HTMLEntityDecode('&#32;'));
end;


procedure THTMLEntitiesDecodeTest.TestHexadecimalEntity;
begin
  CheckEquals('A', HTMLEntityDecode('&#x41;'));
end;


procedure THTMLEntitiesDecodeTest.TestInvalidEntity;
begin
  CheckEquals('&invalid;', HTMLEntityDecode('&invalid;'));
end;


procedure THTMLEntitiesDecodeTest.TestInvalidCharacters;
begin
  CheckEquals('&@;', HTMLEntityDecode('&@;'));
end;


procedure THTMLEntitiesDecodeTest.TestMultipleEntities;
begin
  CheckEquals('1 < 5 & 8 > 4', HTMLEntityDecode('1 &lt; 5 &amp; 8 &gt; 4'));
end;



initialization
  RegisterTest(THTMLEntitiesDecodeTest.Suite);

end.
