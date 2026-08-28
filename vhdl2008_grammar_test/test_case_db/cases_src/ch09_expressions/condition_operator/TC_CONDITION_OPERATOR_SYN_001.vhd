-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Positive
-- Test Focus: Minimal form: ?? applied to a std_logic signal converting it to a boolean condition — in an if condition ?? implicitly converts std_logic to boolean for the condition test, verifying the minimal syntax of the VHDL 2008 condition_operator
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_co_simple is
  port (
    flag_i : in  std_logic;
    val_i  : in  integer;
    y_o    : out integer
  );
end entity ent_co_simple;

architecture rtl of ent_co_simple is
begin
  process(flag_i, val_i)
  begin
    if ?? flag_i then
      y_o <= val_i;
    else
      y_o <= 0;
    end if;
  end process;
end architecture rtl;
