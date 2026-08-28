-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SYN_002
-- Rule Type: Syntax
-- BNF Production: numeric_literal
-- IEEE Section: 9.3.3.1
-- BNF Text: numeric_literal ::= abstract_literal | physical_literal
-- Test Focus: abstract_literal with based literal (binary, octal, hex) for bit pattern constants
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_numeric_literal_syn_002 is
  port (
    base_sel : in  integer range 0 to 3;
    value    : out integer range 0 to 255
  );
end entity tc_numeric_literal_syn_002;

architecture based_literals of tc_numeric_literal_syn_002 is
  constant BIN_VAL : integer := 2#10101010#;  -- based literal: binary
  constant OCT_VAL : integer := 8#252#;        -- based literal: octal
  constant HEX_VAL : integer := 16#AA#;        -- based literal: hex
  constant DEC_VAL : integer := 170;           -- abstract literal: decimal
begin
  with base_sel select
    value <= BIN_VAL when 0,
             OCT_VAL when 1,
             HEX_VAL when 2,
             DEC_VAL when others;
end architecture based_literals;
