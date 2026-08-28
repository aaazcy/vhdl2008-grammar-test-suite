-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic resolution of guarded signal with multiple drivers across blocks -- verifies that a guarded_signal_specification correctly identifies the guarded signal across multiple block statements, each potentially driving the same guarded signal, and that the disconnect timing specified applies uniformly regardless of which block drives the signal
-- Expected Result: Compiles successfully; guarded signal resolution semantics verified
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity gss_sem_multidrv is
  port(
    en_a  : in  bit;
    en_b  : in  bit;
    d_a   : in  std_logic_vector(7 downto 0);
    d_b   : in  std_logic_vector(7 downto 0);
    y     : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of gss_sem_multidrv is
  signal shared_bus : std_logic_vector(7 downto 0) bus := X"00";
  disconnect shared_bus : std_logic_vector after 5 ns;
begin
  -- Block A drives shared_bus when en_a is asserted
  b_drv_a : block (en_a = '1')
  begin
    shared_bus <= guarded d_a;
  end block;

  -- Block B drives shared_bus when en_b is asserted
  b_drv_b : block (en_b = '1')
  begin
    shared_bus <= guarded d_b;
  end block;

  y <= shared_bus;
end architecture rtl;
