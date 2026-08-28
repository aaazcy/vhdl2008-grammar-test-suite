-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Negative
-- Test Focus: SNN: missing primary on the right of ?? — the expression "?? " has no operand before when, verifying that the primary in BNF expression ::= condition_operator primary cannot be omitted
-- Expected Result: Triggers syntax error: missing primary after condition_operator
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_snn_no_primary is
  port (
    y_o : out integer
  );
end entity ent_snn_no_primary;

architecture rtl of ent_snn_no_primary is
begin
  -- ERROR: missing primary after condition_operator ??
  y_o <= 1 when ?? else 0;
end architecture rtl;
