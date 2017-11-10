unit HTMLEntities;

interface

  function HTMLEntityDecode(const AValue: string): string;


type
  THTMLEntity = record
    Name: string;
    Value: string;
  end;


const
  // Source: https://dev.w3.org/html5/html-author/charref
  HTMLEntityList: array[0..2030] of THTMLEntity =
  (
    (Name: 'Tab'; Value: #9), // CHARACTER TABULATION
    (Name: 'NewLine'; Value: #10), // LINE FEED (LF)
    (Name: 'excl'; Value: #33), // EXCLAMATION MARK
    (Name: 'quot'; Value: #34), // QUOTATION MARK
    (Name: 'QUOT'; Value: #34), // QUOTATION MARK
    (Name: 'num'; Value: #35), // NUMBER SIGN
    (Name: 'dollar'; Value: #36), // DOLLAR SIGN
    (Name: 'percnt'; Value: #37), // PERCENT SIGN
    (Name: 'amp'; Value: #38), // AMPERSAND
    (Name: 'AMP'; Value: #38), // AMPERSAND
    (Name: 'apos'; Value: #39), // APOSTROPHE
    (Name: 'lpar'; Value: #40), // LEFT PARENTHESIS
    (Name: 'rpar'; Value: #41), // RIGHT PARENTHESIS
    (Name: 'ast'; Value: #42), // ASTERISK
    (Name: 'midast'; Value: #42), // ASTERISK
    (Name: 'plus'; Value: #43), // PLUS SIGN
    (Name: 'comma'; Value: #44), // COMMA
    (Name: 'period'; Value: #46), // FULL STOP
    (Name: 'sol'; Value: #47), // SOLIDUS
    (Name: 'colon'; Value: #58), // COLON
    (Name: 'semi'; Value: #59), // SEMICOLON
    (Name: 'lt'; Value: #60), // LESS-THAN SIGN
    (Name: 'LT'; Value: #60), // LESS-THAN SIGN
    (Name: 'equals'; Value: #61), // EQUALS SIGN
    (Name: 'gt'; Value: #62), // GREATER-THAN SIGN
    (Name: 'GT'; Value: #62), // GREATER-THAN SIGN
    (Name: 'quest'; Value: #63), // QUESTION MARK
    (Name: 'commat'; Value: #64), // COMMERCIAL AT
    (Name: 'lsqb'; Value: #91), // LEFT SQUARE BRACKET
    (Name: 'lbrack'; Value: #91), // LEFT SQUARE BRACKET
    (Name: 'bsol'; Value: #92), // REVERSE SOLIDUS
    (Name: 'rsqb'; Value: #93), // RIGHT SQUARE BRACKET
    (Name: 'rbrack'; Value: #93), // RIGHT SQUARE BRACKET
    (Name: 'Hat'; Value: #94), // CIRCUMFLEX ACCENT
    (Name: 'lowbar'; Value: #95), // LOW LINE
    (Name: 'grave'; Value: #96), // GRAVE ACCENT
    (Name: 'DiacriticalGrave'; Value: #96), // GRAVE ACCENT
    (Name: 'lcub'; Value: #123), // LEFT CURLY BRACKET
    (Name: 'lbrace'; Value: #123), // LEFT CURLY BRACKET
    (Name: 'verbar'; Value: #124), // VERTICAL LINE
    (Name: 'vert'; Value: #124), // VERTICAL LINE
    (Name: 'VerticalLine'; Value: #124), // VERTICAL LINE
    (Name: 'rcub'; Value: #125), // RIGHT CURLY BRACKET
    (Name: 'rbrace'; Value: #125), // RIGHT CURLY BRACKET
    (Name: 'nbsp'; Value: #160), // NO-BREAK SPACE
    (Name: 'NonBreakingSpace'; Value: #160), // NO-BREAK SPACE
    (Name: 'iexcl'; Value: #161), // INVERTED EXCLAMATION MARK
    (Name: 'cent'; Value: #162), // CENT SIGN
    (Name: 'pound'; Value: #163), // POUND SIGN
    (Name: 'curren'; Value: #164), // CURRENCY SIGN
    (Name: 'yen'; Value: #165), // YEN SIGN
    (Name: 'brvbar'; Value: #166), // BROKEN BAR
    (Name: 'sect'; Value: #167), // SECTION SIGN
    (Name: 'Dot'; Value: #168), // DIAERESIS
    (Name: 'die'; Value: #168), // DIAERESIS
    (Name: 'DoubleDot'; Value: #168), // DIAERESIS
    (Name: 'uml'; Value: #168), // DIAERESIS
    (Name: 'copy'; Value: #169), // COPYRIGHT SIGN
    (Name: 'COPY'; Value: #169), // COPYRIGHT SIGN
    (Name: 'ordf'; Value: #170), // FEMININE ORDINAL INDICATOR
    (Name: 'laquo'; Value: #171), // LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
    (Name: 'not'; Value: #172), // NOT SIGN
    (Name: 'shy'; Value: #173), // SOFT HYPHEN
    (Name: 'reg'; Value: #174), // REGISTERED SIGN
    (Name: 'circledR'; Value: #174), // REGISTERED SIGN
    (Name: 'REG'; Value: #174), // REGISTERED SIGN
    (Name: 'macr'; Value: #175), // MACRON
    (Name: 'OverBar'; Value: #175), // MACRON
    (Name: 'strns'; Value: #175), // MACRON
    (Name: 'deg'; Value: #176), // DEGREE SIGN
    (Name: 'plusmn'; Value: #177), // PLUS-MINUS SIGN
    (Name: 'pm'; Value: #177), // PLUS-MINUS SIGN
    (Name: 'PlusMinus'; Value: #177), // PLUS-MINUS SIGN
    (Name: 'sup2'; Value: #178), // SUPERSCRIPT TWO
    (Name: 'sup3'; Value: #179), // SUPERSCRIPT THREE
    (Name: 'acute'; Value: #180), // ACUTE ACCENT
    (Name: 'DiacriticalAcute'; Value: #180), // ACUTE ACCENT
    (Name: 'micro'; Value: #181), // MICRO SIGN
    (Name: 'para'; Value: #182), // PILCROW SIGN
    (Name: 'middot'; Value: #183), // MIDDLE DOT
    (Name: 'centerdot'; Value: #183), // MIDDLE DOT
    (Name: 'CenterDot'; Value: #183), // MIDDLE DOT
    (Name: 'cedil'; Value: #184), // CEDILLA
    (Name: 'Cedilla'; Value: #184), // CEDILLA
    (Name: 'sup1'; Value: #185), // SUPERSCRIPT ONE
    (Name: 'ordm'; Value: #186), // MASCULINE ORDINAL INDICATOR
    (Name: 'raquo'; Value: #187), // RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
    (Name: 'frac14'; Value: #188), // VULGAR FRACTION ONE QUARTER
    (Name: 'frac12'; Value: #189), // VULGAR FRACTION ONE HALF
    (Name: 'half'; Value: #189), // VULGAR FRACTION ONE HALF
    (Name: 'frac34'; Value: #190), // VULGAR FRACTION THREE QUARTERS
    (Name: 'iquest'; Value: #191), // INVERTED QUESTION MARK
    (Name: 'Agrave'; Value: #192), // LATIN CAPITAL LETTER A WITH GRAVE
    (Name: 'Aacute'; Value: #193), // LATIN CAPITAL LETTER A WITH ACUTE
    (Name: 'Acirc'; Value: #194), // LATIN CAPITAL LETTER A WITH CIRCUMFLEX
    (Name: 'Atilde'; Value: #195), // LATIN CAPITAL LETTER A WITH TILDE
    (Name: 'Auml'; Value: #196), // LATIN CAPITAL LETTER A WITH DIAERESIS
    (Name: 'Aring'; Value: #197), // LATIN CAPITAL LETTER A WITH RING ABOVE
    (Name: 'AElig'; Value: #198), // LATIN CAPITAL LETTER AE
    (Name: 'Ccedil'; Value: #199), // LATIN CAPITAL LETTER C WITH CEDILLA
    (Name: 'Egrave'; Value: #200), // LATIN CAPITAL LETTER E WITH GRAVE
    (Name: 'Eacute'; Value: #201), // LATIN CAPITAL LETTER E WITH ACUTE
    (Name: 'Ecirc'; Value: #202), // LATIN CAPITAL LETTER E WITH CIRCUMFLEX
    (Name: 'Euml'; Value: #203), // LATIN CAPITAL LETTER E WITH DIAERESIS
    (Name: 'Igrave'; Value: #204), // LATIN CAPITAL LETTER I WITH GRAVE
    (Name: 'Iacute'; Value: #205), // LATIN CAPITAL LETTER I WITH ACUTE
    (Name: 'Icirc'; Value: #206), // LATIN CAPITAL LETTER I WITH CIRCUMFLEX
    (Name: 'Iuml'; Value: #207), // LATIN CAPITAL LETTER I WITH DIAERESIS
    (Name: 'ETH'; Value: #208), // LATIN CAPITAL LETTER ETH
    (Name: 'Ntilde'; Value: #209), // LATIN CAPITAL LETTER N WITH TILDE
    (Name: 'Ograve'; Value: #210), // LATIN CAPITAL LETTER O WITH GRAVE
    (Name: 'Oacute'; Value: #211), // LATIN CAPITAL LETTER O WITH ACUTE
    (Name: 'Ocirc'; Value: #212), // LATIN CAPITAL LETTER O WITH CIRCUMFLEX
    (Name: 'Otilde'; Value: #213), // LATIN CAPITAL LETTER O WITH TILDE
    (Name: 'Ouml'; Value: #214), // LATIN CAPITAL LETTER O WITH DIAERESIS
    (Name: 'times'; Value: #215), // MULTIPLICATION SIGN
    (Name: 'Oslash'; Value: #216), // LATIN CAPITAL LETTER O WITH STROKE
    (Name: 'Ugrave'; Value: #217), // LATIN CAPITAL LETTER U WITH GRAVE
    (Name: 'Uacute'; Value: #218), // LATIN CAPITAL LETTER U WITH ACUTE
    (Name: 'Ucirc'; Value: #219), // LATIN CAPITAL LETTER U WITH CIRCUMFLEX
    (Name: 'Uuml'; Value: #220), // LATIN CAPITAL LETTER U WITH DIAERESIS
    (Name: 'Yacute'; Value: #221), // LATIN CAPITAL LETTER Y WITH ACUTE
    (Name: 'THORN'; Value: #222), // LATIN CAPITAL LETTER THORN
    (Name: 'szlig'; Value: #223), // LATIN SMALL LETTER SHARP S
    (Name: 'agrave'; Value: #224), // LATIN SMALL LETTER A WITH GRAVE
    (Name: 'aacute'; Value: #225), // LATIN SMALL LETTER A WITH ACUTE
    (Name: 'acirc'; Value: #226), // LATIN SMALL LETTER A WITH CIRCUMFLEX
    (Name: 'atilde'; Value: #227), // LATIN SMALL LETTER A WITH TILDE
    (Name: 'auml'; Value: #228), // LATIN SMALL LETTER A WITH DIAERESIS
    (Name: 'aring'; Value: #229), // LATIN SMALL LETTER A WITH RING ABOVE
    (Name: 'aelig'; Value: #230), // LATIN SMALL LETTER AE
    (Name: 'ccedil'; Value: #231), // LATIN SMALL LETTER C WITH CEDILLA
    (Name: 'egrave'; Value: #232), // LATIN SMALL LETTER E WITH GRAVE
    (Name: 'eacute'; Value: #233), // LATIN SMALL LETTER E WITH ACUTE
    (Name: 'ecirc'; Value: #234), // LATIN SMALL LETTER E WITH CIRCUMFLEX
    (Name: 'euml'; Value: #235), // LATIN SMALL LETTER E WITH DIAERESIS
    (Name: 'igrave'; Value: #236), // LATIN SMALL LETTER I WITH GRAVE
    (Name: 'iacute'; Value: #237), // LATIN SMALL LETTER I WITH ACUTE
    (Name: 'icirc'; Value: #238), // LATIN SMALL LETTER I WITH CIRCUMFLEX
    (Name: 'iuml'; Value: #239), // LATIN SMALL LETTER I WITH DIAERESIS
    (Name: 'eth'; Value: #240), // LATIN SMALL LETTER ETH
    (Name: 'ntilde'; Value: #241), // LATIN SMALL LETTER N WITH TILDE
    (Name: 'ograve'; Value: #242), // LATIN SMALL LETTER O WITH GRAVE
    (Name: 'oacute'; Value: #243), // LATIN SMALL LETTER O WITH ACUTE
    (Name: 'ocirc'; Value: #244), // LATIN SMALL LETTER O WITH CIRCUMFLEX
    (Name: 'otilde'; Value: #245), // LATIN SMALL LETTER O WITH TILDE
    (Name: 'ouml'; Value: #246), // LATIN SMALL LETTER O WITH DIAERESIS
    (Name: 'divide'; Value: #247), // DIVISION SIGN
    (Name: 'div'; Value: #247), // DIVISION SIGN
    (Name: 'oslash'; Value: #248), // LATIN SMALL LETTER O WITH STROKE
    (Name: 'ugrave'; Value: #249), // LATIN SMALL LETTER U WITH GRAVE
    (Name: 'uacute'; Value: #250), // LATIN SMALL LETTER U WITH ACUTE
    (Name: 'ucirc'; Value: #251), // LATIN SMALL LETTER U WITH CIRCUMFLEX
    (Name: 'uuml'; Value: #252), // LATIN SMALL LETTER U WITH DIAERESIS
    (Name: 'yacute'; Value: #253), // LATIN SMALL LETTER Y WITH ACUTE
    (Name: 'thorn'; Value: #254), // LATIN SMALL LETTER THORN
    (Name: 'yuml'; Value: #255), // LATIN SMALL LETTER Y WITH DIAERESIS
    (Name: 'Amacr'; Value: #256), // LATIN CAPITAL LETTER A WITH MACRON
    (Name: 'amacr'; Value: #257), // LATIN SMALL LETTER A WITH MACRON
    (Name: 'Abreve'; Value: #258), // LATIN CAPITAL LETTER A WITH BREVE
    (Name: 'abreve'; Value: #259), // LATIN SMALL LETTER A WITH BREVE
    (Name: 'Aogon'; Value: #260), // LATIN CAPITAL LETTER A WITH OGONEK
    (Name: 'aogon'; Value: #261), // LATIN SMALL LETTER A WITH OGONEK
    (Name: 'Cacute'; Value: #262), // LATIN CAPITAL LETTER C WITH ACUTE
    (Name: 'cacute'; Value: #263), // LATIN SMALL LETTER C WITH ACUTE
    (Name: 'Ccirc'; Value: #264), // LATIN CAPITAL LETTER C WITH CIRCUMFLEX
    (Name: 'ccirc'; Value: #265), // LATIN SMALL LETTER C WITH CIRCUMFLEX
    (Name: 'Cdot'; Value: #266), // LATIN CAPITAL LETTER C WITH DOT ABOVE
    (Name: 'cdot'; Value: #267), // LATIN SMALL LETTER C WITH DOT ABOVE
    (Name: 'Ccaron'; Value: #268), // LATIN CAPITAL LETTER C WITH CARON
    (Name: 'ccaron'; Value: #269), // LATIN SMALL LETTER C WITH CARON
    (Name: 'Dcaron'; Value: #270), // LATIN CAPITAL LETTER D WITH CARON
    (Name: 'dcaron'; Value: #271), // LATIN SMALL LETTER D WITH CARON
    (Name: 'Dstrok'; Value: #272), // LATIN CAPITAL LETTER D WITH STROKE
    (Name: 'dstrok'; Value: #273), // LATIN SMALL LETTER D WITH STROKE
    (Name: 'Emacr'; Value: #274), // LATIN CAPITAL LETTER E WITH MACRON
    (Name: 'emacr'; Value: #275), // LATIN SMALL LETTER E WITH MACRON
    (Name: 'Edot'; Value: #278), // LATIN CAPITAL LETTER E WITH DOT ABOVE
    (Name: 'edot'; Value: #279), // LATIN SMALL LETTER E WITH DOT ABOVE
    (Name: 'Eogon'; Value: #280), // LATIN CAPITAL LETTER E WITH OGONEK
    (Name: 'eogon'; Value: #281), // LATIN SMALL LETTER E WITH OGONEK
    (Name: 'Ecaron'; Value: #282), // LATIN CAPITAL LETTER E WITH CARON
    (Name: 'ecaron'; Value: #283), // LATIN SMALL LETTER E WITH CARON
    (Name: 'Gcirc'; Value: #284), // LATIN CAPITAL LETTER G WITH CIRCUMFLEX
    (Name: 'gcirc'; Value: #285), // LATIN SMALL LETTER G WITH CIRCUMFLEX
    (Name: 'Gbreve'; Value: #286), // LATIN CAPITAL LETTER G WITH BREVE
    (Name: 'gbreve'; Value: #287), // LATIN SMALL LETTER G WITH BREVE
    (Name: 'Gdot'; Value: #288), // LATIN CAPITAL LETTER G WITH DOT ABOVE
    (Name: 'gdot'; Value: #289), // LATIN SMALL LETTER G WITH DOT ABOVE
    (Name: 'Gcedil'; Value: #290), // LATIN CAPITAL LETTER G WITH CEDILLA
    (Name: 'Hcirc'; Value: #292), // LATIN CAPITAL LETTER H WITH CIRCUMFLEX
    (Name: 'hcirc'; Value: #293), // LATIN SMALL LETTER H WITH CIRCUMFLEX
    (Name: 'Hstrok'; Value: #294), // LATIN CAPITAL LETTER H WITH STROKE
    (Name: 'hstrok'; Value: #295), // LATIN SMALL LETTER H WITH STROKE
    (Name: 'Itilde'; Value: #296), // LATIN CAPITAL LETTER I WITH TILDE
    (Name: 'itilde'; Value: #297), // LATIN SMALL LETTER I WITH TILDE
    (Name: 'Imacr'; Value: #298), // LATIN CAPITAL LETTER I WITH MACRON
    (Name: 'imacr'; Value: #299), // LATIN SMALL LETTER I WITH MACRON
    (Name: 'Iogon'; Value: #302), // LATIN CAPITAL LETTER I WITH OGONEK
    (Name: 'iogon'; Value: #303), // LATIN SMALL LETTER I WITH OGONEK
    (Name: 'Idot'; Value: #304), // LATIN CAPITAL LETTER I WITH DOT ABOVE
    (Name: 'imath'; Value: #305), // LATIN SMALL LETTER DOTLESS I
    (Name: 'inodot'; Value: #305), // LATIN SMALL LETTER DOTLESS I
    (Name: 'IJlig'; Value: #306), // LATIN CAPITAL LIGATURE IJ
    (Name: 'ijlig'; Value: #307), // LATIN SMALL LIGATURE IJ
    (Name: 'Jcirc'; Value: #308), // LATIN CAPITAL LETTER J WITH CIRCUMFLEX
    (Name: 'jcirc'; Value: #309), // LATIN SMALL LETTER J WITH CIRCUMFLEX
    (Name: 'Kcedil'; Value: #310), // LATIN CAPITAL LETTER K WITH CEDILLA
    (Name: 'kcedil'; Value: #311), // LATIN SMALL LETTER K WITH CEDILLA
    (Name: 'kgreen'; Value: #312), // LATIN SMALL LETTER KRA
    (Name: 'Lacute'; Value: #313), // LATIN CAPITAL LETTER L WITH ACUTE
    (Name: 'lacute'; Value: #314), // LATIN SMALL LETTER L WITH ACUTE
    (Name: 'Lcedil'; Value: #315), // LATIN CAPITAL LETTER L WITH CEDILLA
    (Name: 'lcedil'; Value: #316), // LATIN SMALL LETTER L WITH CEDILLA
    (Name: 'Lcaron'; Value: #317), // LATIN CAPITAL LETTER L WITH CARON
    (Name: 'lcaron'; Value: #318), // LATIN SMALL LETTER L WITH CARON
    (Name: 'Lmidot'; Value: #319), // LATIN CAPITAL LETTER L WITH MIDDLE DOT
    (Name: 'lmidot'; Value: #320), // LATIN SMALL LETTER L WITH MIDDLE DOT
    (Name: 'Lstrok'; Value: #321), // LATIN CAPITAL LETTER L WITH STROKE
    (Name: 'lstrok'; Value: #322), // LATIN SMALL LETTER L WITH STROKE
    (Name: 'Nacute'; Value: #323), // LATIN CAPITAL LETTER N WITH ACUTE
    (Name: 'nacute'; Value: #324), // LATIN SMALL LETTER N WITH ACUTE
    (Name: 'Ncedil'; Value: #325), // LATIN CAPITAL LETTER N WITH CEDILLA
    (Name: 'ncedil'; Value: #326), // LATIN SMALL LETTER N WITH CEDILLA
    (Name: 'Ncaron'; Value: #327), // LATIN CAPITAL LETTER N WITH CARON
    (Name: 'ncaron'; Value: #328), // LATIN SMALL LETTER N WITH CARON
    (Name: 'napos'; Value: #329), // LATIN SMALL LETTER N PRECEDED BY APOSTROPHE
    (Name: 'ENG'; Value: #330), // LATIN CAPITAL LETTER ENG
    (Name: 'eng'; Value: #331), // LATIN SMALL LETTER ENG
    (Name: 'Omacr'; Value: #332), // LATIN CAPITAL LETTER O WITH MACRON
    (Name: 'omacr'; Value: #333), // LATIN SMALL LETTER O WITH MACRON
    (Name: 'Odblac'; Value: #336), // LATIN CAPITAL LETTER O WITH DOUBLE ACUTE
    (Name: 'odblac'; Value: #337), // LATIN SMALL LETTER O WITH DOUBLE ACUTE
    (Name: 'OElig'; Value: #338), // LATIN CAPITAL LIGATURE OE
    (Name: 'oelig'; Value: #339), // LATIN SMALL LIGATURE OE
    (Name: 'Racute'; Value: #340), // LATIN CAPITAL LETTER R WITH ACUTE
    (Name: 'racute'; Value: #341), // LATIN SMALL LETTER R WITH ACUTE
    (Name: 'Rcedil'; Value: #342), // LATIN CAPITAL LETTER R WITH CEDILLA
    (Name: 'rcedil'; Value: #343), // LATIN SMALL LETTER R WITH CEDILLA
    (Name: 'Rcaron'; Value: #344), // LATIN CAPITAL LETTER R WITH CARON
    (Name: 'rcaron'; Value: #345), // LATIN SMALL LETTER R WITH CARON
    (Name: 'Sacute'; Value: #346), // LATIN CAPITAL LETTER S WITH ACUTE
    (Name: 'sacute'; Value: #347), // LATIN SMALL LETTER S WITH ACUTE
    (Name: 'Scirc'; Value: #348), // LATIN CAPITAL LETTER S WITH CIRCUMFLEX
    (Name: 'scirc'; Value: #349), // LATIN SMALL LETTER S WITH CIRCUMFLEX
    (Name: 'Scedil'; Value: #350), // LATIN CAPITAL LETTER S WITH CEDILLA
    (Name: 'scedil'; Value: #351), // LATIN SMALL LETTER S WITH CEDILLA
    (Name: 'Scaron'; Value: #352), // LATIN CAPITAL LETTER S WITH CARON
    (Name: 'scaron'; Value: #353), // LATIN SMALL LETTER S WITH CARON
    (Name: 'Tcedil'; Value: #354), // LATIN CAPITAL LETTER T WITH CEDILLA
    (Name: 'tcedil'; Value: #355), // LATIN SMALL LETTER T WITH CEDILLA
    (Name: 'Tcaron'; Value: #356), // LATIN CAPITAL LETTER T WITH CARON
    (Name: 'tcaron'; Value: #357), // LATIN SMALL LETTER T WITH CARON
    (Name: 'Tstrok'; Value: #358), // LATIN CAPITAL LETTER T WITH STROKE
    (Name: 'tstrok'; Value: #359), // LATIN SMALL LETTER T WITH STROKE
    (Name: 'Utilde'; Value: #360), // LATIN CAPITAL LETTER U WITH TILDE
    (Name: 'utilde'; Value: #361), // LATIN SMALL LETTER U WITH TILDE
    (Name: 'Umacr'; Value: #362), // LATIN CAPITAL LETTER U WITH MACRON
    (Name: 'umacr'; Value: #363), // LATIN SMALL LETTER U WITH MACRON
    (Name: 'Ubreve'; Value: #364), // LATIN CAPITAL LETTER U WITH BREVE
    (Name: 'ubreve'; Value: #365), // LATIN SMALL LETTER U WITH BREVE
    (Name: 'Uring'; Value: #366), // LATIN CAPITAL LETTER U WITH RING ABOVE
    (Name: 'uring'; Value: #367), // LATIN SMALL LETTER U WITH RING ABOVE
    (Name: 'Udblac'; Value: #368), // LATIN CAPITAL LETTER U WITH DOUBLE ACUTE
    (Name: 'udblac'; Value: #369), // LATIN SMALL LETTER U WITH DOUBLE ACUTE
    (Name: 'Uogon'; Value: #370), // LATIN CAPITAL LETTER U WITH OGONEK
    (Name: 'uogon'; Value: #371), // LATIN SMALL LETTER U WITH OGONEK
    (Name: 'Wcirc'; Value: #372), // LATIN CAPITAL LETTER W WITH CIRCUMFLEX
    (Name: 'wcirc'; Value: #373), // LATIN SMALL LETTER W WITH CIRCUMFLEX
    (Name: 'Ycirc'; Value: #374), // LATIN CAPITAL LETTER Y WITH CIRCUMFLEX
    (Name: 'ycirc'; Value: #375), // LATIN SMALL LETTER Y WITH CIRCUMFLEX
    (Name: 'Yuml'; Value: #376), // LATIN CAPITAL LETTER Y WITH DIAERESIS
    (Name: 'Zacute'; Value: #377), // LATIN CAPITAL LETTER Z WITH ACUTE
    (Name: 'zacute'; Value: #378), // LATIN SMALL LETTER Z WITH ACUTE
    (Name: 'Zdot'; Value: #379), // LATIN CAPITAL LETTER Z WITH DOT ABOVE
    (Name: 'zdot'; Value: #380), // LATIN SMALL LETTER Z WITH DOT ABOVE
    (Name: 'Zcaron'; Value: #381), // LATIN CAPITAL LETTER Z WITH CARON
    (Name: 'zcaron'; Value: #382), // LATIN SMALL LETTER Z WITH CARON
    (Name: 'fnof'; Value: #402), // LATIN SMALL LETTER F WITH HOOK
    (Name: 'imped'; Value: #437), // LATIN CAPITAL LETTER Z WITH STROKE
    (Name: 'gacute'; Value: #501), // LATIN SMALL LETTER G WITH ACUTE
    (Name: 'jmath'; Value: #567), // LATIN SMALL LETTER DOTLESS J
    (Name: 'circ'; Value: #710), // MODIFIER LETTER CIRCUMFLEX ACCENT
    (Name: 'caron'; Value: #711), // CARON
    (Name: 'Hacek'; Value: #711), // CARON
    (Name: 'breve'; Value: #728), // BREVE
    (Name: 'Breve'; Value: #728), // BREVE
    (Name: 'dot'; Value: #729), // DOT ABOVE
    (Name: 'DiacriticalDot'; Value: #729), // DOT ABOVE
    (Name: 'ring'; Value: #730), // RING ABOVE
    (Name: 'ogon'; Value: #731), // OGONEK
    (Name: 'tilde'; Value: #732), // SMALL TILDE
    (Name: 'DiacriticalTilde'; Value: #732), // SMALL TILDE
    (Name: 'dblac'; Value: #733), // DOUBLE ACUTE ACCENT
    (Name: 'DiacriticalDoubleAcute'; Value: #733), // DOUBLE ACUTE ACCENT
    (Name: 'DownBreve'; Value: #785), // COMBINING INVERTED BREVE
    (Name: 'UnderBar'; Value: #818), // COMBINING LOW LINE
    (Name: 'Alpha'; Value: #913), // GREEK CAPITAL LETTER ALPHA
    (Name: 'Beta'; Value: #914), // GREEK CAPITAL LETTER BETA
    (Name: 'Gamma'; Value: #915), // GREEK CAPITAL LETTER GAMMA
    (Name: 'Delta'; Value: #916), // GREEK CAPITAL LETTER DELTA
    (Name: 'Epsilon'; Value: #917), // GREEK CAPITAL LETTER EPSILON
    (Name: 'Zeta'; Value: #918), // GREEK CAPITAL LETTER ZETA
    (Name: 'Eta'; Value: #919), // GREEK CAPITAL LETTER ETA
    (Name: 'Theta'; Value: #920), // GREEK CAPITAL LETTER THETA
    (Name: 'Iota'; Value: #921), // GREEK CAPITAL LETTER IOTA
    (Name: 'Kappa'; Value: #922), // GREEK CAPITAL LETTER KAPPA
    (Name: 'Lambda'; Value: #923), // GREEK CAPITAL LETTER LAMDA
    (Name: 'Mu'; Value: #924), // GREEK CAPITAL LETTER MU
    (Name: 'Nu'; Value: #925), // GREEK CAPITAL LETTER NU
    (Name: 'Xi'; Value: #926), // GREEK CAPITAL LETTER XI
    (Name: 'Omicron'; Value: #927), // GREEK CAPITAL LETTER OMICRON
    (Name: 'Pi'; Value: #928), // GREEK CAPITAL LETTER PI
    (Name: 'Rho'; Value: #929), // GREEK CAPITAL LETTER RHO
    (Name: 'Sigma'; Value: #931), // GREEK CAPITAL LETTER SIGMA
    (Name: 'Tau'; Value: #932), // GREEK CAPITAL LETTER TAU
    (Name: 'Upsilon'; Value: #933), // GREEK CAPITAL LETTER UPSILON
    (Name: 'Phi'; Value: #934), // GREEK CAPITAL LETTER PHI
    (Name: 'Chi'; Value: #935), // GREEK CAPITAL LETTER CHI
    (Name: 'Psi'; Value: #936), // GREEK CAPITAL LETTER PSI
    (Name: 'Omega'; Value: #937), // GREEK CAPITAL LETTER OMEGA
    (Name: 'alpha'; Value: #945), // GREEK SMALL LETTER ALPHA
    (Name: 'beta'; Value: #946), // GREEK SMALL LETTER BETA
    (Name: 'gamma'; Value: #947), // GREEK SMALL LETTER GAMMA
    (Name: 'delta'; Value: #948), // GREEK SMALL LETTER DELTA
    (Name: 'epsiv'; Value: #949), // GREEK SMALL LETTER EPSILON
    (Name: 'varepsilon'; Value: #949), // GREEK SMALL LETTER EPSILON
    (Name: 'epsilon'; Value: #949), // GREEK SMALL LETTER EPSILON
    (Name: 'zeta'; Value: #950), // GREEK SMALL LETTER ZETA
    (Name: 'eta'; Value: #951), // GREEK SMALL LETTER ETA
    (Name: 'theta'; Value: #952), // GREEK SMALL LETTER THETA
    (Name: 'iota'; Value: #953), // GREEK SMALL LETTER IOTA
    (Name: 'kappa'; Value: #954), // GREEK SMALL LETTER KAPPA
    (Name: 'lambda'; Value: #955), // GREEK SMALL LETTER LAMDA
    (Name: 'mu'; Value: #956), // GREEK SMALL LETTER MU
    (Name: 'nu'; Value: #957), // GREEK SMALL LETTER NU
    (Name: 'xi'; Value: #958), // GREEK SMALL LETTER XI
    (Name: 'omicron'; Value: #959), // GREEK SMALL LETTER OMICRON
    (Name: 'pi'; Value: #960), // GREEK SMALL LETTER PI
    (Name: 'rho'; Value: #961), // GREEK SMALL LETTER RHO
    (Name: 'sigmav'; Value: #962), // GREEK SMALL LETTER FINAL SIGMA
    (Name: 'varsigma'; Value: #962), // GREEK SMALL LETTER FINAL SIGMA
    (Name: 'sigmaf'; Value: #962), // GREEK SMALL LETTER FINAL SIGMA
    (Name: 'sigma'; Value: #963), // GREEK SMALL LETTER SIGMA
    (Name: 'tau'; Value: #964), // GREEK SMALL LETTER TAU
    (Name: 'upsi'; Value: #965), // GREEK SMALL LETTER UPSILON
    (Name: 'upsilon'; Value: #965), // GREEK SMALL LETTER UPSILON
    (Name: 'phi'; Value: #966), // GREEK SMALL LETTER PHI
    (Name: 'phiv'; Value: #966), // GREEK SMALL LETTER PHI
    (Name: 'varphi'; Value: #966), // GREEK SMALL LETTER PHI
    (Name: 'chi'; Value: #967), // GREEK SMALL LETTER CHI
    (Name: 'psi'; Value: #968), // GREEK SMALL LETTER PSI
    (Name: 'omega'; Value: #969), // GREEK SMALL LETTER OMEGA
    (Name: 'thetav'; Value: #977), // GREEK THETA SYMBOL
    (Name: 'vartheta'; Value: #977), // GREEK THETA SYMBOL
    (Name: 'thetasym'; Value: #977), // GREEK THETA SYMBOL
    (Name: 'Upsi'; Value: #978), // GREEK UPSILON WITH HOOK SYMBOL
    (Name: 'upsih'; Value: #978), // GREEK UPSILON WITH HOOK SYMBOL
    (Name: 'straightphi'; Value: #981), // GREEK PHI SYMBOL
    (Name: 'piv'; Value: #982), // GREEK PI SYMBOL
    (Name: 'varpi'; Value: #982), // GREEK PI SYMBOL
    (Name: 'Gammad'; Value: #988), // GREEK LETTER DIGAMMA
    (Name: 'gammad'; Value: #989), // GREEK SMALL LETTER DIGAMMA
    (Name: 'digamma'; Value: #989), // GREEK SMALL LETTER DIGAMMA
    (Name: 'kappav'; Value: #1008), // GREEK KAPPA SYMBOL
    (Name: 'varkappa'; Value: #1008), // GREEK KAPPA SYMBOL
    (Name: 'rhov'; Value: #1009), // GREEK RHO SYMBOL
    (Name: 'varrho'; Value: #1009), // GREEK RHO SYMBOL
    (Name: 'epsi'; Value: #1013), // GREEK LUNATE EPSILON SYMBOL
    (Name: 'straightepsilon'; Value: #1013), // GREEK LUNATE EPSILON SYMBOL
    (Name: 'bepsi'; Value: #1014), // GREEK REVERSED LUNATE EPSILON SYMBOL
    (Name: 'backepsilon'; Value: #1014), // GREEK REVERSED LUNATE EPSILON SYMBOL
    (Name: 'IOcy'; Value: #1025), // CYRILLIC CAPITAL LETTER IO
    (Name: 'DJcy'; Value: #1026), // CYRILLIC CAPITAL LETTER DJE
    (Name: 'GJcy'; Value: #1027), // CYRILLIC CAPITAL LETTER GJE
    (Name: 'Jukcy'; Value: #1028), // CYRILLIC CAPITAL LETTER UKRAINIAN IE
    (Name: 'DScy'; Value: #1029), // CYRILLIC CAPITAL LETTER DZE
    (Name: 'Iukcy'; Value: #1030), // CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I
    (Name: 'YIcy'; Value: #1031), // CYRILLIC CAPITAL LETTER YI
    (Name: 'Jsercy'; Value: #1032), // CYRILLIC CAPITAL LETTER JE
    (Name: 'LJcy'; Value: #1033), // CYRILLIC CAPITAL LETTER LJE
    (Name: 'NJcy'; Value: #1034), // CYRILLIC CAPITAL LETTER NJE
    (Name: 'TSHcy'; Value: #1035), // CYRILLIC CAPITAL LETTER TSHE
    (Name: 'KJcy'; Value: #1036), // CYRILLIC CAPITAL LETTER KJE
    (Name: 'Ubrcy'; Value: #1038), // CYRILLIC CAPITAL LETTER SHORT U
    (Name: 'DZcy'; Value: #1039), // CYRILLIC CAPITAL LETTER DZHE
    (Name: 'Acy'; Value: #1040), // CYRILLIC CAPITAL LETTER A
    (Name: 'Bcy'; Value: #1041), // CYRILLIC CAPITAL LETTER BE
    (Name: 'Vcy'; Value: #1042), // CYRILLIC CAPITAL LETTER VE
    (Name: 'Gcy'; Value: #1043), // CYRILLIC CAPITAL LETTER GHE
    (Name: 'Dcy'; Value: #1044), // CYRILLIC CAPITAL LETTER DE
    (Name: 'IEcy'; Value: #1045), // CYRILLIC CAPITAL LETTER IE
    (Name: 'ZHcy'; Value: #1046), // CYRILLIC CAPITAL LETTER ZHE
    (Name: 'Zcy'; Value: #1047), // CYRILLIC CAPITAL LETTER ZE
    (Name: 'Icy'; Value: #1048), // CYRILLIC CAPITAL LETTER I
    (Name: 'Jcy'; Value: #1049), // CYRILLIC CAPITAL LETTER SHORT I
    (Name: 'Kcy'; Value: #1050), // CYRILLIC CAPITAL LETTER KA
    (Name: 'Lcy'; Value: #1051), // CYRILLIC CAPITAL LETTER EL
    (Name: 'Mcy'; Value: #1052), // CYRILLIC CAPITAL LETTER EM
    (Name: 'Ncy'; Value: #1053), // CYRILLIC CAPITAL LETTER EN
    (Name: 'Ocy'; Value: #1054), // CYRILLIC CAPITAL LETTER O
    (Name: 'Pcy'; Value: #1055), // CYRILLIC CAPITAL LETTER PE
    (Name: 'Rcy'; Value: #1056), // CYRILLIC CAPITAL LETTER ER
    (Name: 'Scy'; Value: #1057), // CYRILLIC CAPITAL LETTER ES
    (Name: 'Tcy'; Value: #1058), // CYRILLIC CAPITAL LETTER TE
    (Name: 'Ucy'; Value: #1059), // CYRILLIC CAPITAL LETTER U
    (Name: 'Fcy'; Value: #1060), // CYRILLIC CAPITAL LETTER EF
    (Name: 'KHcy'; Value: #1061), // CYRILLIC CAPITAL LETTER HA
    (Name: 'TScy'; Value: #1062), // CYRILLIC CAPITAL LETTER TSE
    (Name: 'CHcy'; Value: #1063), // CYRILLIC CAPITAL LETTER CHE
    (Name: 'SHcy'; Value: #1064), // CYRILLIC CAPITAL LETTER SHA
    (Name: 'SHCHcy'; Value: #1065), // CYRILLIC CAPITAL LETTER SHCHA
    (Name: 'HARDcy'; Value: #1066), // CYRILLIC CAPITAL LETTER HARD SIGN
    (Name: 'Ycy'; Value: #1067), // CYRILLIC CAPITAL LETTER YERU
    (Name: 'SOFTcy'; Value: #1068), // CYRILLIC CAPITAL LETTER SOFT SIGN
    (Name: 'Ecy'; Value: #1069), // CYRILLIC CAPITAL LETTER E
    (Name: 'YUcy'; Value: #1070), // CYRILLIC CAPITAL LETTER YU
    (Name: 'YAcy'; Value: #1071), // CYRILLIC CAPITAL LETTER YA
    (Name: 'acy'; Value: #1072), // CYRILLIC SMALL LETTER A
    (Name: 'bcy'; Value: #1073), // CYRILLIC SMALL LETTER BE
    (Name: 'vcy'; Value: #1074), // CYRILLIC SMALL LETTER VE
    (Name: 'gcy'; Value: #1075), // CYRILLIC SMALL LETTER GHE
    (Name: 'dcy'; Value: #1076), // CYRILLIC SMALL LETTER DE
    (Name: 'iecy'; Value: #1077), // CYRILLIC SMALL LETTER IE
    (Name: 'zhcy'; Value: #1078), // CYRILLIC SMALL LETTER ZHE
    (Name: 'zcy'; Value: #1079), // CYRILLIC SMALL LETTER ZE
    (Name: 'icy'; Value: #1080), // CYRILLIC SMALL LETTER I
    (Name: 'jcy'; Value: #1081), // CYRILLIC SMALL LETTER SHORT I
    (Name: 'kcy'; Value: #1082), // CYRILLIC SMALL LETTER KA
    (Name: 'lcy'; Value: #1083), // CYRILLIC SMALL LETTER EL
    (Name: 'mcy'; Value: #1084), // CYRILLIC SMALL LETTER EM
    (Name: 'ncy'; Value: #1085), // CYRILLIC SMALL LETTER EN
    (Name: 'ocy'; Value: #1086), // CYRILLIC SMALL LETTER O
    (Name: 'pcy'; Value: #1087), // CYRILLIC SMALL LETTER PE
    (Name: 'rcy'; Value: #1088), // CYRILLIC SMALL LETTER ER
    (Name: 'scy'; Value: #1089), // CYRILLIC SMALL LETTER ES
    (Name: 'tcy'; Value: #1090), // CYRILLIC SMALL LETTER TE
    (Name: 'ucy'; Value: #1091), // CYRILLIC SMALL LETTER U
    (Name: 'fcy'; Value: #1092), // CYRILLIC SMALL LETTER EF
    (Name: 'khcy'; Value: #1093), // CYRILLIC SMALL LETTER HA
    (Name: 'tscy'; Value: #1094), // CYRILLIC SMALL LETTER TSE
    (Name: 'chcy'; Value: #1095), // CYRILLIC SMALL LETTER CHE
    (Name: 'shcy'; Value: #1096), // CYRILLIC SMALL LETTER SHA
    (Name: 'shchcy'; Value: #1097), // CYRILLIC SMALL LETTER SHCHA
    (Name: 'hardcy'; Value: #1098), // CYRILLIC SMALL LETTER HARD SIGN
    (Name: 'ycy'; Value: #1099), // CYRILLIC SMALL LETTER YERU
    (Name: 'softcy'; Value: #1100), // CYRILLIC SMALL LETTER SOFT SIGN
    (Name: 'ecy'; Value: #1101), // CYRILLIC SMALL LETTER E
    (Name: 'yucy'; Value: #1102), // CYRILLIC SMALL LETTER YU
    (Name: 'yacy'; Value: #1103), // CYRILLIC SMALL LETTER YA
    (Name: 'iocy'; Value: #1105), // CYRILLIC SMALL LETTER IO
    (Name: 'djcy'; Value: #1106), // CYRILLIC SMALL LETTER DJE
    (Name: 'gjcy'; Value: #1107), // CYRILLIC SMALL LETTER GJE
    (Name: 'jukcy'; Value: #1108), // CYRILLIC SMALL LETTER UKRAINIAN IE
    (Name: 'dscy'; Value: #1109), // CYRILLIC SMALL LETTER DZE
    (Name: 'iukcy'; Value: #1110), // CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I
    (Name: 'yicy'; Value: #1111), // CYRILLIC SMALL LETTER YI
    (Name: 'jsercy'; Value: #1112), // CYRILLIC SMALL LETTER JE
    (Name: 'ljcy'; Value: #1113), // CYRILLIC SMALL LETTER LJE
    (Name: 'njcy'; Value: #1114), // CYRILLIC SMALL LETTER NJE
    (Name: 'tshcy'; Value: #1115), // CYRILLIC SMALL LETTER TSHE
    (Name: 'kjcy'; Value: #1116), // CYRILLIC SMALL LETTER KJE
    (Name: 'ubrcy'; Value: #1118), // CYRILLIC SMALL LETTER SHORT U
    (Name: 'dzcy'; Value: #1119), // CYRILLIC SMALL LETTER DZHE
    (Name: 'ensp'; Value: #8194), // EN SPACE
    (Name: 'emsp'; Value: #8195), // EM SPACE
    (Name: 'emsp13'; Value: #8196), // THREE-PER-EM SPACE
    (Name: 'emsp14'; Value: #8197), // FOUR-PER-EM SPACE
    (Name: 'numsp'; Value: #8199), // FIGURE SPACE
    (Name: 'puncsp'; Value: #8200), // PUNCTUATION SPACE
    (Name: 'thinsp'; Value: #8201), // THIN SPACE
    (Name: 'ThinSpace'; Value: #8201), // THIN SPACE
    (Name: 'hairsp'; Value: #8202), // HAIR SPACE
    (Name: 'VeryThinSpace'; Value: #8202), // HAIR SPACE
    (Name: 'ZeroWidthSpace'; Value: #8203), // ZERO WIDTH SPACE
    (Name: 'NegativeVeryThinSpace'; Value: #8203), // ZERO WIDTH SPACE
    (Name: 'NegativeThinSpace'; Value: #8203), // ZERO WIDTH SPACE
    (Name: 'NegativeMediumSpace'; Value: #8203), // ZERO WIDTH SPACE
    (Name: 'NegativeThickSpace'; Value: #8203), // ZERO WIDTH SPACE
    (Name: 'zwnj'; Value: #8204), // ZERO WIDTH NON-JOINER
    (Name: 'zwj'; Value: #8205), // ZERO WIDTH JOINER
    (Name: 'lrm'; Value: #8206), // LEFT-TO-RIGHT MARK
    (Name: 'rlm'; Value: #8207), // RIGHT-TO-LEFT MARK
    (Name: 'hyphen'; Value: #8208), // HYPHEN
    (Name: 'dash'; Value: #8208), // HYPHEN
    (Name: 'ndash'; Value: #8211), // EN DASH
    (Name: 'mdash'; Value: #8212), // EM DASH
    (Name: 'horbar'; Value: #8213), // HORIZONTAL BAR
    (Name: 'Verbar'; Value: #8214), // DOUBLE VERTICAL LINE
    (Name: 'Vert'; Value: #8214), // DOUBLE VERTICAL LINE
    (Name: 'lsquo'; Value: #8216), // LEFT SINGLE QUOTATION MARK
    (Name: 'OpenCurlyQuote'; Value: #8216), // LEFT SINGLE QUOTATION MARK
    (Name: 'rsquo'; Value: #8217), // RIGHT SINGLE QUOTATION MARK
    (Name: 'rsquor'; Value: #8217), // RIGHT SINGLE QUOTATION MARK
    (Name: 'CloseCurlyQuote'; Value: #8217), // RIGHT SINGLE QUOTATION MARK
    (Name: 'lsquor'; Value: #8218), // SINGLE LOW-9 QUOTATION MARK
    (Name: 'sbquo'; Value: #8218), // SINGLE LOW-9 QUOTATION MARK
    (Name: 'ldquo'; Value: #8220), // LEFT DOUBLE QUOTATION MARK
    (Name: 'OpenCurlyDoubleQuote'; Value: #8220), // LEFT DOUBLE QUOTATION MARK
    (Name: 'rdquo'; Value: #8221), // RIGHT DOUBLE QUOTATION MARK
    (Name: 'rdquor'; Value: #8221), // RIGHT DOUBLE QUOTATION MARK
    (Name: 'CloseCurlyDoubleQuote'; Value: #8221), // RIGHT DOUBLE QUOTATION MARK
    (Name: 'ldquor'; Value: #8222), // DOUBLE LOW-9 QUOTATION MARK
    (Name: 'bdquo'; Value: #8222), // DOUBLE LOW-9 QUOTATION MARK
    (Name: 'dagger'; Value: #8224), // DAGGER
    (Name: 'Dagger'; Value: #8225), // DOUBLE DAGGER
    (Name: 'ddagger'; Value: #8225), // DOUBLE DAGGER
    (Name: 'bull'; Value: #8226), // BULLET
    (Name: 'bullet'; Value: #8226), // BULLET
    (Name: 'nldr'; Value: #8229), // TWO DOT LEADER
    (Name: 'hellip'; Value: #8230), // HORIZONTAL ELLIPSIS
    (Name: 'mldr'; Value: #8230), // HORIZONTAL ELLIPSIS
    (Name: 'permil'; Value: #8240), // PER MILLE SIGN
    (Name: 'pertenk'; Value: #8241), // PER TEN THOUSAND SIGN
    (Name: 'prime'; Value: #8242), // PRIME
    (Name: 'Prime'; Value: #8243), // DOUBLE PRIME
    (Name: 'tprime'; Value: #8244), // TRIPLE PRIME
    (Name: 'bprime'; Value: #8245), // REVERSED PRIME
    (Name: 'backprime'; Value: #8245), // REVERSED PRIME
    (Name: 'lsaquo'; Value: #8249), // SINGLE LEFT-POINTING ANGLE QUOTATION MARK
    (Name: 'rsaquo'; Value: #8250), // SINGLE RIGHT-POINTING ANGLE QUOTATION MARK
    (Name: 'oline'; Value: #8254), // OVERLINE
    (Name: 'caret'; Value: #8257), // CARET INSERTION POINT
    (Name: 'hybull'; Value: #8259), // HYPHEN BULLET
    (Name: 'frasl'; Value: #8260), // FRACTION SLASH
    (Name: 'bsemi'; Value: #8271), // REVERSED SEMICOLON
    (Name: 'qprime'; Value: #8279), // QUADRUPLE PRIME
    (Name: 'MediumSpace'; Value: #8287), // MEDIUM MATHEMATICAL SPACE
    (Name: 'NoBreak'; Value: #8288), // WORD JOINER
    (Name: 'ApplyFunction'; Value: #8289), // FUNCTION APPLICATION
    (Name: 'af'; Value: #8289), // FUNCTION APPLICATION
    (Name: 'InvisibleTimes'; Value: #8290), // INVISIBLE TIMES
    (Name: 'it'; Value: #8290), // INVISIBLE TIMES
    (Name: 'InvisibleComma'; Value: #8291), // INVISIBLE SEPARATOR
    (Name: 'ic'; Value: #8291), // INVISIBLE SEPARATOR
    (Name: 'euro'; Value: #8364), // EURO SIGN
    (Name: 'tdot'; Value: #8411), // COMBINING THREE DOTS ABOVE
    (Name: 'TripleDot'; Value: #8411), // COMBINING THREE DOTS ABOVE
    (Name: 'DotDot'; Value: #8412), // COMBINING FOUR DOTS ABOVE
    (Name: 'Copf'; Value: #8450), // DOUBLE-STRUCK CAPITAL C
    (Name: 'complexes'; Value: #8450), // DOUBLE-STRUCK CAPITAL C
    (Name: 'incare'; Value: #8453), // CARE OF
    (Name: 'gscr'; Value: #8458), // SCRIPT SMALL G
    (Name: 'hamilt'; Value: #8459), // SCRIPT CAPITAL H
    (Name: 'HilbertSpace'; Value: #8459), // SCRIPT CAPITAL H
    (Name: 'Hscr'; Value: #8459), // SCRIPT CAPITAL H
    (Name: 'Hfr'; Value: #8460), // BLACK-LETTER CAPITAL H
    (Name: 'Poincareplane'; Value: #8460), // BLACK-LETTER CAPITAL H
    (Name: 'quaternions'; Value: #8461), // DOUBLE-STRUCK CAPITAL H
    (Name: 'Hopf'; Value: #8461), // DOUBLE-STRUCK CAPITAL H
    (Name: 'planckh'; Value: #8462), // PLANCK CONSTANT
    (Name: 'planck'; Value: #8463), // PLANCK CONSTANT OVER TWO PI
    (Name: 'hbar'; Value: #8463), // PLANCK CONSTANT OVER TWO PI
    (Name: 'plankv'; Value: #8463), // PLANCK CONSTANT OVER TWO PI
    (Name: 'hslash'; Value: #8463), // PLANCK CONSTANT OVER TWO PI
    (Name: 'Iscr'; Value: #8464), // SCRIPT CAPITAL I
    (Name: 'imagline'; Value: #8464), // SCRIPT CAPITAL I
    (Name: 'image'; Value: #8465), // BLACK-LETTER CAPITAL I
    (Name: 'Im'; Value: #8465), // BLACK-LETTER CAPITAL I
    (Name: 'imagpart'; Value: #8465), // BLACK-LETTER CAPITAL I
    (Name: 'Ifr'; Value: #8465), // BLACK-LETTER CAPITAL I
    (Name: 'Lscr'; Value: #8466), // SCRIPT CAPITAL L
    (Name: 'lagran'; Value: #8466), // SCRIPT CAPITAL L
    (Name: 'Laplacetrf'; Value: #8466), // SCRIPT CAPITAL L
    (Name: 'ell'; Value: #8467), // SCRIPT SMALL L
    (Name: 'Nopf'; Value: #8469), // DOUBLE-STRUCK CAPITAL N
    (Name: 'naturals'; Value: #8469), // DOUBLE-STRUCK CAPITAL N
    (Name: 'numero'; Value: #8470), // NUMERO SIGN
    (Name: 'copysr'; Value: #8471), // SOUND RECORDING COPYRIGHT
    (Name: 'weierp'; Value: #8472), // SCRIPT CAPITAL P
    (Name: 'wp'; Value: #8472), // SCRIPT CAPITAL P
    (Name: 'Popf'; Value: #8473), // DOUBLE-STRUCK CAPITAL P
    (Name: 'primes'; Value: #8473), // DOUBLE-STRUCK CAPITAL P
    (Name: 'rationals'; Value: #8474), // DOUBLE-STRUCK CAPITAL Q
    (Name: 'Qopf'; Value: #8474), // DOUBLE-STRUCK CAPITAL Q
    (Name: 'Rscr'; Value: #8475), // SCRIPT CAPITAL R
    (Name: 'realine'; Value: #8475), // SCRIPT CAPITAL R
    (Name: 'real'; Value: #8476), // BLACK-LETTER CAPITAL R
    (Name: 'Re'; Value: #8476), // BLACK-LETTER CAPITAL R
    (Name: 'realpart'; Value: #8476), // BLACK-LETTER CAPITAL R
    (Name: 'Rfr'; Value: #8476), // BLACK-LETTER CAPITAL R
    (Name: 'reals'; Value: #8477), // DOUBLE-STRUCK CAPITAL R
    (Name: 'Ropf'; Value: #8477), // DOUBLE-STRUCK CAPITAL R
    (Name: 'rx'; Value: #8478), // PRESCRIPTION TAKE
    (Name: 'trade'; Value: #8482), // TRADE MARK SIGN
    (Name: 'TRADE'; Value: #8482), // TRADE MARK SIGN
    (Name: 'integers'; Value: #8484), // DOUBLE-STRUCK CAPITAL Z
    (Name: 'Zopf'; Value: #8484), // DOUBLE-STRUCK CAPITAL Z
    (Name: 'ohm'; Value: #8486), // OHM SIGN
    (Name: 'mho'; Value: #8487), // INVERTED OHM SIGN
    (Name: 'Zfr'; Value: #8488), // BLACK-LETTER CAPITAL Z
    (Name: 'zeetrf'; Value: #8488), // BLACK-LETTER CAPITAL Z
    (Name: 'iiota'; Value: #8489), // TURNED GREEK SMALL LETTER IOTA
    (Name: 'angst'; Value: #8491), // ANGSTROM SIGN
    (Name: 'bernou'; Value: #8492), // SCRIPT CAPITAL B
    (Name: 'Bernoullis'; Value: #8492), // SCRIPT CAPITAL B
    (Name: 'Bscr'; Value: #8492), // SCRIPT CAPITAL B
    (Name: 'Cfr'; Value: #8493), // BLACK-LETTER CAPITAL C
    (Name: 'Cayleys'; Value: #8493), // BLACK-LETTER CAPITAL C
    (Name: 'escr'; Value: #8495), // SCRIPT SMALL E
    (Name: 'Escr'; Value: #8496), // SCRIPT CAPITAL E
    (Name: 'expectation'; Value: #8496), // SCRIPT CAPITAL E
    (Name: 'Fscr'; Value: #8497), // SCRIPT CAPITAL F
    (Name: 'Fouriertrf'; Value: #8497), // SCRIPT CAPITAL F
    (Name: 'phmmat'; Value: #8499), // SCRIPT CAPITAL M
    (Name: 'Mellintrf'; Value: #8499), // SCRIPT CAPITAL M
    (Name: 'Mscr'; Value: #8499), // SCRIPT CAPITAL M
    (Name: 'order'; Value: #8500), // SCRIPT SMALL O
    (Name: 'orderof'; Value: #8500), // SCRIPT SMALL O
    (Name: 'oscr'; Value: #8500), // SCRIPT SMALL O
    (Name: 'alefsym'; Value: #8501), // ALEF SYMBOL
    (Name: 'aleph'; Value: #8501), // ALEF SYMBOL
    (Name: 'beth'; Value: #8502), // BET SYMBOL
    (Name: 'gimel'; Value: #8503), // GIMEL SYMBOL
    (Name: 'daleth'; Value: #8504), // DALET SYMBOL
    (Name: 'CapitalDifferentialD'; Value: #8517), // DOUBLE-STRUCK ITALIC CAPITAL D
    (Name: 'DD'; Value: #8517), // DOUBLE-STRUCK ITALIC CAPITAL D
    (Name: 'DifferentialD'; Value: #8518), // DOUBLE-STRUCK ITALIC SMALL D
    (Name: 'dd'; Value: #8518), // DOUBLE-STRUCK ITALIC SMALL D
    (Name: 'ExponentialE'; Value: #8519), // DOUBLE-STRUCK ITALIC SMALL E
    (Name: 'exponentiale'; Value: #8519), // DOUBLE-STRUCK ITALIC SMALL E
    (Name: 'ee'; Value: #8519), // DOUBLE-STRUCK ITALIC SMALL E
    (Name: 'ImaginaryI'; Value: #8520), // DOUBLE-STRUCK ITALIC SMALL I
    (Name: 'ii'; Value: #8520), // DOUBLE-STRUCK ITALIC SMALL I
    (Name: 'frac13'; Value: #8531), // VULGAR FRACTION ONE THIRD
    (Name: 'frac23'; Value: #8532), // VULGAR FRACTION TWO THIRDS
    (Name: 'frac15'; Value: #8533), // VULGAR FRACTION ONE FIFTH
    (Name: 'frac25'; Value: #8534), // VULGAR FRACTION TWO FIFTHS
    (Name: 'frac35'; Value: #8535), // VULGAR FRACTION THREE FIFTHS
    (Name: 'frac45'; Value: #8536), // VULGAR FRACTION FOUR FIFTHS
    (Name: 'frac16'; Value: #8537), // VULGAR FRACTION ONE SIXTH
    (Name: 'frac56'; Value: #8538), // VULGAR FRACTION FIVE SIXTHS
    (Name: 'frac18'; Value: #8539), // VULGAR FRACTION ONE EIGHTH
    (Name: 'frac38'; Value: #8540), // VULGAR FRACTION THREE EIGHTHS
    (Name: 'frac58'; Value: #8541), // VULGAR FRACTION FIVE EIGHTHS
    (Name: 'frac78'; Value: #8542), // VULGAR FRACTION SEVEN EIGHTHS
    (Name: 'larr'; Value: #8592), // LEFTWARDS ARROW
    (Name: 'leftarrow'; Value: #8592), // LEFTWARDS ARROW
    (Name: 'LeftArrow'; Value: #8592), // LEFTWARDS ARROW
    (Name: 'slarr'; Value: #8592), // LEFTWARDS ARROW
    (Name: 'ShortLeftArrow'; Value: #8592), // LEFTWARDS ARROW
    (Name: 'uarr'; Value: #8593), // UPWARDS ARROW
    (Name: 'uparrow'; Value: #8593), // UPWARDS ARROW
    (Name: 'UpArrow'; Value: #8593), // UPWARDS ARROW
    (Name: 'ShortUpArrow'; Value: #8593), // UPWARDS ARROW
    (Name: 'rarr'; Value: #8594), // RIGHTWARDS ARROW
    (Name: 'rightarrow'; Value: #8594), // RIGHTWARDS ARROW
    (Name: 'RightArrow'; Value: #8594), // RIGHTWARDS ARROW
    (Name: 'srarr'; Value: #8594), // RIGHTWARDS ARROW
    (Name: 'ShortRightArrow'; Value: #8594), // RIGHTWARDS ARROW
    (Name: 'darr'; Value: #8595), // DOWNWARDS ARROW
    (Name: 'downarrow'; Value: #8595), // DOWNWARDS ARROW
    (Name: 'DownArrow'; Value: #8595), // DOWNWARDS ARROW
    (Name: 'ShortDownArrow'; Value: #8595), // DOWNWARDS ARROW
    (Name: 'harr'; Value: #8596), // LEFT RIGHT ARROW
    (Name: 'leftrightarrow'; Value: #8596), // LEFT RIGHT ARROW
    (Name: 'LeftRightArrow'; Value: #8596), // LEFT RIGHT ARROW
    (Name: 'varr'; Value: #8597), // UP DOWN ARROW
    (Name: 'updownarrow'; Value: #8597), // UP DOWN ARROW
    (Name: 'UpDownArrow'; Value: #8597), // UP DOWN ARROW
    (Name: 'nwarr'; Value: #8598), // NORTH WEST ARROW
    (Name: 'UpperLeftArrow'; Value: #8598), // NORTH WEST ARROW
    (Name: 'nwarrow'; Value: #8598), // NORTH WEST ARROW
    (Name: 'nearr'; Value: #8599), // NORTH EAST ARROW
    (Name: 'UpperRightArrow'; Value: #8599), // NORTH EAST ARROW
    (Name: 'nearrow'; Value: #8599), // NORTH EAST ARROW
    (Name: 'searr'; Value: #8600), // SOUTH EAST ARROW
    (Name: 'searrow'; Value: #8600), // SOUTH EAST ARROW
    (Name: 'LowerRightArrow'; Value: #8600), // SOUTH EAST ARROW
    (Name: 'swarr'; Value: #8601), // SOUTH WEST ARROW
    (Name: 'swarrow'; Value: #8601), // SOUTH WEST ARROW
    (Name: 'LowerLeftArrow'; Value: #8601), // SOUTH WEST ARROW
    (Name: 'nlarr'; Value: #8602), // LEFTWARDS ARROW WITH STROKE
    (Name: 'nleftarrow'; Value: #8602), // LEFTWARDS ARROW WITH STROKE
    (Name: 'nrarr'; Value: #8603), // RIGHTWARDS ARROW WITH STROKE
    (Name: 'nrightarrow'; Value: #8603), // RIGHTWARDS ARROW WITH STROKE
    (Name: 'rarrw'; Value: #8605), // RIGHTWARDS WAVE ARROW
    (Name: 'rightsquigarrow'; Value: #8605), // RIGHTWARDS WAVE ARROW
    (Name: 'Larr'; Value: #8606), // LEFTWARDS TWO HEADED ARROW
    (Name: 'twoheadleftarrow'; Value: #8606), // LEFTWARDS TWO HEADED ARROW
    (Name: 'Uarr'; Value: #8607), // UPWARDS TWO HEADED ARROW
    (Name: 'Rarr'; Value: #8608), // RIGHTWARDS TWO HEADED ARROW
    (Name: 'twoheadrightarrow'; Value: #8608), // RIGHTWARDS TWO HEADED ARROW
    (Name: 'Darr'; Value: #8609), // DOWNWARDS TWO HEADED ARROW
    (Name: 'larrtl'; Value: #8610), // LEFTWARDS ARROW WITH TAIL
    (Name: 'leftarrowtail'; Value: #8610), // LEFTWARDS ARROW WITH TAIL
    (Name: 'rarrtl'; Value: #8611), // RIGHTWARDS ARROW WITH TAIL
    (Name: 'rightarrowtail'; Value: #8611), // RIGHTWARDS ARROW WITH TAIL
    (Name: 'LeftTeeArrow'; Value: #8612), // LEFTWARDS ARROW FROM BAR
    (Name: 'mapstoleft'; Value: #8612), // LEFTWARDS ARROW FROM BAR
    (Name: 'UpTeeArrow'; Value: #8613), // UPWARDS ARROW FROM BAR
    (Name: 'mapstoup'; Value: #8613), // UPWARDS ARROW FROM BAR
    (Name: 'map'; Value: #8614), // RIGHTWARDS ARROW FROM BAR
    (Name: 'RightTeeArrow'; Value: #8614), // RIGHTWARDS ARROW FROM BAR
    (Name: 'mapsto'; Value: #8614), // RIGHTWARDS ARROW FROM BAR
    (Name: 'DownTeeArrow'; Value: #8615), // DOWNWARDS ARROW FROM BAR
    (Name: 'mapstodown'; Value: #8615), // DOWNWARDS ARROW FROM BAR
    (Name: 'larrhk'; Value: #8617), // LEFTWARDS ARROW WITH HOOK
    (Name: 'hookleftarrow'; Value: #8617), // LEFTWARDS ARROW WITH HOOK
    (Name: 'rarrhk'; Value: #8618), // RIGHTWARDS ARROW WITH HOOK
    (Name: 'hookrightarrow'; Value: #8618), // RIGHTWARDS ARROW WITH HOOK
    (Name: 'larrlp'; Value: #8619), // LEFTWARDS ARROW WITH LOOP
    (Name: 'looparrowleft'; Value: #8619), // LEFTWARDS ARROW WITH LOOP
    (Name: 'rarrlp'; Value: #8620), // RIGHTWARDS ARROW WITH LOOP
    (Name: 'looparrowright'; Value: #8620), // RIGHTWARDS ARROW WITH LOOP
    (Name: 'harrw'; Value: #8621), // LEFT RIGHT WAVE ARROW
    (Name: 'leftrightsquigarrow'; Value: #8621), // LEFT RIGHT WAVE ARROW
    (Name: 'nharr'; Value: #8622), // LEFT RIGHT ARROW WITH STROKE
    (Name: 'nleftrightarrow'; Value: #8622), // LEFT RIGHT ARROW WITH STROKE
    (Name: 'lsh'; Value: #8624), // UPWARDS ARROW WITH TIP LEFTWARDS
    (Name: 'Lsh'; Value: #8624), // UPWARDS ARROW WITH TIP LEFTWARDS
    (Name: 'rsh'; Value: #8625), // UPWARDS ARROW WITH TIP RIGHTWARDS
    (Name: 'Rsh'; Value: #8625), // UPWARDS ARROW WITH TIP RIGHTWARDS
    (Name: 'ldsh'; Value: #8626), // DOWNWARDS ARROW WITH TIP LEFTWARDS
    (Name: 'rdsh'; Value: #8627), // DOWNWARDS ARROW WITH TIP RIGHTWARDS
    (Name: 'crarr'; Value: #8629), // DOWNWARDS ARROW WITH CORNER LEFTWARDS
    (Name: 'cularr'; Value: #8630), // ANTICLOCKWISE TOP SEMICIRCLE ARROW
    (Name: 'curvearrowleft'; Value: #8630), // ANTICLOCKWISE TOP SEMICIRCLE ARROW
    (Name: 'curarr'; Value: #8631), // CLOCKWISE TOP SEMICIRCLE ARROW
    (Name: 'curvearrowright'; Value: #8631), // CLOCKWISE TOP SEMICIRCLE ARROW
    (Name: 'olarr'; Value: #8634), // ANTICLOCKWISE OPEN CIRCLE ARROW
    (Name: 'circlearrowleft'; Value: #8634), // ANTICLOCKWISE OPEN CIRCLE ARROW
    (Name: 'orarr'; Value: #8635), // CLOCKWISE OPEN CIRCLE ARROW
    (Name: 'circlearrowright'; Value: #8635), // CLOCKWISE OPEN CIRCLE ARROW
    (Name: 'lharu'; Value: #8636), // LEFTWARDS HARPOON WITH BARB UPWARDS
    (Name: 'LeftVector'; Value: #8636), // LEFTWARDS HARPOON WITH BARB UPWARDS
    (Name: 'leftharpoonup'; Value: #8636), // LEFTWARDS HARPOON WITH BARB UPWARDS
    (Name: 'lhard'; Value: #8637), // LEFTWARDS HARPOON WITH BARB DOWNWARDS
    (Name: 'leftharpoondown'; Value: #8637), // LEFTWARDS HARPOON WITH BARB DOWNWARDS
    (Name: 'DownLeftVector'; Value: #8637), // LEFTWARDS HARPOON WITH BARB DOWNWARDS
    (Name: 'uharr'; Value: #8638), // UPWARDS HARPOON WITH BARB RIGHTWARDS
    (Name: 'upharpoonright'; Value: #8638), // UPWARDS HARPOON WITH BARB RIGHTWARDS
    (Name: 'RightUpVector'; Value: #8638), // UPWARDS HARPOON WITH BARB RIGHTWARDS
    (Name: 'uharl'; Value: #8639), // UPWARDS HARPOON WITH BARB LEFTWARDS
    (Name: 'upharpoonleft'; Value: #8639), // UPWARDS HARPOON WITH BARB LEFTWARDS
    (Name: 'LeftUpVector'; Value: #8639), // UPWARDS HARPOON WITH BARB LEFTWARDS
    (Name: 'rharu'; Value: #8640), // RIGHTWARDS HARPOON WITH BARB UPWARDS
    (Name: 'RightVector'; Value: #8640), // RIGHTWARDS HARPOON WITH BARB UPWARDS
    (Name: 'rightharpoonup'; Value: #8640), // RIGHTWARDS HARPOON WITH BARB UPWARDS
    (Name: 'rhard'; Value: #8641), // RIGHTWARDS HARPOON WITH BARB DOWNWARDS
    (Name: 'rightharpoondown'; Value: #8641), // RIGHTWARDS HARPOON WITH BARB DOWNWARDS
    (Name: 'DownRightVector'; Value: #8641), // RIGHTWARDS HARPOON WITH BARB DOWNWARDS
    (Name: 'dharr'; Value: #8642), // DOWNWARDS HARPOON WITH BARB RIGHTWARDS
    (Name: 'RightDownVector'; Value: #8642), // DOWNWARDS HARPOON WITH BARB RIGHTWARDS
    (Name: 'downharpoonright'; Value: #8642), // DOWNWARDS HARPOON WITH BARB RIGHTWARDS
    (Name: 'dharl'; Value: #8643), // DOWNWARDS HARPOON WITH BARB LEFTWARDS
    (Name: 'LeftDownVector'; Value: #8643), // DOWNWARDS HARPOON WITH BARB LEFTWARDS
    (Name: 'downharpoonleft'; Value: #8643), // DOWNWARDS HARPOON WITH BARB LEFTWARDS
    (Name: 'rlarr'; Value: #8644), // RIGHTWARDS ARROW OVER LEFTWARDS ARROW
    (Name: 'rightleftarrows'; Value: #8644), // RIGHTWARDS ARROW OVER LEFTWARDS ARROW
    (Name: 'RightArrowLeftArrow'; Value: #8644), // RIGHTWARDS ARROW OVER LEFTWARDS ARROW
    (Name: 'udarr'; Value: #8645), // UPWARDS ARROW LEFTWARDS OF DOWNWARDS ARROW
    (Name: 'UpArrowDownArrow'; Value: #8645), // UPWARDS ARROW LEFTWARDS OF DOWNWARDS ARROW
    (Name: 'lrarr'; Value: #8646), // LEFTWARDS ARROW OVER RIGHTWARDS ARROW
    (Name: 'leftrightarrows'; Value: #8646), // LEFTWARDS ARROW OVER RIGHTWARDS ARROW
    (Name: 'LeftArrowRightArrow'; Value: #8646), // LEFTWARDS ARROW OVER RIGHTWARDS ARROW
    (Name: 'llarr'; Value: #8647), // LEFTWARDS PAIRED ARROWS
    (Name: 'leftleftarrows'; Value: #8647), // LEFTWARDS PAIRED ARROWS
    (Name: 'uuarr'; Value: #8648), // UPWARDS PAIRED ARROWS
    (Name: 'upuparrows'; Value: #8648), // UPWARDS PAIRED ARROWS
    (Name: 'rrarr'; Value: #8649), // RIGHTWARDS PAIRED ARROWS
    (Name: 'rightrightarrows'; Value: #8649), // RIGHTWARDS PAIRED ARROWS
    (Name: 'ddarr'; Value: #8650), // DOWNWARDS PAIRED ARROWS
    (Name: 'downdownarrows'; Value: #8650), // DOWNWARDS PAIRED ARROWS
    (Name: 'lrhar'; Value: #8651), // LEFTWARDS HARPOON OVER RIGHTWARDS HARPOON
    (Name: 'ReverseEquilibrium'; Value: #8651), // LEFTWARDS HARPOON OVER RIGHTWARDS HARPOON
    (Name: 'leftrightharpoons'; Value: #8651), // LEFTWARDS HARPOON OVER RIGHTWARDS HARPOON
    (Name: 'rlhar'; Value: #8652), // RIGHTWARDS HARPOON OVER LEFTWARDS HARPOON
    (Name: 'rightleftharpoons'; Value: #8652), // RIGHTWARDS HARPOON OVER LEFTWARDS HARPOON
    (Name: 'Equilibrium'; Value: #8652), // RIGHTWARDS HARPOON OVER LEFTWARDS HARPOON
    (Name: 'nlArr'; Value: #8653), // LEFTWARDS DOUBLE ARROW WITH STROKE
    (Name: 'nLeftarrow'; Value: #8653), // LEFTWARDS DOUBLE ARROW WITH STROKE
    (Name: 'nhArr'; Value: #8654), // LEFT RIGHT DOUBLE ARROW WITH STROKE
    (Name: 'nLeftrightarrow'; Value: #8654), // LEFT RIGHT DOUBLE ARROW WITH STROKE
    (Name: 'nrArr'; Value: #8655), // RIGHTWARDS DOUBLE ARROW WITH STROKE
    (Name: 'nRightarrow'; Value: #8655), // RIGHTWARDS DOUBLE ARROW WITH STROKE
    (Name: 'lArr'; Value: #8656), // LEFTWARDS DOUBLE ARROW
    (Name: 'Leftarrow'; Value: #8656), // LEFTWARDS DOUBLE ARROW
    (Name: 'DoubleLeftArrow'; Value: #8656), // LEFTWARDS DOUBLE ARROW
    (Name: 'uArr'; Value: #8657), // UPWARDS DOUBLE ARROW
    (Name: 'Uparrow'; Value: #8657), // UPWARDS DOUBLE ARROW
    (Name: 'DoubleUpArrow'; Value: #8657), // UPWARDS DOUBLE ARROW
    (Name: 'rArr'; Value: #8658), // RIGHTWARDS DOUBLE ARROW
    (Name: 'Rightarrow'; Value: #8658), // RIGHTWARDS DOUBLE ARROW
    (Name: 'Implies'; Value: #8658), // RIGHTWARDS DOUBLE ARROW
    (Name: 'DoubleRightArrow'; Value: #8658), // RIGHTWARDS DOUBLE ARROW
    (Name: 'dArr'; Value: #8659), // DOWNWARDS DOUBLE ARROW
    (Name: 'Downarrow'; Value: #8659), // DOWNWARDS DOUBLE ARROW
    (Name: 'DoubleDownArrow'; Value: #8659), // DOWNWARDS DOUBLE ARROW
    (Name: 'hArr'; Value: #8660), // LEFT RIGHT DOUBLE ARROW
    (Name: 'Leftrightarrow'; Value: #8660), // LEFT RIGHT DOUBLE ARROW
    (Name: 'DoubleLeftRightArrow'; Value: #8660), // LEFT RIGHT DOUBLE ARROW
    (Name: 'iff'; Value: #8660), // LEFT RIGHT DOUBLE ARROW
    (Name: 'vArr'; Value: #8661), // UP DOWN DOUBLE ARROW
    (Name: 'Updownarrow'; Value: #8661), // UP DOWN DOUBLE ARROW
    (Name: 'DoubleUpDownArrow'; Value: #8661), // UP DOWN DOUBLE ARROW
    (Name: 'nwArr'; Value: #8662), // NORTH WEST DOUBLE ARROW
    (Name: 'neArr'; Value: #8663), // NORTH EAST DOUBLE ARROW
    (Name: 'seArr'; Value: #8664), // SOUTH EAST DOUBLE ARROW
    (Name: 'swArr'; Value: #8665), // SOUTH WEST DOUBLE ARROW
    (Name: 'lAarr'; Value: #8666), // LEFTWARDS TRIPLE ARROW
    (Name: 'Lleftarrow'; Value: #8666), // LEFTWARDS TRIPLE ARROW
    (Name: 'rAarr'; Value: #8667), // RIGHTWARDS TRIPLE ARROW
    (Name: 'Rrightarrow'; Value: #8667), // RIGHTWARDS TRIPLE ARROW
    (Name: 'zigrarr'; Value: #8669), // RIGHTWARDS SQUIGGLE ARROW
    (Name: 'larrb'; Value: #8676), // LEFTWARDS ARROW TO BAR
    (Name: 'LeftArrowBar'; Value: #8676), // LEFTWARDS ARROW TO BAR
    (Name: 'rarrb'; Value: #8677), // RIGHTWARDS ARROW TO BAR
    (Name: 'RightArrowBar'; Value: #8677), // RIGHTWARDS ARROW TO BAR
    (Name: 'duarr'; Value: #8693), // DOWNWARDS ARROW LEFTWARDS OF UPWARDS ARROW
    (Name: 'DownArrowUpArrow'; Value: #8693), // DOWNWARDS ARROW LEFTWARDS OF UPWARDS ARROW
    (Name: 'loarr'; Value: #8701), // LEFTWARDS OPEN-HEADED ARROW
    (Name: 'roarr'; Value: #8702), // RIGHTWARDS OPEN-HEADED ARROW
    (Name: 'hoarr'; Value: #8703), // LEFT RIGHT OPEN-HEADED ARROW
    (Name: 'forall'; Value: #8704), // FOR ALL
    (Name: 'ForAll'; Value: #8704), // FOR ALL
    (Name: 'comp'; Value: #8705), // COMPLEMENT
    (Name: 'complement'; Value: #8705), // COMPLEMENT
    (Name: 'part'; Value: #8706), // PARTIAL DIFFERENTIAL
    (Name: 'PartialD'; Value: #8706), // PARTIAL DIFFERENTIAL
    (Name: 'exist'; Value: #8707), // THERE EXISTS
    (Name: 'Exists'; Value: #8707), // THERE EXISTS
    (Name: 'nexist'; Value: #8708), // THERE DOES NOT EXIST
    (Name: 'NotExists'; Value: #8708), // THERE DOES NOT EXIST
    (Name: 'nexists'; Value: #8708), // THERE DOES NOT EXIST
    (Name: 'empty'; Value: #8709), // EMPTY SET
    (Name: 'emptyset'; Value: #8709), // EMPTY SET
    (Name: 'emptyv'; Value: #8709), // EMPTY SET
    (Name: 'varnothing'; Value: #8709), // EMPTY SET
    (Name: 'nabla'; Value: #8711), // NABLA
    (Name: 'Del'; Value: #8711), // NABLA
    (Name: 'isin'; Value: #8712), // ELEMENT OF
    (Name: 'isinv'; Value: #8712), // ELEMENT OF
    (Name: 'Element'; Value: #8712), // ELEMENT OF
    (Name: 'in'; Value: #8712), // ELEMENT OF
    (Name: 'notin'; Value: #8713), // NOT AN ELEMENT OF
    (Name: 'NotElement'; Value: #8713), // NOT AN ELEMENT OF
    (Name: 'notinva'; Value: #8713), // NOT AN ELEMENT OF
    (Name: 'niv'; Value: #8715), // CONTAINS AS MEMBER
    (Name: 'ReverseElement'; Value: #8715), // CONTAINS AS MEMBER
    (Name: 'ni'; Value: #8715), // CONTAINS AS MEMBER
    (Name: 'SuchThat'; Value: #8715), // CONTAINS AS MEMBER
    (Name: 'notni'; Value: #8716), // DOES NOT CONTAIN AS MEMBER
    (Name: 'notniva'; Value: #8716), // DOES NOT CONTAIN AS MEMBER
    (Name: 'NotReverseElement'; Value: #8716), // DOES NOT CONTAIN AS MEMBER
    (Name: 'prod'; Value: #8719), // N-ARY PRODUCT
    (Name: 'Product'; Value: #8719), // N-ARY PRODUCT
    (Name: 'coprod'; Value: #8720), // N-ARY COPRODUCT
    (Name: 'Coproduct'; Value: #8720), // N-ARY COPRODUCT
    (Name: 'sum'; Value: #8721), // N-ARY SUMMATION
    (Name: 'Sum'; Value: #8721), // N-ARY SUMMATION
    (Name: 'minus'; Value: #8722), // MINUS SIGN
    (Name: 'mnplus'; Value: #8723), // MINUS-OR-PLUS SIGN
    (Name: 'mp'; Value: #8723), // MINUS-OR-PLUS SIGN
    (Name: 'MinusPlus'; Value: #8723), // MINUS-OR-PLUS SIGN
    (Name: 'plusdo'; Value: #8724), // DOT PLUS
    (Name: 'dotplus'; Value: #8724), // DOT PLUS
    (Name: 'setmn'; Value: #8726), // SET MINUS
    (Name: 'setminus'; Value: #8726), // SET MINUS
    (Name: 'Backslash'; Value: #8726), // SET MINUS
    (Name: 'ssetmn'; Value: #8726), // SET MINUS
    (Name: 'smallsetminus'; Value: #8726), // SET MINUS
    (Name: 'lowast'; Value: #8727), // ASTERISK OPERATOR
    (Name: 'compfn'; Value: #8728), // RING OPERATOR
    (Name: 'SmallCircle'; Value: #8728), // RING OPERATOR
    (Name: 'radic'; Value: #8730), // SQUARE ROOT
    (Name: 'Sqrt'; Value: #8730), // SQUARE ROOT
    (Name: 'prop'; Value: #8733), // PROPORTIONAL TO
    (Name: 'propto'; Value: #8733), // PROPORTIONAL TO
    (Name: 'Proportional'; Value: #8733), // PROPORTIONAL TO
    (Name: 'vprop'; Value: #8733), // PROPORTIONAL TO
    (Name: 'varpropto'; Value: #8733), // PROPORTIONAL TO
    (Name: 'infin'; Value: #8734), // INFINITY
    (Name: 'angrt'; Value: #8735), // RIGHT ANGLE
    (Name: 'ang'; Value: #8736), // ANGLE
    (Name: 'angle'; Value: #8736), // ANGLE
    (Name: 'angmsd'; Value: #8737), // MEASURED ANGLE
    (Name: 'measuredangle'; Value: #8737), // MEASURED ANGLE
    (Name: 'angsph'; Value: #8738), // SPHERICAL ANGLE
    (Name: 'mid'; Value: #8739), // DIVIDES
    (Name: 'VerticalBar'; Value: #8739), // DIVIDES
    (Name: 'smid'; Value: #8739), // DIVIDES
    (Name: 'shortmid'; Value: #8739), // DIVIDES
    (Name: 'nmid'; Value: #8740), // DOES NOT DIVIDE
    (Name: 'NotVerticalBar'; Value: #8740), // DOES NOT DIVIDE
    (Name: 'nsmid'; Value: #8740), // DOES NOT DIVIDE
    (Name: 'nshortmid'; Value: #8740), // DOES NOT DIVIDE
    (Name: 'par'; Value: #8741), // PARALLEL TO
    (Name: 'parallel'; Value: #8741), // PARALLEL TO
    (Name: 'DoubleVerticalBar'; Value: #8741), // PARALLEL TO
    (Name: 'spar'; Value: #8741), // PARALLEL TO
    (Name: 'shortparallel'; Value: #8741), // PARALLEL TO
    (Name: 'npar'; Value: #8742), // NOT PARALLEL TO
    (Name: 'nparallel'; Value: #8742), // NOT PARALLEL TO
    (Name: 'NotDoubleVerticalBar'; Value: #8742), // NOT PARALLEL TO
    (Name: 'nspar'; Value: #8742), // NOT PARALLEL TO
    (Name: 'nshortparallel'; Value: #8742), // NOT PARALLEL TO
    (Name: 'and'; Value: #8743), // LOGICAL AND
    (Name: 'wedge'; Value: #8743), // LOGICAL AND
    (Name: 'or'; Value: #8744), // LOGICAL OR
    (Name: 'vee'; Value: #8744), // LOGICAL OR
    (Name: 'cap'; Value: #8745), // INTERSECTION
    (Name: 'cup'; Value: #8746), // UNION
    (Name: 'int'; Value: #8747), // INTEGRAL
    (Name: 'Integral'; Value: #8747), // INTEGRAL
    (Name: 'Int'; Value: #8748), // DOUBLE INTEGRAL
    (Name: 'tint'; Value: #8749), // TRIPLE INTEGRAL
    (Name: 'iiint'; Value: #8749), // TRIPLE INTEGRAL
    (Name: 'conint'; Value: #8750), // CONTOUR INTEGRAL
    (Name: 'oint'; Value: #8750), // CONTOUR INTEGRAL
    (Name: 'ContourIntegral'; Value: #8750), // CONTOUR INTEGRAL
    (Name: 'Conint'; Value: #8751), // SURFACE INTEGRAL
    (Name: 'DoubleContourIntegral'; Value: #8751), // SURFACE INTEGRAL
    (Name: 'Cconint'; Value: #8752), // VOLUME INTEGRAL
    (Name: 'cwint'; Value: #8753), // CLOCKWISE INTEGRAL
    (Name: 'cwconint'; Value: #8754), // CLOCKWISE CONTOUR INTEGRAL
    (Name: 'ClockwiseContourIntegral'; Value: #8754), // CLOCKWISE CONTOUR INTEGRAL
    (Name: 'awconint'; Value: #8755), // ANTICLOCKWISE CONTOUR INTEGRAL
    (Name: 'CounterClockwiseContourIntegral'; Value: #8755), // ANTICLOCKWISE CONTOUR INTEGRAL
    (Name: 'there4'; Value: #8756), // THEREFORE
    (Name: 'therefore'; Value: #8756), // THEREFORE
    (Name: 'Therefore'; Value: #8756), // THEREFORE
    (Name: 'becaus'; Value: #8757), // BECAUSE
    (Name: 'because'; Value: #8757), // BECAUSE
    (Name: 'Because'; Value: #8757), // BECAUSE
    (Name: 'ratio'; Value: #8758), // RATIO
    (Name: 'Colon'; Value: #8759), // PROPORTION
    (Name: 'Proportion'; Value: #8759), // PROPORTION
    (Name: 'minusd'; Value: #8760), // DOT MINUS
    (Name: 'dotminus'; Value: #8760), // DOT MINUS
    (Name: 'mDDot'; Value: #8762), // GEOMETRIC PROPORTION
    (Name: 'homtht'; Value: #8763), // HOMOTHETIC
    (Name: 'sim'; Value: #8764), // TILDE OPERATOR
    (Name: 'Tilde'; Value: #8764), // TILDE OPERATOR
    (Name: 'thksim'; Value: #8764), // TILDE OPERATOR
    (Name: 'thicksim'; Value: #8764), // TILDE OPERATOR
    (Name: 'bsim'; Value: #8765), // REVERSED TILDE
    (Name: 'backsim'; Value: #8765), // REVERSED TILDE
    (Name: 'ac'; Value: #8766), // INVERTED LAZY S
    (Name: 'mstpos'; Value: #8766), // INVERTED LAZY S
    (Name: 'acd'; Value: #8767), // SINE WAVE
    (Name: 'wreath'; Value: #8768), // WREATH PRODUCT
    (Name: 'VerticalTilde'; Value: #8768), // WREATH PRODUCT
    (Name: 'wr'; Value: #8768), // WREATH PRODUCT
    (Name: 'nsim'; Value: #8769), // NOT TILDE
    (Name: 'NotTilde'; Value: #8769), // NOT TILDE
    (Name: 'esim'; Value: #8770), // MINUS TILDE
    (Name: 'EqualTilde'; Value: #8770), // MINUS TILDE
    (Name: 'eqsim'; Value: #8770), // MINUS TILDE
    (Name: 'sime'; Value: #8771), // ASYMPTOTICALLY EQUAL TO
    (Name: 'TildeEqual'; Value: #8771), // ASYMPTOTICALLY EQUAL TO
    (Name: 'simeq'; Value: #8771), // ASYMPTOTICALLY EQUAL TO
    (Name: 'nsime'; Value: #8772), // NOT ASYMPTOTICALLY EQUAL TO
    (Name: 'nsimeq'; Value: #8772), // NOT ASYMPTOTICALLY EQUAL TO
    (Name: 'NotTildeEqual'; Value: #8772), // NOT ASYMPTOTICALLY EQUAL TO
    (Name: 'cong'; Value: #8773), // APPROXIMATELY EQUAL TO
    (Name: 'TildeFullEqual'; Value: #8773), // APPROXIMATELY EQUAL TO
    (Name: 'simne'; Value: #8774), // APPROXIMATELY BUT NOT ACTUALLY EQUAL TO
    (Name: 'ncong'; Value: #8775), // NEITHER APPROXIMATELY NOR ACTUALLY EQUAL TO
    (Name: 'NotTildeFullEqual'; Value: #8775), // NEITHER APPROXIMATELY NOR ACTUALLY EQUAL TO
    (Name: 'asymp'; Value: #8776), // ALMOST EQUAL TO
    (Name: 'ap'; Value: #8776), // ALMOST EQUAL TO
    (Name: 'TildeTilde'; Value: #8776), // ALMOST EQUAL TO
    (Name: 'approx'; Value: #8776), // ALMOST EQUAL TO
    (Name: 'thkap'; Value: #8776), // ALMOST EQUAL TO
    (Name: 'thickapprox'; Value: #8776), // ALMOST EQUAL TO
    (Name: 'nap'; Value: #8777), // NOT ALMOST EQUAL TO
    (Name: 'NotTildeTilde'; Value: #8777), // NOT ALMOST EQUAL TO
    (Name: 'napprox'; Value: #8777), // NOT ALMOST EQUAL TO
    (Name: 'ape'; Value: #8778), // ALMOST EQUAL OR EQUAL TO
    (Name: 'approxeq'; Value: #8778), // ALMOST EQUAL OR EQUAL TO
    (Name: 'apid'; Value: #8779), // TRIPLE TILDE
    (Name: 'bcong'; Value: #8780), // ALL EQUAL TO
    (Name: 'backcong'; Value: #8780), // ALL EQUAL TO
    (Name: 'asympeq'; Value: #8781), // EQUIVALENT TO
    (Name: 'CupCap'; Value: #8781), // EQUIVALENT TO
    (Name: 'bump'; Value: #8782), // GEOMETRICALLY EQUIVALENT TO
    (Name: 'HumpDownHump'; Value: #8782), // GEOMETRICALLY EQUIVALENT TO
    (Name: 'Bumpeq'; Value: #8782), // GEOMETRICALLY EQUIVALENT TO
    (Name: 'bumpe'; Value: #8783), // DIFFERENCE BETWEEN
    (Name: 'HumpEqual'; Value: #8783), // DIFFERENCE BETWEEN
    (Name: 'bumpeq'; Value: #8783), // DIFFERENCE BETWEEN
    (Name: 'esdot'; Value: #8784), // APPROACHES THE LIMIT
    (Name: 'DotEqual'; Value: #8784), // APPROACHES THE LIMIT
    (Name: 'doteq'; Value: #8784), // APPROACHES THE LIMIT
    (Name: 'eDot'; Value: #8785), // GEOMETRICALLY EQUAL TO
    (Name: 'doteqdot'; Value: #8785), // GEOMETRICALLY EQUAL TO
    (Name: 'efDot'; Value: #8786), // APPROXIMATELY EQUAL TO OR THE IMAGE OF
    (Name: 'fallingdotseq'; Value: #8786), // APPROXIMATELY EQUAL TO OR THE IMAGE OF
    (Name: 'erDot'; Value: #8787), // IMAGE OF OR APPROXIMATELY EQUAL TO
    (Name: 'risingdotseq'; Value: #8787), // IMAGE OF OR APPROXIMATELY EQUAL TO
    (Name: 'colone'; Value: #8788), // COLON EQUALS
    (Name: 'coloneq'; Value: #8788), // COLON EQUALS
    (Name: 'Assign'; Value: #8788), // COLON EQUALS
    (Name: 'ecolon'; Value: #8789), // EQUALS COLON
    (Name: 'eqcolon'; Value: #8789), // EQUALS COLON
    (Name: 'ecir'; Value: #8790), // RING IN EQUAL TO
    (Name: 'eqcirc'; Value: #8790), // RING IN EQUAL TO
    (Name: 'cire'; Value: #8791), // RING EQUAL TO
    (Name: 'circeq'; Value: #8791), // RING EQUAL TO
    (Name: 'wedgeq'; Value: #8793), // ESTIMATES
    (Name: 'veeeq'; Value: #8794), // EQUIANGULAR TO
    (Name: 'trie'; Value: #8796), // DELTA EQUAL TO
    (Name: 'triangleq'; Value: #8796), // DELTA EQUAL TO
    (Name: 'equest'; Value: #8799), // QUESTIONED EQUAL TO
    (Name: 'questeq'; Value: #8799), // QUESTIONED EQUAL TO
    (Name: 'ne'; Value: #8800), // NOT EQUAL TO
    (Name: 'NotEqual'; Value: #8800), // NOT EQUAL TO
    (Name: 'equiv'; Value: #8801), // IDENTICAL TO
    (Name: 'Congruent'; Value: #8801), // IDENTICAL TO
    (Name: 'nequiv'; Value: #8802), // NOT IDENTICAL TO
    (Name: 'NotCongruent'; Value: #8802), // NOT IDENTICAL TO
    (Name: 'le'; Value: #8804), // LESS-THAN OR EQUAL TO
    (Name: 'leq'; Value: #8804), // LESS-THAN OR EQUAL TO
    (Name: 'ge'; Value: #8805), // GREATER-THAN OR EQUAL TO
    (Name: 'GreaterEqual'; Value: #8805), // GREATER-THAN OR EQUAL TO
    (Name: 'geq'; Value: #8805), // GREATER-THAN OR EQUAL TO
    (Name: 'lE'; Value: #8806), // LESS-THAN OVER EQUAL TO
    (Name: 'LessFullEqual'; Value: #8806), // LESS-THAN OVER EQUAL TO
    (Name: 'leqq'; Value: #8806), // LESS-THAN OVER EQUAL TO
    (Name: 'gE'; Value: #8807), // GREATER-THAN OVER EQUAL TO
    (Name: 'GreaterFullEqual'; Value: #8807), // GREATER-THAN OVER EQUAL TO
    (Name: 'geqq'; Value: #8807), // GREATER-THAN OVER EQUAL TO
    (Name: 'lnE'; Value: #8808), // LESS-THAN BUT NOT EQUAL TO
    (Name: 'lneqq'; Value: #8808), // LESS-THAN BUT NOT EQUAL TO
    (Name: 'gnE'; Value: #8809), // GREATER-THAN BUT NOT EQUAL TO
    (Name: 'gneqq'; Value: #8809), // GREATER-THAN BUT NOT EQUAL TO
    (Name: 'Lt'; Value: #8810), // MUCH LESS-THAN
    (Name: 'NestedLessLess'; Value: #8810), // MUCH LESS-THAN
    (Name: 'll'; Value: #8810), // MUCH LESS-THAN
    (Name: 'Gt'; Value: #8811), // MUCH GREATER-THAN
    (Name: 'NestedGreaterGreater'; Value: #8811), // MUCH GREATER-THAN
    (Name: 'gg'; Value: #8811), // MUCH GREATER-THAN
    (Name: 'twixt'; Value: #8812), // BETWEEN
    (Name: 'between'; Value: #8812), // BETWEEN
    (Name: 'NotCupCap'; Value: #8813), // NOT EQUIVALENT TO
    (Name: 'nlt'; Value: #8814), // NOT LESS-THAN
    (Name: 'NotLess'; Value: #8814), // NOT LESS-THAN
    (Name: 'nless'; Value: #8814), // NOT LESS-THAN
    (Name: 'ngt'; Value: #8815), // NOT GREATER-THAN
    (Name: 'NotGreater'; Value: #8815), // NOT GREATER-THAN
    (Name: 'ngtr'; Value: #8815), // NOT GREATER-THAN
    (Name: 'nle'; Value: #8816), // NEITHER LESS-THAN NOR EQUAL TO
    (Name: 'NotLessEqual'; Value: #8816), // NEITHER LESS-THAN NOR EQUAL TO
    (Name: 'nleq'; Value: #8816), // NEITHER LESS-THAN NOR EQUAL TO
    (Name: 'nge'; Value: #8817), // NEITHER GREATER-THAN NOR EQUAL TO
    (Name: 'NotGreaterEqual'; Value: #8817), // NEITHER GREATER-THAN NOR EQUAL TO
    (Name: 'ngeq'; Value: #8817), // NEITHER GREATER-THAN NOR EQUAL TO
    (Name: 'lsim'; Value: #8818), // LESS-THAN OR EQUIVALENT TO
    (Name: 'LessTilde'; Value: #8818), // LESS-THAN OR EQUIVALENT TO
    (Name: 'lesssim'; Value: #8818), // LESS-THAN OR EQUIVALENT TO
    (Name: 'gsim'; Value: #8819), // GREATER-THAN OR EQUIVALENT TO
    (Name: 'gtrsim'; Value: #8819), // GREATER-THAN OR EQUIVALENT TO
    (Name: 'GreaterTilde'; Value: #8819), // GREATER-THAN OR EQUIVALENT TO
    (Name: 'nlsim'; Value: #8820), // NEITHER LESS-THAN NOR EQUIVALENT TO
    (Name: 'NotLessTilde'; Value: #8820), // NEITHER LESS-THAN NOR EQUIVALENT TO
    (Name: 'ngsim'; Value: #8821), // NEITHER GREATER-THAN NOR EQUIVALENT TO
    (Name: 'NotGreaterTilde'; Value: #8821), // NEITHER GREATER-THAN NOR EQUIVALENT TO
    (Name: 'lg'; Value: #8822), // LESS-THAN OR GREATER-THAN
    (Name: 'lessgtr'; Value: #8822), // LESS-THAN OR GREATER-THAN
    (Name: 'LessGreater'; Value: #8822), // LESS-THAN OR GREATER-THAN
    (Name: 'gl'; Value: #8823), // GREATER-THAN OR LESS-THAN
    (Name: 'gtrless'; Value: #8823), // GREATER-THAN OR LESS-THAN
    (Name: 'GreaterLess'; Value: #8823), // GREATER-THAN OR LESS-THAN
    (Name: 'ntlg'; Value: #8824), // NEITHER LESS-THAN NOR GREATER-THAN
    (Name: 'NotLessGreater'; Value: #8824), // NEITHER LESS-THAN NOR GREATER-THAN
    (Name: 'ntgl'; Value: #8825), // NEITHER GREATER-THAN NOR LESS-THAN
    (Name: 'NotGreaterLess'; Value: #8825), // NEITHER GREATER-THAN NOR LESS-THAN
    (Name: 'pr'; Value: #8826), // PRECEDES
    (Name: 'Precedes'; Value: #8826), // PRECEDES
    (Name: 'prec'; Value: #8826), // PRECEDES
    (Name: 'sc'; Value: #8827), // SUCCEEDS
    (Name: 'Succeeds'; Value: #8827), // SUCCEEDS
    (Name: 'succ'; Value: #8827), // SUCCEEDS
    (Name: 'prcue'; Value: #8828), // PRECEDES OR EQUAL TO
    (Name: 'PrecedesSlantEqual'; Value: #8828), // PRECEDES OR EQUAL TO
    (Name: 'preccurlyeq'; Value: #8828), // PRECEDES OR EQUAL TO
    (Name: 'sccue'; Value: #8829), // SUCCEEDS OR EQUAL TO
    (Name: 'SucceedsSlantEqual'; Value: #8829), // SUCCEEDS OR EQUAL TO
    (Name: 'succcurlyeq'; Value: #8829), // SUCCEEDS OR EQUAL TO
    (Name: 'prsim'; Value: #8830), // PRECEDES OR EQUIVALENT TO
    (Name: 'precsim'; Value: #8830), // PRECEDES OR EQUIVALENT TO
    (Name: 'PrecedesTilde'; Value: #8830), // PRECEDES OR EQUIVALENT TO
    (Name: 'scsim'; Value: #8831), // SUCCEEDS OR EQUIVALENT TO
    (Name: 'succsim'; Value: #8831), // SUCCEEDS OR EQUIVALENT TO
    (Name: 'SucceedsTilde'; Value: #8831), // SUCCEEDS OR EQUIVALENT TO
    (Name: 'npr'; Value: #8832), // DOES NOT PRECEDE
    (Name: 'nprec'; Value: #8832), // DOES NOT PRECEDE
    (Name: 'NotPrecedes'; Value: #8832), // DOES NOT PRECEDE
    (Name: 'nsc'; Value: #8833), // DOES NOT SUCCEED
    (Name: 'nsucc'; Value: #8833), // DOES NOT SUCCEED
    (Name: 'NotSucceeds'; Value: #8833), // DOES NOT SUCCEED
    (Name: 'sub'; Value: #8834), // SUBSET OF
    (Name: 'subset'; Value: #8834), // SUBSET OF
    (Name: 'sup'; Value: #8835), // SUPERSET OF
    (Name: 'supset'; Value: #8835), // SUPERSET OF
    (Name: 'Superset'; Value: #8835), // SUPERSET OF
    (Name: 'nsub'; Value: #8836), // NOT A SUBSET OF
    (Name: 'nsup'; Value: #8837), // NOT A SUPERSET OF
    (Name: 'sube'; Value: #8838), // SUBSET OF OR EQUAL TO
    (Name: 'SubsetEqual'; Value: #8838), // SUBSET OF OR EQUAL TO
    (Name: 'subseteq'; Value: #8838), // SUBSET OF OR EQUAL TO
    (Name: 'supe'; Value: #8839), // SUPERSET OF OR EQUAL TO
    (Name: 'supseteq'; Value: #8839), // SUPERSET OF OR EQUAL TO
    (Name: 'SupersetEqual'; Value: #8839), // SUPERSET OF OR EQUAL TO
    (Name: 'nsube'; Value: #8840), // NEITHER A SUBSET OF NOR EQUAL TO
    (Name: 'nsubseteq'; Value: #8840), // NEITHER A SUBSET OF NOR EQUAL TO
    (Name: 'NotSubsetEqual'; Value: #8840), // NEITHER A SUBSET OF NOR EQUAL TO
    (Name: 'nsupe'; Value: #8841), // NEITHER A SUPERSET OF NOR EQUAL TO
    (Name: 'nsupseteq'; Value: #8841), // NEITHER A SUPERSET OF NOR EQUAL TO
    (Name: 'NotSupersetEqual'; Value: #8841), // NEITHER A SUPERSET OF NOR EQUAL TO
    (Name: 'subne'; Value: #8842), // SUBSET OF WITH NOT EQUAL TO
    (Name: 'subsetneq'; Value: #8842), // SUBSET OF WITH NOT EQUAL TO
    (Name: 'supne'; Value: #8843), // SUPERSET OF WITH NOT EQUAL TO
    (Name: 'supsetneq'; Value: #8843), // SUPERSET OF WITH NOT EQUAL TO
    (Name: 'cupdot'; Value: #8845), // MULTISET MULTIPLICATION
    (Name: 'uplus'; Value: #8846), // MULTISET UNION
    (Name: 'UnionPlus'; Value: #8846), // MULTISET UNION
    (Name: 'sqsub'; Value: #8847), // SQUARE IMAGE OF
    (Name: 'SquareSubset'; Value: #8847), // SQUARE IMAGE OF
    (Name: 'sqsubset'; Value: #8847), // SQUARE IMAGE OF
    (Name: 'sqsup'; Value: #8848), // SQUARE ORIGINAL OF
    (Name: 'SquareSuperset'; Value: #8848), // SQUARE ORIGINAL OF
    (Name: 'sqsupset'; Value: #8848), // SQUARE ORIGINAL OF
    (Name: 'sqsube'; Value: #8849), // SQUARE IMAGE OF OR EQUAL TO
    (Name: 'SquareSubsetEqual'; Value: #8849), // SQUARE IMAGE OF OR EQUAL TO
    (Name: 'sqsubseteq'; Value: #8849), // SQUARE IMAGE OF OR EQUAL TO
    (Name: 'sqsupe'; Value: #8850), // SQUARE ORIGINAL OF OR EQUAL TO
    (Name: 'SquareSupersetEqual'; Value: #8850), // SQUARE ORIGINAL OF OR EQUAL TO
    (Name: 'sqsupseteq'; Value: #8850), // SQUARE ORIGINAL OF OR EQUAL TO
    (Name: 'sqcap'; Value: #8851), // SQUARE CAP
    (Name: 'SquareIntersection'; Value: #8851), // SQUARE CAP
    (Name: 'sqcup'; Value: #8852), // SQUARE CUP
    (Name: 'SquareUnion'; Value: #8852), // SQUARE CUP
    (Name: 'oplus'; Value: #8853), // CIRCLED PLUS
    (Name: 'CirclePlus'; Value: #8853), // CIRCLED PLUS
    (Name: 'ominus'; Value: #8854), // CIRCLED MINUS
    (Name: 'CircleMinus'; Value: #8854), // CIRCLED MINUS
    (Name: 'otimes'; Value: #8855), // CIRCLED TIMES
    (Name: 'CircleTimes'; Value: #8855), // CIRCLED TIMES
    (Name: 'osol'; Value: #8856), // CIRCLED DIVISION SLASH
    (Name: 'odot'; Value: #8857), // CIRCLED DOT OPERATOR
    (Name: 'CircleDot'; Value: #8857), // CIRCLED DOT OPERATOR
    (Name: 'ocir'; Value: #8858), // CIRCLED RING OPERATOR
    (Name: 'circledcirc'; Value: #8858), // CIRCLED RING OPERATOR
    (Name: 'oast'; Value: #8859), // CIRCLED ASTERISK OPERATOR
    (Name: 'circledast'; Value: #8859), // CIRCLED ASTERISK OPERATOR
    (Name: 'odash'; Value: #8861), // CIRCLED DASH
    (Name: 'circleddash'; Value: #8861), // CIRCLED DASH
    (Name: 'plusb'; Value: #8862), // SQUARED PLUS
    (Name: 'boxplus'; Value: #8862), // SQUARED PLUS
    (Name: 'minusb'; Value: #8863), // SQUARED MINUS
    (Name: 'boxminus'; Value: #8863), // SQUARED MINUS
    (Name: 'timesb'; Value: #8864), // SQUARED TIMES
    (Name: 'boxtimes'; Value: #8864), // SQUARED TIMES
    (Name: 'sdotb'; Value: #8865), // SQUARED DOT OPERATOR
    (Name: 'dotsquare'; Value: #8865), // SQUARED DOT OPERATOR
    (Name: 'vdash'; Value: #8866), // RIGHT TACK
    (Name: 'RightTee'; Value: #8866), // RIGHT TACK
    (Name: 'dashv'; Value: #8867), // LEFT TACK
    (Name: 'LeftTee'; Value: #8867), // LEFT TACK
    (Name: 'top'; Value: #8868), // DOWN TACK
    (Name: 'DownTee'; Value: #8868), // DOWN TACK
    (Name: 'bottom'; Value: #8869), // UP TACK
    (Name: 'bot'; Value: #8869), // UP TACK
    (Name: 'perp'; Value: #8869), // UP TACK
    (Name: 'UpTee'; Value: #8869), // UP TACK
    (Name: 'models'; Value: #8871), // MODELS
    (Name: 'vDash'; Value: #8872), // TRUE
    (Name: 'DoubleRightTee'; Value: #8872), // TRUE
    (Name: 'Vdash'; Value: #8873), // FORCES
    (Name: 'Vvdash'; Value: #8874), // TRIPLE VERTICAL BAR RIGHT TURNSTILE
    (Name: 'VDash'; Value: #8875), // DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE
    (Name: 'nvdash'; Value: #8876), // DOES NOT PROVE
    (Name: 'nvDash'; Value: #8877), // NOT TRUE
    (Name: 'nVdash'; Value: #8878), // DOES NOT FORCE
    (Name: 'nVDash'; Value: #8879), // NEGATED DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE
    (Name: 'prurel'; Value: #8880), // PRECEDES UNDER RELATION
    (Name: 'vltri'; Value: #8882), // NORMAL SUBGROUP OF
    (Name: 'vartriangleleft'; Value: #8882), // NORMAL SUBGROUP OF
    (Name: 'LeftTriangle'; Value: #8882), // NORMAL SUBGROUP OF
    (Name: 'vrtri'; Value: #8883), // CONTAINS AS NORMAL SUBGROUP
    (Name: 'vartriangleright'; Value: #8883), // CONTAINS AS NORMAL SUBGROUP
    (Name: 'RightTriangle'; Value: #8883), // CONTAINS AS NORMAL SUBGROUP
    (Name: 'ltrie'; Value: #8884), // NORMAL SUBGROUP OF OR EQUAL TO
    (Name: 'trianglelefteq'; Value: #8884), // NORMAL SUBGROUP OF OR EQUAL TO
    (Name: 'LeftTriangleEqual'; Value: #8884), // NORMAL SUBGROUP OF OR EQUAL TO
    (Name: 'rtrie'; Value: #8885), // CONTAINS AS NORMAL SUBGROUP OR EQUAL TO
    (Name: 'trianglerighteq'; Value: #8885), // CONTAINS AS NORMAL SUBGROUP OR EQUAL TO
    (Name: 'RightTriangleEqual'; Value: #8885), // CONTAINS AS NORMAL SUBGROUP OR EQUAL TO
    (Name: 'origof'; Value: #8886), // ORIGINAL OF
    (Name: 'imof'; Value: #8887), // IMAGE OF
    (Name: 'mumap'; Value: #8888), // MULTIMAP
    (Name: 'multimap'; Value: #8888), // MULTIMAP
    (Name: 'hercon'; Value: #8889), // HERMITIAN CONJUGATE MATRIX
    (Name: 'intcal'; Value: #8890), // INTERCALATE
    (Name: 'intercal'; Value: #8890), // INTERCALATE
    (Name: 'veebar'; Value: #8891), // XOR
    (Name: 'barvee'; Value: #8893), // NOR
    (Name: 'angrtvb'; Value: #8894), // RIGHT ANGLE WITH ARC
    (Name: 'lrtri'; Value: #8895), // RIGHT TRIANGLE
    (Name: 'xwedge'; Value: #8896), // N-ARY LOGICAL AND
    (Name: 'Wedge'; Value: #8896), // N-ARY LOGICAL AND
    (Name: 'bigwedge'; Value: #8896), // N-ARY LOGICAL AND
    (Name: 'xvee'; Value: #8897), // N-ARY LOGICAL OR
    (Name: 'Vee'; Value: #8897), // N-ARY LOGICAL OR
    (Name: 'bigvee'; Value: #8897), // N-ARY LOGICAL OR
    (Name: 'xcap'; Value: #8898), // N-ARY INTERSECTION
    (Name: 'Intersection'; Value: #8898), // N-ARY INTERSECTION
    (Name: 'bigcap'; Value: #8898), // N-ARY INTERSECTION
    (Name: 'xcup'; Value: #8899), // N-ARY UNION
    (Name: 'Union'; Value: #8899), // N-ARY UNION
    (Name: 'bigcup'; Value: #8899), // N-ARY UNION
    (Name: 'diam'; Value: #8900), // DIAMOND OPERATOR
    (Name: 'diamond'; Value: #8900), // DIAMOND OPERATOR
    (Name: 'Diamond'; Value: #8900), // DIAMOND OPERATOR
    (Name: 'sdot'; Value: #8901), // DOT OPERATOR
    (Name: 'sstarf'; Value: #8902), // STAR OPERATOR
    (Name: 'Star'; Value: #8902), // STAR OPERATOR
    (Name: 'divonx'; Value: #8903), // DIVISION TIMES
    (Name: 'divideontimes'; Value: #8903), // DIVISION TIMES
    (Name: 'bowtie'; Value: #8904), // BOWTIE
    (Name: 'ltimes'; Value: #8905), // LEFT NORMAL FACTOR SEMIDIRECT PRODUCT
    (Name: 'rtimes'; Value: #8906), // RIGHT NORMAL FACTOR SEMIDIRECT PRODUCT
    (Name: 'lthree'; Value: #8907), // LEFT SEMIDIRECT PRODUCT
    (Name: 'leftthreetimes'; Value: #8907), // LEFT SEMIDIRECT PRODUCT
    (Name: 'rthree'; Value: #8908), // RIGHT SEMIDIRECT PRODUCT
    (Name: 'rightthreetimes'; Value: #8908), // RIGHT SEMIDIRECT PRODUCT
    (Name: 'bsime'; Value: #8909), // REVERSED TILDE EQUALS
    (Name: 'backsimeq'; Value: #8909), // REVERSED TILDE EQUALS
    (Name: 'cuvee'; Value: #8910), // CURLY LOGICAL OR
    (Name: 'curlyvee'; Value: #8910), // CURLY LOGICAL OR
    (Name: 'cuwed'; Value: #8911), // CURLY LOGICAL AND
    (Name: 'curlywedge'; Value: #8911), // CURLY LOGICAL AND
    (Name: 'Sub'; Value: #8912), // DOUBLE SUBSET
    (Name: 'Subset'; Value: #8912), // DOUBLE SUBSET
    (Name: 'Sup'; Value: #8913), // DOUBLE SUPERSET
    (Name: 'Supset'; Value: #8913), // DOUBLE SUPERSET
    (Name: 'Cap'; Value: #8914), // DOUBLE INTERSECTION
    (Name: 'Cup'; Value: #8915), // DOUBLE UNION
    (Name: 'fork'; Value: #8916), // PITCHFORK
    (Name: 'pitchfork'; Value: #8916), // PITCHFORK
    (Name: 'epar'; Value: #8917), // EQUAL AND PARALLEL TO
    (Name: 'ltdot'; Value: #8918), // LESS-THAN WITH DOT
    (Name: 'lessdot'; Value: #8918), // LESS-THAN WITH DOT
    (Name: 'gtdot'; Value: #8919), // GREATER-THAN WITH DOT
    (Name: 'gtrdot'; Value: #8919), // GREATER-THAN WITH DOT
    (Name: 'Ll'; Value: #8920), // VERY MUCH LESS-THAN
    (Name: 'Gg'; Value: #8921), // VERY MUCH GREATER-THAN
    (Name: 'ggg'; Value: #8921), // VERY MUCH GREATER-THAN
    (Name: 'leg'; Value: #8922), // LESS-THAN EQUAL TO OR GREATER-THAN
    (Name: 'LessEqualGreater'; Value: #8922), // LESS-THAN EQUAL TO OR GREATER-THAN
    (Name: 'lesseqgtr'; Value: #8922), // LESS-THAN EQUAL TO OR GREATER-THAN
    (Name: 'gel'; Value: #8923), // GREATER-THAN EQUAL TO OR LESS-THAN
    (Name: 'gtreqless'; Value: #8923), // GREATER-THAN EQUAL TO OR LESS-THAN
    (Name: 'GreaterEqualLess'; Value: #8923), // GREATER-THAN EQUAL TO OR LESS-THAN
    (Name: 'cuepr'; Value: #8926), // EQUAL TO OR PRECEDES
    (Name: 'curlyeqprec'; Value: #8926), // EQUAL TO OR PRECEDES
    (Name: 'cuesc'; Value: #8927), // EQUAL TO OR SUCCEEDS
    (Name: 'curlyeqsucc'; Value: #8927), // EQUAL TO OR SUCCEEDS
    (Name: 'nprcue'; Value: #8928), // DOES NOT PRECEDE OR EQUAL
    (Name: 'NotPrecedesSlantEqual'; Value: #8928), // DOES NOT PRECEDE OR EQUAL
    (Name: 'nsccue'; Value: #8929), // DOES NOT SUCCEED OR EQUAL
    (Name: 'NotSucceedsSlantEqual'; Value: #8929), // DOES NOT SUCCEED OR EQUAL
    (Name: 'nsqsube'; Value: #8930), // NOT SQUARE IMAGE OF OR EQUAL TO
    (Name: 'NotSquareSubsetEqual'; Value: #8930), // NOT SQUARE IMAGE OF OR EQUAL TO
    (Name: 'nsqsupe'; Value: #8931), // NOT SQUARE ORIGINAL OF OR EQUAL TO
    (Name: 'NotSquareSupersetEqual'; Value: #8931), // NOT SQUARE ORIGINAL OF OR EQUAL TO
    (Name: 'lnsim'; Value: #8934), // LESS-THAN BUT NOT EQUIVALENT TO
    (Name: 'gnsim'; Value: #8935), // GREATER-THAN BUT NOT EQUIVALENT TO
    (Name: 'prnsim'; Value: #8936), // PRECEDES BUT NOT EQUIVALENT TO
    (Name: 'precnsim'; Value: #8936), // PRECEDES BUT NOT EQUIVALENT TO
    (Name: 'scnsim'; Value: #8937), // SUCCEEDS BUT NOT EQUIVALENT TO
    (Name: 'succnsim'; Value: #8937), // SUCCEEDS BUT NOT EQUIVALENT TO
    (Name: 'nltri'; Value: #8938), // NOT NORMAL SUBGROUP OF
    (Name: 'ntriangleleft'; Value: #8938), // NOT NORMAL SUBGROUP OF
    (Name: 'NotLeftTriangle'; Value: #8938), // NOT NORMAL SUBGROUP OF
    (Name: 'nrtri'; Value: #8939), // DOES NOT CONTAIN AS NORMAL SUBGROUP
    (Name: 'ntriangleright'; Value: #8939), // DOES NOT CONTAIN AS NORMAL SUBGROUP
    (Name: 'NotRightTriangle'; Value: #8939), // DOES NOT CONTAIN AS NORMAL SUBGROUP
    (Name: 'nltrie'; Value: #8940), // NOT NORMAL SUBGROUP OF OR EQUAL TO
    (Name: 'ntrianglelefteq'; Value: #8940), // NOT NORMAL SUBGROUP OF OR EQUAL TO
    (Name: 'NotLeftTriangleEqual'; Value: #8940), // NOT NORMAL SUBGROUP OF OR EQUAL TO
    (Name: 'nrtrie'; Value: #8941), // DOES NOT CONTAIN AS NORMAL SUBGROUP OR EQUAL
    (Name: 'ntrianglerighteq'; Value: #8941), // DOES NOT CONTAIN AS NORMAL SUBGROUP OR EQUAL
    (Name: 'NotRightTriangleEqual'; Value: #8941), // DOES NOT CONTAIN AS NORMAL SUBGROUP OR EQUAL
    (Name: 'vellip'; Value: #8942), // VERTICAL ELLIPSIS
    (Name: 'ctdot'; Value: #8943), // MIDLINE HORIZONTAL ELLIPSIS
    (Name: 'utdot'; Value: #8944), // UP RIGHT DIAGONAL ELLIPSIS
    (Name: 'dtdot'; Value: #8945), // DOWN RIGHT DIAGONAL ELLIPSIS
    (Name: 'disin'; Value: #8946), // ELEMENT OF WITH LONG HORIZONTAL STROKE
    (Name: 'isinsv'; Value: #8947), // ELEMENT OF WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
    (Name: 'isins'; Value: #8948), // SMALL ELEMENT OF WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
    (Name: 'isindot'; Value: #8949), // ELEMENT OF WITH DOT ABOVE
    (Name: 'notinvc'; Value: #8950), // ELEMENT OF WITH OVERBAR
    (Name: 'notinvb'; Value: #8951), // SMALL ELEMENT OF WITH OVERBAR
    (Name: 'isinE'; Value: #8953), // ELEMENT OF WITH TWO HORIZONTAL STROKES
    (Name: 'nisd'; Value: #8954), // CONTAINS WITH LONG HORIZONTAL STROKE
    (Name: 'xnis'; Value: #8955), // CONTAINS WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
    (Name: 'nis'; Value: #8956), // SMALL CONTAINS WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
    (Name: 'notnivc'; Value: #8957), // CONTAINS WITH OVERBAR
    (Name: 'notnivb'; Value: #8958), // SMALL CONTAINS WITH OVERBAR
    (Name: 'barwed'; Value: #8965), // PROJECTIVE
    (Name: 'barwedge'; Value: #8965), // PROJECTIVE
    (Name: 'Barwed'; Value: #8966), // PERSPECTIVE
    (Name: 'doublebarwedge'; Value: #8966), // PERSPECTIVE
    (Name: 'lceil'; Value: #8968), // LEFT CEILING
    (Name: 'LeftCeiling'; Value: #8968), // LEFT CEILING
    (Name: 'rceil'; Value: #8969), // RIGHT CEILING
    (Name: 'RightCeiling'; Value: #8969), // RIGHT CEILING
    (Name: 'lfloor'; Value: #8970), // LEFT FLOOR
    (Name: 'LeftFloor'; Value: #8970), // LEFT FLOOR
    (Name: 'rfloor'; Value: #8971), // RIGHT FLOOR
    (Name: 'RightFloor'; Value: #8971), // RIGHT FLOOR
    (Name: 'drcrop'; Value: #8972), // BOTTOM RIGHT CROP
    (Name: 'dlcrop'; Value: #8973), // BOTTOM LEFT CROP
    (Name: 'urcrop'; Value: #8974), // TOP RIGHT CROP
    (Name: 'ulcrop'; Value: #8975), // TOP LEFT CROP
    (Name: 'bnot'; Value: #8976), // REVERSED NOT SIGN
    (Name: 'profline'; Value: #8978), // ARC
    (Name: 'profsurf'; Value: #8979), // SEGMENT
    (Name: 'telrec'; Value: #8981), // TELEPHONE RECORDER
    (Name: 'target'; Value: #8982), // POSITION INDICATOR
    (Name: 'ulcorn'; Value: #8988), // TOP LEFT CORNER
    (Name: 'ulcorner'; Value: #8988), // TOP LEFT CORNER
    (Name: 'urcorn'; Value: #8989), // TOP RIGHT CORNER
    (Name: 'urcorner'; Value: #8989), // TOP RIGHT CORNER
    (Name: 'dlcorn'; Value: #8990), // BOTTOM LEFT CORNER
    (Name: 'llcorner'; Value: #8990), // BOTTOM LEFT CORNER
    (Name: 'drcorn'; Value: #8991), // BOTTOM RIGHT CORNER
    (Name: 'lrcorner'; Value: #8991), // BOTTOM RIGHT CORNER
    (Name: 'frown'; Value: #8994), // FROWN
    (Name: 'sfrown'; Value: #8994), // FROWN
    (Name: 'smile'; Value: #8995), // SMILE
    (Name: 'ssmile'; Value: #8995), // SMILE
    (Name: 'cylcty'; Value: #9005), // CYLINDRICITY
    (Name: 'profalar'; Value: #9006), // ALL AROUND-PROFILE
    (Name: 'topbot'; Value: #9014), // APL FUNCTIONAL SYMBOL I-BEAM
    (Name: 'ovbar'; Value: #9021), // APL FUNCTIONAL SYMBOL CIRCLE STILE
    (Name: 'solbar'; Value: #9023), // APL FUNCTIONAL SYMBOL SLASH BAR
    (Name: 'angzarr'; Value: #9084), // RIGHT ANGLE WITH DOWNWARDS ZIGZAG ARROW
    (Name: 'lmoust'; Value: #9136), // UPPER LEFT OR LOWER RIGHT CURLY BRACKET SECTION
    (Name: 'lmoustache'; Value: #9136), // UPPER LEFT OR LOWER RIGHT CURLY BRACKET SECTION
    (Name: 'rmoust'; Value: #9137), // UPPER RIGHT OR LOWER LEFT CURLY BRACKET SECTION
    (Name: 'rmoustache'; Value: #9137), // UPPER RIGHT OR LOWER LEFT CURLY BRACKET SECTION
    (Name: 'tbrk'; Value: #9140), // TOP SQUARE BRACKET
    (Name: 'OverBracket'; Value: #9140), // TOP SQUARE BRACKET
    (Name: 'bbrk'; Value: #9141), // BOTTOM SQUARE BRACKET
    (Name: 'UnderBracket'; Value: #9141), // BOTTOM SQUARE BRACKET
    (Name: 'bbrktbrk'; Value: #9142), // BOTTOM SQUARE BRACKET OVER TOP SQUARE BRACKET
    (Name: 'OverParenthesis'; Value: #9180), // TOP PARENTHESIS
    (Name: 'UnderParenthesis'; Value: #9181), // BOTTOM PARENTHESIS
    (Name: 'OverBrace'; Value: #9182), // TOP CURLY BRACKET
    (Name: 'UnderBrace'; Value: #9183), // BOTTOM CURLY BRACKET
    (Name: 'trpezium'; Value: #9186), // WHITE TRAPEZIUM
    (Name: 'elinters'; Value: #9191), // ELECTRICAL INTERSECTION
    (Name: 'blank'; Value: #9251), // OPEN BOX
    (Name: 'oS'; Value: #9416), // CIRCLED LATIN CAPITAL LETTER S
    (Name: 'circledS'; Value: #9416), // CIRCLED LATIN CAPITAL LETTER S
    (Name: 'boxh'; Value: #9472), // BOX DRAWINGS LIGHT HORIZONTAL
    (Name: 'HorizontalLine'; Value: #9472), // BOX DRAWINGS LIGHT HORIZONTAL
    (Name: 'boxv'; Value: #9474), // BOX DRAWINGS LIGHT VERTICAL
    (Name: 'boxdr'; Value: #9484), // BOX DRAWINGS LIGHT DOWN AND RIGHT
    (Name: 'boxdl'; Value: #9488), // BOX DRAWINGS LIGHT DOWN AND LEFT
    (Name: 'boxur'; Value: #9492), // BOX DRAWINGS LIGHT UP AND RIGHT
    (Name: 'boxul'; Value: #9496), // BOX DRAWINGS LIGHT UP AND LEFT
    (Name: 'boxvr'; Value: #9500), // BOX DRAWINGS LIGHT VERTICAL AND RIGHT
    (Name: 'boxvl'; Value: #9508), // BOX DRAWINGS LIGHT VERTICAL AND LEFT
    (Name: 'boxhd'; Value: #9516), // BOX DRAWINGS LIGHT DOWN AND HORIZONTAL
    (Name: 'boxhu'; Value: #9524), // BOX DRAWINGS LIGHT UP AND HORIZONTAL
    (Name: 'boxvh'; Value: #9532), // BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL
    (Name: 'boxH'; Value: #9552), // BOX DRAWINGS DOUBLE HORIZONTAL
    (Name: 'boxV'; Value: #9553), // BOX DRAWINGS DOUBLE VERTICAL
    (Name: 'boxdR'; Value: #9554), // BOX DRAWINGS DOWN SINGLE AND RIGHT DOUBLE
    (Name: 'boxDr'; Value: #9555), // BOX DRAWINGS DOWN DOUBLE AND RIGHT SINGLE
    (Name: 'boxDR'; Value: #9556), // BOX DRAWINGS DOUBLE DOWN AND RIGHT
    (Name: 'boxdL'; Value: #9557), // BOX DRAWINGS DOWN SINGLE AND LEFT DOUBLE
    (Name: 'boxDl'; Value: #9558), // BOX DRAWINGS DOWN DOUBLE AND LEFT SINGLE
    (Name: 'boxDL'; Value: #9559), // BOX DRAWINGS DOUBLE DOWN AND LEFT
    (Name: 'boxuR'; Value: #9560), // BOX DRAWINGS UP SINGLE AND RIGHT DOUBLE
    (Name: 'boxUr'; Value: #9561), // BOX DRAWINGS UP DOUBLE AND RIGHT SINGLE
    (Name: 'boxUR'; Value: #9562), // BOX DRAWINGS DOUBLE UP AND RIGHT
    (Name: 'boxuL'; Value: #9563), // BOX DRAWINGS UP SINGLE AND LEFT DOUBLE
    (Name: 'boxUl'; Value: #9564), // BOX DRAWINGS UP DOUBLE AND LEFT SINGLE
    (Name: 'boxUL'; Value: #9565), // BOX DRAWINGS DOUBLE UP AND LEFT
    (Name: 'boxvR'; Value: #9566), // BOX DRAWINGS VERTICAL SINGLE AND RIGHT DOUBLE
    (Name: 'boxVr'; Value: #9567), // BOX DRAWINGS VERTICAL DOUBLE AND RIGHT SINGLE
    (Name: 'boxVR'; Value: #9568), // BOX DRAWINGS DOUBLE VERTICAL AND RIGHT
    (Name: 'boxvL'; Value: #9569), // BOX DRAWINGS VERTICAL SINGLE AND LEFT DOUBLE
    (Name: 'boxVl'; Value: #9570), // BOX DRAWINGS VERTICAL DOUBLE AND LEFT SINGLE
    (Name: 'boxVL'; Value: #9571), // BOX DRAWINGS DOUBLE VERTICAL AND LEFT
    (Name: 'boxHd'; Value: #9572), // BOX DRAWINGS DOWN SINGLE AND HORIZONTAL DOUBLE
    (Name: 'boxhD'; Value: #9573), // BOX DRAWINGS DOWN DOUBLE AND HORIZONTAL SINGLE
    (Name: 'boxHD'; Value: #9574), // BOX DRAWINGS DOUBLE DOWN AND HORIZONTAL
    (Name: 'boxHu'; Value: #9575), // BOX DRAWINGS UP SINGLE AND HORIZONTAL DOUBLE
    (Name: 'boxhU'; Value: #9576), // BOX DRAWINGS UP DOUBLE AND HORIZONTAL SINGLE
    (Name: 'boxHU'; Value: #9577), // BOX DRAWINGS DOUBLE UP AND HORIZONTAL
    (Name: 'boxvH'; Value: #9578), // BOX DRAWINGS VERTICAL SINGLE AND HORIZONTAL DOUBLE
    (Name: 'boxVh'; Value: #9579), // BOX DRAWINGS VERTICAL DOUBLE AND HORIZONTAL SINGLE
    (Name: 'boxVH'; Value: #9580), // BOX DRAWINGS DOUBLE VERTICAL AND HORIZONTAL
    (Name: 'uhblk'; Value: #9600), // UPPER HALF BLOCK
    (Name: 'lhblk'; Value: #9604), // LOWER HALF BLOCK
    (Name: 'block'; Value: #9608), // FULL BLOCK
    (Name: 'blk14'; Value: #9617), // LIGHT SHADE
    (Name: 'blk12'; Value: #9618), // MEDIUM SHADE
    (Name: 'blk34'; Value: #9619), // DARK SHADE
    (Name: 'squ'; Value: #9633), // WHITE SQUARE
    (Name: 'square'; Value: #9633), // WHITE SQUARE
    (Name: 'Square'; Value: #9633), // WHITE SQUARE
    (Name: 'squf'; Value: #9642), // BLACK SMALL SQUARE
    (Name: 'squarf'; Value: #9642), // BLACK SMALL SQUARE
    (Name: 'blacksquare'; Value: #9642), // BLACK SMALL SQUARE
    (Name: 'FilledVerySmallSquare'; Value: #9642), // BLACK SMALL SQUARE
    (Name: 'EmptyVerySmallSquare'; Value: #9643), // WHITE SMALL SQUARE
    (Name: 'rect'; Value: #9645), // WHITE RECTANGLE
    (Name: 'marker'; Value: #9646), // BLACK VERTICAL RECTANGLE
    (Name: 'fltns'; Value: #9649), // WHITE PARALLELOGRAM
    (Name: 'xutri'; Value: #9651), // WHITE UP-POINTING TRIANGLE
    (Name: 'bigtriangleup'; Value: #9651), // WHITE UP-POINTING TRIANGLE
    (Name: 'utrif'; Value: #9652), // BLACK UP-POINTING SMALL TRIANGLE
    (Name: 'blacktriangle'; Value: #9652), // BLACK UP-POINTING SMALL TRIANGLE
    (Name: 'utri'; Value: #9653), // WHITE UP-POINTING SMALL TRIANGLE
    (Name: 'triangle'; Value: #9653), // WHITE UP-POINTING SMALL TRIANGLE
    (Name: 'rtrif'; Value: #9656), // BLACK RIGHT-POINTING SMALL TRIANGLE
    (Name: 'blacktriangleright'; Value: #9656), // BLACK RIGHT-POINTING SMALL TRIANGLE
    (Name: 'rtri'; Value: #9657), // WHITE RIGHT-POINTING SMALL TRIANGLE
    (Name: 'triangleright'; Value: #9657), // WHITE RIGHT-POINTING SMALL TRIANGLE
    (Name: 'xdtri'; Value: #9661), // WHITE DOWN-POINTING TRIANGLE
    (Name: 'bigtriangledown'; Value: #9661), // WHITE DOWN-POINTING TRIANGLE
    (Name: 'dtrif'; Value: #9662), // BLACK DOWN-POINTING SMALL TRIANGLE
    (Name: 'blacktriangledown'; Value: #9662), // BLACK DOWN-POINTING SMALL TRIANGLE
    (Name: 'dtri'; Value: #9663), // WHITE DOWN-POINTING SMALL TRIANGLE
    (Name: 'triangledown'; Value: #9663), // WHITE DOWN-POINTING SMALL TRIANGLE
    (Name: 'ltrif'; Value: #9666), // BLACK LEFT-POINTING SMALL TRIANGLE
    (Name: 'blacktriangleleft'; Value: #9666), // BLACK LEFT-POINTING SMALL TRIANGLE
    (Name: 'ltri'; Value: #9667), // WHITE LEFT-POINTING SMALL TRIANGLE
    (Name: 'triangleleft'; Value: #9667), // WHITE LEFT-POINTING SMALL TRIANGLE
    (Name: 'loz'; Value: #9674), // LOZENGE
    (Name: 'lozenge'; Value: #9674), // LOZENGE
    (Name: 'cir'; Value: #9675), // WHITE CIRCLE
    (Name: 'tridot'; Value: #9708), // WHITE UP-POINTING TRIANGLE WITH DOT
    (Name: 'xcirc'; Value: #9711), // LARGE CIRCLE
    (Name: 'bigcirc'; Value: #9711), // LARGE CIRCLE
    (Name: 'ultri'; Value: #9720), // UPPER LEFT TRIANGLE
    (Name: 'urtri'; Value: #9721), // UPPER RIGHT TRIANGLE
    (Name: 'lltri'; Value: #9722), // LOWER LEFT TRIANGLE
    (Name: 'EmptySmallSquare'; Value: #9723), // WHITE MEDIUM SQUARE
    (Name: 'FilledSmallSquare'; Value: #9724), // BLACK MEDIUM SQUARE
    (Name: 'starf'; Value: #9733), // BLACK STAR
    (Name: 'bigstar'; Value: #9733), // BLACK STAR
    (Name: 'star'; Value: #9734), // WHITE STAR
    (Name: 'phone'; Value: #9742), // BLACK TELEPHONE
    (Name: 'female'; Value: #9792), // FEMALE SIGN
    (Name: 'male'; Value: #9794), // MALE SIGN
    (Name: 'spades'; Value: #9824), // BLACK SPADE SUIT
    (Name: 'spadesuit'; Value: #9824), // BLACK SPADE SUIT
    (Name: 'clubs'; Value: #9827), // BLACK CLUB SUIT
    (Name: 'clubsuit'; Value: #9827), // BLACK CLUB SUIT
    (Name: 'hearts'; Value: #9829), // BLACK HEART SUIT
    (Name: 'heartsuit'; Value: #9829), // BLACK HEART SUIT
    (Name: 'diams'; Value: #9830), // BLACK DIAMOND SUIT
    (Name: 'diamondsuit'; Value: #9830), // BLACK DIAMOND SUIT
    (Name: 'sung'; Value: #9834), // EIGHTH NOTE
    (Name: 'flat'; Value: #9837), // MUSIC FLAT SIGN
    (Name: 'natur'; Value: #9838), // MUSIC NATURAL SIGN
    (Name: 'natural'; Value: #9838), // MUSIC NATURAL SIGN
    (Name: 'sharp'; Value: #9839), // MUSIC SHARP SIGN
    (Name: 'check'; Value: #10003), // CHECK MARK
    (Name: 'checkmark'; Value: #10003), // CHECK MARK
    (Name: 'cross'; Value: #10007), // BALLOT X
    (Name: 'malt'; Value: #10016), // MALTESE CROSS
    (Name: 'maltese'; Value: #10016), // MALTESE CROSS
    (Name: 'sext'; Value: #10038), // SIX POINTED BLACK STAR
    (Name: 'VerticalSeparator'; Value: #10072), // LIGHT VERTICAL BAR
    (Name: 'lbbrk'; Value: #10098), // LIGHT LEFT TORTOISE SHELL BRACKET ORNAMENT
    (Name: 'rbbrk'; Value: #10099), // LIGHT RIGHT TORTOISE SHELL BRACKET ORNAMENT
    (Name: 'lobrk'; Value: #10214), // MATHEMATICAL LEFT WHITE SQUARE BRACKET
    (Name: 'LeftDoubleBracket'; Value: #10214), // MATHEMATICAL LEFT WHITE SQUARE BRACKET
    (Name: 'robrk'; Value: #10215), // MATHEMATICAL RIGHT WHITE SQUARE BRACKET
    (Name: 'RightDoubleBracket'; Value: #10215), // MATHEMATICAL RIGHT WHITE SQUARE BRACKET
    (Name: 'lang'; Value: #10216), // MATHEMATICAL LEFT ANGLE BRACKET
    (Name: 'LeftAngleBracket'; Value: #10216), // MATHEMATICAL LEFT ANGLE BRACKET
    (Name: 'langle'; Value: #10216), // MATHEMATICAL LEFT ANGLE BRACKET
    (Name: 'rang'; Value: #10217), // MATHEMATICAL RIGHT ANGLE BRACKET
    (Name: 'RightAngleBracket'; Value: #10217), // MATHEMATICAL RIGHT ANGLE BRACKET
    (Name: 'rangle'; Value: #10217), // MATHEMATICAL RIGHT ANGLE BRACKET
    (Name: 'Lang'; Value: #10218), // MATHEMATICAL LEFT DOUBLE ANGLE BRACKET
    (Name: 'Rang'; Value: #10219), // MATHEMATICAL RIGHT DOUBLE ANGLE BRACKET
    (Name: 'loang'; Value: #10220), // MATHEMATICAL LEFT WHITE TORTOISE SHELL BRACKET
    (Name: 'roang'; Value: #10221), // MATHEMATICAL RIGHT WHITE TORTOISE SHELL BRACKET
    (Name: 'xlarr'; Value: #10229), // LONG LEFTWARDS ARROW
    (Name: 'longleftarrow'; Value: #10229), // LONG LEFTWARDS ARROW
    (Name: 'LongLeftArrow'; Value: #10229), // LONG LEFTWARDS ARROW
    (Name: 'xrarr'; Value: #10230), // LONG RIGHTWARDS ARROW
    (Name: 'longrightarrow'; Value: #10230), // LONG RIGHTWARDS ARROW
    (Name: 'LongRightArrow'; Value: #10230), // LONG RIGHTWARDS ARROW
    (Name: 'xharr'; Value: #10231), // LONG LEFT RIGHT ARROW
    (Name: 'longleftrightarrow'; Value: #10231), // LONG LEFT RIGHT ARROW
    (Name: 'LongLeftRightArrow'; Value: #10231), // LONG LEFT RIGHT ARROW
    (Name: 'xlArr'; Value: #10232), // LONG LEFTWARDS DOUBLE ARROW
    (Name: 'Longleftarrow'; Value: #10232), // LONG LEFTWARDS DOUBLE ARROW
    (Name: 'DoubleLongLeftArrow'; Value: #10232), // LONG LEFTWARDS DOUBLE ARROW
    (Name: 'xrArr'; Value: #10233), // LONG RIGHTWARDS DOUBLE ARROW
    (Name: 'Longrightarrow'; Value: #10233), // LONG RIGHTWARDS DOUBLE ARROW
    (Name: 'DoubleLongRightArrow'; Value: #10233), // LONG RIGHTWARDS DOUBLE ARROW
    (Name: 'xhArr'; Value: #10234), // LONG LEFT RIGHT DOUBLE ARROW
    (Name: 'Longleftrightarrow'; Value: #10234), // LONG LEFT RIGHT DOUBLE ARROW
    (Name: 'DoubleLongLeftRightArrow'; Value: #10234), // LONG LEFT RIGHT DOUBLE ARROW
    (Name: 'xmap'; Value: #10236), // LONG RIGHTWARDS ARROW FROM BAR
    (Name: 'longmapsto'; Value: #10236), // LONG RIGHTWARDS ARROW FROM BAR
    (Name: 'dzigrarr'; Value: #10239), // LONG RIGHTWARDS SQUIGGLE ARROW
    (Name: 'nvlArr'; Value: #10498), // LEFTWARDS DOUBLE ARROW WITH VERTICAL STROKE
    (Name: 'nvrArr'; Value: #10499), // RIGHTWARDS DOUBLE ARROW WITH VERTICAL STROKE
    (Name: 'nvHarr'; Value: #10500), // LEFT RIGHT DOUBLE ARROW WITH VERTICAL STROKE
    (Name: 'Map'; Value: #10501), // RIGHTWARDS TWO-HEADED ARROW FROM BAR
    (Name: 'lbarr'; Value: #10508), // LEFTWARDS DOUBLE DASH ARROW
    (Name: 'rbarr'; Value: #10509), // RIGHTWARDS DOUBLE DASH ARROW
    (Name: 'bkarow'; Value: #10509), // RIGHTWARDS DOUBLE DASH ARROW
    (Name: 'lBarr'; Value: #10510), // LEFTWARDS TRIPLE DASH ARROW
    (Name: 'rBarr'; Value: #10511), // RIGHTWARDS TRIPLE DASH ARROW
    (Name: 'dbkarow'; Value: #10511), // RIGHTWARDS TRIPLE DASH ARROW
    (Name: 'RBarr'; Value: #10512), // RIGHTWARDS TWO-HEADED TRIPLE DASH ARROW
    (Name: 'drbkarow'; Value: #10512), // RIGHTWARDS TWO-HEADED TRIPLE DASH ARROW
    (Name: 'DDotrahd'; Value: #10513), // RIGHTWARDS ARROW WITH DOTTED STEM
    (Name: 'UpArrowBar'; Value: #10514), // UPWARDS ARROW TO BAR
    (Name: 'DownArrowBar'; Value: #10515), // DOWNWARDS ARROW TO BAR
    (Name: 'Rarrtl'; Value: #10518), // RIGHTWARDS TWO-HEADED ARROW WITH TAIL
    (Name: 'latail'; Value: #10521), // LEFTWARDS ARROW-TAIL
    (Name: 'ratail'; Value: #10522), // RIGHTWARDS ARROW-TAIL
    (Name: 'lAtail'; Value: #10523), // LEFTWARDS DOUBLE ARROW-TAIL
    (Name: 'rAtail'; Value: #10524), // RIGHTWARDS DOUBLE ARROW-TAIL
    (Name: 'larrfs'; Value: #10525), // LEFTWARDS ARROW TO BLACK DIAMOND
    (Name: 'rarrfs'; Value: #10526), // RIGHTWARDS ARROW TO BLACK DIAMOND
    (Name: 'larrbfs'; Value: #10527), // LEFTWARDS ARROW FROM BAR TO BLACK DIAMOND
    (Name: 'rarrbfs'; Value: #10528), // RIGHTWARDS ARROW FROM BAR TO BLACK DIAMOND
    (Name: 'nwarhk'; Value: #10531), // NORTH WEST ARROW WITH HOOK
    (Name: 'nearhk'; Value: #10532), // NORTH EAST ARROW WITH HOOK
    (Name: 'searhk'; Value: #10533), // SOUTH EAST ARROW WITH HOOK
    (Name: 'hksearow'; Value: #10533), // SOUTH EAST ARROW WITH HOOK
    (Name: 'swarhk'; Value: #10534), // SOUTH WEST ARROW WITH HOOK
    (Name: 'hkswarow'; Value: #10534), // SOUTH WEST ARROW WITH HOOK
    (Name: 'nwnear'; Value: #10535), // NORTH WEST ARROW AND NORTH EAST ARROW
    (Name: 'nesear'; Value: #10536), // NORTH EAST ARROW AND SOUTH EAST ARROW
    (Name: 'toea'; Value: #10536), // NORTH EAST ARROW AND SOUTH EAST ARROW
    (Name: 'seswar'; Value: #10537), // SOUTH EAST ARROW AND SOUTH WEST ARROW
    (Name: 'tosa'; Value: #10537), // SOUTH EAST ARROW AND SOUTH WEST ARROW
    (Name: 'swnwar'; Value: #10538), // SOUTH WEST ARROW AND NORTH WEST ARROW
    (Name: 'rarrc'; Value: #10547), // WAVE ARROW POINTING DIRECTLY RIGHT
    (Name: 'cudarrr'; Value: #10549), // ARROW POINTING RIGHTWARDS THEN CURVING DOWNWARDS
    (Name: 'ldca'; Value: #10550), // ARROW POINTING DOWNWARDS THEN CURVING LEFTWARDS
    (Name: 'rdca'; Value: #10551), // ARROW POINTING DOWNWARDS THEN CURVING RIGHTWARDS
    (Name: 'cudarrl'; Value: #10552), // RIGHT-SIDE ARC CLOCKWISE ARROW
    (Name: 'larrpl'; Value: #10553), // LEFT-SIDE ARC ANTICLOCKWISE ARROW
    (Name: 'curarrm'; Value: #10556), // TOP ARC CLOCKWISE ARROW WITH MINUS
    (Name: 'cularrp'; Value: #10557), // TOP ARC ANTICLOCKWISE ARROW WITH PLUS
    (Name: 'rarrpl'; Value: #10565), // RIGHTWARDS ARROW WITH PLUS BELOW
    (Name: 'harrcir'; Value: #10568), // LEFT RIGHT ARROW THROUGH SMALL CIRCLE
    (Name: 'Uarrocir'; Value: #10569), // UPWARDS TWO-HEADED ARROW FROM SMALL CIRCLE
    (Name: 'lurdshar'; Value: #10570), // LEFT BARB UP RIGHT BARB DOWN HARPOON
    (Name: 'ldrushar'; Value: #10571), // LEFT BARB DOWN RIGHT BARB UP HARPOON
    (Name: 'LeftRightVector'; Value: #10574), // LEFT BARB UP RIGHT BARB UP HARPOON
    (Name: 'RightUpDownVector'; Value: #10575), // UP BARB RIGHT DOWN BARB RIGHT HARPOON
    (Name: 'DownLeftRightVector'; Value: #10576), // LEFT BARB DOWN RIGHT BARB DOWN HARPOON
    (Name: 'LeftUpDownVector'; Value: #10577), // UP BARB LEFT DOWN BARB LEFT HARPOON
    (Name: 'LeftVectorBar'; Value: #10578), // LEFTWARDS HARPOON WITH BARB UP TO BAR
    (Name: 'RightVectorBar'; Value: #10579), // RIGHTWARDS HARPOON WITH BARB UP TO BAR
    (Name: 'RightUpVectorBar'; Value: #10580), // UPWARDS HARPOON WITH BARB RIGHT TO BAR
    (Name: 'RightDownVectorBar'; Value: #10581), // DOWNWARDS HARPOON WITH BARB RIGHT TO BAR
    (Name: 'DownLeftVectorBar'; Value: #10582), // LEFTWARDS HARPOON WITH BARB DOWN TO BAR
    (Name: 'DownRightVectorBar'; Value: #10583), // RIGHTWARDS HARPOON WITH BARB DOWN TO BAR
    (Name: 'LeftUpVectorBar'; Value: #10584), // UPWARDS HARPOON WITH BARB LEFT TO BAR
    (Name: 'LeftDownVectorBar'; Value: #10585), // DOWNWARDS HARPOON WITH BARB LEFT TO BAR
    (Name: 'LeftTeeVector'; Value: #10586), // LEFTWARDS HARPOON WITH BARB UP FROM BAR
    (Name: 'RightTeeVector'; Value: #10587), // RIGHTWARDS HARPOON WITH BARB UP FROM BAR
    (Name: 'RightUpTeeVector'; Value: #10588), // UPWARDS HARPOON WITH BARB RIGHT FROM BAR
    (Name: 'RightDownTeeVector'; Value: #10589), // DOWNWARDS HARPOON WITH BARB RIGHT FROM BAR
    (Name: 'DownLeftTeeVector'; Value: #10590), // LEFTWARDS HARPOON WITH BARB DOWN FROM BAR
    (Name: 'DownRightTeeVector'; Value: #10591), // RIGHTWARDS HARPOON WITH BARB DOWN FROM BAR
    (Name: 'LeftUpTeeVector'; Value: #10592), // UPWARDS HARPOON WITH BARB LEFT FROM BAR
    (Name: 'LeftDownTeeVector'; Value: #10593), // DOWNWARDS HARPOON WITH BARB LEFT FROM BAR
    (Name: 'lHar'; Value: #10594), // LEFTWARDS HARPOON WITH BARB UP ABOVE LEFTWARDS HARPOON WITH BARB DOWN
    (Name: 'uHar'; Value: #10595), // UPWARDS HARPOON WITH BARB LEFT BESIDE UPWARDS HARPOON WITH BARB RIGHT
    (Name: 'rHar'; Value: #10596), // RIGHTWARDS HARPOON WITH BARB UP ABOVE RIGHTWARDS HARPOON WITH BARB DOWN
    (Name: 'dHar'; Value: #10597), // DOWNWARDS HARPOON WITH BARB LEFT BESIDE DOWNWARDS HARPOON WITH BARB RIGHT
    (Name: 'luruhar'; Value: #10598), // LEFTWARDS HARPOON WITH BARB UP ABOVE RIGHTWARDS HARPOON WITH BARB UP
    (Name: 'ldrdhar'; Value: #10599), // LEFTWARDS HARPOON WITH BARB DOWN ABOVE RIGHTWARDS HARPOON WITH BARB DOWN
    (Name: 'ruluhar'; Value: #10600), // RIGHTWARDS HARPOON WITH BARB UP ABOVE LEFTWARDS HARPOON WITH BARB UP
    (Name: 'rdldhar'; Value: #10601), // RIGHTWARDS HARPOON WITH BARB DOWN ABOVE LEFTWARDS HARPOON WITH BARB DOWN
    (Name: 'lharul'; Value: #10602), // LEFTWARDS HARPOON WITH BARB UP ABOVE LONG DASH
    (Name: 'llhard'; Value: #10603), // LEFTWARDS HARPOON WITH BARB DOWN BELOW LONG DASH
    (Name: 'rharul'; Value: #10604), // RIGHTWARDS HARPOON WITH BARB UP ABOVE LONG DASH
    (Name: 'lrhard'; Value: #10605), // RIGHTWARDS HARPOON WITH BARB DOWN BELOW LONG DASH
    (Name: 'udhar'; Value: #10606), // UPWARDS HARPOON WITH BARB LEFT BESIDE DOWNWARDS HARPOON WITH BARB RIGHT
    (Name: 'UpEquilibrium'; Value: #10606), // UPWARDS HARPOON WITH BARB LEFT BESIDE DOWNWARDS HARPOON WITH BARB RIGHT
    (Name: 'duhar'; Value: #10607), // DOWNWARDS HARPOON WITH BARB LEFT BESIDE UPWARDS HARPOON WITH BARB RIGHT
    (Name: 'ReverseUpEquilibrium'; Value: #10607), // DOWNWARDS HARPOON WITH BARB LEFT BESIDE UPWARDS HARPOON WITH BARB RIGHT
    (Name: 'RoundImplies'; Value: #10608), // RIGHT DOUBLE ARROW WITH ROUNDED HEAD
    (Name: 'erarr'; Value: #10609), // EQUALS SIGN ABOVE RIGHTWARDS ARROW
    (Name: 'simrarr'; Value: #10610), // TILDE OPERATOR ABOVE RIGHTWARDS ARROW
    (Name: 'larrsim'; Value: #10611), // LEFTWARDS ARROW ABOVE TILDE OPERATOR
    (Name: 'rarrsim'; Value: #10612), // RIGHTWARDS ARROW ABOVE TILDE OPERATOR
    (Name: 'rarrap'; Value: #10613), // RIGHTWARDS ARROW ABOVE ALMOST EQUAL TO
    (Name: 'ltlarr'; Value: #10614), // LESS-THAN ABOVE LEFTWARDS ARROW
    (Name: 'gtrarr'; Value: #10616), // GREATER-THAN ABOVE RIGHTWARDS ARROW
    (Name: 'subrarr'; Value: #10617), // SUBSET ABOVE RIGHTWARDS ARROW
    (Name: 'suplarr'; Value: #10619), // SUPERSET ABOVE LEFTWARDS ARROW
    (Name: 'lfisht'; Value: #10620), // LEFT FISH TAIL
    (Name: 'rfisht'; Value: #10621), // RIGHT FISH TAIL
    (Name: 'ufisht'; Value: #10622), // UP FISH TAIL
    (Name: 'dfisht'; Value: #10623), // DOWN FISH TAIL
    (Name: 'lopar'; Value: #10629), // LEFT WHITE PARENTHESIS
    (Name: 'ropar'; Value: #10630), // RIGHT WHITE PARENTHESIS
    (Name: 'lbrke'; Value: #10635), // LEFT SQUARE BRACKET WITH UNDERBAR
    (Name: 'rbrke'; Value: #10636), // RIGHT SQUARE BRACKET WITH UNDERBAR
    (Name: 'lbrkslu'; Value: #10637), // LEFT SQUARE BRACKET WITH TICK IN TOP CORNER
    (Name: 'rbrksld'; Value: #10638), // RIGHT SQUARE BRACKET WITH TICK IN BOTTOM CORNER
    (Name: 'lbrksld'; Value: #10639), // LEFT SQUARE BRACKET WITH TICK IN BOTTOM CORNER
    (Name: 'rbrkslu'; Value: #10640), // RIGHT SQUARE BRACKET WITH TICK IN TOP CORNER
    (Name: 'langd'; Value: #10641), // LEFT ANGLE BRACKET WITH DOT
    (Name: 'rangd'; Value: #10642), // RIGHT ANGLE BRACKET WITH DOT
    (Name: 'lparlt'; Value: #10643), // LEFT ARC LESS-THAN BRACKET
    (Name: 'rpargt'; Value: #10644), // RIGHT ARC GREATER-THAN BRACKET
    (Name: 'gtlPar'; Value: #10645), // DOUBLE LEFT ARC GREATER-THAN BRACKET
    (Name: 'ltrPar'; Value: #10646), // DOUBLE RIGHT ARC LESS-THAN BRACKET
    (Name: 'vzigzag'; Value: #10650), // VERTICAL ZIGZAG LINE
    (Name: 'vangrt'; Value: #10652), // RIGHT ANGLE VARIANT WITH SQUARE
    (Name: 'angrtvbd'; Value: #10653), // MEASURED RIGHT ANGLE WITH DOT
    (Name: 'ange'; Value: #10660), // ANGLE WITH UNDERBAR
    (Name: 'range'; Value: #10661), // REVERSED ANGLE WITH UNDERBAR
    (Name: 'dwangle'; Value: #10662), // OBLIQUE ANGLE OPENING UP
    (Name: 'uwangle'; Value: #10663), // OBLIQUE ANGLE OPENING DOWN
    (Name: 'angmsdaa'; Value: #10664), // MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING UP AND RIGHT
    (Name: 'angmsdab'; Value: #10665), // MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING UP AND LEFT
    (Name: 'angmsdac'; Value: #10666), // MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING DOWN AND RIGHT
    (Name: 'angmsdad'; Value: #10667), // MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING DOWN AND LEFT
    (Name: 'angmsdae'; Value: #10668), // MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING RIGHT AND UP
    (Name: 'angmsdaf'; Value: #10669), // MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING LEFT AND UP
    (Name: 'angmsdag'; Value: #10670), // MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING RIGHT AND DOWN
    (Name: 'angmsdah'; Value: #10671), // MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING LEFT AND DOWN
    (Name: 'bemptyv'; Value: #10672), // REVERSED EMPTY SET
    (Name: 'demptyv'; Value: #10673), // EMPTY SET WITH OVERBAR
    (Name: 'cemptyv'; Value: #10674), // EMPTY SET WITH SMALL CIRCLE ABOVE
    (Name: 'raemptyv'; Value: #10675), // EMPTY SET WITH RIGHT ARROW ABOVE
    (Name: 'laemptyv'; Value: #10676), // EMPTY SET WITH LEFT ARROW ABOVE
    (Name: 'ohbar'; Value: #10677), // CIRCLE WITH HORIZONTAL BAR
    (Name: 'omid'; Value: #10678), // CIRCLED VERTICAL BAR
    (Name: 'opar'; Value: #10679), // CIRCLED PARALLEL
    (Name: 'operp'; Value: #10681), // CIRCLED PERPENDICULAR
    (Name: 'olcross'; Value: #10683), // CIRCLE WITH SUPERIMPOSED X
    (Name: 'odsold'; Value: #10684), // CIRCLED ANTICLOCKWISE-ROTATED DIVISION SIGN
    (Name: 'olcir'; Value: #10686), // CIRCLED WHITE BULLET
    (Name: 'ofcir'; Value: #10687), // CIRCLED BULLET
    (Name: 'olt'; Value: #10688), // CIRCLED LESS-THAN
    (Name: 'ogt'; Value: #10689), // CIRCLED GREATER-THAN
    (Name: 'cirscir'; Value: #10690), // CIRCLE WITH SMALL CIRCLE TO THE RIGHT
    (Name: 'cirE'; Value: #10691), // CIRCLE WITH TWO HORIZONTAL STROKES TO THE RIGHT
    (Name: 'solb'; Value: #10692), // SQUARED RISING DIAGONAL SLASH
    (Name: 'bsolb'; Value: #10693), // SQUARED FALLING DIAGONAL SLASH
    (Name: 'boxbox'; Value: #10697), // TWO JOINED SQUARES
    (Name: 'trisb'; Value: #10701), // TRIANGLE WITH SERIFS AT BOTTOM
    (Name: 'rtriltri'; Value: #10702), // RIGHT TRIANGLE ABOVE LEFT TRIANGLE
    (Name: 'LeftTriangleBar'; Value: #10703), // LEFT TRIANGLE BESIDE VERTICAL BAR
    (Name: 'RightTriangleBar'; Value: #10704), // VERTICAL BAR BESIDE RIGHT TRIANGLE
    (Name: 'race'; Value: #10714), // LEFT DOUBLE WIGGLY FENCE
    (Name: 'iinfin'; Value: #10716), // INCOMPLETE INFINITY
    (Name: 'infintie'; Value: #10717), // TIE OVER INFINITY
    (Name: 'nvinfin'; Value: #10718), // INFINITY NEGATED WITH VERTICAL BAR
    (Name: 'eparsl'; Value: #10723), // EQUALS SIGN AND SLANTED PARALLEL
    (Name: 'smeparsl'; Value: #10724), // EQUALS SIGN AND SLANTED PARALLEL WITH TILDE ABOVE
    (Name: 'eqvparsl'; Value: #10725), // IDENTICAL TO AND SLANTED PARALLEL
    (Name: 'lozf'; Value: #10731), // BLACK LOZENGE
    (Name: 'blacklozenge'; Value: #10731), // BLACK LOZENGE
    (Name: 'RuleDelayed'; Value: #10740), // RULE-DELAYED
    (Name: 'dsol'; Value: #10742), // SOLIDUS WITH OVERBAR
    (Name: 'xodot'; Value: #10752), // N-ARY CIRCLED DOT OPERATOR
    (Name: 'bigodot'; Value: #10752), // N-ARY CIRCLED DOT OPERATOR
    (Name: 'xoplus'; Value: #10753), // N-ARY CIRCLED PLUS OPERATOR
    (Name: 'bigoplus'; Value: #10753), // N-ARY CIRCLED PLUS OPERATOR
    (Name: 'xotime'; Value: #10754), // N-ARY CIRCLED TIMES OPERATOR
    (Name: 'bigotimes'; Value: #10754), // N-ARY CIRCLED TIMES OPERATOR
    (Name: 'xuplus'; Value: #10756), // N-ARY UNION OPERATOR WITH PLUS
    (Name: 'biguplus'; Value: #10756), // N-ARY UNION OPERATOR WITH PLUS
    (Name: 'xsqcup'; Value: #10758), // N-ARY SQUARE UNION OPERATOR
    (Name: 'bigsqcup'; Value: #10758), // N-ARY SQUARE UNION OPERATOR
    (Name: 'qint'; Value: #10764), // QUADRUPLE INTEGRAL OPERATOR
    (Name: 'iiiint'; Value: #10764), // QUADRUPLE INTEGRAL OPERATOR
    (Name: 'fpartint'; Value: #10765), // FINITE PART INTEGRAL
    (Name: 'cirfnint'; Value: #10768), // CIRCULATION FUNCTION
    (Name: 'awint'; Value: #10769), // ANTICLOCKWISE INTEGRATION
    (Name: 'rppolint'; Value: #10770), // LINE INTEGRATION WITH RECTANGULAR PATH AROUND POLE
    (Name: 'scpolint'; Value: #10771), // LINE INTEGRATION WITH SEMICIRCULAR PATH AROUND POLE
    (Name: 'npolint'; Value: #10772), // LINE INTEGRATION NOT INCLUDING THE POLE
    (Name: 'pointint'; Value: #10773), // INTEGRAL AROUND A POINT OPERATOR
    (Name: 'quatint'; Value: #10774), // QUATERNION INTEGRAL OPERATOR
    (Name: 'intlarhk'; Value: #10775), // INTEGRAL WITH LEFTWARDS ARROW WITH HOOK
    (Name: 'pluscir'; Value: #10786), // PLUS SIGN WITH SMALL CIRCLE ABOVE
    (Name: 'plusacir'; Value: #10787), // PLUS SIGN WITH CIRCUMFLEX ACCENT ABOVE
    (Name: 'simplus'; Value: #10788), // PLUS SIGN WITH TILDE ABOVE
    (Name: 'plusdu'; Value: #10789), // PLUS SIGN WITH DOT BELOW
    (Name: 'plussim'; Value: #10790), // PLUS SIGN WITH TILDE BELOW
    (Name: 'plustwo'; Value: #10791), // PLUS SIGN WITH SUBSCRIPT TWO
    (Name: 'mcomma'; Value: #10793), // MINUS SIGN WITH COMMA ABOVE
    (Name: 'minusdu'; Value: #10794), // MINUS SIGN WITH DOT BELOW
    (Name: 'loplus'; Value: #10797), // PLUS SIGN IN LEFT HALF CIRCLE
    (Name: 'roplus'; Value: #10798), // PLUS SIGN IN RIGHT HALF CIRCLE
    (Name: 'Cross'; Value: #10799), // VECTOR OR CROSS PRODUCT
    (Name: 'timesd'; Value: #10800), // MULTIPLICATION SIGN WITH DOT ABOVE
    (Name: 'timesbar'; Value: #10801), // MULTIPLICATION SIGN WITH UNDERBAR
    (Name: 'smashp'; Value: #10803), // SMASH PRODUCT
    (Name: 'lotimes'; Value: #10804), // MULTIPLICATION SIGN IN LEFT HALF CIRCLE
    (Name: 'rotimes'; Value: #10805), // MULTIPLICATION SIGN IN RIGHT HALF CIRCLE
    (Name: 'otimesas'; Value: #10806), // CIRCLED MULTIPLICATION SIGN WITH CIRCUMFLEX ACCENT
    (Name: 'Otimes'; Value: #10807), // MULTIPLICATION SIGN IN DOUBLE CIRCLE
    (Name: 'odiv'; Value: #10808), // CIRCLED DIVISION SIGN
    (Name: 'triplus'; Value: #10809), // PLUS SIGN IN TRIANGLE
    (Name: 'triminus'; Value: #10810), // MINUS SIGN IN TRIANGLE
    (Name: 'tritime'; Value: #10811), // MULTIPLICATION SIGN IN TRIANGLE
    (Name: 'iprod'; Value: #10812), // INTERIOR PRODUCT
    (Name: 'intprod'; Value: #10812), // INTERIOR PRODUCT
    (Name: 'amalg'; Value: #10815), // AMALGAMATION OR COPRODUCT
    (Name: 'capdot'; Value: #10816), // INTERSECTION WITH DOT
    (Name: 'ncup'; Value: #10818), // UNION WITH OVERBAR
    (Name: 'ncap'; Value: #10819), // INTERSECTION WITH OVERBAR
    (Name: 'capand'; Value: #10820), // INTERSECTION WITH LOGICAL AND
    (Name: 'cupor'; Value: #10821), // UNION WITH LOGICAL OR
    (Name: 'cupcap'; Value: #10822), // UNION ABOVE INTERSECTION
    (Name: 'capcup'; Value: #10823), // INTERSECTION ABOVE UNION
    (Name: 'cupbrcap'; Value: #10824), // UNION ABOVE BAR ABOVE INTERSECTION
    (Name: 'capbrcup'; Value: #10825), // INTERSECTION ABOVE BAR ABOVE UNION
    (Name: 'cupcup'; Value: #10826), // UNION BESIDE AND JOINED WITH UNION
    (Name: 'capcap'; Value: #10827), // INTERSECTION BESIDE AND JOINED WITH INTERSECTION
    (Name: 'ccups'; Value: #10828), // CLOSED UNION WITH SERIFS
    (Name: 'ccaps'; Value: #10829), // CLOSED INTERSECTION WITH SERIFS
    (Name: 'ccupssm'; Value: #10832), // CLOSED UNION WITH SERIFS AND SMASH PRODUCT
    (Name: 'And'; Value: #10835), // DOUBLE LOGICAL AND
    (Name: 'Or'; Value: #10836), // DOUBLE LOGICAL OR
    (Name: 'andand'; Value: #10837), // TWO INTERSECTING LOGICAL AND
    (Name: 'oror'; Value: #10838), // TWO INTERSECTING LOGICAL OR
    (Name: 'orslope'; Value: #10839), // SLOPING LARGE OR
    (Name: 'andslope'; Value: #10840), // SLOPING LARGE AND
    (Name: 'andv'; Value: #10842), // LOGICAL AND WITH MIDDLE STEM
    (Name: 'orv'; Value: #10843), // LOGICAL OR WITH MIDDLE STEM
    (Name: 'andd'; Value: #10844), // LOGICAL AND WITH HORIZONTAL DASH
    (Name: 'ord'; Value: #10845), // LOGICAL OR WITH HORIZONTAL DASH
    (Name: 'wedbar'; Value: #10847), // LOGICAL AND WITH UNDERBAR
    (Name: 'sdote'; Value: #10854), // EQUALS SIGN WITH DOT BELOW
    (Name: 'simdot'; Value: #10858), // TILDE OPERATOR WITH DOT ABOVE
    (Name: 'congdot'; Value: #10861), // CONGRUENT WITH DOT ABOVE
    (Name: 'easter'; Value: #10862), // EQUALS WITH ASTERISK
    (Name: 'apacir'; Value: #10863), // ALMOST EQUAL TO WITH CIRCUMFLEX ACCENT
    (Name: 'apE'; Value: #10864), // APPROXIMATELY EQUAL OR EQUAL TO
    (Name: 'eplus'; Value: #10865), // EQUALS SIGN ABOVE PLUS SIGN
    (Name: 'pluse'; Value: #10866), // PLUS SIGN ABOVE EQUALS SIGN
    (Name: 'Esim'; Value: #10867), // EQUALS SIGN ABOVE TILDE OPERATOR
    (Name: 'Colone'; Value: #10868), // DOUBLE COLON EQUAL
    (Name: 'Equal'; Value: #10869), // TWO CONSECUTIVE EQUALS SIGNS
    (Name: 'eDDot'; Value: #10871), // EQUALS SIGN WITH TWO DOTS ABOVE AND TWO DOTS BELOW
    (Name: 'ddotseq'; Value: #10871), // EQUALS SIGN WITH TWO DOTS ABOVE AND TWO DOTS BELOW
    (Name: 'equivDD'; Value: #10872), // EQUIVALENT WITH FOUR DOTS ABOVE
    (Name: 'ltcir'; Value: #10873), // LESS-THAN WITH CIRCLE INSIDE
    (Name: 'gtcir'; Value: #10874), // GREATER-THAN WITH CIRCLE INSIDE
    (Name: 'ltquest'; Value: #10875), // LESS-THAN WITH QUESTION MARK ABOVE
    (Name: 'gtquest'; Value: #10876), // GREATER-THAN WITH QUESTION MARK ABOVE
    (Name: 'les'; Value: #10877), // LESS-THAN OR SLANTED EQUAL TO
    (Name: 'LessSlantEqual'; Value: #10877), // LESS-THAN OR SLANTED EQUAL TO
    (Name: 'leqslant'; Value: #10877), // LESS-THAN OR SLANTED EQUAL TO
    (Name: 'ges'; Value: #10878), // GREATER-THAN OR SLANTED EQUAL TO
    (Name: 'GreaterSlantEqual'; Value: #10878), // GREATER-THAN OR SLANTED EQUAL TO
    (Name: 'geqslant'; Value: #10878), // GREATER-THAN OR SLANTED EQUAL TO
    (Name: 'lesdot'; Value: #10879), // LESS-THAN OR SLANTED EQUAL TO WITH DOT INSIDE
    (Name: 'gesdot'; Value: #10880), // GREATER-THAN OR SLANTED EQUAL TO WITH DOT INSIDE
    (Name: 'lesdoto'; Value: #10881), // LESS-THAN OR SLANTED EQUAL TO WITH DOT ABOVE
    (Name: 'gesdoto'; Value: #10882), // GREATER-THAN OR SLANTED EQUAL TO WITH DOT ABOVE
    (Name: 'lesdotor'; Value: #10883), // LESS-THAN OR SLANTED EQUAL TO WITH DOT ABOVE RIGHT
    (Name: 'gesdotol'; Value: #10884), // GREATER-THAN OR SLANTED EQUAL TO WITH DOT ABOVE LEFT
    (Name: 'lap'; Value: #10885), // LESS-THAN OR APPROXIMATE
    (Name: 'lessapprox'; Value: #10885), // LESS-THAN OR APPROXIMATE
    (Name: 'gap'; Value: #10886), // GREATER-THAN OR APPROXIMATE
    (Name: 'gtrapprox'; Value: #10886), // GREATER-THAN OR APPROXIMATE
    (Name: 'lne'; Value: #10887), // LESS-THAN AND SINGLE-LINE NOT EQUAL TO
    (Name: 'lneq'; Value: #10887), // LESS-THAN AND SINGLE-LINE NOT EQUAL TO
    (Name: 'gne'; Value: #10888), // GREATER-THAN AND SINGLE-LINE NOT EQUAL TO
    (Name: 'gneq'; Value: #10888), // GREATER-THAN AND SINGLE-LINE NOT EQUAL TO
    (Name: 'lnap'; Value: #10889), // LESS-THAN AND NOT APPROXIMATE
    (Name: 'lnapprox'; Value: #10889), // LESS-THAN AND NOT APPROXIMATE
    (Name: 'gnap'; Value: #10890), // GREATER-THAN AND NOT APPROXIMATE
    (Name: 'gnapprox'; Value: #10890), // GREATER-THAN AND NOT APPROXIMATE
    (Name: 'lEg'; Value: #10891), // LESS-THAN ABOVE DOUBLE-LINE EQUAL ABOVE GREATER-THAN
    (Name: 'lesseqqgtr'; Value: #10891), // LESS-THAN ABOVE DOUBLE-LINE EQUAL ABOVE GREATER-THAN
    (Name: 'gEl'; Value: #10892), // GREATER-THAN ABOVE DOUBLE-LINE EQUAL ABOVE LESS-THAN
    (Name: 'gtreqqless'; Value: #10892), // GREATER-THAN ABOVE DOUBLE-LINE EQUAL ABOVE LESS-THAN
    (Name: 'lsime'; Value: #10893), // LESS-THAN ABOVE SIMILAR OR EQUAL
    (Name: 'gsime'; Value: #10894), // GREATER-THAN ABOVE SIMILAR OR EQUAL
    (Name: 'lsimg'; Value: #10895), // LESS-THAN ABOVE SIMILAR ABOVE GREATER-THAN
    (Name: 'gsiml'; Value: #10896), // GREATER-THAN ABOVE SIMILAR ABOVE LESS-THAN
    (Name: 'lgE'; Value: #10897), // LESS-THAN ABOVE GREATER-THAN ABOVE DOUBLE-LINE EQUAL
    (Name: 'glE'; Value: #10898), // GREATER-THAN ABOVE LESS-THAN ABOVE DOUBLE-LINE EQUAL
    (Name: 'lesges'; Value: #10899), // LESS-THAN ABOVE SLANTED EQUAL ABOVE GREATER-THAN ABOVE SLANTED EQUAL
    (Name: 'gesles'; Value: #10900), // GREATER-THAN ABOVE SLANTED EQUAL ABOVE LESS-THAN ABOVE SLANTED EQUAL
    (Name: 'els'; Value: #10901), // SLANTED EQUAL TO OR LESS-THAN
    (Name: 'eqslantless'; Value: #10901), // SLANTED EQUAL TO OR LESS-THAN
    (Name: 'egs'; Value: #10902), // SLANTED EQUAL TO OR GREATER-THAN
    (Name: 'eqslantgtr'; Value: #10902), // SLANTED EQUAL TO OR GREATER-THAN
    (Name: 'elsdot'; Value: #10903), // SLANTED EQUAL TO OR LESS-THAN WITH DOT INSIDE
    (Name: 'egsdot'; Value: #10904), // SLANTED EQUAL TO OR GREATER-THAN WITH DOT INSIDE
    (Name: 'el'; Value: #10905), // DOUBLE-LINE EQUAL TO OR LESS-THAN
    (Name: 'eg'; Value: #10906), // DOUBLE-LINE EQUAL TO OR GREATER-THAN
    (Name: 'siml'; Value: #10909), // SIMILAR OR LESS-THAN
    (Name: 'simg'; Value: #10910), // SIMILAR OR GREATER-THAN
    (Name: 'simlE'; Value: #10911), // SIMILAR ABOVE LESS-THAN ABOVE EQUALS SIGN
    (Name: 'simgE'; Value: #10912), // SIMILAR ABOVE GREATER-THAN ABOVE EQUALS SIGN
    (Name: 'LessLess'; Value: #10913), // DOUBLE NESTED LESS-THAN
    (Name: 'GreaterGreater'; Value: #10914), // DOUBLE NESTED GREATER-THAN
    (Name: 'glj'; Value: #10916), // GREATER-THAN OVERLAPPING LESS-THAN
    (Name: 'gla'; Value: #10917), // GREATER-THAN BESIDE LESS-THAN
    (Name: 'ltcc'; Value: #10918), // LESS-THAN CLOSED BY CURVE
    (Name: 'gtcc'; Value: #10919), // GREATER-THAN CLOSED BY CURVE
    (Name: 'lescc'; Value: #10920), // LESS-THAN CLOSED BY CURVE ABOVE SLANTED EQUAL
    (Name: 'gescc'; Value: #10921), // GREATER-THAN CLOSED BY CURVE ABOVE SLANTED EQUAL
    (Name: 'smt'; Value: #10922), // SMALLER THAN
    (Name: 'lat'; Value: #10923), // LARGER THAN
    (Name: 'smte'; Value: #10924), // SMALLER THAN OR EQUAL TO
    (Name: 'late'; Value: #10925), // LARGER THAN OR EQUAL TO
    (Name: 'bumpE'; Value: #10926), // EQUALS SIGN WITH BUMPY ABOVE
    (Name: 'pre'; Value: #10927), // PRECEDES ABOVE SINGLE-LINE EQUALS SIGN
    (Name: 'preceq'; Value: #10927), // PRECEDES ABOVE SINGLE-LINE EQUALS SIGN
    (Name: 'PrecedesEqual'; Value: #10927), // PRECEDES ABOVE SINGLE-LINE EQUALS SIGN
    (Name: 'sce'; Value: #10928), // SUCCEEDS ABOVE SINGLE-LINE EQUALS SIGN
    (Name: 'succeq'; Value: #10928), // SUCCEEDS ABOVE SINGLE-LINE EQUALS SIGN
    (Name: 'SucceedsEqual'; Value: #10928), // SUCCEEDS ABOVE SINGLE-LINE EQUALS SIGN
    (Name: 'prE'; Value: #10931), // PRECEDES ABOVE EQUALS SIGN
    (Name: 'scE'; Value: #10932), // SUCCEEDS ABOVE EQUALS SIGN
    (Name: 'prnE'; Value: #10933), // PRECEDES ABOVE NOT EQUAL TO
    (Name: 'precneqq'; Value: #10933), // PRECEDES ABOVE NOT EQUAL TO
    (Name: 'scnE'; Value: #10934), // SUCCEEDS ABOVE NOT EQUAL TO
    (Name: 'succneqq'; Value: #10934), // SUCCEEDS ABOVE NOT EQUAL TO
    (Name: 'prap'; Value: #10935), // PRECEDES ABOVE ALMOST EQUAL TO
    (Name: 'precapprox'; Value: #10935), // PRECEDES ABOVE ALMOST EQUAL TO
    (Name: 'scap'; Value: #10936), // SUCCEEDS ABOVE ALMOST EQUAL TO
    (Name: 'succapprox'; Value: #10936), // SUCCEEDS ABOVE ALMOST EQUAL TO
    (Name: 'prnap'; Value: #10937), // PRECEDES ABOVE NOT ALMOST EQUAL TO
    (Name: 'precnapprox'; Value: #10937), // PRECEDES ABOVE NOT ALMOST EQUAL TO
    (Name: 'scnap'; Value: #10938), // SUCCEEDS ABOVE NOT ALMOST EQUAL TO
    (Name: 'succnapprox'; Value: #10938), // SUCCEEDS ABOVE NOT ALMOST EQUAL TO
    (Name: 'Pr'; Value: #10939), // DOUBLE PRECEDES
    (Name: 'Sc'; Value: #10940), // DOUBLE SUCCEEDS
    (Name: 'subdot'; Value: #10941), // SUBSET WITH DOT
    (Name: 'supdot'; Value: #10942), // SUPERSET WITH DOT
    (Name: 'subplus'; Value: #10943), // SUBSET WITH PLUS SIGN BELOW
    (Name: 'supplus'; Value: #10944), // SUPERSET WITH PLUS SIGN BELOW
    (Name: 'submult'; Value: #10945), // SUBSET WITH MULTIPLICATION SIGN BELOW
    (Name: 'supmult'; Value: #10946), // SUPERSET WITH MULTIPLICATION SIGN BELOW
    (Name: 'subedot'; Value: #10947), // SUBSET OF OR EQUAL TO WITH DOT ABOVE
    (Name: 'supedot'; Value: #10948), // SUPERSET OF OR EQUAL TO WITH DOT ABOVE
    (Name: 'subE'; Value: #10949), // SUBSET OF ABOVE EQUALS SIGN
    (Name: 'subseteqq'; Value: #10949), // SUBSET OF ABOVE EQUALS SIGN
    (Name: 'supE'; Value: #10950), // SUPERSET OF ABOVE EQUALS SIGN
    (Name: 'supseteqq'; Value: #10950), // SUPERSET OF ABOVE EQUALS SIGN
    (Name: 'subsim'; Value: #10951), // SUBSET OF ABOVE TILDE OPERATOR
    (Name: 'supsim'; Value: #10952), // SUPERSET OF ABOVE TILDE OPERATOR
    (Name: 'subnE'; Value: #10955), // SUBSET OF ABOVE NOT EQUAL TO
    (Name: 'subsetneqq'; Value: #10955), // SUBSET OF ABOVE NOT EQUAL TO
    (Name: 'supnE'; Value: #10956), // SUPERSET OF ABOVE NOT EQUAL TO
    (Name: 'supsetneqq'; Value: #10956), // SUPERSET OF ABOVE NOT EQUAL TO
    (Name: 'csub'; Value: #10959), // CLOSED SUBSET
    (Name: 'csup'; Value: #10960), // CLOSED SUPERSET
    (Name: 'csube'; Value: #10961), // CLOSED SUBSET OR EQUAL TO
    (Name: 'csupe'; Value: #10962), // CLOSED SUPERSET OR EQUAL TO
    (Name: 'subsup'; Value: #10963), // SUBSET ABOVE SUPERSET
    (Name: 'supsub'; Value: #10964), // SUPERSET ABOVE SUBSET
    (Name: 'subsub'; Value: #10965), // SUBSET ABOVE SUBSET
    (Name: 'supsup'; Value: #10966), // SUPERSET ABOVE SUPERSET
    (Name: 'suphsub'; Value: #10967), // SUPERSET BESIDE SUBSET
    (Name: 'supdsub'; Value: #10968), // SUPERSET BESIDE AND JOINED BY DASH WITH SUBSET
    (Name: 'forkv'; Value: #10969), // ELEMENT OF OPENING DOWNWARDS
    (Name: 'topfork'; Value: #10970), // PITCHFORK WITH TEE TOP
    (Name: 'mlcp'; Value: #10971), // TRANSVERSAL INTERSECTION
    (Name: 'Dashv'; Value: #10980), // VERTICAL BAR DOUBLE LEFT TURNSTILE
    (Name: 'DoubleLeftTee'; Value: #10980), // VERTICAL BAR DOUBLE LEFT TURNSTILE
    (Name: 'Vdashl'; Value: #10982), // LONG DASH FROM LEFT MEMBER OF DOUBLE VERTICAL
    (Name: 'Barv'; Value: #10983), // SHORT DOWN TACK WITH OVERBAR
    (Name: 'vBar'; Value: #10984), // SHORT UP TACK WITH UNDERBAR
    (Name: 'vBarv'; Value: #10985), // SHORT UP TACK ABOVE SHORT DOWN TACK
    (Name: 'Vbar'; Value: #10987), // DOUBLE UP TACK
    (Name: 'Not'; Value: #10988), // DOUBLE STROKE NOT SIGN
    (Name: 'bNot'; Value: #10989), // REVERSED DOUBLE STROKE NOT SIGN
    (Name: 'rnmid'; Value: #10990), // DOES NOT DIVIDE WITH REVERSED NEGATION SLASH
    (Name: 'cirmid'; Value: #10991), // VERTICAL LINE WITH CIRCLE ABOVE
    (Name: 'midcir'; Value: #10992), // VERTICAL LINE WITH CIRCLE BELOW
    (Name: 'topcir'; Value: #10993), // DOWN TACK WITH CIRCLE BELOW
    (Name: 'nhpar'; Value: #10994), // PARALLEL WITH HORIZONTAL STROKE
    (Name: 'parsim'; Value: #10995), // PARALLEL WITH TILDE OPERATOR
    (Name: 'parsl'; Value: #11005), // DOUBLE SOLIDUS OPERATOR
    (Name: 'fflig'; Value: #64256), // LATIN SMALL LIGATURE FF
    (Name: 'filig'; Value: #64257), // LATIN SMALL LIGATURE FI
    (Name: 'fllig'; Value: #64258), // LATIN SMALL LIGATURE FL
    (Name: 'ffilig'; Value: #64259), // LATIN SMALL LIGATURE FFI
    (Name: 'ffllig'; Value: #64260), // LATIN SMALL LIGATURE FFL
    (Name: 'Ascr'; Value: #119964), // MATHEMATICAL SCRIPT CAPITAL A
    (Name: 'Cscr'; Value: #119966), // MATHEMATICAL SCRIPT CAPITAL C
    (Name: 'Dscr'; Value: #119967), // MATHEMATICAL SCRIPT CAPITAL D
    (Name: 'Gscr'; Value: #119970), // MATHEMATICAL SCRIPT CAPITAL G
    (Name: 'Jscr'; Value: #119973), // MATHEMATICAL SCRIPT CAPITAL J
    (Name: 'Kscr'; Value: #119974), // MATHEMATICAL SCRIPT CAPITAL K
    (Name: 'Nscr'; Value: #119977), // MATHEMATICAL SCRIPT CAPITAL N
    (Name: 'Oscr'; Value: #119978), // MATHEMATICAL SCRIPT CAPITAL O
    (Name: 'Pscr'; Value: #119979), // MATHEMATICAL SCRIPT CAPITAL P
    (Name: 'Qscr'; Value: #119980), // MATHEMATICAL SCRIPT CAPITAL Q
    (Name: 'Sscr'; Value: #119982), // MATHEMATICAL SCRIPT CAPITAL S
    (Name: 'Tscr'; Value: #119983), // MATHEMATICAL SCRIPT CAPITAL T
    (Name: 'Uscr'; Value: #119984), // MATHEMATICAL SCRIPT CAPITAL U
    (Name: 'Vscr'; Value: #119985), // MATHEMATICAL SCRIPT CAPITAL V
    (Name: 'Wscr'; Value: #119986), // MATHEMATICAL SCRIPT CAPITAL W
    (Name: 'Xscr'; Value: #119987), // MATHEMATICAL SCRIPT CAPITAL X
    (Name: 'Yscr'; Value: #119988), // MATHEMATICAL SCRIPT CAPITAL Y
    (Name: 'Zscr'; Value: #119989), // MATHEMATICAL SCRIPT CAPITAL Z
    (Name: 'ascr'; Value: #119990), // MATHEMATICAL SCRIPT SMALL A
    (Name: 'bscr'; Value: #119991), // MATHEMATICAL SCRIPT SMALL B
    (Name: 'cscr'; Value: #119992), // MATHEMATICAL SCRIPT SMALL C
    (Name: 'dscr'; Value: #119993), // MATHEMATICAL SCRIPT SMALL D
    (Name: 'fscr'; Value: #119995), // MATHEMATICAL SCRIPT SMALL F
    (Name: 'hscr'; Value: #119997), // MATHEMATICAL SCRIPT SMALL H
    (Name: 'iscr'; Value: #119998), // MATHEMATICAL SCRIPT SMALL I
    (Name: 'jscr'; Value: #119999), // MATHEMATICAL SCRIPT SMALL J
    (Name: 'kscr'; Value: #120000), // MATHEMATICAL SCRIPT SMALL K
    (Name: 'lscr'; Value: #120001), // MATHEMATICAL SCRIPT SMALL L
    (Name: 'mscr'; Value: #120002), // MATHEMATICAL SCRIPT SMALL M
    (Name: 'nscr'; Value: #120003), // MATHEMATICAL SCRIPT SMALL N
    (Name: 'pscr'; Value: #120005), // MATHEMATICAL SCRIPT SMALL P
    (Name: 'qscr'; Value: #120006), // MATHEMATICAL SCRIPT SMALL Q
    (Name: 'rscr'; Value: #120007), // MATHEMATICAL SCRIPT SMALL R
    (Name: 'sscr'; Value: #120008), // MATHEMATICAL SCRIPT SMALL S
    (Name: 'tscr'; Value: #120009), // MATHEMATICAL SCRIPT SMALL T
    (Name: 'uscr'; Value: #120010), // MATHEMATICAL SCRIPT SMALL U
    (Name: 'vscr'; Value: #120011), // MATHEMATICAL SCRIPT SMALL V
    (Name: 'wscr'; Value: #120012), // MATHEMATICAL SCRIPT SMALL W
    (Name: 'xscr'; Value: #120013), // MATHEMATICAL SCRIPT SMALL X
    (Name: 'yscr'; Value: #120014), // MATHEMATICAL SCRIPT SMALL Y
    (Name: 'zscr'; Value: #120015), // MATHEMATICAL SCRIPT SMALL Z
    (Name: 'Afr'; Value: #120068), // MATHEMATICAL FRAKTUR CAPITAL A
    (Name: 'Bfr'; Value: #120069), // MATHEMATICAL FRAKTUR CAPITAL B
    (Name: 'Dfr'; Value: #120071), // MATHEMATICAL FRAKTUR CAPITAL D
    (Name: 'Efr'; Value: #120072), // MATHEMATICAL FRAKTUR CAPITAL E
    (Name: 'Ffr'; Value: #120073), // MATHEMATICAL FRAKTUR CAPITAL F
    (Name: 'Gfr'; Value: #120074), // MATHEMATICAL FRAKTUR CAPITAL G
    (Name: 'Jfr'; Value: #120077), // MATHEMATICAL FRAKTUR CAPITAL J
    (Name: 'Kfr'; Value: #120078), // MATHEMATICAL FRAKTUR CAPITAL K
    (Name: 'Lfr'; Value: #120079), // MATHEMATICAL FRAKTUR CAPITAL L
    (Name: 'Mfr'; Value: #120080), // MATHEMATICAL FRAKTUR CAPITAL M
    (Name: 'Nfr'; Value: #120081), // MATHEMATICAL FRAKTUR CAPITAL N
    (Name: 'Ofr'; Value: #120082), // MATHEMATICAL FRAKTUR CAPITAL O
    (Name: 'Pfr'; Value: #120083), // MATHEMATICAL FRAKTUR CAPITAL P
    (Name: 'Qfr'; Value: #120084), // MATHEMATICAL FRAKTUR CAPITAL Q
    (Name: 'Sfr'; Value: #120086), // MATHEMATICAL FRAKTUR CAPITAL S
    (Name: 'Tfr'; Value: #120087), // MATHEMATICAL FRAKTUR CAPITAL T
    (Name: 'Ufr'; Value: #120088), // MATHEMATICAL FRAKTUR CAPITAL U
    (Name: 'Vfr'; Value: #120089), // MATHEMATICAL FRAKTUR CAPITAL V
    (Name: 'Wfr'; Value: #120090), // MATHEMATICAL FRAKTUR CAPITAL W
    (Name: 'Xfr'; Value: #120091), // MATHEMATICAL FRAKTUR CAPITAL X
    (Name: 'Yfr'; Value: #120092), // MATHEMATICAL FRAKTUR CAPITAL Y
    (Name: 'afr'; Value: #120094), // MATHEMATICAL FRAKTUR SMALL A
    (Name: 'bfr'; Value: #120095), // MATHEMATICAL FRAKTUR SMALL B
    (Name: 'cfr'; Value: #120096), // MATHEMATICAL FRAKTUR SMALL C
    (Name: 'dfr'; Value: #120097), // MATHEMATICAL FRAKTUR SMALL D
    (Name: 'efr'; Value: #120098), // MATHEMATICAL FRAKTUR SMALL E
    (Name: 'ffr'; Value: #120099), // MATHEMATICAL FRAKTUR SMALL F
    (Name: 'gfr'; Value: #120100), // MATHEMATICAL FRAKTUR SMALL G
    (Name: 'hfr'; Value: #120101), // MATHEMATICAL FRAKTUR SMALL H
    (Name: 'ifr'; Value: #120102), // MATHEMATICAL FRAKTUR SMALL I
    (Name: 'jfr'; Value: #120103), // MATHEMATICAL FRAKTUR SMALL J
    (Name: 'kfr'; Value: #120104), // MATHEMATICAL FRAKTUR SMALL K
    (Name: 'lfr'; Value: #120105), // MATHEMATICAL FRAKTUR SMALL L
    (Name: 'mfr'; Value: #120106), // MATHEMATICAL FRAKTUR SMALL M
    (Name: 'nfr'; Value: #120107), // MATHEMATICAL FRAKTUR SMALL N
    (Name: 'ofr'; Value: #120108), // MATHEMATICAL FRAKTUR SMALL O
    (Name: 'pfr'; Value: #120109), // MATHEMATICAL FRAKTUR SMALL P
    (Name: 'qfr'; Value: #120110), // MATHEMATICAL FRAKTUR SMALL Q
    (Name: 'rfr'; Value: #120111), // MATHEMATICAL FRAKTUR SMALL R
    (Name: 'sfr'; Value: #120112), // MATHEMATICAL FRAKTUR SMALL S
    (Name: 'tfr'; Value: #120113), // MATHEMATICAL FRAKTUR SMALL T
    (Name: 'ufr'; Value: #120114), // MATHEMATICAL FRAKTUR SMALL U
    (Name: 'vfr'; Value: #120115), // MATHEMATICAL FRAKTUR SMALL V
    (Name: 'wfr'; Value: #120116), // MATHEMATICAL FRAKTUR SMALL W
    (Name: 'xfr'; Value: #120117), // MATHEMATICAL FRAKTUR SMALL X
    (Name: 'yfr'; Value: #120118), // MATHEMATICAL FRAKTUR SMALL Y
    (Name: 'zfr'; Value: #120119), // MATHEMATICAL FRAKTUR SMALL Z
    (Name: 'Aopf'; Value: #120120), // MATHEMATICAL DOUBLE-STRUCK CAPITAL A
    (Name: 'Bopf'; Value: #120121), // MATHEMATICAL DOUBLE-STRUCK CAPITAL B
    (Name: 'Dopf'; Value: #120123), // MATHEMATICAL DOUBLE-STRUCK CAPITAL D
    (Name: 'Eopf'; Value: #120124), // MATHEMATICAL DOUBLE-STRUCK CAPITAL E
    (Name: 'Fopf'; Value: #120125), // MATHEMATICAL DOUBLE-STRUCK CAPITAL F
    (Name: 'Gopf'; Value: #120126), // MATHEMATICAL DOUBLE-STRUCK CAPITAL G
    (Name: 'Iopf'; Value: #120128), // MATHEMATICAL DOUBLE-STRUCK CAPITAL I
    (Name: 'Jopf'; Value: #120129), // MATHEMATICAL DOUBLE-STRUCK CAPITAL J
    (Name: 'Kopf'; Value: #120130), // MATHEMATICAL DOUBLE-STRUCK CAPITAL K
    (Name: 'Lopf'; Value: #120131), // MATHEMATICAL DOUBLE-STRUCK CAPITAL L
    (Name: 'Mopf'; Value: #120132), // MATHEMATICAL DOUBLE-STRUCK CAPITAL M
    (Name: 'Oopf'; Value: #120134), // MATHEMATICAL DOUBLE-STRUCK CAPITAL O
    (Name: 'Sopf'; Value: #120138), // MATHEMATICAL DOUBLE-STRUCK CAPITAL S
    (Name: 'Topf'; Value: #120139), // MATHEMATICAL DOUBLE-STRUCK CAPITAL T
    (Name: 'Uopf'; Value: #120140), // MATHEMATICAL DOUBLE-STRUCK CAPITAL U
    (Name: 'Vopf'; Value: #120141), // MATHEMATICAL DOUBLE-STRUCK CAPITAL V
    (Name: 'Wopf'; Value: #120142), // MATHEMATICAL DOUBLE-STRUCK CAPITAL W
    (Name: 'Xopf'; Value: #120143), // MATHEMATICAL DOUBLE-STRUCK CAPITAL X
    (Name: 'Yopf'; Value: #120144), // MATHEMATICAL DOUBLE-STRUCK CAPITAL Y
    (Name: 'aopf'; Value: #120146), // MATHEMATICAL DOUBLE-STRUCK SMALL A
    (Name: 'bopf'; Value: #120147), // MATHEMATICAL DOUBLE-STRUCK SMALL B
    (Name: 'copf'; Value: #120148), // MATHEMATICAL DOUBLE-STRUCK SMALL C
    (Name: 'dopf'; Value: #120149), // MATHEMATICAL DOUBLE-STRUCK SMALL D
    (Name: 'eopf'; Value: #120150), // MATHEMATICAL DOUBLE-STRUCK SMALL E
    (Name: 'fopf'; Value: #120151), // MATHEMATICAL DOUBLE-STRUCK SMALL F
    (Name: 'gopf'; Value: #120152), // MATHEMATICAL DOUBLE-STRUCK SMALL G
    (Name: 'hopf'; Value: #120153), // MATHEMATICAL DOUBLE-STRUCK SMALL H
    (Name: 'iopf'; Value: #120154), // MATHEMATICAL DOUBLE-STRUCK SMALL I
    (Name: 'jopf'; Value: #120155), // MATHEMATICAL DOUBLE-STRUCK SMALL J
    (Name: 'kopf'; Value: #120156), // MATHEMATICAL DOUBLE-STRUCK SMALL K
    (Name: 'lopf'; Value: #120157), // MATHEMATICAL DOUBLE-STRUCK SMALL L
    (Name: 'mopf'; Value: #120158), // MATHEMATICAL DOUBLE-STRUCK SMALL M
    (Name: 'nopf'; Value: #120159), // MATHEMATICAL DOUBLE-STRUCK SMALL N
    (Name: 'oopf'; Value: #120160), // MATHEMATICAL DOUBLE-STRUCK SMALL O
    (Name: 'popf'; Value: #120161), // MATHEMATICAL DOUBLE-STRUCK SMALL P
    (Name: 'qopf'; Value: #120162), // MATHEMATICAL DOUBLE-STRUCK SMALL Q
    (Name: 'ropf'; Value: #120163), // MATHEMATICAL DOUBLE-STRUCK SMALL R
    (Name: 'sopf'; Value: #120164), // MATHEMATICAL DOUBLE-STRUCK SMALL S
    (Name: 'topf'; Value: #120165), // MATHEMATICAL DOUBLE-STRUCK SMALL T
    (Name: 'uopf'; Value: #120166), // MATHEMATICAL DOUBLE-STRUCK SMALL U
    (Name: 'vopf'; Value: #120167), // MATHEMATICAL DOUBLE-STRUCK SMALL V
    (Name: 'wopf'; Value: #120168), // MATHEMATICAL DOUBLE-STRUCK SMALL W
    (Name: 'xopf'; Value: #120169), // MATHEMATICAL DOUBLE-STRUCK SMALL X
    (Name: 'yopf'; Value: #120170), // MATHEMATICAL DOUBLE-STRUCK SMALL Y
    (Name: 'zopf'; Value: #120171) // MATHEMATICAL DOUBLE-STRUCK SMALL Z
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
