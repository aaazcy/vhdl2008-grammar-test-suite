-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: use_clause appearing in the declarative part of a process: use ieee.std_logic_1164.all written inside the declarative_part of a process — verifies that a use_clause can be used in the process declarative part to make the package contents visible inside that process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
entity uc_in_process is
  port (
    strobe : in  bit;
    mask   : in  bit_vector(3 downto 0);
    data   : in  bit_vector(3 downto 0);
    result : out bit_vector(3 downto 0)
  );
end entity uc_in_process;

architecture rtl of uc_in_process is
  signal s_raw : bit_vector(3 downto 0);
begin
  process(strobe, mask, data)
    use ieee.std_logic_1164.all;
    variable v_and : std_logic_vector(3 downto 0);
    variable v_or  : std_logic_vector(3 downto 0);
  begin
    if strobe = '1' then
      v_and := to_stdlogicvector(data) and to_stdlogicvector(mask);
      v_or  := to_stdlogicvector(data) or to_stdlogicvector(mask);
      s_raw <= to_bitvector(v_and xor v_or);
    end if;
  end process;
  result <= s_raw;
end architecture rtl;
