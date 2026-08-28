-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Positive
-- Test Focus: ?? used in a concurrent conditional signal assignment — in a when/else concurrent conditional assignment ?? converts a std_logic condition, verifying the application of condition_operator in a concurrent context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_co_concurrent is
  port (
    sel_i  : in  std_logic;
    val_a  : in  integer;
    val_b  : in  integer;
    y_o    : out integer
  );
end entity ent_co_concurrent;

architecture rtl of ent_co_concurrent is
begin
  y_o <= val_a when ?? sel_i else val_b;
end architecture rtl;
