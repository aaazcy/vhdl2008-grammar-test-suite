-- =============================================================
-- Case ID: TC_CONCURRENT_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.1
-- Production: concurrent_statement ::= block_statement | process_statement | concurrent_procedure_call_statement | concurrent_assertion_statement | concurrent_signal_assignment_statement | component_instantiation_statement | generate_statement
-- Case Type: Positive
-- Test Focus: Multiple kinds of concurrent statements coexisting——the architecture contains four kinds of concurrent statements: process, block, concurrent assertion and concurrent signal assignment, verifying that different kinds can be mixed
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
entity cs_mixed_ent is
  port(clk, a, b : in std_logic; y : out std_logic);
end entity cs_mixed_ent;
architecture bh of cs_mixed_ent is
  signal s_and : std_logic;
begin
  -- concurrent signal assignment
  y <= s_and;
  -- block
  blk_and : block is
  begin
    s_and <= a and b;
  end block blk_and;
  -- concurrent assertion
  assert not (clk'event and a = 'X')
    report "unknown input on clock edge" severity warning;
  -- process
  proc_chk : process(clk) is
  begin
    if clk'event and clk = '1' then
      report "clock tick";
    end if;
  end process proc_chk;
end architecture bh;
