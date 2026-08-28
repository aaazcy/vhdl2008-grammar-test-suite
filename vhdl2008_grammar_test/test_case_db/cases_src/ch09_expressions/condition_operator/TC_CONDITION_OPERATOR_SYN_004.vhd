-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Positive
-- Test Focus: ?? used multiple times in an elsif condition chain — in an if/elsif chain ?? is applied to several std_logic signals for the condition tests, verifying the repeated use of condition_operator in cascaded conditions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_co_chain is
  port (
    sel_a : in  std_logic;
    sel_b : in  std_logic;
    sel_c : in  std_logic;
    d0_i  : in  integer;
    d1_i  : in  integer;
    d2_i  : in  integer;
    y_o   : out integer
  );
end entity ent_co_chain;

architecture rtl of ent_co_chain is
begin
  process(sel_a, sel_b, sel_c, d0_i, d1_i, d2_i)
  begin
    if ?? sel_a then
      y_o <= d0_i;
    elsif ?? sel_b then
      y_o <= d1_i;
    elsif ?? sel_c then
      y_o <= d2_i;
    else
      y_o <= 0;
    end if;
  end process;
end architecture rtl;
