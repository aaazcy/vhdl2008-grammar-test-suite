-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_2008_006
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Rule Description: Force out mode on output port must be semantically compatible
-- Case Type: Positive
-- Test Focus: Conditional force with out mode on output port using conditional expression is valid
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_force_sem_002 is
  port (
    p_result : out std_logic_vector(7 downto 0)
  );
end entity cond_force_sem_002;

architecture test of cond_force_sem_002 is
  signal s_sel : std_logic := '1';
begin
  process is
  begin
    p_result <= force out X"AA" when s_sel = '1' else X"55";
    wait for 50 ns;
    p_result <= release out;
    wait;
  end process;
end architecture test;
