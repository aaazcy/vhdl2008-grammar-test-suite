-- =============================================================
-- Case ID: TC_INTEGER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Negative
-- Test Focus: Trailing underscore — a digit must follow an underscore, a trailing underscore violates the digit-ending rule
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity int_snn_004 is
  port (
    val_out : out integer
  );
end entity int_snn_004;

architecture rtl of int_snn_004 is
  constant C_BAD : integer := 100_;
begin
  val_out <= C_BAD;
end architecture rtl;
