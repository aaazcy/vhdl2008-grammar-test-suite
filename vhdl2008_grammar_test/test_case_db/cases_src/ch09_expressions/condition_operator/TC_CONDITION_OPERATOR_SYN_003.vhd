-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Positive
-- Test Focus: ?? applied to the reduction condition of a std_logic_vector — ?? converts the reduced value of std_logic_vector (nonzero detection) to a boolean condition, verifying the implicit reduction conversion of condition_operator on array types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_co_vector is
  port (
    data_i : in  std_logic_vector(7 downto 0);
    valid_o: out bit
  );
end entity ent_co_vector;

architecture rtl of ent_co_vector is
  function "??" (l : std_logic_vector) return boolean is
  begin
    return l /= (l'range => '0');
  end function "??";
begin
  process(data_i)
  begin
    if ?? data_i then
      valid_o <= '1';
    else
      valid_o <= '0';
    end if;
  end process;
end architecture rtl;
