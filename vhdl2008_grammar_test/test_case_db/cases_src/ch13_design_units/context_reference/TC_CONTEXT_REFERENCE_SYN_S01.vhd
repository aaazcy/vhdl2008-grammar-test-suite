-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: context_reference
-- IEEE Section: 13.2
-- BNF Text: context_reference ::= context selected_name { , selected_name } ;
-- Test Focus: Single context_reference with one selected_name
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
context common_pkg_context is
end context common_pkg_context;

library ieee;
use ieee.std_logic_1164.all;
context work.common_pkg_context;

entity tc_context_reference_syn_s01 is
  port (
    a : in  std_logic;
    y : out std_logic
  );
end entity tc_context_reference_syn_s01;

architecture rtl of tc_context_reference_syn_s01 is
begin
  y <= a;
end architecture rtl;
