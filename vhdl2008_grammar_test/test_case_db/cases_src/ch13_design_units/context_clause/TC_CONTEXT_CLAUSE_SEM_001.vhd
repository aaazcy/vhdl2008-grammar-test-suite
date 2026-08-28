-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONTEXT_VISIBLE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_clause ::= { context_item }
-- Case Type: Positive (semantic verification)
-- Rule Description: items in context_clause take effect sequentially in order of appearance; later context_items may use libraries declared by earlier library_clauses
-- Test Focus: library-use order dependency: library ieee; use ieee.std_logic_1164.all — the ieee library referenced by use_clause must be declared via an earlier library_clause, verifying order-effect semantics of context items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cc_sem_order is
  port (
    clk   : in  std_ulogic;
    cnt   : out std_logic_vector(3 downto 0)
  );
end entity cc_sem_order;

architecture rtl of cc_sem_order is
  signal s_cnt : unsigned(3 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      s_cnt <= s_cnt + 1;
    end if;
  end process;
  cnt <= std_logic_vector(s_cnt);
end architecture rtl;
