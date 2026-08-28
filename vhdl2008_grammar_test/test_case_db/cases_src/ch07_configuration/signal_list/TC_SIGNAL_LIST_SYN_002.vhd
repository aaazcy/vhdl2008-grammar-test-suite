-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Positive
-- Test Focus: signal_list with multiple signal names — comma-separated signal_name list used in guarded_signal_specification + disconnection_specification, testing { , signal_name } repetition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sl_multi_ent is
  port(d : in std_logic_vector(1 downto 0); q0 : out std_logic bus; q1 : out std_logic bus);
end entity;

architecture bh of sl_multi_ent is
  signal r0, r1 : std_logic bus := '0';
  disconnect r0, r1 : std_logic after 3 ns;
begin
  g_blk : block (d(0) = '1')
  begin
    r0 <= guarded d(0); r1 <= guarded d(1);
    q0 <= guarded r0; q1 <= guarded r1;
  end block;
end architecture bh;
