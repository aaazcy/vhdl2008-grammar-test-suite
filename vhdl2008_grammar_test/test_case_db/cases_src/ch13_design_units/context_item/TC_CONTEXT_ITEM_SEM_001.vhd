-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONTEXT_ITEM_ORDER
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_item ::= library_clause | use_clause | context_reference
-- Case Type: Positive
-- Rule Description: the library_clause of a context_item must appear before the use_clause referencing that library, ordered by correct dependency
-- Test Focus: order-dependency semantics of context items: library ieee; use ieee.std_logic_1164.all; — the library ieee referenced by use_clause as a context_item must first be declared via the preceding library_clause (also a context_item), verifying the order dependency between context_items is correctly satisfied
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ci_sem_order is
  port (
    clk   : in  std_ulogic;
    data  : in  std_logic_vector(7 downto 0);
    valid : out std_ulogic
  );
end entity ci_sem_order;

architecture rtl of ci_sem_order is
  signal s_count : unsigned(3 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if data = x"00" then
        s_count <= (others => '0');
      else
        s_count <= s_count + 1;
      end if;
    end if;
  end process;
  valid <= '1' when s_count > 5 else '0';
end architecture rtl;
