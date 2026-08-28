-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_DESIGN_UNIT_ORDER
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_unit ::= context_clause library_unit
-- Case Type: Positive
-- Rule Description: items of the context_clause in a design_unit take effect in declaration order; the library_unit can correctly use types introduced by the context_clause
-- Test Focus: semantic correctness - from ordered context_clause import to library_unit use: library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all; the entity uses std_ulogic and unsigned — verifying the use_clauses in the context_clause make package contents visible to the library_unit in order
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity du_sem_valid is
  port (
    clk   : in  std_ulogic;
    rst_n : in  std_ulogic;
    cnt   : out std_logic_vector(3 downto 0)
  );
end entity du_sem_valid;

architecture rtl of du_sem_valid is
  signal s_count : unsigned(3 downto 0) := (others => '0');
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_count <= (others => '0');
    elsif rising_edge(clk) then
      s_count <= s_count + 1;
    end if;
  end process;
  cnt <= std_logic_vector(s_count);
end architecture rtl;
