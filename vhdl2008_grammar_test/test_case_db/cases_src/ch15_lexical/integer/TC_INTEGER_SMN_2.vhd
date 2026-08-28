-- =============================================================
-- Case ID: TC_INTEGER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Negative
-- Test Focus: Integer value beyond the integer'high range — syntactically the integer is correct but semantically the value exceeds the implementation upper bound of type integer
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity int_sem_001 is
  port (
    val_out : out integer
  );
end entity int_sem_001;

architecture rtl of int_sem_001 is
  constant C_OVER : integer := 99999999999999999999;
begin
  val_out <= C_OVER;
end architecture rtl;
