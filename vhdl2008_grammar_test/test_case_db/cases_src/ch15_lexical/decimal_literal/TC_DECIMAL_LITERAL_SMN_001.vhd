-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Negative
-- Test Focus: Real type decimal_literal assigned to an integer port — type mismatch, a real literal cannot be implicitly converted to an integer
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity dec_lit_smn_001 is
  port (
    int_out : out integer
  );
end entity dec_lit_smn_001;

architecture rtl of dec_lit_smn_001 is
  constant C_BAD : integer := 5.7;
begin
  int_out <= C_BAD;
end architecture rtl;
