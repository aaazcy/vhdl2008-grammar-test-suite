-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_REFERENCE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_reference ::= context selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: minimal context_reference: context work.my_context; — a single selected_name with no comma-list extension, verifying the smallest compilable form of context_reference
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
context type_pkg_ctx is
end context type_pkg_ctx;

library ieee;
use ieee.std_logic_1164.all;
context work.type_pkg_ctx;

entity cr_min_single is
  port (
    a : in  std_logic;
    y : out std_logic
  );
end entity cr_min_single;

architecture rtl of cr_min_single is
begin
  y <= a;
end architecture rtl;
