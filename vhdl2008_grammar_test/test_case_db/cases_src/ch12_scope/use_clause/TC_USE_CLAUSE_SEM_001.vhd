-- =============================================================
-- Case ID: TC_USE_CLAUSE_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_LIBRARY_VISIBLE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive (semantic verification)
-- Rule Description: The library referenced by a use_clause must have been declared visible through a library_clause
-- Test Focus: Legal reference chain: library ieee; use ieee.std_logic_1164.all — the library_clause declares the library first and the use_clause references a package in that library, verifying the complete library-declaration/import semantic chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity uc_sem_valid_ref is
  port (
    clk : in  std_ulogic;
    rst : in  std_ulogic;
    q   : out std_ulogic
  );
end entity uc_sem_valid_ref;

architecture rtl of uc_sem_valid_ref is
  signal s_q : std_ulogic := '0';
begin
  process(clk, rst)
  begin
    if rst = '1' then
      s_q <= '0';
    elsif rising_edge(clk) then
      s_q <= not s_q;
    end if;
  end process;
  q <= s_q;
end architecture rtl;
