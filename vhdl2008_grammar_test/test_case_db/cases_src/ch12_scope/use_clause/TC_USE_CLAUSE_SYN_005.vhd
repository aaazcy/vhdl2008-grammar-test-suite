-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: selected_name importing specific items (not .all): use ieee.std_logic_1164.std_ulogic, ieee.numeric_std.unsigned — verifies that the selected_name in a use_clause points to specific declared items inside the packages rather than the whole packages
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
entity uc_specific_item is
  port (
    d_in  : in  bit_vector(7 downto 0);
    d_out : out bit_vector(7 downto 0)
  );
end entity uc_specific_item;

architecture rtl of uc_specific_item is
  use ieee.std_logic_1164.std_ulogic, ieee.std_logic_1164.std_logic_vector;
  use ieee.std_logic_1164.to_stdlogicvector, ieee.std_logic_1164.to_bitvector;
  use ieee.numeric_std.unsigned, ieee.numeric_std."+";
  signal s_data : unsigned(7 downto 0);
begin
  s_data <= unsigned(to_stdlogicvector(d_in));
  d_out  <= to_bitvector(std_logic_vector(s_data + 1));
end architecture rtl;
