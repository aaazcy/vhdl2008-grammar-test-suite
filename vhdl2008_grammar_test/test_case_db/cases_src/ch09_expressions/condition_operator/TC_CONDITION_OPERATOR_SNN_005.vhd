-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Negative
-- Test Focus: SNN: a reserved word after ?? that is not a primary — in "?? if" the ?? is followed by the keyword if instead of a legal primary expression, verifying that condition_operator requires a primary expression after it
-- Expected Result: Triggers syntax error: unexpected keyword after condition_operator, expected primary
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_snn_co_keyword is
  port (
    flag_i : in  std_logic;
    y_o    : out integer
  );
end entity ent_snn_co_keyword;

architecture rtl of ent_snn_co_keyword is
begin
  -- ERROR: unexpected token after condition_operator
  y_o <= 1 when ?? if then 0;
end architecture rtl;
