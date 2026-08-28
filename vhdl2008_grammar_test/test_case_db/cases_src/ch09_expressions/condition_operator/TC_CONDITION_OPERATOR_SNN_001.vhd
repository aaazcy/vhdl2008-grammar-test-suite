-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Negative
-- Test Focus: SNN: a single ? instead of ?? — using a single question mark "?" instead of the double "??", verifying that condition_operator must be ?? (two consecutive question marks); a single ? is not a legal VHDL operator token
-- Expected Result: Triggers syntax error: single "?" is not a valid condition_operator
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_snn_single_q is
  port (
    flag_i : in  std_logic;
    y_o    : out integer
  );
end entity ent_snn_single_q;

architecture rtl of ent_snn_single_q is
begin
  -- ERROR: "?" is not a valid condition_operator (must be "??")
  y_o <= 1 when ? flag_i else 0;
end architecture rtl;
