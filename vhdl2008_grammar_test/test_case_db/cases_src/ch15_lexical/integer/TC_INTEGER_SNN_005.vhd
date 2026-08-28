-- =============================================================
-- Case ID: TC_INTEGER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Negative
-- Test Focus: Letter embedded in an integer — integer may contain only digit and underline, letter A is not a digit, violating the integer definition
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity int_snn_005 is
  port (
    val_out : out integer
  );
end entity int_snn_005;

architecture rtl of int_snn_005 is
  constant C_BAD : integer := 10A0;
begin
  val_out <= C_BAD;
end architecture rtl;
