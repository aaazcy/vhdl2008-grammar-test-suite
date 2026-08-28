-- =============================================================
-- Case ID: TC_BASE_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Positive
-- Test Focus: base using the maximum value 16 (hexadecimal base) in based_literal(16#FF_EE#) verify the legal syntax of base=16 as the highest allowed radix with underscore-separated digits
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bs_base_max_value is
  port (
    out_val : out integer
  );
end entity bs_base_max_value;

architecture rtl of bs_base_max_value is
  constant C_HEX : integer := 16#FF_EE#;
begin
  out_val <= C_HEX;
end architecture rtl;
