-- =============================================================
-- Case ID: TC_BASE_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Positive
-- Test Focus: base in extended integer form — integer with underscore(1_6) as base value, based_literal(16#FF#) equivalent form(1_6#FF#): verify underscore separators in the base integer are accepted and correctly parsed as the value 16
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bs_underscore_in_base is
  port (
    out_val : out integer
  );
end entity bs_underscore_in_base;

architecture rtl of bs_underscore_in_base is
  constant C_HEX1 : integer := 16#FF#;
  constant C_HEX2 : integer := 1_6#FF#;
begin
  out_val <= C_HEX1 + C_HEX2;
end architecture rtl;
