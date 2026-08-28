-- =============================================================
-- Case ID: TC_INTEGER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Negative
-- Test Focus: Leading underscore before digits — integer must start with a digit, underscore cannot be the first character of an integer
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity int_snn_001 is
  port (
    val_out : out integer
  );
end entity int_snn_001;

architecture rtl of int_snn_001 is
  constant C_BAD : integer := _100;
begin
  val_out <= C_BAD;
end architecture rtl;
