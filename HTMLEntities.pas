unit HTMLEntities;

interface

  function HTMLEntityDecode(const AValue: string): string;


type
  THTMLEntity = record
    Name: string;
    Value: string;
  end;


const
  // Source: https://www.freeformatter.com/html-entities.html
  HTMLEntityList: array[0..224] of THTMLEntity =
  (
    (Name: 'amp'; Value: #38), // Ampersand
    (Name: 'lt'; Value: #60), // Less-than
    (Name: 'gt'; Value: #62), // Greater than
    (Name: 'Agrave'; Value: #192), // Capital a with grave accent
    (Name: 'Aacute'; Value: #193), // Capital a with acute accent
    (Name: 'Acirc'; Value: #194), // Capital a with circumflex accent
    (Name: 'Atilde'; Value: #195), // Capital a with tilde
    (Name: 'Aring'; Value: #197), // Capital a with ring
    (Name: 'AElig'; Value: #198), // Capital ae
    (Name: 'Egrave'; Value: #200), // Capital e with grave accent
    (Name: 'Eacute'; Value: #201), // Capital e with acute accent
    (Name: 'Ecirc'; Value: #202), // Capital e with circumflex accent
    (Name: 'Euml'; Value: #203), // Capital e with umlaut
    (Name: 'Igrave'; Value: #204), // Capital i with grave accent
    (Name: 'Icirc'; Value: #206), // Capital i with circumflex accent
    (Name: 'Iuml'; Value: #207), // Capital i with umlaut
    (Name: 'ETH'; Value: #208), // Capital eth (Icelandic)
    (Name: 'Ntilde'; Value: #209), // Capital n with tilde
    (Name: 'Ograve'; Value: #210), // Capital o with grave accent
    (Name: 'Oacute'; Value: #211), // Capital o with accute accent
    (Name: 'Ocirc'; Value: #212), // Capital o with circumflex accent
    (Name: 'Otilde'; Value: #213), // Capital o with tilde
    (Name: 'Ouml'; Value: #214), // Capital o with umlaut
    (Name: 'Oslash'; Value: #216), // Capital o with slash
    (Name: 'Ugrave'; Value: #217), // Capital u with grave accent
    (Name: 'Uacute'; Value: #218), // Capital u with acute accent
    (Name: 'Ucirc'; Value: #219), // Capital u with circumflex accent
    (Name: 'Uuml'; Value: #220), // Capital u with umlaut
    (Name: 'Yacute'; Value: #221), // Capital y with acute accent
    (Name: 'THORN'; Value: #222), // Capital thorn (Icelandic)
    (Name: 'szlig'; Value: #223), // Lowercase sharp s (German)
    (Name: 'agrave'; Value: #224), // Lowercase a with grave accent
    (Name: 'aacute'; Value: #225), // Lowercase a with acute accent
    (Name: 'acirc'; Value: #226), // Lowercase a with circumflex accent
    (Name: 'atilde'; Value: #227), // Lowercase a with tilde
    (Name: 'auml'; Value: #228), // Lowercase a with umlaut
    (Name: 'aring'; Value: #229), // Lowercase a with ring
    (Name: 'aelig'; Value: #230), // Lowercase ae
    (Name: 'ccedil'; Value: #231), // Lowercase c with cedilla
    (Name: 'egrave'; Value: #232), // Lowercase e with grave accent
    (Name: 'eacute'; Value: #233), // Lowercase e with acute accent
    (Name: 'ecirc'; Value: #234), // Lowercase e with circumflex accent
    (Name: 'euml'; Value: #235), // Lowercase e with umlaut
    (Name: 'igrave'; Value: #236), // Lowercase i with grave accent
    (Name: 'iacute'; Value: #237), // Lowercase i with acute accent
    (Name: 'icirc'; Value: #238), // Lowercase i with circumflex accent
    (Name: 'iuml'; Value: #239), // Lowercase i with umlaut
    (Name: 'eth'; Value: #240), // Lowercase eth (Icelandic)
    (Name: 'ntilde'; Value: #241), // Lowercase n with tilde
    (Name: 'ograve'; Value: #242), // Lowercase o with grave accent
    (Name: 'oacute'; Value: #243), // Lowercase o with acute accent
    (Name: 'ocirc'; Value: #244), // Lowercase o with circumflex accent
    (Name: 'otilde'; Value: #245), // Lowercase o with tilde
    (Name: 'ouml'; Value: #246), // Lowercase o with umlaut
    (Name: 'oslash'; Value: #248), // Lowercase o with slash
    (Name: 'ugrave'; Value: #249), // Lowercase u with grave accent
    (Name: 'uacute'; Value: #250), // Lowercase u with acute accent
    (Name: 'ucirc'; Value: #251), // Lowercase u with circumflex accent
    (Name: 'uuml'; Value: #252), // Lowercase u with umlaut
    (Name: 'yacute'; Value: #253), // Lowercase y with acute accent
    (Name: 'thorn'; Value: #254), // Lowercase thorn (Icelandic)
    (Name: 'nbsp'; Value: #160), // Non-breaking space
    (Name: 'iexcl'; Value: #161), // Inverted exclamation mark
    (Name: 'cent'; Value: #162), // Cent
    (Name: 'pound'; Value: #163), // Pound
    (Name: 'curren'; Value: #164), // Currency
    (Name: 'yen'; Value: #165), // Yen
    (Name: 'brvbar'; Value: #166), // Broken vertical bar
    (Name: 'sect'; Value: #167), // Section
    (Name: 'uml'; Value: #168), // Spacing diaeresis
    (Name: 'copy'; Value: #169), // Copyright
    (Name: 'ordf'; Value: #170), // Feminine ordinal indicator
    (Name: 'laquo'; Value: #171), // Opening/Left angle quotation mark
    (Name: 'not'; Value: #172), // Negation
    (Name: 'shy'; Value: #173), // Soft hyphen
    (Name: 'reg'; Value: #174), // Registered trademark
    (Name: 'macr'; Value: #175), // Spacing macron
    (Name: 'deg'; Value: #176), // Degree
    (Name: 'plusmn'; Value: #177), // Plus or minus
    (Name: 'sup2'; Value: #178), // Superscript 2
    (Name: 'sup3'; Value: #179), // Superscript 3
    (Name: 'acute'; Value: #180), // Spacing acute
    (Name: 'micro'; Value: #181), // Micro
    (Name: 'para'; Value: #182), // Paragraph
    (Name: 'cedil'; Value: #184), // Spacing cedilla
    (Name: 'sup1'; Value: #185), // Superscript 1
    (Name: 'ordm'; Value: #186), // Masculine ordinal indicator
    (Name: 'raquo'; Value: #187), // Closing/Right angle quotation mark
    (Name: 'frac14'; Value: #188), // Fraction 1/4
    (Name: 'frac12'; Value: #189), // Fraction 1/2
    (Name: 'frac34'; Value: #190), // Fraction 3/4
    (Name: 'iquest'; Value: #191), // Inverted question mark
    (Name: 'times'; Value: #215), // Multiplication
    (Name: 'divide'; Value: #247), // Divide
    (Name: 'forall'; Value: #8704), // For all
    (Name: 'part'; Value: #8706), // Part
    (Name: 'exist'; Value: #8707), // Exist
    (Name: 'empty'; Value: #8709), // Empty
    (Name: 'nabla'; Value: #8711), // Nabla
    (Name: 'isin'; Value: #8712), // Is in
    (Name: 'notin'; Value: #8713), // Not in
    (Name: 'ni'; Value: #8715), // Ni
    (Name: 'prod'; Value: #8719), // Product
    (Name: 'sum'; Value: #8721), // Sum
    (Name: 'minus'; Value: #8722), // Minus
    (Name: 'lowast'; Value: #8727), // Asterisk (Lowast)
    (Name: 'radic'; Value: #8730), // Square root
    (Name: 'prop'; Value: #8733), // Proportional to
    (Name: 'infin'; Value: #8734), // Infinity
    (Name: 'ang'; Value: #8736), // Angle
    (Name: 'and'; Value: #8743), // And
    (Name: 'or'; Value: #8744), // Or
    (Name: 'cap'; Value: #8745), // Cap
    (Name: 'cup'; Value: #8746), // Cup
    (Name: 'int'; Value: #8747), // Integral
    (Name: 'there4'; Value: #8756), // Therefore
    (Name: 'sim'; Value: #8764), // Similar to
    (Name: 'cong'; Value: #8773), // Congurent to
    (Name: 'asymp'; Value: #8776), // Almost equal
    (Name: 'ne'; Value: #8800), // Not equal
    (Name: 'equiv'; Value: #8801), // Equivalent
    (Name: 'le'; Value: #8804), // Less or equal
    (Name: 'ge'; Value: #8805), // Greater or equal
    (Name: 'sub'; Value: #8834), // Subset of
    (Name: 'sup'; Value: #8835), // Superset of
    (Name: 'nsub'; Value: #8836), // Not subset of
    (Name: 'sube'; Value: #8838), // Subset or equal
    (Name: 'supe'; Value: #8839), // Superset or equal
    (Name: 'oplus'; Value: #8853), // Circled plus
    (Name: 'otimes'; Value: #8855), // Circled times
    (Name: 'perp'; Value: #8869), // Perpendicular
    (Name: 'Alpha'; Value: #913), // Alpha
    (Name: 'Beta'; Value: #914), // Beta
    (Name: 'Gamma'; Value: #915), // Gamma
    (Name: 'Delta'; Value: #916), // Delta
    (Name: 'Epsilon'; Value: #917), // Epsilon
    (Name: 'Zeta'; Value: #918), // Zeta
    (Name: 'Theta'; Value: #920), // Theta
    (Name: 'Iota'; Value: #921), // Iota
    (Name: 'Lambda'; Value: #923), // Lambda
    (Name: 'Mu'; Value: #924), // Mu
    (Name: 'Nu'; Value: #925), // Nu
    (Name: 'Xi'; Value: #926), // Xi
    (Name: 'Pi'; Value: #928), // Pi
    (Name: 'Rho'; Value: #929), // Rho
    (Name: 'Sigma'; Value: #931), // Sigma
    (Name: 'Tau'; Value: #932), // Tau
    (Name: 'Upsilon'; Value: #933), // Upsilon
    (Name: 'Phi'; Value: #934), // Phi
    (Name: 'Chi'; Value: #935), // Chi
    (Name: 'Psi'; Value: #936), // Psi
    (Name: 'Omega'; Value: #937), // Omega
    (Name: 'alpha'; Value: #945), // alpha
    (Name: 'gamma'; Value: #947), // gamma
    (Name: 'delta'; Value: #948), // delta
    (Name: 'zeta'; Value: #950), // zeta
    (Name: 'eta'; Value: #951), // eta
    (Name: 'theta'; Value: #952), // theta
    (Name: 'iota'; Value: #953), // iota
    (Name: 'kappa'; Value: #954), // kappa
    (Name: 'lambda'; Value: #955), // lambda
    (Name: 'mu'; Value: #956), // mu
    (Name: 'nu'; Value: #957), // nu
    (Name: 'xi'; Value: #958), // xi
    (Name: 'pi'; Value: #960), // pi
    (Name: 'rho'; Value: #961), // rho
    (Name: 'sigmaf'; Value: #962), // sigmaf
    (Name: 'tau'; Value: #964), // tau
    (Name: 'upsilon'; Value: #965), // upsilon
    (Name: 'phi'; Value: #966), // phi
    (Name: 'chi'; Value: #967), // chi
    (Name: 'psi'; Value: #968), // psi
    (Name: 'omega'; Value: #969), // omega
    (Name: 'thetasym'; Value: #977), // Theta symbol
    (Name: 'upsih'; Value: #978), // Upsilon symbol
    (Name: 'piv'; Value: #982), // Pi symbol
    (Name: 'OElig'; Value: #338), // Uppercase ligature OE
    (Name: 'oelig'; Value: #339), // Lowercase ligature OE
    (Name: 'Scaron'; Value: #352), // Uppercase S with caron
    (Name: 'scaron'; Value: #353), // Lowercase S with caron
    (Name: 'Yuml'; Value: #376), // Capital Y with diaeres
    (Name: 'fnof'; Value: #402), // Lowercase with hook
    (Name: 'circ'; Value: #710), // Circumflex accent
    (Name: 'tilde'; Value: #732), // Tilde
    (Name: 'ensp'; Value: #8194), // En space
    (Name: 'emsp'; Value: #8195), // Em space
    (Name: 'thinsp'; Value: #8201), // Thin space
    (Name: 'zwnj'; Value: #8204), // Zero width non-joiner
    (Name: 'zwj'; Value: #8205), // Zero width joiner
    (Name: 'lrm'; Value: #8206), // Left-to-right mark
    (Name: 'rlm'; Value: #8207), // Right-to-left mark
    (Name: 'mdash'; Value: #8212), // Em dash
    (Name: 'lsquo'; Value: #8216), // Left single quotation mark
    (Name: 'rsquo'; Value: #8217), // Right single quotation mark
    (Name: 'sbquo'; Value: #8218), // Single low-9 quotation mark
    (Name: 'ldquo'; Value: #8220), // Left double quotation mark
    (Name: 'rdquo'; Value: #8221), // Right double quotation mark
    (Name: 'bdquo'; Value: #8222), // Double low-9 quotation mark
    (Name: 'dagger'; Value: #8224), // Dagger
    (Name: 'Dagger'; Value: #8225), // Double dagger
    (Name: 'bull'; Value: #8226), // Bullet
    (Name: 'hellip'; Value: #8230), // Horizontal ellipsis
    (Name: 'permil'; Value: #8240), // Per mille
    (Name: 'prime'; Value: #8242), // Minutes (Degrees)
    (Name: 'Prime'; Value: #8243), // Seconds (Degrees)
    (Name: 'lsaquo'; Value: #8249), // Single left angle quotation
    (Name: 'rsaquo'; Value: #8250), // Single right angle quotation
    (Name: 'oline'; Value: #8254), // Overline
    (Name: 'euro'; Value: #8364), // Euro
    (Name: 'trade'; Value: #8482), // Trademark
    (Name: 'larr'; Value: #8592), // Left arrow
    (Name: 'uarr'; Value: #8593), // Up arrow
    (Name: 'rarr'; Value: #8594), // Right arrow
    (Name: 'darr'; Value: #8595), // Down arrow
    (Name: 'harr'; Value: #8596), // Left right arrow
    (Name: 'crarr'; Value: #8629), // Carriage return arrow
    (Name: 'lceil'; Value: #8968), // Left ceiling
    (Name: 'rceil'; Value: #8969), // Right ceiling
    (Name: 'lfloor'; Value: #8970), // Left floor
    (Name: 'rfloor'; Value: #8971), // Right floor
    (Name: 'loz'; Value: #9674), // Lozenge
    (Name: 'spades'; Value: #9824), // Spade
    (Name: 'clubs'; Value: #9827), // Club
    (Name: 'hearts'; Value: #9829), // Heart
    (Name: 'diams'; Value: #9830) // Diamond
  );


implementation
uses
  System.SysUtils;


function NameToValue(const AName: string): string; inline
var
  entity: THTMLEntity;

begin
  for entity in HTMLEntityList do
    if entity.Name = AName then
      exit(entity.Value);

  // Unknown entity, return as-is
  Result := '&' + AName + ';';
end;


function NumericToValue(const ANumeric: string): string; //inline;
var
  value: string;
  intValue: Integer;

begin
  if Length(ANumeric) = 0 then
    exit('');

  value := ANumeric;
  if value[1] = 'x' then
    value[1] := '$';

  if TryStrToInt(value, intValue) then
    Result := Char(intValue)
  else
    // Unable to convert, return as-is
    Result := '&' + ANumeric + ';';
end;


function HTMLEntityDecode(const AValue: string): string;
const
  ValidEntityChars = ['A'..'Z', 'a'..'z', '0'..'9', '#'];


  procedure FlushOutput(const AOutput: TStringBuilder; const AValue: string; const ACharPos: Integer; var ALastOutputPos: Integer); //inline;
  begin
    if ALastOutputPos < ACharPos then
    begin
      AOutput.Append(Copy(AValue, ALastOutputPos, ACharPos - ALastOutputPos));
      ALastOutputPos := ACharPos;
    end;
  end;


var
  output: TStringBuilder;
  charPos: Integer;
  lastOutputPos: Integer;
  entityStartPos: Integer;
  entityName: string;


begin
  output := TStringBuilder.Create;
  try
    lastOutputPos := 1;
    charPos := 1;

    while charPos < Length(AValue) do
    begin
      if AValue[charPos] = '&' then
      begin
        // Possible start of entity
        FlushOutput(output, AValue, charPos, lastOutputPos);

        Inc(charPos);
        entityStartPos := charPos;

        while charPos <= Length(AValue) do
        begin
          if AValue[charPos] = ';' then
          begin
            // End of entity
            if charPos > entityStartPos then
            begin
              entityName := Copy(AValue, entityStartPos, charPos - entityStartPos);

              if entityName[1] = '#' then
              begin
                Delete(entityName, 1, 1);
                output.Append(NumericToValue(entityName));
              end else
                output.Append(NameToValue(entityName));
            end;

            Inc(charPos);
            lastOutputPos := charPos;
            break;

          end else if not (CharInSet(AValue[charPos], ValidEntityChars)) then
            // Invalid character, keep charPos to check for new entity start later on
            break
          else
            Inc(charPos);
        end;
      end else
        Inc(charPos);
    end;

    FlushOutput(output, AValue, Succ(Length(AValue)), lastOutputPos);
    Result := output.ToString;
  finally
    FreeAndNil(output);
  end;
end;


end.
