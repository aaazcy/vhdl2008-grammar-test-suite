-- =============================================================
-- Case ID: TC_INTEGER_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Negative
-- Test Focus: No digit after underscore — two consecutive underscores, a digit must follow underline, violating the integer syntax
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity int_sem_002 is
  port (
    val_out : out integer
  );
end entity int_sem_002;

architecture rtl of int_sem_002 is
  constant C_BAD : integer := 1__0;
begin
  val_out <= C_BAD;
end architecture rtl;
