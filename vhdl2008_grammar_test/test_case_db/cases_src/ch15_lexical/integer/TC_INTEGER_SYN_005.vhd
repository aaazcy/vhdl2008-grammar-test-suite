-- =============================================================
-- Case ID: TC_INTEGER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Positive
-- Test Focus: Underscore used in a based integer — underline may appear in the integer part of a based literal, improving hexadecimal readability
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity int_based_underscore is
  port (
    val_out : out integer
  );
end entity int_based_underscore;

architecture rtl of int_based_underscore is
  constant C_MASK  : integer := 16#FFFF_0000#;
  constant C_COLOR : integer := 16#FF_00_AA_55#;
  signal s_merged  : integer := 0;
begin
  s_merged <= C_MASK + C_COLOR;
  val_out  <= s_merged;
end architecture rtl;
