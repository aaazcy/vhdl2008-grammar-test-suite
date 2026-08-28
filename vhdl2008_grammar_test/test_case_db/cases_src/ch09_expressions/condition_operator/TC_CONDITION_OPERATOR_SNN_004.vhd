-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Negative
-- Test Focus: SNN: three question marks ??? — using three ? question marks instead of two, verifying that condition_operator must be exactly ?? (two question marks); three question marks are not a legal operator
-- Expected Result: Triggers syntax error: "???" is not a valid condition_operator
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_snn_triple_q is
  port (
    flag_i : in  std_logic;
    y_o    : out integer
  );
end entity ent_snn_triple_q;

architecture rtl of ent_snn_triple_q is
begin
  -- ERROR: "???" is not a valid condition_operator (must be "??")
  y_o <= 1 when ??? flag_i else 0;
end architecture rtl;
