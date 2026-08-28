-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_REFERENCE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_reference ::= context selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: multiple context_reference statements with multiple selected_names: two independent context_reference statements each containing multiple comma-separated selected_names — verifying multiple context_references coexist as independent context_items, each with a selected_name list of different length
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
context type_ctx is
end context type_ctx;

context ops_ctx is
end context ops_ctx;

context io_ctx is
end context io_ctx;

context math_ctx is
end context math_ctx;

context debug_ctx is
end context debug_ctx;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
context work.type_ctx, work.ops_ctx;
context work.io_ctx, work.math_ctx, work.debug_ctx;

entity cr_multi_stmt is
  port (
    clk   : in  std_ulogic;
    a     : in  unsigned(7 downto 0);
    b     : in  unsigned(7 downto 0);
    sum   : out unsigned(7 downto 0)
  );
end entity cr_multi_stmt;

architecture rtl of cr_multi_stmt is
  signal s_sum : unsigned(7 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      s_sum <= a + b;
    end if;
  end process;
  sum <= s_sum;
end architecture rtl;
