-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Positive
-- Test Focus: guarded_signal_specification with "all" reserved word as the guarded_signal_list -- exercises the "all" alternative in disconnect specification to apply a uniform disconnect time to every guarded signal of the given type_mark in the declarative region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity gss_all_guard is
  port(
    a, b : in  std_logic;
    y    : out std_logic bus
  );
end entity;

architecture bh of gss_all_guard is
  signal internal_bus : std_logic bus := '0';
  -- "all" covers every guarded signal of type bit in the architecture
  disconnect all : std_logic after 3 ns;
begin
  g_blk : block (a = '1')
  begin
    internal_bus <= guarded (a nand b);
    y <= guarded internal_bus;
  end block;
end architecture bh;
