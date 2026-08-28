-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_LIBRARY_UNIT_ORDER
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: library_unit ::= primary_unit | secondary_unit
-- Case Type: Positive
-- Rule Description: primary_unit (entity) must appear before secondary_unit (architecture), and the architecture body must correctly correspond to its entity
-- Test Focus: primary_unit→secondary_unit correct order: entity declaration→architecture implementation — verifies entity appears first as primary_unit, architecture follows as secondary_unit with correct correspondence, the two alternative forms of library_unit combined in semantically correct order
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity lu_sem_valid is
  generic (
    WIDTH : positive := 8
  );
  port (
    clk   : in  std_ulogic;
    din   : in  std_logic_vector(WIDTH-1 downto 0);
    dout  : out std_logic_vector(WIDTH-1 downto 0)
  );
end entity lu_sem_valid;

architecture rtl of lu_sem_valid is
  signal s_reg : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      s_reg <= din;
    end if;
  end process;
  dout <= s_reg;
end architecture rtl;
