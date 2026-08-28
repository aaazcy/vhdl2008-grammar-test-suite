-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Positive
-- Test Focus: ?? applied to the unsigned type — ?? converts an unsigned vector to a boolean condition (nonzero is true), verifying the implicit conversion of condition_operator on the numeric_std unsigned type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_co_unsigned is
  port (
    val_i : in  unsigned(3 downto 0);
    flag_o: out bit
  );
end entity ent_co_unsigned;

architecture rtl of ent_co_unsigned is
  function "??" (l : unsigned) return boolean is
  begin
    return l /= to_unsigned(0, l'length);
  end function "??";
begin
  process(val_i)
  begin
    if ?? val_i then
      flag_o <= '1';
    else
      flag_o <= '0';
    end if;
  end process;
end architecture rtl;
