-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_unit ::= context_clause library_unit
-- Case Type: Positive
-- Test Focus: context_clause with library+use + primary_unit with generic+port: library ieee; use ieee.numeric_std.all; entity with generic and port — verifying a context_clause with multiple context_items combines with a generic-bearing primary_unit into a complete design_unit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity du_generic_ent is
  generic (
    WIDTH : positive := 8
  );
  port (
    a : in  unsigned(WIDTH-1 downto 0);
    y : out unsigned(WIDTH-1 downto 0)
  );
end entity du_generic_ent;

architecture rtl of du_generic_ent is
begin
  y <= a + 1;
end architecture rtl;
