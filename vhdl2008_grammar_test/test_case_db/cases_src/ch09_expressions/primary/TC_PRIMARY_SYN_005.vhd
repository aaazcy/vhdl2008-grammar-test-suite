-- =============================================================
-- Case ID: TC_PRIMARY_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Positive
-- Test Focus: type_conversion form: primary is integer(s), an explicit type conversion that converts bit_vector to integer type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity prim_tconv_ent is
  port(s : in std_ulogic_vector(3 downto 0); val : out integer);
end entity;
architecture rtl of prim_tconv_ent is
begin
  val <= to_integer(unsigned(s));
end architecture rtl;
