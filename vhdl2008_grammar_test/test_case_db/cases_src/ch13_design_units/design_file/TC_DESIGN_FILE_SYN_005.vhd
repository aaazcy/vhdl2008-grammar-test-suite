-- =============================================================
-- Case ID: TC_DESIGN_FILE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_FILE
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_file ::= design_unit { design_unit }
-- Case Type: Positive
-- Test Focus: multiple design_units with context_clauses: each design_unit has its own independent context_clause — verifying design_units with different library/use combinations coexist in the same design_file, with each design_unit resolving its own context independently
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Design unit 1: uses bit only
entity df5_simple_ent is
  port (
    a : in  bit;
    y : out bit
  );
end entity df5_simple_ent;

architecture rtl of df5_simple_ent is
begin
  y <= a;
end architecture rtl;

-- Design unit 2: uses std_logic via its own context_clause
library ieee;
use ieee.std_logic_1164.all;

entity df5_stdlogic_ent is
  port (
    clk : in  std_ulogic;
    q   : out std_ulogic
  );
end entity df5_stdlogic_ent;

architecture rtl of df5_stdlogic_ent is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      q <= '1';
    end if;
  end process;
end architecture rtl;
