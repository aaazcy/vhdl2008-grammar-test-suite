-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SYN_003
-- Rule Type: Syntax
-- BNF Production: context_reference
-- IEEE Section: 13.2
-- BNF Text: context_reference ::= context selected_name { , selected_name } ;
-- Test Focus: context_reference with full library-qualified selected_name path
-- Case Type: Positive
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
context ieee.ieee_std_context;

entity tc_context_reference_syn_003 is
  port (
    a : in  std_logic;
    y : out std_logic
  );
end entity tc_context_reference_syn_003;

architecture rtl of tc_context_reference_syn_003 is
begin
  y <= a;
end architecture rtl;
