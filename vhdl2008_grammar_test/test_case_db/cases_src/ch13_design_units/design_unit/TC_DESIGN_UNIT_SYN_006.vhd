-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_unit ::= context_clause library_unit
-- Case Type: Positive
-- Test Focus: context_clause with library+use+context_reference + entity primary_unit: library ieee; use ieee.std_logic_1164.all; context work.tools_ctx; entity — verifying the complete context_clause made of three kinds of context_item combines with a primary_unit into a design_unit
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
context tools_ctx is
end context tools_ctx;

library ieee;
use ieee.std_logic_1164.all;
context work.tools_ctx;

entity du_ctxref_ent is
  port (
    clk   : in  std_ulogic;
    sig   : in  std_ulogic;
    flag  : out std_ulogic
  );
end entity du_ctxref_ent;

architecture rtl of du_ctxref_ent is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      flag <= sig;
    end if;
  end process;
end architecture rtl;
