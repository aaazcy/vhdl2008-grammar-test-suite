-- =============================================================
-- Case ID: TC_FORCE_MODE_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Rule Description: Force in on internal signal is semantically valid -- internal signals can be forced in
-- Case Type: Positive
-- Test Focus: Valid force in on internal std_logic_vector signal with when/else conditional -- tests force in semantic validity for internal signals
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity fmode_sem_002 is
end entity fmode_sem_002;

architecture test of fmode_sem_002 is
  signal s_data : std_logic_vector(3 downto 0) := "0000";
  signal s_mode : std_logic := '0';
begin
  process is
  begin
    s_data <= force in "1111" when s_mode = '1' else "0000";
    wait for 10 ns;
    s_data <= release in;
    wait;
  end process;
end architecture test;
