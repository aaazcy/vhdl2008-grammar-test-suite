-- =============================================================
-- Case ID: TC_BASED_LITERAL_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Negative
-- Test Focus: based_literal with a negative exponent(2#1010#E-5) — exponent must be a positive integer (E followed by an integer value), a negative exponent is illegal in a VHDL based_literal; verify semantic analysis/the parser rejects the negative exponent
-- Expected Result: Triggers semantic error on negative exponent
-- Dependencies: None
-- =============================================================
entity bl_negative_exponent is
  port (
    bad_val : out integer
  );
end entity bl_negative_exponent;

architecture rtl of bl_negative_exponent is
  constant C_BAD : integer := 2#1010#E-5;
begin
  bad_val <= C_BAD;
end architecture rtl;
