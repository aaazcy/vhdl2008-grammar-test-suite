-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SEM_002
-- Related Rule ID: SEM_DISCONNE_002
-- Rule Type: Semantic
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Positive (Semantic)
-- Test Focus: Two guarded signals in the architecture declarative region each with an independent disconnect delay (10 ns / 3 ns), nested blocks drive their own signals via guarded assignment, verifying disconnect specifications take effect independently per signal declaration scope without cross interference
-- Expected Result: Compiles successfully; inner block disconnect does not affect outer block signals
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity dcspec_sem_nested is
  port(ena, enb : in bit; da, db : in std_logic; qa, qb : out std_logic);
end entity;

architecture rtl of dcspec_sem_nested is
  signal s_outer : std_logic register;
  signal s_inner : std_logic register;
  disconnect s_outer : std_logic after 10 ns;
  disconnect s_inner : std_logic after 3 ns;
begin
  b_outer : block (ena = '1')
  begin
    s_outer <= guarded da;
    qa <= s_outer;
    b_inner : block (enb = '1')
    begin
      s_inner <= guarded db;
      qb <= s_inner;
    end block;
  end block;
end architecture rtl;
