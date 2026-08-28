-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Negative
-- Test Focus: Literal value beyond the upper limit of the integer range — decimal_literal is syntactically legal but semantically the integer value overflows the target type
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity dec_lit_sem_001 is
  port (
    val_out : out integer
  );
end entity dec_lit_sem_001;

architecture rtl of dec_lit_sem_001 is
  constant C_OVERFLOW : integer := 99999999999999999999;
begin
  val_out <= C_OVERFLOW;
end architecture rtl;
