-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Positive
-- Test Focus: Multiple radix forms of based_literal in abstract_literal: binary(2#1010_1010#), octal(8#377#), decimal(10#255#), hexadecimal(16#FF#), ternary(3#22#), based digits with underscores(2#1111_0000_1010_0101#), verify each radix based_literal as abstract_literal used in constant initialization
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity al_based_variants is
  port (
    bin_val : out integer;
    oct_val : out integer;
    dec_val : out integer;
    hex_val : out integer;
    ter_val : out integer;
    big_val : out integer
  );
end entity al_based_variants;

architecture rtl of al_based_variants is
  constant C_BIN : integer := 2#1010_1010#;
  constant C_OCT : integer := 8#377#;
  constant C_DEC : integer := 10#255#;
  constant C_HEX : integer := 16#FF#;
  constant C_TER : integer := 3#22#;
  constant C_BIG : integer := 2#1111_0000_1010_0101#;
begin
  bin_val <= C_BIN;
  oct_val <= C_OCT;
  dec_val <= C_DEC;
  hex_val <= C_HEX;
  ter_val <= C_TER;
  big_val <= C_BIG;
end architecture rtl;
