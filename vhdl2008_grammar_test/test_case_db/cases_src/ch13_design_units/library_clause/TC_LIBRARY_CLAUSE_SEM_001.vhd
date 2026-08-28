-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_LIBRARY_CLAUSE_VISIBLE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Positive
-- Rule Description: the library declared by library_clause makes its packages visible to subsequent use_clauses
-- Test Focus: use_clause visibility after library_clause declaration: library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all; — verifying that for library ieee declared via library_clause, its packages std_logic_1164 and numeric_std are both visible to subsequent use_clauses, and the entity can use std_ulogic and unsigned types normally
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lc_sem_visible is
  port (
    clk   : in  std_ulogic;
    cnt   : out std_logic_vector(3 downto 0)
  );
end entity lc_sem_visible;

architecture rtl of lc_sem_visible is
  signal s_count : unsigned(3 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      s_count <= s_count + 1;
    end if;
  end process;
  cnt <= std_logic_vector(s_count);
end architecture rtl;
