-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Positive
-- Test Focus: guarded_signal_specification with multiple guarded signals — comma-separated guarded_signal_list (sig_a, sig_b, sig_c : type_mark) in disconnection_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity gss_multi_ent is
  port(a : in std_logic; b : in std_logic; y0 : out std_logic bus; y1 : out std_logic bus; y2 : out std_logic bus);
end entity;

architecture bh of gss_multi_ent is
  signal s0, s1, s2 : std_logic bus := '0';
  disconnect s0, s1, s2 : std_logic after 2 ns;
begin
  g_blk : block (a = '1')
  begin
    s0 <= guarded a;
    s1 <= guarded b;
    s2 <= guarded (a nand b);
    y0 <= guarded s0; y1 <= guarded s1; y2 <= guarded s2;
  end block;
end architecture bh;
