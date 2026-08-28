-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_ITEM
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_item ::= library_clause | use_clause | context_reference
-- Case Type: Positive
-- Test Focus: multiple use_clauses as context_items: referencing multiple packages from the same library, verifying consecutive use_clauses are each parsed correctly as an independent context_item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity ci_multi_use is
  port (
    din  : in  std_logic_vector(7 downto 0);
    dout : out std_logic_vector(7 downto 0)
  );
end entity ci_multi_use;

architecture rtl of ci_multi_use is
begin
  dout <= din;
end architecture rtl;
