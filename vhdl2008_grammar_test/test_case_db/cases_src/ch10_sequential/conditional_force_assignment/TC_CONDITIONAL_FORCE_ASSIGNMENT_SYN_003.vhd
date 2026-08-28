-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Conditional force with out mode and final else clause on output port
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_force_syn_003 is
  port (
    p_out : out std_logic_vector(3 downto 0)
  );
end entity cond_force_syn_003;

architecture test of cond_force_syn_003 is
  signal s_mode : integer range 0 to 2 := 0;
begin
  process is
  begin
    p_out <= force out "1111" when s_mode = 0 else "0000" when s_mode = 1 else "1010";
    wait for 15 ns;
    p_out <= release out;
    wait;
  end process;
end architecture test;
